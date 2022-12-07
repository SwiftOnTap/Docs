@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that enables/disables user interaction.
    ///
    /// ```
    /// struct HitDisabledView: View {
    ///     var body: some View {
    ///         Button("Can't touch this 🎶") { /*this never happens*/ }
    ///             .allowsHitTesting(false)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a button in the center of the screen that reads
    /// "Can't touch this" to denote that the button is not clickable given
    /// that user interaction was disabled by the view modifier.](allow-hit-testing-ex.png)
    ///
    /// - Parameter enabled: A boolean for whether the view allows user interaction.
    @inlinable public func allowsHitTesting(_ enabled: Bool) -> some View { }

}

