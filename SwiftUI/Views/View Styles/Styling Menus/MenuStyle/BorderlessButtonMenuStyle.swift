/// A menu style that displays a borderless button that toggles the display of
/// the menu's contents when pressed.
///
/// On macOS, the button optionally displays an arrow indicating that it presents
/// a menu.
///
/// Pressing and then dragging into the contents triggers the chosen action on
/// release.
///
/// For example:
///
/// ```
/// struct BorderlessButtonMenuView: View {
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
/// ![A gif displaying a view containing a borderless button style menu "PDF" that once clicked displays
/// two buttons, "Open in Preview" and "Save as PDF", each with no action attached.](default-menu-example.gif)
///
@available(iOS, introduced: 14.0, deprecated: 100000.0, message: "Use .menuStyle(.button) and .buttonStyle(.borderless).")
@available(macOS, introduced: 11.0, deprecated: 100000.0, message: "Use .menuStyle(.button) and .buttonStyle(.borderless).")
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct BorderlessButtonMenuStyle : MenuStyle {

    /// Creates a borderless button menu style.
    ///
    /// By default, the borderless style displays a visual indicator that it
    /// represents a menu.
    ///
    /// For example:
    ///
    /// ```
    /// struct BorderlessButtonMenuView: View {
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
    /// ![A gif displaying a view containing a borderless button style menu "PDF" that once clicked displays
    /// two buttons, "Open in Preview" and "Save as PDF", each with no action attached.](default-menu-example.gif)
    ///
    public init() { }

    /// Creates a view that represents the body of a menu.
    ///
    /// - Parameter configuration: The properties of the menu.
    ///
    /// The system calls this method for each ``Menu`` instance in a view
    /// hierarchy where this style is the current menu style.
    public func makeBody(configuration: BorderlessButtonMenuStyle.Configuration) -> some View { }


    /// A view that represents the body of a menu.
    public typealias Body = some View
}

