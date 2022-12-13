@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
extension View {

    /// Sets the style for navigation views within this view.
    ///
    /// Use `navigationViewStyle(_:)` to style a ``NavigationView``.
    ///
    /// `navigationViewStyle(_:)` accepts a parameter that conforms
    /// to the ``NavigationViewStyle`` protocol. There are currently
    /// 3 navigation view styles:
    /// - ``DefaultNavigationViewStyle``
    /// - ``StackNavigationViewStyle`` (iOS only)
    /// - ``DoubleColumnNavigationViewStyle``
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
    /// ![A gif displaying a stack-based style NavigationView with the NavigationLink "Hello
    /// Bananas" that once clicked results in the appearance of the stacked
    /// text view "🍌🍌".](nav-view-ex8.gif)
    ///
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
    /// ![A gif displaying a double-column style NavigationView with a NavigationLink
    /// reading "Hello Bananas" in the left column that once clicked results in
    /// the appearance of the text view "🍌🍌" in the right column.](nav-view-ex9.gif)
    ///
    /// - Parameter style: The desired style of the ``NavigationView``.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
    @available(watchOS, introduced: 7.0, deprecated: 100000.0, message: "replace styled NavigationView with NavigationStack or NavigationSplitView instead")
    public func navigationViewStyle<S>(_ style: S) -> some View where S : NavigationViewStyle { }

}

