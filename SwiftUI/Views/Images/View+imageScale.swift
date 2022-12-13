@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    
    /// A view modifier that scales images within the view according to one of the relative sizes
    /// available including small, medium, and large images sizes.
    ///
    /// The example below shows the relative scaling effect. The system renders
    /// the image at a relative size based on the available space and
    /// configuration options of the image it is scaling.
    ///
    /// ```
    /// struct ImageScaleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             HStack {
    ///                 Image(systemName: "heart.fill")
    ///                     .imageScale(.small)
    ///                 Text("Small")
    ///             }
    ///             HStack {
    ///                 Image(systemName: "heart.fill")
    ///                     .imageScale(.medium)
    ///                 Text("Medium")
    ///             }
    ///
    ///             HStack {
    ///                 Image(systemName: "heart.fill")
    ///                     .imageScale(.large)
    ///                 Text("Large")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying three heart icons in a VStack, each with a label
    /// to its right hand side to specify the scale used. From top to bottom, the
    /// icons apply the imageScale modifier as small, medium, and large,
    /// respectively.](image-scale.png)
    ///
    /// - Parameter scale: One of the relative sizes provided by the image scale
    ///   enumeration.
    @available(macOS 11.0, *)
    @inlinable public func imageScale(_ scale: Image.Scale) -> some View { }
    
}
