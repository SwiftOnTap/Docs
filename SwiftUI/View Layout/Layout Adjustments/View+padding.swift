@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Pads this view using the edges and padding amount you specify.
    ///
    /// Use `padding(_:)` to add a specified amount of padding to one or more
    /// edges of the view. For example, you can add padding of specific amounts
    /// to specified edges of a view:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("20 point padding on the left and bottom edges.")
    ///                 .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0))
    ///                 .border(Color.gray)
    ///             Text("Unpadded text")
    ///                 .border(Color.yellow)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with two text views, one with a gray border
    /// and 20 point padding on just the left and bottom edges, the other with a yellow border and
    /// no padding.](padding-97aab-ex.png)
    ///
    /// To pad selected outside edges of a view with an amount you specify, see
    /// ``View/padding(_:_:)``. To pad all outside edges of a view with an
    /// amount you specify, see ``View/padding(_:)-049c2``.
    ///
    /// - Parameter insets: The edges and amounts to inset.
    ///
    /// - Returns: A view that pads this view using the specified edge insets
    ///   with specified amount of padding.
    @inlinable public func padding(_ insets: EdgeInsets) -> some View { }


    /// A view that pads this view inside the specified edge insets with a
    /// system-calculated amount of padding.
    ///
    /// Use ``View/padding(_:)-049c2`` to add a system-calculated amount of padding inside
    /// one or more of the view's edges by passing either a single edge name, or
    /// an `OptionSet` describing which edges should be padded. For example you
    /// can add padding to the bottom of a text view:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Text padded on the bottom edge.")
    ///                 .padding(.bottom)
    ///                 .border(Color.gray)
    ///             Text("Unpadded text")
    ///                 .border(Color.yellow)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with two text views, one with a gray border
    /// and padding on the bottom edge, the other with a yellow border and
    /// no padding.](15.39.23.png)
    ///
    /// To pad the view's insets, which affects the amount of padding _inside_
    /// the edges of the view, see ``View/padding(_:)-97aab``. To pad all
    /// outside edges of a view with an amount you specify, see
    /// ``View/padding(_:)-049c2``.
    ///
    /// - Parameters:
    ///   - edges: The set of edges along which to pad this view; if `nil` the
    ///     specified or system-calculated mount is applied to all edges.
    ///   - length: The amount to inset this view on the specified edges. If
    ///     `nil`, the amount is the system-default amount.
    ///
    /// - Returns: A view that pads this view using the specified edge insets
    ///   with specified amount of padding.
    @inlinable public func padding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View { }


    /// Pads the view along all edges by the specified amount.
    ///
    /// Use ``View/padding(_:)-049c2`` to add a specific amount of padding around all edges
    /// of the view.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Text padded by 10 points on each edge.")
    ///                 .padding(10.0)
    ///                 .border(Color.gray)
    ///             Text("Unpadded text")
    ///                 .border(Color.yellow)
    ///         }
    ///     }
    /// }
    /// ```
    /// ![A view containing a VStack with two text views, one with a gray border
    /// and 10 point padding on each edge, the other with a yellow border and
    /// no padding.](15.27.58.png)
    ///
    /// - Parameter length: The amount to pad this view on each edge.
    ///
    /// - Returns: A view that pads this view by the amount you specify.
    @inlinable public func padding(_ length: CGFloat) -> some View { }

}

