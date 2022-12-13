/// A SwiftUI property wrapper that subscribes to an observable object.
///
/// - Like `@StateObject`, this type subscribes to the observable object and
/// invalidates a view whenever the observable object changes.
/// - Unlike `@StateObject,` `@ObservedObject` does not persist the object in
/// state. Objects are only *assigned* to `@ObservedObject`, they should be
/// initialized and persistent by an ancestor view.
///
/// ### Usage
///
/// In the following example, an observable object is assigned to an
/// `@ObservedObject` variable:
///
/// ```
/// class AppModel: ObservableObject {
///     static let shared = AppModel()
///
///     @Published var fruitName: String = "Apple"
/// }
///
/// struct ExampleView: View {
///     @ObservedObject var appModel = AppModel.shared
///
///     var body: some View {
///         VStack {
///             Text(appModel.fruitName)
///
///             Button("Change Text") {
///                 appModel.fruitName = "Banana"
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a VStaxk with a text object "Apple"
/// derived from the related app model and a button that reads "Change Text";
/// when pressed, the button updates the text to "Banana" using the app model.](wrapped-value-ex.gif)
///
/// In the example above, `ExampleView` will update its displayed text to
/// "Banana" when the button labeled "Change Text" is pressed. This is because
/// `ExampleView` has subscribed to `AppModel.shared` via the `@ObservedObject`
/// `appModel` variable.
///
/// Whenever the object referenced by `appModel` (which is `AppModel.shared`
/// in this case) emits a change, `ExampleView` will be invalidated and redrawn.
///
/// ### Creating bindings
///
/// Just like `@State`, `@EnvironmentObject` and `@StateObject`,
/// `@ObservedObject` allows you to create a ``Binding`` to an object using
/// the `$` prefix syntax.
///
/// For example:
///
/// ```
/// class AppModel: ObservableObject {
///     static let shared = AppModel()
///
///     @Published var fruitName: String = "Apple"
/// }
///
/// struct ExampleView: View {
///     @ObservedObject var appModel = AppModel.shared
///
///     var body: some View {
///         TextField("Enter fruit name", text: $appModel.fruitName)
///     }
/// }
/// ```
///
/// ![A gif displaying a main view with an observed object variable and a text field
/// reading "Enter fruit name"; when text is entered, it is bound to the
/// related app models published variable called fruitName.](observed-object-ex3.gif)
///
/// In this example, a two-way connection is established between
/// `appModel.fruitName` and ``TextField``, by using the `$` prefix to
/// create a `Binding<String>`. This allows ``TextField`` to update the
/// `fruitName` variable when the user enters text, and also to update its
/// own displayed text if `fruitName` is changed programmatically.
///
/// ### Passing an observable object to a child view using `@ObservedObject`
///
/// Pass an observable object like you would pass any other variable down to a
/// child view. For example:
///
/// ```
/// class AppModel: ObservableObject {
///     static let shared = AppModel()
///
///     @Published var fruitName: String = "Apple"
/// }
///
/// struct ExampleView: View {
///     @StateObject var appModel = AppModel()
///
///     struct ChildView: View {
///         @ObservedObject var appModel: AppModel
///
///         var body: some View {
///             TextField("Enter fruit name", text: $appModel.fruitName)
///         }
///     }
///
///     var body: some View {
///         ChildView(appModel: appModel)
///     }
/// }
/// ```
///
/// ![A main view with a state object variable containing an oberservable object
/// that it passes to the child view with an observed object variable, which
/// displays a text field reading "Enter fruit name"; when text is entered,
/// it is bound to the related app model's published variable called fruitName.](observed-object-ex3.gif)
///
/// It is a common pattern for a parent view to create a `@StateObject` to
/// hold an observable object, and then to pass it down to a child using an
/// `@ObservedObject`. `@StateObject` **owns** the object, `@ObservedObject`
/// simply holds a reference to the object.
///
/// ### Comparison with `@StateObject`
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
/// the view uses a state object.](observed-object-ex4.gif)
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
/// This example is identical to the previous example **except** for the fact
/// that `@StateObject` has been replaced with `@ObservedObject`. Run this
/// code now, and observe the following print again:
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
/// -  `@StateObject` instantiates and holds the object in state.
/// -  `@ObservedObject` is *assigned* an object, and **does not** hold it in state
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper @frozen public struct ObservedObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {

    /// A wrapper of the underlying observable object that can create bindings to
    /// its properties using dynamic member lookup.
    @dynamicMemberLookup @frozen public struct Wrapper {

        /// Returns a binding to the resulting value of a given key path.
        ///
        /// - Parameter keyPath  : A key path to a specific resulting value.
        ///
        /// - Returns: A new binding.
        public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> { get }
    }

    /// Creates an observed object with an initial value.
    ///
    /// - Parameter initialValue: An initial value.
    public init(initialValue: ObjectType) { }

    /// Creates an observed object with an initial wrapped value.
    ///
    /// You don't call this initializer directly. Instead, declare a property
    /// with the `@ObservedObject` attribute, and provide an initial value.
    ///
    /// - Parameter wrappedValue: An initial value.
    public init(wrappedValue: ObjectType) { }

    /// The underlying value referenced by the observed object.
    ///
    /// This property provides primary access to the value's data. However, you
    /// don't access `wrappedValue` directly. Instead, you use the property
    /// variable created with the `@ObservedObject` attribute.
    ///
    /// When a mutable value changes, the new value is immediately available.
    /// However, a view displaying the value is updated asynchronously and may
    /// not show the new value immediately.
    public var wrappedValue: ObjectType

    /// A projection of the observed object that creates bindings to its
    /// properties using dynamic member lookup.
    ///
    /// Use the projected value to pass a binding value down a view hierarchy.
    /// To get the `projectedValue`, prefix the property variable with `$`.
    public var projectedValue: ObservedObject<ObjectType>.Wrapper { get }
}

