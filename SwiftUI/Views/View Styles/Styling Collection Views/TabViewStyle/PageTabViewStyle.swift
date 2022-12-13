/// A ``TabViewStyle`` that implements a paged scrolling ``TabView``.
///
/// Use this style with the ``View/tabViewStyle(_:)`` view modifier to
/// change the style of a ``TabView`` to look like swipable pages:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         TabView {
///             Text("Bananas 🍌🍌")
///             Text("Apples 🍏🍏")
///             Text("Peaches 🍑🍑")
///         }
///         .foregroundColor(Color.white)
///         .background(Color.yellow)
///         .tabViewStyle(.page)
///     }
/// }
/// ```
///
/// ![A gif displaying a tabview with three text items, "Bananas 🍌🍌",
/// "Apples 🍏🍏", and "Peaches 🍑🍑", and a yellow background; the gif
/// displays the page tab view style by flipping through each of the three tabs,
/// as reflected by the page indicator dots at the bottom of the frame.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TabView-example-2.gif)
///
/// You can also use `PageTabViewStyle`'s initializer
/// ``PageTabViewStyle/init(indexDisplayMode:)`` to specify whether
/// or not you want the page dots at the bottom to show up:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         TabView {
///             Text("Bananas 🍌🍌")
///             Text("Apples 🍏🍏")
///             Text("Peaches 🍑🍑")
///         }
///         .foregroundColor(Color.white)
///         .background(Color.yellow)
///         .tabViewStyle(.page(indexDisplayMode: .never))
///     }
/// }
/// ```
///
/// ![](pg-tab-view-style-ex2.gif)
///
@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
@available(macOS, unavailable)
public struct PageTabViewStyle : TabViewStyle {

    /// A style for displaying the page index view.
    ///
    /// Use this structure with ``PageTabViewStyle``'s
    /// ``PageTabViewStyle/init(indexDisplayMode:)`` initializer to
    /// specify whether or not the page dots should appear at the bottom
    /// of the screen:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         TabView {
    ///             Text("Bananas 🍌🍌")
    ///             Text("Apples 🍏🍏")
    ///             Text("Peaches 🍑🍑")
    ///         }
    ///         .foregroundColor(Color.white)
    ///         .background(Color.yellow)
    ///         .tabViewStyle(.page(indexDisplayMode: .never))
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a tabview with three text items, "Bananas 🍌🍌",
    /// "Apples 🍏🍏", and "Peaches 🍑🍑", with a yellow background and no
    /// index displays / page indicator.; the gif flips through each of the three tabs.](pg-tab-view-style-ex2.gif)
    ///
    /// This structure has three static properties:
    /// - ``PageTabViewStyle/IndexDisplayMode/automatic`` - Display
    /// the page dots only if there is more than one page in the
    /// ``TabView``.
    /// - ``PageTabViewStyle/IndexDisplayMode/always`` - Always
    /// display the page dots.
    /// - ``PageTabViewStyle/IndexDisplayMode/never`` - Never
    /// display the page dots.
    ///
    /// - Notes: If you want more control over the look of the dots,
    /// see ``View/indexViewStyle(_:)``.
    ///
    public struct IndexDisplayMode {

