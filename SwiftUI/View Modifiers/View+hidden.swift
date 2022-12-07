@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that hides this view unconditionally.
    ///
    /// Hidden views are invisible and can't receive or respond to interactions.
    /// However, they do remain in the view hierarchy and affect layout. Use
    /// this modifier if you want to include a view for layout purposes, but
    /// don't want it to display.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Image(systemName: "a.circle.fill")
    ///             Image(systemName: "b.circle.fill")
    ///             Image(systemName: "c.circle.fill")
    ///                 .hidden()
    ///             Image(systemName: "d.circle.fill")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// The third circle takes up space, because it's still present, but
    /// SwiftUI doesn't draw it onscreen.
    ///
    /// ![A row of circles with the letters A, B, and D, with a gap where
    /// the circle with the letter C should be.](hidden-fixed.png)
    ///
    /// If you want to conditionally include a view in the view hierarchy, use
    /// an `if` statement instead:
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State private var isHidden = false
    ///
    ///     var body: some View {
    ///         VStack {
    ///             HStack {
    ///                 Image(systemName: "a.circle.fill")
    ///                 Image(systemName: "b.circle.fill")
    ///                 if !isHidden {
    ///                     Image(systemName: "c.circle.fill")
    ///                 }
    ///                 Image(systemName: "d.circle.fill")
    ///             }
    ///             Toggle("Hide", isOn: $isHidden)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a toggle on the left which is off and has four equally
    /// spaced circles above it: A, B, C, and D. When the toggle is switched on,
    /// it has three equally spaced circles above it: A, B, and D.](hidden-conditional.gif)
    ///
    /// Depending on the current value of the `isHidden` state variable in the
    /// example above, controlled by the ``Toggle`` instance, SwiftUI draws
    /// the circle or completely omits it from the layout.
    ///
    /// - Returns: A hidden view.
    @inlinable public func hidden() -> some View { }

}

