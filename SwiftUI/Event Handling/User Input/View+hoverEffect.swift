@available(iOS 13.4, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// A view modifier that adds a pointer hover effect to the view.
    ///
    /// Use this modifier on iPadOS only.
    ///
    /// - Note: The system may fall back to a more appropriate effect.
    @available(iOS 13.4, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func hoverEffect(_ effect: HoverEffect = .automatic) -> some View { }

}

