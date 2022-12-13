/// A navigation view style represented by a primary view stack that
/// navigates to a detail view.
///
/// Use this style with the ``View/navigationViewStyle(_:)`` modifier
/// to set a ``NavigationView`` to use the double column style.
///
/// This
/// is the default behavior in macOS, and works well in iPadOS. In iOS,
/// it is overriden and ``StackNavigationViewStyle`` is used instead.
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
///         .navigationViewStyle(DoubleColumnNavigationViewStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a double-column style NavigationView with a NavigationLink
/// reading "I'm in the sidebar ⬅️" in the left column that once clicked results in
/// the appearance of the text view "I just appeared in the middle 🤠" with the
/// navigation title "Second Screen" in the right column.](doub-column-nav-view-style-ex1.gif)
///
@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "replace styled NavigationView with NavigationSplitView instead")
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
@available(watchOS, unavailable)
public struct DoubleColumnNavigationViewStyle : NavigationViewStyle {

    /// Creates a double column navigation view style.
    ///
    /// Use this initializer to create an instance of ``DoubleColumnNavigationViewStyle``
    /// that can be passed to ``View/navigationViewStyle(_:)``.
    ///
    /// This is the only initilaizer of ``DoubleColumnNavigationViewStyle``.
    /// It takes no parameters.
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
    ///         .navigationViewStyle(DoubleColumnNavigationViewStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a double-column style NavigationView with a NavigationLink
    /// reading "I'm in the sidebar ⬅️" in the left column that once clicked results in
    /// the appearance of the text view "I just appeared in the middle 🤠" with the
    /// navigation title "Second Screen" in the right column.](doub-column-nav-view-style-ex1.gif)
    ///
    public init() { }
}

