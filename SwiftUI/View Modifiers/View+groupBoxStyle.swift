@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// A view modifier that sets the style for group boxes within this view.
    ///
    /// Use this method to change the style of your ``GroupBox``.
    ///
    /// There is currently only one pre-built style, called ``DefaultGroupBoxStyle``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         GroupBox(label: Label("Default GroupBox", systemImage: "smiley"))
    ///         {
    ///             Text("GroupBox content!")
    ///         }
    ///         .padding()
    ///         .groupBoxStyle(DefaultGroupBoxStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a GroupBox labeled "Default GroupBox" coupled with a
    /// smiley face system image and a text view within. Padding and the
    /// DefaultGroupBoxStyle have been applied to the GroupBox.](group-box-style-ex.png)
    ///
    /// The protocol ``GroupBoxStyle`` lets you create your own custom styles.
    ///
    /// - Parameter style: The style to apply to boxes within this view.
    public func groupBoxStyle<S>(_ style: S) -> some View where S : GroupBoxStyle { }

}

