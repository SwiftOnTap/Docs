/// This protocol is used to change the appearance and interaction of a ``TabView``.
///
/// This protocol does not make its interface public and cannot be customized. The only
/// types available are the ones included in the framework and are platform dependent:
/// - ``DefaultTabViewStyle`` (iOS and macOS)
/// - ``PageTabViewStyle`` (iOS only)
/// - `CarouselTabViewStyle` (watchOS only)
///
/// To learn more about each style, visit their pages.
///
/// Apply a ``TabViewStyle`` using ``View/tabViewStyle(_:)``:
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
/// ![A gif displaying a tab view composed of three pages, each with a yellow
/// background reading the name of a different fruit. Applying the tabViewStyle
/// renders the view such that there are dots at the bottom of the page for
/// ease of use.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TabView-example-2.gif)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol TabViewStyle { }
extension TabViewStyle {
}

