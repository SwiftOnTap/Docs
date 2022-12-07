@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Adds padding to the specified edges of this view using an amount that's
    /// appropriate for the current scene.
    ///
    /// Use this modifier to add a scene-appropriate amount of padding to a
    /// view. Specify either a single edge value from ``Edge/Set``, or an
    /// <doc://com.apple.documentation/documentation/Swift/OptionSet> that
    /// describes the edges to pad.
    ///
    /// In macOS, use scene padding to produce the recommended spacing around
    /// the root view of a window. In watchOS, use scene padding to align
    /// elements of your user interface with top level elements, like the title
    /// of a navigation view. For example, compare the effects of different
    /// kinds of padding on text views presented inside a ``NavigationView``
    /// in watchOS:
    ///
    ///     VStack(alignment: .leading, spacing: 10) {
    ///         Text("Scene padding")
    ///             .scenePadding(.horizontal)
    ///             .border(.red) // Border added for reference.
    ///         Text("Regular padding")
    ///             .padding(.horizontal)
    ///             .border(.green)
    ///         Text("Text with no padding")
    ///             .border(.blue)
    ///         Button("Button") { }
    ///     }
    ///     .navigationTitle("Hello World")
    ///
    /// The text with scene padding automatically aligns with the title,
    /// unlike the text that uses the default padding or the text without
    /// padding:
    ///
    /// ![A watchOS screenshot with the title Hello World and a back button
    /// in the upper left. The title is indented by a small amount from
    /// the leading edge of the screen. Three bordered strings and a button
    /// appear arranged vertically below the title.
    /// The first string says Scene padding and has a red border that's aligned
    /// with the leading edge of the screen. The leading
    /// edge of the string inside the border aligns with the leading edge of
    /// the screen's title.
    /// The second string says Regular padding and has a green border that's
    /// aligned with the leading edge of the screen. The leading edge of the
    /// string appears offset from the title's leading edge by a small amount.
    /// The third string says Text with no padding and has a blue border that's
    /// aligned with the leading edge of the screen. The string is also aligned
    /// with the leading edge of the screen.](View-scenePadding-1-watchOS)
    ///
    /// Scene padding in watchOS also ensures that your content avoids the
    /// curved edges of a device like Apple Watch Series 7.
    /// In other platforms, scene padding produces the same default padding that
    /// you get from the ``View/padding(_:_:)`` modifier.
    ///
    /// > Important: Scene padding doesn't pad the top and bottom edges of a
    /// view in watchOS, even if you specify those edges as part of the input.
    /// For example, if you specify ``Edge/Set/vertical`` instead of
    /// ``Edge/Set/horizontal`` in the example above, the modifier would have
    /// no effect in watchOS. It does, however, apply to all the edges that you
    /// specify in other platforms.
    ///
    /// - Parameter edges: The set of edges along which to pad this view.
    ///
    /// - Returns: A view that's padded on specified edges by a
    ///   scene-appropriate amount.
    public func scenePadding(_ edges: Edge.Set = .all) -> some View { }


    /// Adds a specified kind of padding to the specified edges of this view
    /// using an amount that's appropriate for the current scene.
    ///
    /// Use this modifier to add a scene-appropriate amount of padding to a
    /// view. Specify either a single edge value from ``Edge/Set``, or an
    /// <doc://com.apple.documentation/documentation/Swift/OptionSet> that
    /// describes the edges to pad.
    ///
    /// In macOS, use scene padding to produce the recommended spacing around
    /// the root view of a window. In watchOS, use scene padding to align
    /// elements of your user interface with top level elements, like the title
    /// of a navigation view. For example, compare the effects of different
    /// kinds of padding on text views presented inside a ``NavigationView``
    /// in watchOS:
    ///
    ///     VStack(alignment: .leading, spacing: 10) {
    ///         Text("Minimum Scene padding")
    ///             .scenePadding(.minimum, edges: .horizontal)
    ///             .border(.red) // Border added for reference.
    ///         Text("Navigation Bar Scene padding")
    ///             .scenePadding(.navigationBar, edges: .horizontal)
    ///             .border(.yellow)
    ///         Text("Regular padding")
    ///             .padding(.horizontal)
    ///             .border(.green)
    ///         Text("Text with no padding")
    ///             .border(.blue)
    ///         Button("Button") { }
    ///     }
    ///     .navigationTitle("Hello World")
    ///
    /// The text with minimum scene padding uses the system minimum padding
    /// and the text with navigation bar scene padding automatically aligns
    /// with the navigation bar content. In contrast, the text that uses the
    /// default padding and the text without padding do not align with scene
    /// elements.
    ///
    /// Scene padding in watchOS also ensures that your content avoids the
    /// curved edges of a device like Apple Watch Series 7.
    /// In other platforms, scene padding produces the same default padding that
    /// you get from the ``View/padding(_:_:)`` modifier.
    ///
    /// > Important: Scene padding doesn't pad the top and bottom edges of a
    /// view in watchOS, even if you specify those edges as part of the input.
    /// For example, if you specify ``Edge/Set/vertical`` instead of
    /// ``Edge/Set/horizontal`` in the example above, the modifier would have
    /// no effect in watchOS. It does, however, apply to all the edges that you
    /// specify in other platforms.
    ///
    /// - Parameter padding: The kind of padding to add.
    /// - Parameter edges: The set of edges along which to pad this view.
    ///
    /// - Returns: A view that's padded on specified edges by a
    ///   scene-appropriate amount.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func scenePadding(_ padding: ScenePadding, edges: Edge.Set = .all) -> some View { }

}

