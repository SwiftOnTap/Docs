@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the accent color for this view and the views it contains.
    ///
    /// Use `accentColor(_:)` when you want to apply a broad theme color to
    /// your app's user interface. Some styles of controls use the accent color
    /// as a default tint color.
    ///
    /// On macOS, customization of the accent color is only applied if the
    /// "Multicolor" accent color is selected in System Preferences.
    ///
    /// In the example below, the outer ``VStack`` contains two child views, the
    /// first is a ``VStack`` containing a default accented button. The second
    /// ``VStack`` contains a button and a slider both of which adopt the purple
    /// accent color of their containing view. Note that the ``Text`` element
    /// used as a label alongside the ``Slider`` retains its default color.
    ///
    /// ```
    /// struct AccentColorView: View {
    ///     @State var sliderValue = 0.5
    ///
    ///     var body: some View {
    ///         VStack {
    ///             VStack {
    ///                 Button(action: { }) {
    ///                     Text("Regular Button")
    ///                 }
    ///             }
    ///             VStack {
    ///                 Button(action: { }) {
    ///                     Text("Accented Button")
    ///                 }
    ///                 Slider(value: $sliderValue) {
    ///                     Text("Accented Slider")
    ///                 }
    ///             }
    ///             .accentColor(.purple)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with two buttons and a slider contained within a VStack.
    /// The first button reads "Regular Button" in blue text, while the second
    /// reads "Accented Button" in purple text. The slider is also purple. In this
    /// case, there are two VStacks set within the outer VStack, the second of which
    /// contains the accented button and the slider. The accentColor view modifier is
    /// applied to the second VStack, changing the colors of the second two items to
    /// be purple.](accentcolor.png)
    ///
    /// Another common use of `accentColor(_:)` by mixing it with
    /// The ``Color`` property
    /// ``Color/primary``.
    /// This allows you to make text white in dark mode and black in light mode.
    /// For example:
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Text("Bananas 🍌🍌")
    ///                 .accentColor(.primary)
    ///         }
    ///     }
    ///
    /// In light mode, this produces:
    ///
    /// ![A screenshot in light mode with text in the center that reads "Bananas"
    /// in black text. Passing .primary to the accentColor modifier makes it so
    /// that in light mode the text is black and thus visible.](color-primary-light.png)
    ///
    /// And in dark mode:
    ///
    /// ![A screenshot in dark mode with text in the center that reads "Bananas"
    /// in white text. Passing .primary to the accentColor modifier makes it so
    /// that in dark mode the text is white and thus visible.](color-primary-dark.png)
    ///
    /// - Parameter accentColor: The color to use as an accent color. If `nil`,
    ///   the accent color continues to be inherited
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use the asset catalog's accent color or View.tint(_:) instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use the asset catalog's accent color or View.tint(_:) instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use the asset catalog's accent color or View.tint(_:) instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use the asset catalog's accent color or View.tint(_:) instead.")
    @inlinable public func accentColor(_ accentColor: Color?) -> some View { }

}

