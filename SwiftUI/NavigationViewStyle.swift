/// Structures conforming to ``NavigationViewStyle`` can be used to style a
/// ``NavigationView`` via
/// ``View/navigationViewStyle(_:)``.
///
/// There are only 3 styles that conform to the navigation view style protocol:
/// - ``DefaultNavigationViewStyle``
/// - ``DoubleColumnNavigationViewStyle``
/// - ``StackNavigationViewStyle``
///
/// In the example below, we apply a ``StackNavigationViewStyle``
/// which conforms to this protocol.
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
/// ![A gif displaying a navigation view with a button that reads "Hello Bananas."
/// When pressed, the view slides to reveal a new view with two banana emojis and
/// a button in the upper left hand corner with the option to go back. The
/// StackNavigationViewStyle renders the swipe appearance.](nav-view-style-ex1.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
public protocol NavigationViewStyle { }
extension NavigationViewStyle {
}

