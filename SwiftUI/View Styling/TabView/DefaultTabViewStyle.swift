/// The default ``TabView`` style.
///
/// On iOS the default TabView looks as follows:
/// If you don't specify a ``view/tabviewstyle(_:)``, this is what it defaults to.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         TabView {
///             Text("Bananas 🍌🍌")
///                 .tabItem {
///                     Image(systemName: "1.circle.fill")
///                     Text("🍌🍌")
///                 }
///             Text("Apples 🍏🍏")
///                 .tabItem {
///                     Image(systemName: "2.square.fill")
///                     Text("🍏🍏")
///                 }
///             Text("Peaches 🍑🍑")
///                 .tabItem {
///                     Image(systemName: "3.square.fill")
///                     Text("🍑🍑")
///                 }
///         }
///         .tabViewStyle(.automatic)
///         .font(.headline)
///     }
/// }
/// ```
///
/// ![A gif that jumps between the three text views, "Bananas 🍌🍌",
/// "Apples 🍏🍏", and "Peaches 🍑🍑", within an iOS default style TabView
/// by clicking the corresponding symbols on the tab-bar: each tab bar item is
/// a filled circle with the page number above the two matching emojis
/// corresponding to the those in the text views.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TabView-example-1.gif)
///
/// Since this is the default style,
/// if you omit the line `.tabViewStyle(.automatic)`, you
/// get the same result:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         TabView {
///             Text("Bananas 🍌🍌")
///                 .tabItem {
///                     Image(systemName: "1.circle.fill")
///                     Text("🍌🍌")
///                 }
///             Text("Apples 🍏🍏")
///                 .tabItem {
///                     Image(systemName: "2.square.fill")
///                     Text("🍏🍏")
///                 }
///             Text("Peaches 🍑🍑")
///                 .tabItem {
///                     Image(systemName: "3.square.fill")
///                     Text("🍑🍑")
///                 }
///         }
///         .font(.headline)
///     }
/// }
/// ```
///
/// ![A gif that jumps between the three text views, "Bananas 🍌🍌",
/// "Apples 🍏🍏", and "Peaches 🍑🍑", within a TabView by clicking the
/// corresponding symbols on the tab-bar: each tab bar item is a filled circle
/// with the page number above the two matching emojis corresponding to the
/// those in the text views.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TabView-example-1.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
public struct DefaultTabViewStyle : TabViewStyle {

    /// Creates a default tab view style.
    ///
    /// Use this initializer to create a ``DefaultTabViewStyle``.
    /// The initializer takes no parameters:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         TabView {
    ///             Text("Bananas 🍌🍌")
    ///                 .tabItem {
    ///                     Image(systemName: "1.circle.fill")
    ///                     Text("🍌🍌")
    ///                 }
    ///             Text("Apples 🍏🍏")
    ///                 .tabItem {
    ///                     Image(systemName: "2.square.fill")
    ///                     Text("🍏🍏")
    ///                 }
    ///             Text("Peaches 🍑🍑")
    ///                 .tabItem {
    ///                     Image(systemName: "3.square.fill")
    ///                     Text("🍑🍑")
    ///                 }
    ///         }
    ///         .tabViewStyle(.automatic)
    ///         .font(.headline)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif that jumps between the three text views, "Bananas 🍌🍌",
    /// "Apples 🍏🍏", and "Peaches 🍑🍑", within an iOS default style TabView
    /// by clicking the corresponding symbols on the tab-bar: each tab bar item is
    /// a filled circle with the page number above the two matching emojis
    /// corresponding to the those in the text views.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TabView-example-1.gif)
    ///
    public init() { }
}

