/// An index view style that places a page index view over its content.
///
/// ```
/// struct ExampleView: View {
///     @State var items = ["Bananas 🍌🍌", "Apples 🍏🍏", "Peaches 🍑🍑"]
///
///     var body: some View {
///         TabView {
///             ForEach(items, id: \.self) {
///                 Text($0)
///             }
///         }
///         .tabViewStyle(.page)
///         .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
///     }
/// }
/// ```
///
/// ![A gif flipping through the pages of a TabView with three items,
/// "Bananas 🍌🍌", "Apples 🍏🍏", "Peaches 🍑🍑", derived from a state variable;
/// the TabView has no page index indicators.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TabView-example-4.gif)
///
/// Currently the ``PageIndexViewStyle`` is the only type that allows for customization
/// over a page index view. To configure the current ``IndexViewStyle`` for a view hierarchy, use the
/// `.indexViewStyle()` modifier. When creating a new ``PageIndexViewStyle``, it will
/// default to the `.automatic` ``PageIndexViewStyle/backgroundDisplayMode`` if none is specified.
///
/// For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         TabView {
///             Text("Tab 1")
///             Text("Tab 2")
///             Text("Tab 3")
///         }
///         .tabViewStyle(.page(indexDisplayMode: .always))
///         .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
///     }
/// }
/// ```
///
/// ![A gif flipping through the pages of a TabView with three text views, "Tab 1",
/// "Tab 2", and "Tab 3", as reflected in the page index indicator dots at the bottom
/// of the frame.](pg-index-view-style-always-ex.gif)
///
@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct PageIndexViewStyle : IndexViewStyle {

    /// The background style for the page index view.
    ///
    /// There are 4 background style options:
    /// - ``PageIndexViewStyle/BackgroundDisplayMode/automatic``: uses the default background for the platform
    /// - ``PageIndexViewStyle/BackgroundDisplayMode/interactive``: shows a background when the index is interacted with
    /// - ``PageIndexViewStyle/BackgroundDisplayMode/always``: the background is always shown
    /// - ``PageIndexViewStyle/BackgroundDisplayMode/never``: the background is never shown
    ///
    /// See the individual style pages for visualizations of each option.
    public struct BackgroundDisplayMode {

        /// Background will use the default for the platform.
        ///
        /// For example:
        ///
        /// ```
        /// struct ExampleView: View {
        ///     var body: some View {
        ///         ZStack {
        ///             Color.blue
        ///                 .ignoresSafeArea()
        ///
        ///             TabView {
        ///                 Text("Tab 1")
        ///                 Text("Tab 2")
        ///                 Text("Tab 3")
        ///             }
        ///             .tabViewStyle(.page(indexDisplayMode: .always))
        ///             .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a blue background that reads "Tab 1" in the
        /// center of the screen with three dots at the bottom of the screen. Applying
        /// the automatic property for backgroundDisplayMode renders the tabview
        /// background as a light oval when held down by the user.](pageindexviewstyle-automatic-example.png)
        ///
        /// Note that the ``ZStack`` was used to apply a background color to the screen so that
        /// the background styles on the page index view were more clear.
        public static let automatic: PageIndexViewStyle.BackgroundDisplayMode

        /// Background is only shown while the index view is interacted with.
        ///
        /// For example:
        ///
        /// ```
        /// struct ExampleView: View {
        ///     var body: some View {
        ///         ZStack {
        ///             Color.blue
        ///                 .ignoresSafeArea()
        ///
        ///             TabView {
        ///                 Text("Tab 1")
        ///                 Text("Tab 2")
        ///                 Text("Tab 3")
        ///             }
        ///             .tabViewStyle(.page(indexDisplayMode: .always))
        ///             .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A gif that displays a blue background that reads "Tab 1" in the
        /// center of the screen with three dots at the bottom of the screen. As
        /// the user swipes, the dot moves between the three pages. When the page
        /// index view (the dots) is held down (interacted with), a light oval
        /// background emerges behind it.](page-index-view-style-background-display-mode-interactive.gif)
        ///
        /// Note that the ``ZStack`` was used to apply a background color to the screen so that
        /// the background styles on the page index view were more clear.
        public static let interactive: PageIndexViewStyle.BackgroundDisplayMode

        /// Background is always displayed behind the page index view.
        ///
        /// For example:
        ///
        /// ```
        /// struct ExampleView: View {
        ///     var body: some View {
        ///         ZStack {
        ///             Color.blue
        ///                 .ignoresSafeArea()
        ///
        ///             TabView {
        ///                 Text("Tab 1")
        ///                 Text("Tab 2")
        ///                 Text("Tab 3")
        ///             }
        ///             .tabViewStyle(.page(indexDisplayMode: .always))
        ///             .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a blue background that reads "Tab 1" in the
        /// center of the screen with three dots at the bottom of the screen surrounded
        /// by a light gray oval background. Applying the always property for
        /// backgroundDisplayMode renders the tabview background as a light oval
        /// in any case.](background-display-mode-always.png)
        ///
        /// Note that the ``ZStack`` was used to apply a background color to the screen so that
        /// the background styles on the page index view were more clear.
        public static let always: PageIndexViewStyle.BackgroundDisplayMode

        /// Background is never displayed behind the page index view.
        ///
        /// For example:
        ///
        /// ```
        /// struct ExampleView: View {
        ///     var body: some View {
        ///         ZStack {
        ///             Color.blue
        ///                 .ignoresSafeArea()
        ///
        ///             TabView {
        ///                 Text("Tab 1")
        ///                 Text("Tab 2")
        ///                 Text("Tab 3")
        ///             }
        ///             .tabViewStyle(.page(indexDisplayMode: .always))
        ///             .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a blue background that reads "Tab 1" in the
        /// center of the screen with three dots at the bottom of the screen with
        /// no surrounding background. Applying the never property for
        /// backgroundDisplayMode renders no tabview background in any case.](pageindexviewstyle-automatic-example.png)
        ///
        /// Note that the ``ZStack`` was used to apply a background color to the screen so that
        /// the background styles on the page index view were more clear.
        public static let never: PageIndexViewStyle.BackgroundDisplayMode
    }

    /// Creates a page index view style.
    ///
    /// When creating a new ``PageIndexViewStyle``, it will default to the .automatic
    /// ``PageIndexViewStyle/BackgroundDisplayMode`` if none is specified. For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         TabView {
    ///             Text("Tab 1")
    ///             Text("Tab 2")
    ///             Text("Tab 3")
    ///         }
    ///         .tabViewStyle(.page(indexDisplayMode: .always))
    ///         .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    ///     }
    /// }
    /// ```
    ///
    /// ![Index view style protocol example 1](indexviewstyle-protocol-example-1.png)
    ///
    /// - Parameter backgroundDisplayMode: The display mode of the background of any
    /// page index views receiving this style
    public init(backgroundDisplayMode: PageIndexViewStyle.BackgroundDisplayMode = .automatic) { }
}

