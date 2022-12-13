@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets the style for control groups within this view.
    ///
    /// - Parameter style: The style to apply to controls within this view.
    public func controlGroupStyle<S>(_ style: S) -> some View where S : ControlGroupStyle { }

}
