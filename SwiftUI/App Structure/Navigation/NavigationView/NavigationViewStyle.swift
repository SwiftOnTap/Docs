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
@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
@available(watchOS, introduced: 7.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
public protocol NavigationViewStyle { }

@available(iOS, introduced: 15.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationSplitView")
@available(macOS, introduced: 12.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationSplitView")
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension NavigationViewStyle where Self == ColumnNavigationViewStyle {

    /// A navigation view style represented by a series of views in columns.
    public static var columns: ColumnNavigationViewStyle { get }
}

@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "replace styled NavigationView with NavigationSplitView instead")
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
@available(watchOS, introduced: 7.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
extension NavigationViewStyle where Self == DefaultNavigationViewStyle {

    /// The default navigation view style in the current context of the view
    /// being styled.
    public static var automatic: DefaultNavigationViewStyle { get }
}

@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "replace stack-styled NavigationView with NavigationStack")
@available(macOS, unavailable)
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "replace stack-styled NavigationView with NavigationStack")
@available(watchOS, introduced: 7.0, deprecated: 100000.0, message: "replace stack-styled NavigationView with NavigationStack")
extension NavigationViewStyle where Self == StackNavigationViewStyle {

    /// A navigation view style represented by a view stack that only shows a
    /// single top view at a time.
    public static var stack: StackNavigationViewStyle { get }
}