        /// Displays page dots when there are more than one page.
        ///
        /// This property dynamically displays the page dots of a
        /// ``TabView`` depending on the number of pages. If there is only
        /// one page, they are hidden:
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         TabView {
        ///             Text("Bananas 🍌🍌")
        ///         }
        ///         .foregroundColor(Color.white)
        ///         .background(Color.yellow)
        ///         .tabViewStyle(.page(indexDisplayMode: .automatic))
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a single yellow page in tabview that reads
        /// "Bananas" in the center. No dots appear on the bottom of the page
        /// since the view modifier hides them when there is only a single page.](tab-view-auto-ex1.png)
        ///
        /// If there are multiple pages, they are shown:
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         TabView {
        ///             Text("Bananas 🍌🍌")
        ///             Text("Apples 🍏🍏")
        ///             Text("Peaches 🍑🍑")
        ///         }
        ///         .foregroundColor(Color.white)
        ///         .background(Color.yellow)
        ///         .tabViewStyle(.page(indexDisplayMode: .automatic))
        ///     }
        /// }
        /// ```
        ///
        /// ![A gif displaying a tabview with three text items, "Bananas 🍌🍌",
        /// "Apples 🍏🍏", and "Peaches 🍑🍑", each with a yellow background;
        /// the gif flips through each of the three tabs and since there are
        /// multiple pages, dots are shown at the bottom.](tab-view-auto-ex2.gif)
        ///
        /// - Notes: If you want more control over the look of the dots,
        /// see ``View/indexViewStyle(_:)``.
        ///
        public static let automatic: PageTabViewStyle.IndexDisplayMode

        /// Always display page dots regardless of page count.
        ///
        /// Use this property to always show the page dots, regardless
        /// of how many pages there are in the ``TabView``:
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         TabView {
        ///             Text("Bananas 🍌🍌")
        ///             Text("Apples 🍏🍏")
        ///             Text("Peaches 🍑🍑")
        ///         }
        ///         .foregroundColor(Color.white)
        ///         .background(Color.yellow)
        ///         .tabViewStyle(.page(indexDisplayMode: .always))
        ///     }
        /// }
        /// ```
        ///
        /// ![A gif displaying a tabview with three text items, "Bananas 🍌🍌",
        /// "Apples 🍏🍏", and "Peaches 🍑🍑", each with a yellow background;
        /// the gif flips through each of the three tabs and since
        /// indexDisplayMode is set to always, dots are shown at the bottom.](tab-view-auto-ex2.gif)
        ///
        /// - Notes: If you want more control over the look of the dots,
        /// see ``View/indexViewStyle(_:)``.
        ///
        @available(watchOS, unavailable)
        public static let always: PageTabViewStyle.IndexDisplayMode

        /// Never display page dots.
        ///
        /// Use this property to never display page dots
        /// of a ``TabView``:
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         TabView {
        ///             Text("Bananas 🍌🍌")
        ///             Text("Apples 🍏🍏")
        ///             Text("Peaches 🍑🍑")
        ///         }
        ///         .foregroundColor(Color.white)
        ///         .background(Color.yellow)
        ///         .tabViewStyle(.page(indexDisplayMode: .never))
        ///     }
        /// }
        /// ```
        ///
        /// ![A gif displaying a tabview with three text items, "Bananas 🍌🍌",
        /// "Apples 🍏🍏", and "Peaches 🍑🍑", each with a yellow background;
        /// the gif flips through each of the three tabs and since
        /// indexDisplayMode is set to never, no dots are shown at the bottom.](pg-tab-view-style-ex2.gif)
        ///
        /// - Notes: If you want more control over the look of the dots,
        /// see ``View/indexViewStyle(_:)``.
        ///
        @available(watchOS, unavailable)
        public static let never: PageTabViewStyle.IndexDisplayMode
    }

    /// Creates a new ``PageTabViewStyle`` with an index display mode
    ///
    /// Use this initializer with the ``View/tabViewStyle(_:)`` modifier
    /// to specify a ``TabView`` style of swipable
    /// pages.
    ///
    /// This initializer takes a parameter of type ``PageTabViewStyle/IndexDisplayMode``
    /// to describe whether the page dots at the bottom of the screen
    /// should be visible. If left blank, it defaults to
    /// ``PageTabViewStyle/IndexDisplayMode/automatic``.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         TabView {
    ///             Text("Bananas 🍌🍌")
    ///             Text("Apples 🍏🍏")
    ///             Text("Peaches 🍑🍑")
    ///         }
    ///         .foregroundColor(Color.white)
    ///         .background(Color.yellow)
    ///         .tabViewStyle(.page(indexDisplayMode: .never))
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a tabview with three text items, "Bananas 🍌🍌",
    /// "Apples 🍏🍏", and "Peaches 🍑🍑", each with a yellow background;
    /// the gif flips through each of the three tabs and since
    /// indexDisplayMode is set to never, no dots are shown at the bottom.](pg-tab-view-style-ex2.gif)
    ///
    /// - Notes: If you want more control over the look of the dots,
    /// see ``View/indexViewStyle(_:)``.
    ///
    public init(indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic) { }
}

