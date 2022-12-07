@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Make a view draggable by providing dragged info.
    ///
    /// Use this modifier to add the appropriate gestures for
    /// drag and drop to a view. When a dragging begins, a rendering of
    /// the view is generated and used as the preview image.
    ///
    /// In the following simple example, the image view can be dragged.
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Image(systemName: "mustache")
    ///                 .onDrag {
    ///                     NSItemProvider(object: UIImage(systemName: "mustache")!)
    ///                 }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a view containing mustache image being dragged around
    /// the screen; the dragged item is a simple copy of the original, which
    /// remains in the center of the view, and once dropped, the copy merges
    /// with the original.](ondrag-ex.gif)
    ///
    /// - Parameter data: A function that returns an
    /// [`NSItemProvider`](https://developer.apple.com/documentation/foundation/nsitemprovider)
    /// object storing draggable data from a view.
    ///
    /// - Returns: A view that can be used as the source of drag and drop.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onDrag(_ data: @escaping () -> NSItemProvider) -> some View { }

}

