/// An object that publishes its changes.
///
/// ### Understanding `ObservableObject`
///
/// The `ObservableObject` protocol definition is as follows:
///
/// ```
/// public protocol ObservableObject: AnyObject {
///     associatedtype ObjectWillChangePublisher: Publisher
///
///     var objectWillChange: ObjectWillChangePublisher { get }
/// }
/// ```
///
/// `ObservableObject` has one simple requirement - the `objectWillChange`
/// publisher. The `objectWillChange` publisher is responsible for emitting just
/// before the object changes.
///
/// This requirement is fundamental to how the SwiftUI runtime interacts with
/// your object-based data models. It allows the runtime to react to changes
/// in your data, and queue view updates for the UI's next render cycle.
///
/// ### Using `ObservableObject`
///
/// To conform to `ObservableObject`, simply add it to the class definition.
///
/// ```
/// class AppModel: ObservableObject {
///     @Published var foo: Bool = false
/// }
/// ```
///
/// `ObservableObject` provides a default implementation for ``ObservableObject/objectWillChange``
/// using `Combine/ObservableObjectPublisher`.
///
/// To trigger `objectWillChange` events when your data changes, annotate your
/// properties with the `@Published` property wrapper. Adding `@Published` to a
/// variable causes the object to emit an `objectWillChange` event any time that
/// variable is modified.
///
/// Note: This only works if you are using the default `ObservableObject`
/// implementation, or if `objectWillChange` is an instance of
/// `ObservableObjectPublisher`. If you use a custom `Publisher` type, you are
/// responsible for triggering updates yourself.
///
/// ### Manually triggering `objectWillChange`
///
/// You can also manually trigger updates by calling
/// `ObservableObjectPublisher/send()`.
///
/// This is useful for cases where `@Published` does not suffice. For example:
///
/// ```
/// class AppModel: ObservableObject {
///     class ChildModel {
///         var foo: String = "Apple"
///     }
///
///     var childModel = ChildModel()
///
///     func updateChildModel() {
///         childModel.foo = "Banana"
///
///         objectWillChange.send()
///     }
/// }
/// ```
///
/// In this example, `AppModel` holds a reference to a child model,
/// `ChildModel`. Adding a `@Published` to the `childModel` variable would
/// have no effect because `ChildModel` is a class and not a value type.
/// Therefore, to emit a change event, you must manually call
/// `objectWillChange.send()` when updating the child model.
///
/// ### Using a custom publisher
///
/// In some cases, you may want to use a custom `Publisher` type for
/// `objectWillChange`. For example:
///
/// ```
/// class AppModel: ObservableObject {
///     public let objectWillChange = PassthroughSubject<Void, Never>()
/// }
/// ```
///
/// This example uses a ``Combine/PassthroughSubject`` for its `objectWillChange`
/// requirement. A passthrough subject is a publisher that lets you send values
/// manually (i.e. "passes through" any values sent to it).
///
/// - Note: The `@Published` property wrapper does not work with custom
/// publishers. If you use a custom publisher, you are responsible for updating
/// the object yourself. For example:
///
/// ```
/// class AppModel: ObservableObject {
///     public let objectWillChange = PassthroughSubject<Void, Never>()
///
///     var foo: Bool = false {
///         willSet {
///             objectWillChange.send()
///         }
///     }
/// }
/// ```
///
/// Here `objectWillChange.send()` is manually called everytime `foo` is about
/// to update, using the `willSet` observer.
///
/// ### Using `ObservableObject` with SwiftUI
///
/// An observable object can be used to drive changes in a ``View``, via three
/// property wrapper types:
///
/// - `@ObservedObject`
/// - `@EnvironmentObject`
/// - `@StateObject`
///
/// #### Usage with `@StateObject`
///
/// ![7EA88B2E-3B0C-4306-AF48-2D2D14818823](7EA88B2E-3B0C-4306-AF48-2D2D14818823.png)
/// ```
/// class AppModel: ObservableObject {
///     @Published var foo: Bool = false
/// }
///
/// struct ContentView: View {
///     @StateObject var appModel = AppModel()
///
///     var body: some View {
///         Toggle("Foo", isOn: $appModel.foo)
///     }
/// }
/// ```
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ObservableObject : AnyObject {

    /// The type of publisher that emits before the object has changed.
    associatedtype ObjectWillChangePublisher : Publisher = ObservableObjectPublisher where Self.ObjectWillChangePublisher.Failure == Never

    /// A publisher that emits before the object has changed.
    var objectWillChange: Self.ObjectWillChangePublisher { get }
}
