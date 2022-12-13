/// A property wrapper type that can read and write a value that SwiftUI updates
/// as the placement of focus within the scene changes.
///
/// Use this property wrapper in conjunction with ``View/focused(_:equals:)``
/// and ``View/focused(_:)`` to
/// describe views whose appearance and contents relate to the location of
/// focus in the scene. When focus enters the modified view, the wrapped value
/// of this property updates to match a given prototype value. Similarly, when
/// focus leaves, the wrapped value of this property resets to `nil`
/// or `false`. Setting the property's value programmatically has the reverse
/// effect, causing focus to move to the view associated with the
/// updated value.
///
/// In the following example of a simple login screen, when the user presses the
/// Sign In button and one of the fields is still empty, focus moves to that
/// field. Otherwise, the sign-in process proceeds.
///
///     struct LoginForm {
///         enum Field: Hashable {
///             case username
///             case password
///         }
///
///         @State private var username = ""
///         @State private var password = ""
///         @FocusState private var focusedField: Field?
///
///         var body: some View {
///             Form {
///                 TextField("Username", text: $username)
///                     .focused($focusedField, equals: .username)
///
///                 SecureField("Password", text: $password)
///                     .focused($focusedField, equals: .password)
///
///                 Button("Sign In") {
///                     if username.isEmpty {
///                         focusedField = .username
///                     } else if password.isEmpty {
///                         focusedField = .password
///                     } else {
///                         handleLogin(username, password)
///                     }
///                 }
///             }
///         }
///     }
///
/// To allow for cases where focus is completely absent from a view tree, the
/// wrapped value must be either an optional or a Boolean. Set the focus binding
/// to `false` or `nil` as appropriate to remove focus from all bound fields.
/// You can also use this to remove focus from a ``TextField`` and thereby
/// dismiss the keyboard.
///
/// ### Avoid ambiguous focus bindings
///
/// The same view can have multiple focus bindings. In the following example,
/// setting `focusedField` to either `name` or `fullName` causes the field
/// to receive focus:
///
///     struct ContentView: View {
///         enum Field: Hashable {
///             case name
///             case fullName
///         }
///         @FocusState private var focusedField: Field?
///
///         var body: some View {
///             TextField("Full Name", ...)
///                 .focused($focusedField, equals: .name)
///                 .focused($focusedField, equals: .fullName)
///         }
///     }
///
/// On the other hand, binding the same value to two views is ambiguous. In
/// the following example, two separate fields bind focus to the `name` value:
///
///     struct ContentView: View {
///         enum Field: Hashable {
///             case name
///             case fullName
///         }
///         @FocusState private var focusedField: Field?
///
///         var body: some View {
///             TextField("Name", ...)
///                 .focused($focusedField, equals: .name)
///             TextField("Full Name", ...)
///                 .focused($focusedField, equals: .name) // incorrect re-use of .name
///         }
///     }
///
/// If the user moves focus to either field, the `focusedField` binding updates
/// to `name`. However, if the app programmatically sets the value to `name`,
/// SwiftUI chooses the first candidate, which in this case is the "Name"
/// field. SwiftUI also emits a runtime warning in this case, since the repeated
/// binding is likely a programmer error.
///
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen @propertyWrapper public struct FocusState<Value> : DynamicProperty where Value : Hashable {

    /// A property wrapper type that can read and write a value that indicates
    /// the current focus location.
    @frozen @propertyWrapper public struct Binding {

        /// The underlying value referenced by the bound property.
        public var wrappedValue: Value { get nonmutating set }

        /// A projection of the binding value that returns a binding.
        ///
        /// Use the projected value to pass a binding value down a view
        /// hierarchy.
        public var projectedValue: FocusState<Value>.Binding { get }
    }

    /// The current state value, taking into account whatever bindings might be
    /// in effect due to the current location of focus.
    ///
    /// When focus is not in any view that is bound to this state, the wrapped
    /// value will be `nil` (for optional-typed state) or `false` (for `Bool`-
    /// typed state).
    public var wrappedValue: Value { get nonmutating set }

    /// A projection of the focus state value that returns a binding.
    ///
    /// When focus is outside any view that is bound to this state, the wrapped
    /// value is `nil` for optional-typed state or `false` for Boolean state.
    ///
    /// In the following example of a simple navigation sidebar, when the user
    /// presses the Filter Sidebar Contents button, focus moves to the sidebar's
    /// filter text field. Conversely, if the user moves focus to the sidebar's
    /// filter manually, then the value of `isFiltering` automatically
    /// becomes `true`, and the sidebar view updates.
    ///
    ///     struct Sidebar: View {
    ///         @State private var filterText = ""
    ///         @FocusState private var isFiltering: Bool
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Button("Filter Sidebar Contents") {
    ///                     isFiltering = true
    ///                 }
    ///
    ///                 TextField("Filter", text: $filterText)
    ///                     .focused($isFiltering)
    ///             }
    ///         }
    ///     }
    public var projectedValue: FocusState<Value>.Binding { get }

    /// Creates a focus state that binds to a Boolean.
    public init() where Value == Bool { }

    /// Creates a focus state that binds to an optional type.
    public init<T>() where Value == T?, T : Hashable { }
}

