/// A SwiftUI property wrapper that holds a state value.
///
/// ### Usage
///
/// Modifying a `@State` variable causes the `body` of the view to be recomputed. For example:
///
/// ```
/// struct ExampleView: View {
///     @State var foo: String = "Apple"
///
///     var body: some View {
///         VStack {
///             Text(foo)
///
///             Button("Change Text") {
///                 foo = "Banana"
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a VStack with a text object derived
/// from a state variable and a button that reads "Change Text";
/// when pressed, the button updates the text through the variable.](wrapped-value-ex.gif)
///
/// In this example, pressing the button labeled "Change Text" modifies the `foo` state variable. This causes `ExampleView`'s `body` to be recomputed by the SwiftUI runtime. This new `body` is then queued for the next render cycle, upon which the view's display is updated on the screen.
///
/// Note:
///
/// - Recomputing the `body` is also frequently referred to as "invalidating the view".
/// - While all SwiftUI views are value types, the `@State` property wrapper creates a reference based storage managed by the SwiftUI runtime. This is why mutating a state variable does not require a mutating function.
///
/// ### Passing state down to a child view
///
/// Pass a state variable just as you would pass any other variable to a struct. For example:
///
/// ```
/// struct ExampleView: View {
///     struct ChildView: View {
///         let text: String
///
///         var body: some View {
///             Text(text)
///         }
///     }
///
///     @State var foo: String = "Apple"
///
///     var body: some View {
///         VStack {
///             ChildView(text: foo)
///
///             Button("Change Text") {
///                 foo = "Banana"
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a VStack with a text object derived
/// from the child view and a button that reads "Change Text";
/// when pressed, the button updates the text through the state variable.](wrapped-value-ex.gif)
///
/// In this example, `foo` is passed to `ChildView` by initializer.
///
/// And exactly as in the previous example, when `foo` updates, so will the
/// `body` of `ExampleView`. When the `body` of `ExampleView` is recomputed, a
/// new instance of `ChildView` is created with the latest value of `foo`
/// (which is now "Banana"). `ChildView` in turn computes its own `body`,
/// which creates a `Text("Banana")`.
///
/// Everytime a ``View`` is invalidated, its `body` is recomputed. Everytime
/// the body is recomputed, all the view's childrens' bodies are also
/// recursively recomputed. Since SwiftUI views are value types, creating
/// and destroying them repeatedly (even hundreds of times a second) does not
/// impact the app's performance.
///
/// ### Passing a reference to the state
///
/// The previous example demonstrated how a state value could be passed from a
/// view to its child. However, for the child to be able to actually modify
/// the parent's state, the parent must pass a **binding** to its child. A
/// binding is a read/write reference to the `@State` variable, and is
/// represented via ``Binding``.
///
/// To create a binding to a state variable, prefix it with a dollar sign `$`.
/// For example:
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
/// ![A gif displaying a view with a text field containg a call to a state
/// variable and textfield reading "Placeholder"; when populated with new text,
/// the text above the text field updates as well.](state-ex3.gif)
///
/// In this example, `TextField` requires a binding in order to read and write
/// to a given value. The `text` state variable is converted to a
/// `Binding<String>` using the dollar sign prefix (`$text`), and then passed
/// to ``TextField`` via its initializer.
///
/// Note: The ``Binding`` type can also be used to create references to
/// `@ObservedObject`, `@EnvironmentObject` and `@StateObject`. It is not
/// unique to `@State`, but rather a general structure that represents a
/// reference to some source of truth.
///
/// ### Modifying a state variable outside of `body`
///
/// It's possible to modify a state variable outside of a view's `body`. For example:
///
/// ```
/// struct ContentView: View {
///     @State var foo: String = "Apple"
///
///     var body: some View {
///         VStack {
///             Text(foo)
///
///             Button("Change Text", action: changeText)
///         }
///     }
///
///     func changeText() {
///         foo = "Banana"
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a VStack with a text object that
/// contains a state variable and a button that reads "Change Text";
/// when pressed, the button updates the text by calling to a function, which
/// calls to the state variable.](wrapped-value-ex.gif)
///
/// In this example, the button labeled "Change text" calls the function `changeText`, which modifies `foo`.
///
/// Note:
///
/// - `changeText` is not a `mutating` function. This is because the `@State`
/// property wrapper internally uses a reference based storage managed by the
/// SwiftUI runtime.
/// - Only access a state property from inside the view’s body, or from methods
/// called by it.
/// - Declare state properties as private, to prevent outside code from
/// accessing them.
/// - Although you should only access the state from inside the body, you
/// can mutate it elsewhere including from any thread.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen @propertyWrapper public struct State<Value> : DynamicProperty {

    /// Creates the state with an initial wrapped value.
    ///
    /// You don't call this initializer directly. Instead, declare a property
    /// with the `@State` attribute, and provide an initial value; for example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State var foo: String = "Apple"
    ///
    ///     var body: some View {
    ///         Text(foo)
    ///         Button("Change Text") { foo = "Banana" }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a text view that reads "Apple" with a button underneath
    /// it that reads "Change Text." When clicked, the text changes to read "Banana."
    /// The initial value provided to the @State attribute is Apple.](wrapped-value-ex.gif)
    ///
    /// - Parameter wrappedValue: An initial wrappedValue for a state.
    public init(wrappedValue value: Value) { }

    /// Creates the state with an initial value.
    ///
    /// For most cases of ``State``, you will initialize the object using
    /// the `@State` syntax, described in detail in the ``State`` page.
    /// However, this initializer does have an especially good use
    /// case of allowing you to initialize a structure's
    /// ``State`` property in the structure's initializer!
    /// See below.
    ///
    /// ```
    /// struct ContentView: View {
    ///     struct NameView: View {
    ///         @State var name: String
    ///
    ///         init(startingName: String) {
    ///             _name = State(initialValue: startingName) //Note the "_"!
    ///         }
    ///
    ///         var body: some View {
    ///             TextField("Type your name ✍️", text: $name)
    ///         }
    ///     }
    ///
    ///     var body: some View {
    ///         NameView(startingName: "Ron Wayne")
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a text field that reads "Ron Wayne;" when deleted, it
    /// reveals light gray text that reads "Type your name." Initializing the State
    /// property in the structure's initializer places the starting name, but it can
    /// be changed by the user.](initial-value-ex.gif)
    ///
    /// - Parameter value: An initial value of the state.
    public init(initialValue value: Value) { }

    /// The underlying value referenced by the state variable.
    ///
    /// This property provides primary access to the value's data. However, you
    /// don't access `wrappedValue` directly. Instead, you use the property
    /// variable created with the `@State` attribute. For example, in the
    /// following code example the button's actions toggles the value of
    /// `showingProfile`, which toggles `wrappedValue`:
    ///
    ///     struct ContentView: View {
    ///         @State private var showingProfile = false
    ///
    ///         var profileButton: some View {
    ///             Button(action: { showingProfile.toggle() }) {
    ///                 Image(systemName: "person.crop.circle")
    ///                     .imageScale(.large)
    ///                     .padding()
    ///             }
    ///         }
    ///     }
    ///
    /// When a mutable binding value changes, the new value is immediately
    /// available. However, updates to a view displaying the value happens
    /// asynchronously, so the view may not show the change immediately.
    public var wrappedValue: Value { get /*nonmutating set*/ }

    /// A binding to the state value.
    ///
    /// Use the projected value to pass a ``Binding`` value down a view hierarchy.
    /// To get the `projectedValue`, prefix the property variable with `$`. For
    /// example, in the following code example `PlayerView` projects a binding
    /// of the state property `title` to the ``TextField`` view using
    /// `$title`.
    ///
    ///     struct PlayerView: View {
    ///         @State private var title = "The Wedding, pt. 2"
    ///
    ///         var body: some View {
    ///             TextField("Show title", text: $title)
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a keyboard on the lower half of the screen and a
    /// text field above that reads "The Wedding, pt. 2." The state property title is
    /// projected as a binding to the text field. ](state-projectedvalue.png)
    public var projectedValue: Binding<Value> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension State where Value : ExpressibleByNilLiteral {

    /// Creates a state without an initial value.
    ///
    /// **Don't use this initializer directly. Instead, see ``State`` for
    /// info on how to use state as a property wrapper.**
    @inlinable public init() { }
}

