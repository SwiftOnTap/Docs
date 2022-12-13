@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// A view modifier that expands the view out of its safe area.
    ///
    /// Use this modifier to extend your content beyond the safe area.
    ///
    /// There are two parameters: the safe area regions to ignore, and the edges that
    /// you would like to ignore those safe areas.
    ///
    /// The first parameter is of type ``SafeAreaRegions``. The options are:
    /// - ``SafeAreaRegions/container``: The navigation bar and bottom bar on iPhone X+.
    /// - ``SafeAreaRegions/keyboard``: The software keyboard area.
    /// - ``SafeAreaRegions/all``: All safe areas
    ///
    /// The second parameter has edge options:
    /// - ``Edge/Set/leading``
    /// - ``Edge/Set/trailing``
    /// - ``Edge/Set/top``
    /// - ``Edge/Set/bottom``
    ///
    /// ```
    /// struct SafeAreaIgnoringView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Color.pink
    ///             Text("I am everywhere")
    ///         }
    ///         .ignoresSafeArea(.all, edges: [.top, .bottom])
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a fully pink background that extends outside the
    /// safe area as rendered by the view modifier. The text in the center
    /// reads "I am everywhere" to demonstrate that the pink extends to every
    /// part of the screen.](ignoressafearea.png)
    ///
    /// - Parameters:
    ///   - regions: the kinds of rectangles removed from the safe area
    ///     that should be ignored (i.e. added back to the safe area
    ///     of the new child view.
    ///   - edges: the edges of the view that may be outset, any edges
    ///     not in this set will be unchanged, even if that edge is
    ///     abutting a safe area listed in `regions`.
    ///
    /// - Returns: a new view with its safe area expanded.
    ///
    @inlinable public func ignoresSafeArea(_ regions: SafeAreaRegions = .all, edges: Edge.Set = .all) -> some View { }

}

