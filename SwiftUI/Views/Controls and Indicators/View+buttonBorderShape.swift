@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Sets the border shape for buttons in this view.
    ///
    /// The border shape is used to draw the platter for a bordered button.
    ///
    /// - Parameter shape: the shape to use.
    /// - Note: This will only reflect on explicitly-set `.bordered` or
    ///   `borderedProminent` styles. Setting a shape without
    ///   explicitly setting the above styles will have no effect.
    @inlinable public func buttonBorderShape(_ shape: ButtonBorderShape) -> some View { }

}
