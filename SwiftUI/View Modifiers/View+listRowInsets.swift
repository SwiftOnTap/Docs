@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that applies an inset to the rows in a list.
    ///
    /// Use `listRowInsets(_:)` to change the default padding of the content of
    /// list items.
    ///
    /// In the example below, the list row is inset 15pts from the top edge,
    /// and 100pts from the right edge.
    ///
    /// - Note: The code below does not work in a list alone.
    /// It must be in a ``ForEach``.
    ///
    ///     struct ContentView: View {
    ///         let colors: [Color] = [Color.orange, .purple, .pink]
    ///         let insets = EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 100)
    ///
    ///         var body: some View {
    ///             List {
    ///                 ForEach(colors, id: \.self) {
    ///                     color.listRowInsets(insets)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying three colored bars at the top of the screen,
    /// each inset so as not to span the entire width of the screen. Each colored
    /// bar is inset at its top edge and trailing edge using the view modifier, so
    /// they extend just beyond half the width of the screen and there is some
    /// empty space between them.](listrowinsets.png)
    ///
    /// - Parameter insets: ``EdgeInsets`` to apply to the edges of the view.
    ///
    /// - Returns: A view that uses the given edge insets when used as a list
    ///   cell.
    @inlinable public func listRowInsets(_ insets: EdgeInsets?) -> some View { }

}

