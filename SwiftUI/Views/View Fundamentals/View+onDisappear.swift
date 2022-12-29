@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    
    /// A view modifier that performs an action when the view disappears.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var show = true
    ///     @State var message = "DO IT"
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Button(message) { show = false }
    ///             if show {
    ///                 Text("When I disappear, this 👆 will become a banana")
    ///                      .onDisappear { message = "🍌" }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a button in the center of the screen that reads "DO IT",
    /// with text underneath it in a VStack that reads "When I disappear, this
    /// finger emoji will become a banana." When pressed, the view disappears
    /// to reveal a banana emoji.](view-on-dissapear-perform-ex.gif)
    ///
    /// - Parameter action: The action to perform. If `action` is `nil`, the
    ///   call has no effect.
    ///
    /// - Returns: A view that triggers `action` when this view disappears.
    @inlinable public func onDisappear(perform action: (() -> Void)? = nil) -> some View { }
    
}
