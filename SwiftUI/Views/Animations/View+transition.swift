@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that adds a transition to this view when it appears and disappears.
    ///
    /// Use this modifier to apply an effect to a view, such as a fade, scale, or slide
    /// when the view appears and disappears from the screen.
    ///
    /// The transition is only one part of the equation - a timer curve (animation)
    /// must also be specified. There are two ways to specify the associated animation:
    ///
    /// 1. With ``View/animation(_:)``.
    /// 2. Explicitly, using ``withAnimation(_:_:)``.
    ///
    /// See ``AnyTransition`` for more on how to create a transition.
    ///
    /// ### Using ``View/animation(_:)``
    ///
    /// We can animate the toggle `animation(.easeInOut)`.
    ///
    /// ```
    /// struct ImplicitTransitionView: View {
    ///     @State var showBanana = false
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Button("Toggle") { showBanana.toggle() }
    ///             if showBanana {
    ///                 Text("🍌")
    ///                     .animation(.easeInOut)
    ///                     .transition(.slide)
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a "Toggle" button in blue that slides a banana into
    /// the view when clicked using the transition view modifier. When the
    /// button is clicked again, the banana slides out of view with the same animation.](with-animation-2.gif)
    ///
    /// ### Using ``withAnimation(_:_:)``
    ///
    /// We can get the same effect by toggling `showBanana` explicitly
    /// with an animation
    /// using ``withAnimation(_:_:)``.
    ///
    /// ```
    /// struct ExplicitTransitionView: View {
    ///     @State var showBanana = false
    ///
    ///     var body: some View {
    ///         Button("Toggle") {
    ///             withAnimation(.easeInOut) { show.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.slide)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a "Toggle" button in blue that slides a banana into
    /// the view when clicked using the transition view modifier. When the
    /// button is clicked again, the banana slides out of view with the same animation.
    /// In this case, withAnimation is used rather than the animation view modifier.](with-animation-2.gif)
    @inlinable public func transition(_ t: AnyTransition) -> some View { }

}

