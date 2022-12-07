@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the style for toggles within this view.
    ///
    /// Use this modifier to specify the ``ToggleStyle`` of a
    /// ``Toggle``. See ``ToggleStyle`` for more info on the styles
    /// that SwiftUI provides out of the box, along with how to create
    /// your own custom styles.
    ///
    /// To set a specific style for all toggle instances within a view, use the
    /// ``View/toggleStyle(_:)`` modifier, as follows:
    ///
    /// ```
    /// struct StyledToggleView: View {
    ///     @State var vibrateOnRing = true
    ///     @State var vibrateOnSilent = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
    ///             Toggle("Vibrate on Silent", isOn: $vibrateOnSilent)
    ///         }
    ///         .toggleStyle(SwitchToggleStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two toggles in a VStack, with the toggleStyle
    /// view modifier applied to the VStack itself, making it so that both items
    /// the container have a SwitchToggleStyle. The top toggle reads "Vibrate
    /// on Ring" and the bottom reads "Vibrate on Silent." Both toggles are
    /// switched to "on," with their sliders switched to the right side.](togglestyle-modifier.png)
    ///
    /// - Parameter style: The style to set.
    public func toggleStyle<S>(_ style: S) -> some View where S : ToggleStyle { }

}

