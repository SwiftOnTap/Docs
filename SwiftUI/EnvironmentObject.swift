/// A property wrapper type for an observable object passed down the view
/// hierarchy by a parent view.
///
/// `@EnvironmentObject` is similar to `@ObservedObject` in that they both
/// invalidate the view using them whenever the observed object changes.
///
/// `@EnvironmentObject` differs from `@ObservedObject` in that it receives
/// the object to observe at runtime, from the view's environment, whereas
/// `@ObservedObject` receives it directly either by the immediate parent
/// view or by an initial value while declaring it.
/// [environment-objects ->]
/// ### Using environment objects
///
/// Consider the following example:
///
/// ```
/// class AppModel: ObservableObject {
///     let text: String = "This text was passed through views by way of an environment 🌿🕊🌏 object!"
/// }
///
/// struct ContentView: View {
///     @StateObject var appModel = AppModel()
///
///     var body: some View {
///         ChildView()
///             .environmentObject(appModel)
///     }
/// }
///
/// struct ChildView: View {
///     @EnvironmentObject var appModel: AppModel
///
///     var body: some View {
///         Text(appModel.text)
///     }
/// }
/// ```
///
/// ![A view displaying the text "This text was passed through views by way of
/// an environment 🌿🕊🌏 object!"; the main view intializes an app
/// model through a state object and a child view, which uses an environment
/// object to display the text declared in the app model.](view-environ-obj-ex.png)
///
/// - An app model, `AppModel` is initialized in a `@StateObject` in the
/// `ContentView`.
/// - `ContentView` initializes `ChildView`, and then passes the app model
/// initialized via ``View/environmentObject(_:)``.
/// - `ChildView` uses `AppModel` to display a piece of text declared by the
/// app model.
/// [<-]
/// Now consider a slightly different version of this example:
///
/// ```
/// class AppModel: ObservableObject {
///     let text: String = "some text"
/// }
///
/// struct ContentView: View {
///     @StateObject var appModel = AppModel()
///
///     var body: some View {
///         IntermediateView()
///             .environmentObject(appModel)
///     }
/// }
///
/// struct IntermediateView: View {
///     var body: some View {
///         ChildView()
///             .padding()
///     }
/// }
///
/// struct ChildView: View {
///     @EnvironmentObject var appModel: AppModel
///
///     var body: some View {
///         Text(appModel.text)
///     }
/// }
///
/// ```
///
/// ![A view displaying the text "some text"; the main view intializes an
/// app model through a state object and an intermediate view, which initializes
/// a child view, which uses an environment object to display the text
/// declared in the app model.](6181BC35-A419-499C-B394-64E170CECAD1.png)
///
/// In this example, `ChildView` is initialized by an `IntermediateView`,
/// which in turn is initialized by `ContentView`. This example is different
/// only in that there is an additional level of nesting, via
/// `IntermediateView` (a view that adds padding to `ChildView`).
///
/// Note that `ChildView` did not need to be changed at all.
/// `@EnvironmentObject` is neither used nor declared in `IntermediateView`,
/// yet it is still available in the same way at one level deeper.
///
/// This is also the primary way in which `@EnvironmentObject` and
/// `@ObservedObject` differ. Had `ChildView` been using `@ObservedObject`,
/// the app model would need to be passed explicitly through
/// `IntermediateView`, which would also need to declare
/// `var appModel: AppModel` and then pass it to `ChildView`'s initializer.
///
/// ### Creating bindings
///
/// Here is another example:
///
/// ```
/// class AppModel: ObservableObject {
///     @Published var flag: Bool = false
/// }
///
/// struct ContentView: View {
///     @StateObject var appModel = AppModel()
///
///     var body: some View {
///         ChildView()
///             .environmentObject(appModel)
///     }
/// }
///
/// struct ChildView: View {
///     @EnvironmentObject var appModel: AppModel
///
///     var body: some View {
///         Toggle("Flag", isOn: $appModel.flag)
///     }
/// }
/// ```
///
/// ![A gif flipping a toggle named "Flag" on and off; the main view intializes an
/// app model containing the bool for flag through a state object and
/// a child view, which uses an environment object to display the toggle.](bindings-ex.gif)
///
///  In this example, `AppModel` contains a boolean, `flag`, which is
/// represented by a ``Toggle`` in `ChildView`. ``Toggle`` requires a
/// `Binding<Bool>` to read and write whether it is on.
///
/// Just like `@State`, `@ObservedObject` and `@StateObject`,
/// `@EnvironmentObject` allows you to create a ``Binding`` from its wrapped
/// value type using the `$` syntax.
///
/// `$appModel.flag` creates a binding to `flag`, which is then passed to the
/// toggle. This is also a good example of how **mutable** data can be passed
/// down from a parent view to a child view (at any level deep) at runtime.
///
/// ### Dependency injection
///
/// Because `@EnvironmentObject` receives the object from the environment, the
/// object can be passed down any number of levels. This makes it especially
/// useful for problems such as dependency injection.
///
/// There are many use cases of `@EnvironmentObject` that don't necessarily
/// involve passing the app's main model down. For example:
///
/// - Providing a "theme" object, allowing child views to adapt as per the
/// theme passed down.
/// - Providing a cache, that allows complex network-based views to be broken
/// down into reusable components, while still using a cache provided by the
/// parent.
/// - Passing a global navigation manager - a navigator object that contains
/// the current navigation selection.
///
/// ### Caveats
///
/// There are some limitations to `@EnvironmentObject`, especially on older
/// versions of iOS.
///
/// On iOS 13, environment objects do not automatically pass to sheets or
/// navigation destinations. The following code would crash on iOS 13, for
/// example:
///
/// ```
/// class AppModel: ObservableObject {
///     @Published var flag: Bool = false
/// }
///
/// struct ContentView: View {
///     @StateObject var appModel = AppModel()
///
///     @State var isPresented: Bool = false
///
///     var body: some View {
///         Button("Present") {
///             isPresented = true
///         }
///         .sheet(isPresented: $isPresented) {
///             ChildView()
///         }
///         .environmentObject(appModel)
///     }
/// }
///
/// struct ChildView: View {
///     @EnvironmentObject var appModel: AppModel
///
///     var body: some View {
///         Toggle("Flag", isOn: $appModel.flag)
///     }
/// }
/// ```
///
/// ![A gif displaying an iOS 14 screen with a button "present" that once
/// pressed reveals a sheet with a toggle named "Flag"; the main view contains
/// the button and the sheet and intializes an app model containing the bool for
/// flag through a state object and a child view, which uses an environment
/// object to display the toggle.](environment-object-ex4.gif)
///
/// To fix it, the ``View/environmentObject(_:)`` modifier would need to be
/// added directly to the sheet's content, like this:
///
/// ```
/// class AppModel: ObservableObject {
///     @Published var flag: Bool = false
/// }
///
/// struct ContentView: View {
///     @StateObject var appModel = AppModel()
///
///     @State var isPresented: Bool = false
///
///     var body: some View {
///         Button("Present") {
///             isPresented = true
///         }
///         .sheet(isPresented: $isPresented) {
///             ChildView()
///                 .environmentObject(appModel)
///         }
///         .environmentObject(appModel)
///     }
/// }
///
/// struct ChildView: View {
///     @EnvironmentObject var appModel: AppModel
///
///     var body: some View {
///         Toggle("Flag", isOn: $appModel.flag)
///     }
/// }
/// ```
///
/// ![A gif displaying an iOS 13 screen with a button "present" that once
/// pressed reveals a sheet with a toggle named "Flag"; the main view contains
/// the button and the sheet, which contains an environment object, and intializes
/// an app model containing the bool for flag through a state object, and a child
/// view, which uses an the same environment object in the sheet and to display
/// the toggle.](environment-object-ex5.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen @propertyWrapper public struct EnvironmentObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {

    /// A wrapper of the underlying environment object that can create bindings
    /// to its properties using dynamic member lookup.
    @dynamicMemberLookup @frozen public struct Wrapper {

        /// Returns a binding to the resulting value of a given key path.
        ///
        /// - Parameter keyPath: A key path to a specific resulting value.
        ///
        /// - Returns: A new binding.
        public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> { get }
    }

    /// The underlying value referenced by the environment object.
    ///
    /// This property provides primary access to the value's data. However, you
    /// don't access `wrappedValue` directly. Instead, you use the property
    /// variable created with the ``EnvironmentObject`` attribute.
    ///
    /// When a mutable value changes, the new value is immediately available.
    /// However, a view displaying the value is updated asynchronously and may
    /// not show the new value immediately.
    @inlinable public var wrappedValue: ObjectType { get }

    /// A projection of the environment object that creates bindings to its
    /// properties using dynamic member lookup.
    ///
    /// Use the projected value to pass an environment object down a view
    /// hierarchy.
    public var projectedValue: EnvironmentObject<ObjectType>.Wrapper { get }

    /// Creates an environment object.
    ///
    /// This initializer is rarely used directly. Instead, use the
    /// `@EnvironmentObject` property wrapper to
    /// read the enviornment object from the environment.
    ///
    /// Inject the object into the environment using the
    /// ``View/environmentObject(_:)`` modifier.
    ///
    /// ```
    /// class AppModel: ObservableObject {
    ///     let text: String = "some text"
    /// }
    ///
    /// struct GrandparentView: View {
    ///     @StateObject var appModel = AppModel()
    ///
    ///     var body: some View {
    ///         ParentView()
    ///             .environmentObject(appModel)
    ///     }
    /// }
    ///
    /// struct ParentView: View {
    ///     var body: some View {
    ///         ChildView()
    ///             .padding()
    ///     }
    /// }
    ///
    /// struct ChildView: View {
    ///     @EnvironmentObject var appModel: AppModel
    ///
    ///     var body: some View {
    ///         Text(appModel.text)
    ///     }
    /// }
    ///
    /// ```
    ///
    /// ![An observable model containing the text view "some text" that is
    /// passed down through three nested view by a state object and environment
    /// object; the text is displayed in the last view.](22.34.04.png)
    ///
    public init() { }
}

