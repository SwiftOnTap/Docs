/// The default navigation view style.
///
/// Use this style with the ``View/navigationViewStyle(_:)`` modifier
/// to set a ``NavigationView`` to use the default style given the context.
///
/// On iOS and Mac Catalyst, ``StackNavigationViewStyle`` is the default:
///
/// ```
/// struct ExampleView: View {
///     var destination: some View {
///         Text("I'm stacked on the pancakes 📚")
///             .navigationTitle("Second Screen")
///     }
///
///     var body: some View {
///         NavigationView {
///             NavigationLink(destination: destination) {
///                 Text("Stack the second screen! 🥞")
///             }
///         }
///         .navigationViewStyle(DefaultNavigationViewStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying an iOS default style NavigationView containing a NavigationLink
/// that reads "Stack the second screen! 🥞" and causes a stacked text view
/// reading "I'm stacked on the pancakes 📚" with the navigation title "Second
/// Screen" to appear, covering the first view.](default-nav-view-style-ex1.gif)
///
/// On macOS, ``DoubleColumnNavigationViewStyle`` is the default:
///
/// ```
/// struct ExampleView: View {
///     var destination: some View {
///         Text("I just appeared in the middle 🤠")
///             .navigationTitle("Second Screen")
///     }
///
///     var body: some View {
///         NavigationView {
///             NavigationLink(destination: destination) {
///                 Text("I'm in the sidebar ⬅️")
///             }
///         }
///         .navigationViewStyle(DefaultNavigationViewStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a macOS default style NavigationView containing a NavigationLink
/// in the left column that reads "I'm in the sidebar ⬅️" and causes a text view
/// reading "I just appeared in the middle 🤠" with the navigation title "Second
/// Screen" to appear in the right column.](default-nav-view-style-ex2.gif)
///
@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "replace styled `NavigationView` with `NavigationStack` or `NavigationSplitView` instead")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "replace styled `NavigationView` with `NavigationSplitView` instead")
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "replace styled `NavigationView` with `NavigationStack` or `NavigationSplitView` instead")
@available(watchOS, introduced: 7.0, deprecated: 100000.0, message: "replace styled `NavigationView` with `NavigationStack` or `NavigationSplitView` instead")
public struct DefaultNavigationViewStyle : NavigationViewStyle {

    /// Creates a default navigation view style.
    ///
    /// Use this initializer with ``View/navigationViewStyle(_:)`` to
    /// give a ``NavigationView`` a default style.
    ///
    /// On iOS and Mac Catalyst, for example,
    /// ``StackNavigationViewStyle`` is the default:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var destination: some View {
    ///         Text("I'm stacked on the pancakes 📚")
    ///             .navigationTitle("Second Screen")
    ///     }
    ///
    ///     var body: some View {
    ///         NavigationView {
    ///             NavigationLink(destination: destination) {
    ///                 Text("Stack the second screen! 🥞")
    ///             }
    ///         }
    ///         .navigationViewStyle(DefaultNavigationViewStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying an iOS default style NavigationView containing a NavigationLink
    /// that reads "Stack the second screen! 🥞" and causes a stacked text view
    /// reading "I'm stacked on the pancakes 📚" with the navigation title "Second
    /// Screen" to appear, covering the first view.](default-nav-view-style-ex1.gif)
    ///
    public init() { }
}

