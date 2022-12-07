@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the item provider used for drag and drop.
    ///
    /// Use this modifier to set the item provider when dragging and dropping a view. This is most
    /// commonly used on larger screen sizes like iPad and Mac.
    ///
    /// The example below uses system images in a ``List`` view to drag and drop onto the Photos
    /// app.
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             List {
    ///                 Label("Mustache", systemImage: "mustache")
    ///                     .itemProvider {
    ///                         NSItemProvider(object:  UIImage(systemName: "mustache")!)
    ///                     }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A view containg a default style list with one item, "Mustache" with a
    /// system image label, which can be dragged and dropped given the attached
    /// item provider; the gif shows the list tiem being dragged and dropped
    /// into the photos app, where the related image appears.](view-item-provider-ex.gif)
    ///
    /// - Parameter action: A function that returns an NSItemProvider.
    @inlinable public func itemProvider(_ action: (() -> NSItemProvider?)?) -> some View { }

}

