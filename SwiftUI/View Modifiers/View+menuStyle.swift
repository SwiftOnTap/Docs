@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// A view modifier that sets the style for menus.
    ///
    /// To set a specific style for all menu instances within a view, use the
    /// `menuStyle(_:)` modifier. Pass an instance of a struct that
    /// conforms to the ``MenuStyle`` protocol.
    ///
    /// ```
    /// struct ButtonStyleView: View {
    ///     var body: some View {
    ///         Menu("PDF") {
    ///             Button("Open in Preview", action: { })
    ///             Button("Save as PDF", action: { })
    ///         }
    ///         .menuStyle(BorderlessButtonMenuStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a button in the center of the screen that reads "PDF,"
    /// which holds down to reveal a menu with two options: Save as PDF or Open
    /// in Preview which are displayed in a borderless box as rendered by
    /// passing BorderlessButtonMenuStyle to the modifier.](view-menu-style-pdf-ex.gif)
    ///
    /// Existing menu styles include:
    /// - ``DefaultMenuStyle``
    /// - ``BorderlessButtonMenuStyle``
    /// - ``BorderedButtonMenuStyle`` (on macOS)
    ///
    /// On iOS, ``BorderlessButtonMenuStyle`` is the
    /// ``DefaultMenuStyle``, so there is no reason to use these.
    ///
    /// ### Custom Menu Styles
    ///
    /// The ``MenuStyle`` protocol also supports custom structures.
    /// To create a custom ``MenuStyle``, implement the
    /// ``MenuStyle/makeBody(configuration:)`` function:
    ///
    /// ```
    /// struct RedBorderMenuStyle: MenuStyle {
    ///     func makeBody(configuration: Configuration) -> some View {
    ///         Menu(configuration)
    ///             .border(Color.red)
    ///     }
    /// }
    /// ```
    ///
    /// You can then use `menuStyle(_:)` to apply the style:
    ///
    /// ```
    /// struct ButtonStyleView: View {
    ///     var body: some View {
    ///         Menu("PDF") {
    ///             Button("Open in Preview", action: { })
    ///             Button("Save as PDF", action: { })
    ///         }
    ///         .menuStyle(RedBorderMenuStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a button in the center of the screen that reads "PDF" surrounded
    /// by a rectangular red border, which holds down to reveal a menu with two
    /// options: Save as PDF or Open in Preview which are displayed in a borderless
    /// box as rendered by passing BorderlessButtonMenuStyle to the modifier.](menu-style-ex2.gif)
    ///
    /// - Parameter style: Your desired ``MenuStyle``.
    /// - Returns: A view with styled menus.
    public func menuStyle<S>(_ style: S) -> some View where S : MenuStyle { }

}

