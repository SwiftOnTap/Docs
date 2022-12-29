@available(iOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
extension View {

    /// Sets the visibility of the status bar.
    ///
    /// Use `statusBar(hidden:)` to show or hide the status bar.
    ///
    /// ```
    /// struct NoStatusBarView: View {
    ///     var body: some View {
    ///         Text("I have no status bar ⏰")
    ///             .statusBar(hidden: true)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a text view that reads "I have no status bar" in
    /// the center of the screen, with no status bar at the top.](statusbar-hidden.png)
    ///
    /// You can also show or hide the status bar with an animation by
    /// attaching the modifier to a ``State`` property and using
    /// ``withAnimation(_:_:)``:
    ///
    /// ```
    /// struct ToggleMyStatusBarView: View {
    ///     @State private var hideBar = false
    ///
    ///     var body: some View {
    ///         Button("Toggle the status bar! 🎚") {
    ///             withAnimation {
    ///                 hideBar.toggle()
    ///             }
    ///         }
    ///         .statusBar(hidden: hideBar)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a button in the center of the screen that reads "Toggle
    /// the status bar!" which causes the status bar at the top of the screen
    /// to appear and reappear with each time it's pressed as a result of attaching
    /// the statusBar modifier to the button.](status-bar-hidden.gif)
    ///
    /// - Parameter hidden: A Boolean value that indicates whether to hide the
    ///   status bar.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "statusBarHidden(_:)")
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func statusBar(hidden: Bool) -> some View { }

}

