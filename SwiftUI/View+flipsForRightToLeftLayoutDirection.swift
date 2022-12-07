@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets whether this view flips its contents horizontally when the layout
    /// direction is right-to-left.
    ///
    /// Use `flipsForRightToLeftLayoutDirection(_:)` when you need the system to
    /// horizontally flip the contents of the view to support right-to-left
    /// layout.
    ///
    /// In the example below, the text flips horizontally when the layout system
    /// is right-to-left:
    ///
    /// ```
    /// struct HebrewView: View {
    ///     var body: some View {
    ///         Text("שָׁלוֹם")
    ///             .flipsForRightToLeftLayoutDirection(true)
    ///             .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view in the center of the screen which
    /// reads the Hebrew word "שָׁלוֹם," where the flipsForRightToLeftLayoutDirection
    /// view modifier is applied to accomodate the language's reading from right
    /// to left.](flipsforrighttoleftlayoutdirection.png)
    ///
    /// - Parameter enabled: A Boolean value that indicates whether this view
    ///   flips its content horizontally when the layout direction is
    ///   right-to-left.
    ///
    /// - Returns: A view that conditionally flips its contents horizontally
    ///   when the layout direction is right-to-left.
    @inlinable public func flipsForRightToLeftLayoutDirection(_ enabled: Bool) -> some View { }

}

