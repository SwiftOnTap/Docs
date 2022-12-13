@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Sets the style for the tab view within the the current environment.
    ///
    /// Use this modifier to set the style of a ``TabView``. For example,
    /// below, we set the ``TabView`` style to
    /// ``PageTabViewStyle``:
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
    /// The parameter of the function must conform to ``TabViewStyle``.
    /// There are currently only 3 styles:
    /// - ``DefaultTabViewStyle`` (iOS and macOS)
    /// - ``PageTabViewStyle`` (iOS)
    /// - `CarouselTabViewStyle` (watchOS)
    ///
    /// ``PageTabViewStyle`` accepts an ``PageTabViewStyle/IndexDisplayMode``
    /// parameter, which allows you to hide the page dots at the bottom
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
    /// "Apples 🍏🍏", and "Peaches 🍑🍑", and a yellow background; the gif
    /// displays the page tab view style by flipping through each of the three tabs,
    /// without displaying any page indicator.](view-tab-view-style-ex2.gif)
    ///
    /// By default, ``DefaultTabViewStyle`` is used:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         TabView {
    ///             Text("Bananas 🍌🍌")
    ///                 .tabItem { Image(systemName: "1.circle.fill") }
    ///             Text("Apples 🍏🍏")
    ///                 .tabItem { Image(systemName: "2.circle.fill") }
    ///             Text("Peaches 🍑🍑")
    ///                 .tabItem { Image(systemName: "3.circle.fill") }
    ///         }
    ///         .tabViewStyle(.automatic)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif flipping through each page of a default tabview with three text items, "Bananas 🍌🍌",
    /// "Apples 🍏🍏", and "Peaches 🍑🍑", using the tab items at the bottom of the frame; the tab
    /// items are filled circles containing the page number](view-tab-view-style-ex3.gif)
    ///
    /// - Parameter style: The style to apply to this tab view.
    public func tabViewStyle<S>(_ style: S) -> some View where S : TabViewStyle { }

}

