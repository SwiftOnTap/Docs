/// The default menu style, based on the menu's context.
///
/// The default menu style can vary by platform. By default, macOS uses the
/// bordered button style.
///
/// If you create a menu inside a container, the style resolves to the
/// recommended style for menus inside that container for that specific platform.
/// For example, a menu nested within another menu will resolve to a submenu:
///
///     Menu("Edit") {
///         Menu("Arrange") {
///             Button("Bring to Front", action: moveSelectionToFront)
///             Button("Send to Back", action: moveSelectionToBack)
///         }
///         Button("Delete", action: deleteSelection)
///     }
///
/// You can override a menu's style. To apply the default style to a menu, or to
/// a view that contains a menu, use the ``View/menuStyle(_:)`` modifier.
///
/// For example:
///
/// ```
/// struct DefaultMenuView: View {
///     var body: some View {
///         Menu("PDF") {
///             Button("Open in Preview", action: { })
///             Button("Save as PDF", action: { })
///         }
///         .menuStyle(DefaultMenuStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a default style menu "PDF" that once clicked displays
/// two buttons, "Open in Preview" and "Save as PDF", each with no action attached.](default-menu-example.gif)
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultMenuStyle : MenuStyle {

    /// Creates a default menu style.
    ///
    /// ```
    /// struct DefaultMenuView: View {
    ///     var body: some View {
    ///         Menu("PDF") {
    ///             Button("Open in Preview", action: { })
    ///             Button("Save as PDF", action: { })
    ///         }
    ///         .menuStyle(DefaultMenuStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a default style menu "PDF" that
    /// once clicked displays two buttons, "Open in Preview" and "Save as PDF", each with no action.](default-menu-example.gif)
    ///
    public init() { }

    /// Creates a view that represents the body of a menu.
    ///
    /// - Parameter configuration: The properties of the menu.
    ///
    /// The system calls this method for each ``Menu`` instance in a view
    /// hierarchy where this style is the current menu style.
    public func makeBody(configuration: DefaultMenuStyle.Configuration) -> some View { }


    /// A view that represents the body of a menu.
    public typealias Body = some View
}

