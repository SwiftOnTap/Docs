@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// A view modifier that adds an action to perform when the user moves the pointer over or away
    /// from the view's frame.
    ///
    /// Calling this method defines a region for detecting pointer movement with
    /// the size and position of this view.
    ///
    /// ```
    /// struct HoverView: View {
    ///     @State private var isHovering = false
    ///
    ///     var body: some View {
    ///         Text(isHovering ? "HOVERING 🛸" : "👉 Come here 👈")
    ///             .onHover { hovering in
    ///                 isHovering = hovering
    ///             }
    ///             .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a text view that reads "Come here," which, when
    /// hovered over with the cursor, changes to read "HOVERING." The onHover
    /// view modifier determines when the user hovers and switches the text.](on-hover-perform-ex.gif)
    ///
    /// - Parameter action: The action to perform whenever the pointer enters or
    ///   exits this view's frame. If the pointer is in the view's frame, the
    ///   `action` closure passes `true` as a parameter; otherwise, `false`.
    ///
    /// - Returns: A view that triggers `action` when the pointer enters or
    ///   exits this view's frame.
    @inlinable public func onHover(perform action: @escaping (Bool) -> Void) -> some View { }

}

