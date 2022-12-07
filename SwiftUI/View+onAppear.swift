@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Perform an action when a view appears.
    ///
    /// This is an extremely useful modifier for setting up any actions needed
    /// when the page first is loaded.
    ///
    /// ```
    /// struct AppearedView: View {
    ///     var body: some View {
    ///         Text("If you're reading this 🍌 was printed")
    ///             .onAppear {
    ///                 print("🍌")
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// Whenever a view is rendered, even a previously rendered child view, `onAppear` will run. For example:
    ///
    /// ![A gif with a toggle in the center of the screen with text above it that
    /// reads "We've created: _# bananas." Each time the toggle is clicked, a
    /// banana emoji appears below it and the number in the above text increases by
    /// one, since the action passed to onAppear is to increment banana count.](on-appear.gif)
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State var bananaCount: Int = 0
    ///     @State var showBanana: Bool = true
    ///
    ///     var body: some View {
    ///         Text("We've created: \(bananaCount) bananas")
    ///
    ///         Toggle("Banana Toggle", isOn: $showBanana)
    ///
    ///         if showBanana {
    ///             Text("🍌🍌")
    ///                 .onAppear {
    ///                     bananaCount += 1
    ///                 }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameter action: The action to perform. If `action` is `nil`, the
    ///   call has no effect.
    ///
    /// - Returns: A view that triggers `action` when this view appears.
    @inlinable public func onAppear(perform action: (() -> Void)? = nil) -> some View { }


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

