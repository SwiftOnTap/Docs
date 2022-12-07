@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Prevent view interaction.
    ///
    /// Disable interaction on a view.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State var isDisabled = false
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Toggle("Disable The Banana", isOn: $isDisabled)
    ///             Button("Banana 🍌🍌") { }
    ///                 .disabled(isDisabled)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a toggle in the center of the screen that reads "Disable
    /// the Banana," set in a VStack with a "Banana" button underneath it. When
    /// toggled to on, the Banana button disables and fades to gray.](disabled-example.gif)
    ///
    /// Another example:
    ///
    /// ```
    /// struct CantTouchThisView: View {
    ///     var body: some View {
    ///         Button("Can't touch this 🎶") { }
    ///             .disabled(true)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a button in the center of the screen that reads
    /// "Can't touch this" in light gray text to denote that the button is not clickable given
    /// that user interaction was disabled by the view modifier.](disabled.png)
    ///
    /// - Parameter disabled: A Boolean value that determines whether users can
    ///   interact with this view.
    ///
    /// - Returns: A view that controls whether users can interact with this
    ///   view.
    @inlinable public func disabled(_ disabled: Bool) -> some View { }

}

