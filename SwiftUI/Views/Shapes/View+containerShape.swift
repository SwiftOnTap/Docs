@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Sets the container shape to use for any container relative shape
    /// within this view.
    ///
    /// The example below defines a view that shows its content with a rounded
    /// rectangle background and the same container shape. Any
    /// ``ContainerRelativeShape`` within the `content` matches the rounded
    /// rectangle shape from this container inset as appropriate.
    ///
    ///     struct PlatterContainer<Content: View> : View {
    ///         @ViewBuilder var content: Content
    ///         var body: some View {
    ///             content
    ///                 .padding()
    ///                 .containerShape(shape)
    ///                 .background(shape.fill(.background))
    ///         }
    ///         var shape: RoundedRectangle { RoundedRectangle(cornerRadius: 20) }
    ///     }
    ///
    @inlinable public func containerShape<T>(_ shape: T) -> some View where T : InsettableShape { }

}
