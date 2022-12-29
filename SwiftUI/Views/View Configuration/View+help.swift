@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Adds help text to a view using a localized string that you provide.
    ///
    /// Adding help to a view configures the view's accessibility hint and
    /// its tooltip ("help tag") on macOS.
    ///
    /// For more information on using help tags, see
    /// [Help](https://developer.apple.com/design/human-interface-guidelines/macos/user-interaction/help/)
    /// in the macOS Human Interface Guidelines.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Button(action:  { /*Compose a message*/ }) {
    ///             Image(systemName: "square.and.pencil")
    ///         }
    ///         .help("Compose a new message")
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a button with help text underneath that reads
    /// "Compose a new message"](help-localized.png)
    ///
    /// - Parameter textKey: The key for the localized text to use as help.
    public func help(_ textKey: LocalizedStringKey) -> some View { }


    /// Adds help text to a view using a text view that you provide.
    ///
    /// Adding help to a view configures the view's accessibility hint and
    /// its tooltip ("help tag") on macOS.
    ///
    /// For more information on using help tags, see
    /// [Help](https://developer.apple.com/design/human-interface-guidelines/macos/user-interaction/help/)
    /// in the macOS Human Interface Guidelines.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var opacity = 0.0
    ///
    ///     var body: some View {
    ///         Slider(value: $opacity)
    ///             .help(Text("Adjust the opacity"))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a slider with help text underneath reading
    /// "Adjust the opacity"](help-text.png)
    ///
    /// - Parameter text: The Text view to use as help.
    public func help(_ text: Text) -> some View { }


    /// Adds help text to a view using a string that you provide.
    ///
    /// Adding help to a view configures the view's accessibility hint and
    /// its tooltip ("help tag") on macOS.
    ///
    /// For more information on using help tags, see
    /// [Help](https://developer.apple.com/design/human-interface-guidelines/macos/user-interaction/help/)
    /// in the macOS Human Interface Guidelines.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let helpText = "I am orange 🟧"
    ///
    ///     var body: some View {
    ///         Image(systemName: "pin.circle")
    ///             .foregroundColor(.orange)
    ///             .help(helpText)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange pin icon with help text underneath
    /// that reads "I am orange" followed by an orange block emoji.](help-orange.png)
    ///
    /// - Parameter text: The text to use as help.
    public func help<S>(_ text: S) -> some View where S : StringProtocol { }

}

