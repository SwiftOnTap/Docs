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


@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Activates this view as the source of a drag and drop operation.
    ///
    /// Applying the `onDrag(_:preview:)` modifier adds the appropriate gestures
    /// for drag and drop to this view. When a drag operation begins,
    /// a rendering of `preview` is generated and used as the preview image.
    ///
    /// - Parameter data: A closure that returns a single
    /// <doc://com.apple.documentation/documentation/Foundation/NSItemProvider>
    /// that represents the draggable data from this view.
    /// - Parameter preview: A ``View`` to use as the source for the dragging
    ///   preview, once the drag operation has begun. The preview is centered over
    ///   the source view.
    ///
    /// - Returns: A view that activates this view as the source of a drag-and-
    ///   drop operation, beginning with user gesture input.
    public func onDrag<V>(_ data: @escaping () -> NSItemProvider, @ViewBuilder preview: () -> V) -> some View where V : View { }

}
