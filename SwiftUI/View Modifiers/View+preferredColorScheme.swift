@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the preferred color scheme for this presentation.
    ///
    /// The color scheme applies to the nearest enclosing presentation, such as
    /// a popover or window. Views may read the color scheme using the
    /// ``colorScheme`` environment value.
    ///
    /// In the example below the presentation containing the ``VStack`` has its
    /// color scheme set to ``ColorScheme/dark``:
    ///
    /// ```
    /// struct DarkView: View {
    ///     @State var sliderValue: Double = 0
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Button(action: { }) {
    ///                 Text(" Button")
    ///             }
    ///             HStack {
    ///                 Text("Slider").accentColor(Color.green)
    ///                 Slider(value: $sliderValue, in: -100...100, step: 0.1)
    ///             }
    ///         }
    ///         .preferredColorScheme(.dark)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a button and a slider arranged in a VStack,
    /// which applies the preferredColorScheme view modifier using dark, making it
    /// such that the color scheme for the whole view appears in dark mode.](preferredcolorscheme.png)
    ///
    /// - Parameter colorScheme: The color scheme for this view.
    ///
    /// - Returns: A view that wraps this view and sets the color scheme.
    @inlinable public func preferredColorScheme(_ colorScheme: ColorScheme?) -> some View { }

}

