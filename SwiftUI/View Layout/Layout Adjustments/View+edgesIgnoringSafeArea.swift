@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use ignoresSafeArea(_:edges:) instead.")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use ignoresSafeArea(_:edges:) instead.")
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use ignoresSafeArea(_:edges:) instead.")
@available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use ignoresSafeArea(_:edges:) instead.")
extension View {

    /// Changes the view's proposed area to extend outside the screen's safe
    ///
    /// **DEPRECATED**: use ``View/ignoresSafeArea(_:edges:)`` instead.
    ///
    /// Use `edgesIgnoringSafeArea(_:)` to change the area proposed for this
    /// view so that — were the proposal accepted — this view could extend
    /// outside the safe area to the bounds of the screen for the specified
    /// edges.
    ///
    /// ```
    /// struct SafeAreaIgnoringView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Color.pink
    ///             Text("I am everywhere")
    ///         }
    ///         .edgesIgnoringSafeArea(.all)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a fully pink background that extends outside the
    /// safe area as rendered by the view modifier. The text in the center
    /// reads "I am everywhere" to demonstrate that the pink extends to every
    /// part of the screen.](ignoressafearea.png)
    ///
    /// Depending on the surrounding view hierarchy, SwiftUI may not honor an
    /// `edgesIgnoringSafeArea(_:)` request. This can happen, for example, if
    /// the view is inside a container that respects the screen's safe area. In
    /// that case you may need to apply `edgesIgnoringSafeArea(_:)` to the
    /// container instead.
    ///
    /// - Parameter edges: The set of the edges in which to expand the size
    ///   requested for this view.
    ///
    /// - Returns: A view that may extend outside of the screen's safe area
    ///   on the edges specified by `edges`.
    @inlinable public func edgesIgnoringSafeArea(_ edges: Edge.Set) -> some View { }

}

