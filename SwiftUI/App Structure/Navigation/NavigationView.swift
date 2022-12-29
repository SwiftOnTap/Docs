/// A container for view navigation along with a (optional) navigation bar.
///
/// ``NavigationView`` is a container that adds stack-based navigation to a view, along with a (optional) navigation bar.
///
/// ### Setting up a navigation stack
///
/// A navigation stack is set up simply by wrapping your view in a `NavigationView`:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         NavigationView {
///             Text("Hello Bananas🍌🍌")
///         }
///     }
/// }
/// ```
///
/// ![A navigation view displaying the plain text "Hello Bananas🍌🍌".](CB034D71-ECFF-46DF-93B0-DE24A88C5721.png)
///
/// A navigation bar is added by default. The navigation bar can be hidden via
/// ``View/navigationBarHidden(_:)``.
/// [navigation-title ->]
/// ### Adding a navigation title
///
/// Use ``View/navigationTitle(_:)-5ad18`` to add a title to the navigation
/// bar within your `NavigationView`:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         NavigationView {
///             Text("Hello Bananas🍌🍌")
///                 .navigationTitle("Home")
///         }
///     }
/// }
/// ```
///
/// ![A navigation view displaying the plain text "Hello Bananas🍌🍌" under a left aligned navigation title that reads "Home".](382BE2AE-E26A-4214-9F32-8F1786543B14.png)
///
///
/// ``View/navigationTitle(_:)-d3628`` is only available on iOS 14 and higher.
/// If your application targets iOS 13, please use
/// ``View/navigationBarTitle(_:)-079a6``.
/// [<-]
/// [navigation-title-display-mode ->]
/// ### Setting the navigation title display mode
///
/// The display mode of a navigation bar title can be controlled via
/// ``View/navigationBarTitleDisplayMode(_:)``. There are two main display
/// modes:
/// - `NavigationBarItem.TitleDisplayMode.inline`
/// - `NavigationBarItem.TitleDisplayMode.large`
///
/// An ``NavigationBarItem/TitleDisplayMode/automatic`` mode is also present,
/// and represents the system default.
///
/// The following example forces a large navigation title:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         NavigationView {
///             Text("Hello Bananas🍌🍌")
///                 .navigationTitle("Home")
///                 .navigationBarTitleDisplayMode(.large)
///         }
///     }
/// }
/// ```
///
/// ![A navigation view displaying the plain text "Hello Bananas🍌🍌" under a
/// navigation title with display mode .large that reads "Home".](538F7154-7B14-41AD-B913-2391A4D850CB.png)
///
/// [<-]
/// [navigation-link ->]
/// ### Navigating to a view
///
/// Use ``NavigationLink`` to add a button that pushes a new view onto the
/// navigation stack.
///
/// For example, the following presents `BananasView` when the link
/// "I want bananas!" is pressed:
///
/// ```
/// struct ExampleView: View {
///     struct BananasView: View {
///         var body: some View {
///             Text("Bananas")
///                 .navigationTitle("🍌🍌")
///         }
///     }
///
///     var body: some View {
///         NavigationView {
///             NavigationLink(destination: BananasView()) {
///                 Text("I want bananas!")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif that shows a view displaying a navigation link with a text button that reads "I want bananas!"; once the button is clicked, another view with a navigation title reading "🍌🍌" and text reading "Bananas" slides left over the main view.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/NavigationView-example-4.gif)
///
/// [<-]
/// [navigation-bar-hidden ->]
/// ### Hiding the navigation bar
///
/// The navigation bar is on by default within a `NavigationView`. It can be
/// hidden using ``View/navigationBarHidden(_:)``.
///
/// For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         NavigationView {
///             Text("Hello Bananas🍌🍌")
///                 .navigationBarHidden(true)
///         }
///     }
/// }
/// ```
///
/// ![A navigation view displaying the text "Hello Bananas🍌🍌" and hiding the navigation bar.](83BA32E9-ABB0-401F-B66D-CC695D71AD54.png)
///
/// Note that the navigation bar can be unhidden by child views.
/// ``View/navigationBarHidden(_:)`` is a *preference value*, and uses the
/// value proposed by the deepest view in the hierarchy as its active value.
/// This is to say, a screen with the navigation bar hidden can push a screen
/// that unhides the bar.
///
/// For example, navigating to `SecondScreen` in the following unhides the bar:
///
/// ```
/// struct ExampleView: View {
///     struct SecondScreen: View {
///         var body: some View {
///             Text("Bananas🍌🍌")
///                 .navigationTitle("Second Screen")
///                 .navigationBarHidden(false)
///         }
///     }
///
///     var body: some View {
///         NavigationView {
///             VStack {
///                 Text("Hello Bananas🍌🍌")
///
///                 NavigationLink(destination: SecondScreen()) {
///                     Text("Take me to the second screen!")
///                 }
///             }
///             .navigationBarHidden(true)
///         }
///     }
/// }
/// ```
///
/// ![A gif that shows a view displaying a navigation view containing a VStack
/// with the text "Hello Bananas🍌🍌" and a navigation link reading "Take me to
/// the second screen!"; with a text button that reads "Take me to the second screen!";
/// once the link is clicked, another view with a navigation title reading
/// "Second Screen" and text reading "Bananas🍌🍌" slides left over the main view.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/NavigationView-example-6.gif)
///
/// And popping `SecondScreen` (or navigating back) hides it again, as
/// `SecondScreen` is removed from the view hierarchy, leaving `ExampleView`
/// as the deepest view in the hierarchy - which has hidden the navigation bar.
/// [<-]
/// [navigation-bar-items ->]
/// ### Adding navigation bar items
///
/// Use ``View/navigationBarItems(leading:trailing:)`` to add items to a
/// navigation bar's leading and trailing areas.
///
/// For example, the following adds "🍌🍌" to the leading area, and "🍏🍏"
/// to the trailing area:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         NavigationView {
///             Text("Hello Bananas🍌🍌")
///                 .navigationBarItems(leading: Text("🍌🍌"), trailing: Text("🍏🍏"))
///         }
///     }
/// }
/// ```
///
/// ![A navigation view displaying the text "Hello Bananas🍌🍌" with a
/// navigation bar containing the leading text "🍌🍌" and the trailing text "🍏🍏".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/NavigationView-example-11.png)
///
/// [<-]
/// [navigation-view-style ->]
/// ### Styling a navigation view
///
/// Use ``View/navigationViewStyle(_:)`` to style a navigation view.
///
/// For example, the following forces a stack-based navigation style,
/// overriding the default double-column style on Mac Catalyst:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         NavigationView {
///             NavigationLink("Hello Bananas", destination: Text("🍌🍌"))
///         }
///         .navigationViewStyle(StackNavigationViewStyle())
///     }
/// }
/// ```
///
/// ![A navigation view on Mac Catalyst containing a navigation link with the text "Hello Bananas";
/// once clicked the navigation link displays a stacked view with the text "🍌🍌" and a back arrow button in the upper left corner.](nav-view-ex8.gif)
///
/// And the following forces a double-column navigation style, overriding the
/// default stack-based navigation style on iPadOS:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         NavigationView {
///             NavigationLink("Hello Bananas", destination: Text("🍌🍌"))
///         }
///         .navigationViewStyle(DoubleColumnNavigationViewStyle())
///     }
/// }
/// ```
///
/// ![A navigation view on iPadOS with two columns; the left column contains a navigation link with the text "Hello Bananas" that populates the right column with the text "🍌🍌" once clicked.](nav-view-ex9.gif)
///
/// [<-]
/// ### Handling selection
///
/// ``NavigationLink`` provides the ability to observe and/or set the active
/// navigation selection via its initializer
/// ``NavigationLink/init(destination:tag:selection:label:)``.
///
/// For example:
///
/// ```
/// struct ExampleView: View {
///     enum NavigationItem {
///         case bananas
///         case apples
///         case peaches
///     }
///
///     @State var navigatedItem: NavigationItem? = .bananas
///
///     var body: some View {
///         NavigationView {
///             NavigationLink(
///                 destination: Text("🍏🍏"),
///                 tag: NavigationItem.apples,
///                 selection: $navigatedItem
///             ) {
///                 Text("Apples")
///             }
///
///             NavigationLink(
///                 destination: Text("🍌🍌"),
///                 tag: NavigationItem.bananas,
///                 selection: $navigatedItem
///             ) {
///                 Text("Bananas")
///             }
///
///             NavigationLink(
///                 destination: Text("🍑🍑"),
///                 tag: NavigationItem.peaches,
///                 selection: $navigatedItem
///             ) {
///                 Text("Peaches")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing three navigation views, each with text that displays a corresponding stacked view when clicked.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/NavigationView-example-10.gif)
///
/// In the example above, the navigation selection is written to a state
/// variable, `navigatedItem`. `navigatedItem` is an optional, because it is
/// possible for the screen to not be navigated to any particular screen
/// (i.e. be at the root view containing the 3 navigation links).
///
///  See ``ToolbarItem`` for more on what can be placed in the navigation bar.
///
@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "use NavigationStack or NavigationSplitView instead")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "use NavigationStack or NavigationSplitView instead")
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "use NavigationStack or NavigationSplitView instead")
@available(watchOS, introduced: 7.0, deprecated: 100000.0, message: "use NavigationStack or NavigationSplitView instead")
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
public struct NavigationView<Content> : View where Content : View {

    /// Creates a navigation view from a view builder of content.
    ///
    /// - Parameter content: The view builder of content displayed on the first
    /// view in the navigation stack.
    public init(@ViewBuilder content: () -> Content) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

