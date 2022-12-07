/// This type handles shared values across views.
///
/// `Binding` is a property wrapper that creates a connection between stored
/// data, and a view that displays and changes that data. It is a **two-way
/// connection** to a source of truth. It is used to both read the latest
/// value, as well as to set a new value. `Binding` defines a **getter**
/// and a **setter** for a value.
///
/// ### Structure of a `Binding`
///
/// A `Binding` is essentially the following structure:
///
/// ```
/// struct Binding<Value> {
///     let get: () -> Value
///     let set: (Value) -> ()
/// }
/// ```
///
/// ### Creating a `Binding` from `@State`
///
/// A `Binding` typically represents a reference to a mutable source of
/// truth - such as `@State`, `@ObservedObject` or a reference-writable keypath
/// of an object. To create a `Binding` from a mutable source of truth,
/// prefix the variable name for the source of truth with a dollar sign (`$`).
///
/// For example, a ``TextField`` can be bound to a state variable:
///
/// ```
/// struct ExampleView: View {
///     @State var text: String = "🍌🍌"
///
///     var body: some View {
///         Text(text)
///         TextField("Placeholder", text: $text)
///     }
/// }
/// ```
///
/// ![A gif showing a text field that displays the corresponding placeholder text in the view center until changed.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Binding-example-1.gif)
///
/// In the example above, the source of truth is a `@State` variable,
/// named `text`. `text`  represents a
/// [`String`](https://developer.apple.com/documentation/swift/string),
/// whereas `$text` represents
/// a `Binding<String>`. ``TextField``'s initializer accepts a placeholder
/// [`String`](https://developer.apple.com/documentation/swift/string) and a
/// `Binding<String>`. In this example, `TextField` requires a
/// ``Binding`` to the source of truth as ``TextField`` must be able to
/// *write back* to the `@State` variable (a **mutable** source of truth).
///
/// Recall, a `Binding` is a **two-way connection** to a source of truth.
/// It is used to both read the latest value, as well as to set a new value.
/// In the previous example, the view's initial render will display an
/// editable text of "🍌🍌" on the screen - ``TextField`` reads the current
/// value of the source of truth ``text`` via the  `Binding` `$text`. When
/// the user starts editing, ``TextField`` *writes back* new values to the
/// source of truth `text` via the `Binding`  `$text` once again.
///
/// ### Creating a `Binding` from an ``ObservableObject``
///
/// In this example, the source of truth is an observable object
/// `ExampleModel` - stored in a `@StateObject` owned by `ExampleView`:
///
/// ```
/// struct ExampleView: View {
///     @StateObject var viewModel = ExampleModel()
///
///     var text: String {
///         viewModel.isEnabled ? "Enabled" : "Disabled"
///     }
///
///     var body: some View {
///         Toggle(text, isOn: $viewModel.isEnabled)
///     }
/// }
///
/// class ExampleModel: ObservableObject {
///     @Published var isEnabled: Bool = false
/// }
/// ```
///
/// ![A gif showing a view with the text "Disabled", which is replaced by "Enabled" when the corresponding toggle on the right side of the frame is clicked.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Binding-example-2.gif)
///
/// The binding between the model's `isEnabled` variable and a toggle is
/// established using `$viewModel.isEnabled` within `ExampleView`'s body.
/// Note that the dollar sign must prefix the **root** variable, even in the
/// case where a child member is being referenced. `$viewModel.isEnabled`
/// and `viewModel.$isEnabled` are **not** equivalent. The former creates a
/// ``Binding`` to `isEnabled`, whereas the latter unwraps the projected
/// value of the `@Published` property wrapper wrapping `isEnabled`.
///
/// ### Animating Updates via a ``Binding``
///
/// Since a `Binding` is capable of updating a view's state, the state
/// update can be made to animate with ``Binding/animation(_:)``.
/// Usage looks as follows:
///
/// ```
/// $myVariable.animation(.default)
/// ```
///
/// ### Creating a ``Binding`` from a constant
///
/// At times, you may want to pass a fixed value as a `Binding`. This is
/// possible via ``Binding/constant(_:)``, which creates a `Binding`
/// to a fixed value, ignoring any updates from the consumer of the binding.
///
/// Consider ``EnvironmentValues/editMode``, for example. A ``List`` can be
/// forced into active editing by passing a binding to `EditMode.active`.
///
/// ```
/// struct ExampleView: View {
///     @State var fruits = ["🍌", "🍏", "🍑"]
///
///     var body: some View {
///         List {
///             ForEach(fruits, id: \.self) { fruit in
///                 Text(fruit)
///             }
///             .onDelete { offets in
///                 fruits.remove(atOffsets: offets)
///             }
///         }
///         .environment(\.editMode, .constant(.active))
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a list with three members; the gif
/// shows two of the items being deleted from the list.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Binding-example-3.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen @propertyWrapper @dynamicMemberLookup public struct Binding<Value> {

    /// The binding's transaction.
    ///
    /// The transaction captures the information needed to update the view when
    /// the binding value changes.
    public var transaction: Transaction

    /// Creates a binding with closures that read and write the binding value.
    ///
    /// - Parameters:
    ///   - get: A closure that retrieves the binding value. The closure has no
    ///     parameters, and returns a value.
    ///   - set: A closure that sets the binding value. The closure has the
    ///     following parameter:
    ///       - newValue: The new value of the binding value.
    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void) { }

    /// Creates a binding with a closure that reads from the binding value, and
    /// a closure that applies a transaction when writing to the binding value.
    ///
    /// - Parameters:
    ///   - get: A closure to retrieve the binding value. The closure has no
    ///     parameters, and returns a value.
    ///   - set: A closure to set the binding value. The closure has the
    ///     following parameters:
    ///       - newValue: The new value of the binding value.
    ///       - transaction: The transaction to apply when setting a new value.
    public init(get: @escaping () -> Value, set: @escaping (Value, Transaction) -> Void) { }

    /// Creates a binding with an immutable value.
    ///
    /// Use this method to create a binding to a value that cannot change.
    /// This can be useful when using a ``PreviewProvider`` to see how a view
    /// represents different values.
    ///
    ///     // Example of binding to an immutable value.
    ///     PlayButton(isPlaying: Binding.constant(true))
    ///
    /// Another use case is for prototyping. For example:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Toggle("Banana On", isOn: .constant(true))
    ///     }
    /// }
    /// ```
    ///
    /// - Parameter value: An immutable value.
    public static func constant(_ value: Value) -> Binding<Value> { }

    /// The underlying value referenced by the binding variable.
    ///
    /// This property provides primary access to the value's data. However, you
    /// don't access `wrappedValue` directly. Instead, you use the property
    /// variable created with the `@Binding` attribute. For instance, in the
    /// following code example the binding variable `isPlaying` returns the
    /// value of `wrappedValue`:
    ///
    ///     struct PlayButton: View {
    ///         @Binding var isPlaying: Bool
    ///
    ///         var body: some View {
    ///             Button(action: {
    ///                 self.isPlaying.toggle()
    ///             }) {
    ///                 Image(systemName: isPlaying ? "pause.circle" : "play.circle")
    ///             }
    ///         }
    ///     }
    ///
    /// When a mutable binding value changes, the new value is immediately
    /// available. However, updates to a view displaying the value happens
    /// asynchronously, so the view may not show the change immediately.
    public var wrappedValue: Value { get /*nonmutating set*/ }

    /// A projection of the binding value that returns a binding.
    ///
    /// Use the projected value to pass a binding value down a view hierarchy.
    /// To get the `projectedValue`, prefix the property variable with `$`. For
    /// example, in the following code example `PlayerView` projects a binding
    /// of the state property `isPlaying` to the `PlayButton` view using
    /// `$isPlaying`.
    ///
    ///     struct PlayerView: View {
    ///         var episode: Episode
    ///         @State private var isPlaying: Bool = false
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Text(episode.title)
    ///                 Text(episode.showTitle)
    ///                 PlayButton(isPlaying: $isPlaying)
    ///             }
    ///         }
    ///     }
    public var projectedValue: Binding<Value> { get }

    /// Returns a binding to the resulting value of a given key path.
    ///
    /// - Parameter keyPath: A key path to a specific resulting value.
    ///
    /// - Returns: A new binding.
    public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Binding<Subject> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Binding {

    /// Creates a binding by projecting the base value to an optional value.
    ///
    /// - Parameter base: A value to project to an optional value.
    public init<V>(_ base: Binding<V>) where Value == V? { }

    /// Creates a binding by projecting the base value to an unwrapped value.
    ///
    /// - Parameter base: A value to project to an unwrapped value.
    ///
    /// - Returns: A new binding or `nil` when `base` is `nil`.
    public init?(_ base: Binding<Value?>) { }

    /// Creates a binding by projecting the base value to a hashable value.
    ///
    /// - Parameters:
    ///   - base: A `Hashable` value to project to an `AnyHashable` value.
    public init<V>(_ base: Binding<V>) where Value == AnyHashable, V : Hashable { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Binding {

    /// Specifies a transaction for the binding.
    ///
    /// - Parameter transaction  : An instance of a ``Transaction``.
    ///
    /// - Returns: A new binding.
    public func transaction(_ transaction: Transaction) -> Binding<Value> { }

    /// Specifies an animation to perform when the binding value changes.
    ///
    /// - Parameter animation: An animation sequence performed when the binding
    ///   value changes.
    ///
    /// - Returns: A new binding.
    public func animation(_ animation: Animation? = .default) -> Binding<Value> { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Binding : DynamicProperty {
}

