/// A SwiftUI property wrapper that instantiates and stores an observable object in state.
///
/// - Think of `@StateObject` as a combination of `@State` and `@ObservedObject`.
/// - Like `@ObservedObject`, this type subscribes to the observable object and invalidates a view whenever the observable object changes.
/// - Unlike `@ObservedObject`, `@StateObject` holds on to its value even when the view is invalidated and redrawn.
///
/// ### Usage
///
/// In the following example, an observable object class `AppModel` is instantiated and stored in a `@StateObject`:
///
/// ```
/// class AppModel: ObservableObject {
///     @Published var foo: Bool = false
/// }
///
/// struct ExampleView: View {
///     @StateObject var appModel = AppModel()
///
///     var body: some View {
///         Text("Hello World")
///     }
/// }
/// ```
///
/// ![A view displaying the text "Hello World"; the view instantiates an
/// observable object class AppModel and stores it in a @StateObject.](B96E266D-DFC6-40A9-B6C1-56C609F308D0.png)
///
/// ### How it works
///
/// The following is the basic structure of a `@StateObject`:
///
/// ```
/// struct StateObject<ObjectType: ObservableObject>: DynamicProperty {
///     var wrappedValue: ObjectType { get }
///
///     init(wrappedValue thunk: @autoclosure @escaping () -> ObjectType)
/// }
/// ```
///
/// It's important to note that the initializer takes an `@autoclosure`
/// expression. This means that the following code is evaluated lazily:
///
/// ```
/// @StateObject var appModel = AppModel()
/// ```
///
/// `AppModel` is only initialized once per the lifetime of the ``View``,
/// ``Scene`` or ``App`` that contains the `@StateObject`. This is made
/// possible by the `@autoclosure` annotation, that wraps the instantiation
/// of the app model, `AppModel()`, into a lazy expression at compile time,
/// `{ return AppModel() }`. This allows the `@StateObject` to call it
/// appropriately as needed, which is once per its parent's lifetime.
///
/// ### Creating bindings
///
/// Just like `@State`, `@ObservedObject` and `@EnvironmentObject`,
/// `@StateObject` allows you to create a ``Binding`` from its wrapped value
/// type using the `$` syntax.
///
/// For example:
///
/// ```
/// class AppModel: ObservableObject {
///     @Published var flag: Bool = false
/// }
///
/// struct ExampleView: View {
///     @StateObject var appModel = AppModel()
///
///     var body: some View {
///         Toggle("Flag", isOn: $appModel.flag)
///     }
/// }
/// ```
///
/// ![A gif displaying a toggle named "Flag" switching on and off; the view
/// instantiates an observable object class AppModel with a bool variable called
/// flag that acts as a binding for isOn in the toggle by way of a@StateObject.](state-object-ex2.gif)
///
/// In this example, `AppModel` contains a boolean, `flag`, which is
/// represented by a ``Toggle`` in `ChildView`. ``Toggle`` requires a
/// `Binding<Bool>` to read and write whether it is on.
///
/// ### Comparison with `@ObservedObject`
///
/// Consider the following:
///
/// ```
/// struct ExampleView: View {
///     class ViewModel: ObservableObject {
///         init() {
///             print("Initialized")
///         }
///     }
///
///     struct ToggleDescription: View {
///         let value: Bool
///
///         @StateObject var viewModel = ViewModel()
///
///         var body: some View {
///             Text("The value is: \(String(describing: value))")
///         }
///     }
///
///     @State var foo = false
///
///     var body: some View {
///         VStack {
///             ToggleDescription(value: foo)
///
///             Toggle("Refresh", isOn: $foo)
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying view containing a VStack with a toggle description reading
/// "The value is: _", populated with true or false dependent on the bool value,
/// and a toggle called "Refresh" that is used to change the bool value; flipping
/// the toggle caused "Initialized" to be printed once in the console because
/// the view uses a state object.](state-object-ex3.gif)
///
/// `ExampleView` creates a vertical stack of a ``Toggle``, and a view that
/// describes the toggle, `ToggleDescription`.
///
/// `ToggleDescription` also contains a `ViewModel`, that is instantiated and
/// held by `@StateObject`. The `ViewModel` prints on initialization. Run this
/// code and observe that the following is printed:
///
/// ```
/// Initialized
/// ```
///
/// Flip the toggle twice. Note that even though `ToggleDescription` is
/// refreshed, nothing is printed further.
///
/// Now consider the following:
///
/// ```
/// struct ExampleView: View {
///     class ViewModel: ObservableObject {
///         init() {
///             print("Initialized")
///         }
///     }
///
///     struct ToggleDescription: View {
///         let value: Bool
///
///         @ObservedObject var viewModel = ViewModel()
///
///         var body: some View {
///             Text("The value is: \(String(describing: value))")
///         }
///     }
///
///     @State var foo = false
///
///     var body: some View {
///         VStack {
///             ToggleDescription(value: foo)
///
///             Toggle("Refresh", isOn: $foo)
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying view containing a VStack with a toggle description reading
/// "The value is: _", populated with true or false dependent on the bool value,
/// and a toggle called "Refresh" that is used to change the bool value; flipping
/// the toggle caused "Initialized" to be printed each time in the console because
/// the view uses an observed object.](state-object-ex3.gif)
///
/// This example is identical to the previous example **except** for the
/// fact that `@StateObject` has been replaced with `@ObservedObject`. Run
/// this code now, and observe the following print again:
///
/// ```
/// Initialized
/// ```
///
/// Now flip the toggle twice. The console will print the following:
///
/// ```
/// Initialized
/// Initialized
/// ```
///
/// This highlights the fundamental difference between `@StateObject` and
/// `@ObservedObject`.
///
/// - `@StateObject` instantiates and holds the object in state
/// - `@ObservedObject` is *assigned* an object, and **does not** hold it in
// state
///
/// ### Usage with ``App``
///
/// `@StateObject` provides a great way to initialize global, application-wide
/// models.
///
/// In the following example, a `@StateObject` is instantiated in `MyApp`, and
/// passed down to `ExampleView` as an environment object.
///
/// ```
/// class AppModel: ObservableObject {
///     @Published var foo: Bool = false
/// }
///
/// @main
/// struct MyApp: App {
///     @StateObject var appModel = AppModel()
///
///     var body: some Scene {
///         WindowGroup {
///             ExampleView()
///                 .environmentObject(appModel)
///         }
///     }
/// }
///
/// struct ExampleView: View {
///     @EnvironmentObject var appModel: AppModel
///
///     var body: some View {
///         Text("Hello World")
///     }
/// }
/// ```
///
/// ![A view displaying the text "Hello world"; the main app instantiates a state
/// object and passes it down to the view as an environment object.](B96E266D-DFC6-40A9-B6C1-56C609F308D0.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen @propertyWrapper public struct StateObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {

    /// Creates a new state object with an initial wrapped value.
    ///
    /// You don’t call this initializer directly. Instead, declare a property
    /// with the `@StateObject` attribute in a ``View``,
    /// ``App``, or ``Scene``, and provide an initial value:
    ///
    ///     struct MyView: View {
    ///         @StateObject var model = DataModel()
    ///
    ///         // ...
    ///     }
    ///
    /// SwiftUI creates only one instance of the state object for each
    /// container instance that you declare. In the code above, SwiftUI
    /// creates `model` only the first time it initializes a particular instance
    /// of `MyView`. On the other hand, each different instance of `MyView`
    /// receives a distinct copy of the data model.
    ///
    /// - Parameter thunk: An initial value for the state object.
    @inlinable public init(wrappedValue thunk: @autoclosure @escaping () -> ObjectType) { }

    /// The underlying value referenced by the state object.
    ///
    /// The wrapped value property provides primary access to the value's data.
    /// However, you don't access `wrappedValue` directly. Instead, use the
    /// property variable created with the `@StateObject` attribute:
    ///
    ///     @StateObject var contact = Contact()
    ///
    ///     var body: some View {
    ///         Text(contact.name) // Accesses contact's wrapped value.
    ///     }
    ///
    /// When you change a property of the wrapped value, you can access the new
    /// value immediately. However, SwiftUI updates views displaying the value
    /// asynchronously, so the user interface might not update immediately.
    public var wrappedValue: ObjectType { get }

    /// A projection of the state object that creates bindings to its
    /// properties.
    ///
    /// Use the projected value to pass a binding value down a view hierarchy.
    /// To get the projected value, prefix the property variable with `$`. For
    /// example, you can get a binding to a model's `isEnabled` Boolean so that
    /// a ``Toggle`` view can control the value:
    ///
    ///     struct MyView: View {
    ///         @StateObject var model = DataModel()
    ///
    ///         var body: some View {
    ///             Toggle("Enabled", isOn: $model.isEnabled)
    ///         }
    ///     }
    public var projectedValue: ObservedObject<ObjectType>.Wrapper { get }
}

