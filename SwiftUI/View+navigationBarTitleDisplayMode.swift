@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Configures the title display mode for this view.
    ///
    /// Use
    /// `navigationBarTitleDisplayMode(_:)` to control the appearance
    /// of the navigation bar title. There are two main display
    /// modes:
    /// - ``NavigationBarItem/TitleDisplayMode/inline``
    /// - ``NavigationBarItem/TitleDisplayMode/large``
    ///
    /// An ``NavigationBarItem/TitleDisplayMode/automatic`` mode is also present,
    /// and represents the system default.
    ///
    /// The following example forces a large navigation title:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         NavigationView {
    ///             Text("Hello Bananas🍌🍌")
    ///                 .navigationTitle("Home")
    ///                 .navigationBarTitleDisplayMode(.large)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A navigation view displaying the plain text "Hello Bananas🍌🍌" under a navigation title with display mode .large that reads "Home".](538F7154-7B14-41AD-B913-2391A4D850CB.png)
    ///
    /// - Parameter displayMode: The ``NavigationBarItem/TitleDisplayMode`` style to use for displaying the title.
    public func navigationBarTitleDisplayMode(_ displayMode: NavigationBarItem.TitleDisplayMode) -> some View { }

}

