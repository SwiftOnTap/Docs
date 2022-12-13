/// A type that applies standard interaction behavior and a custom appearance
/// to all menus within a view hierarchy.
///
/// Use this protocol to create
/// a componentized style to apply to a ``Menu``.
///
/// ### Creating Your Own Style
///
/// There is only one requirement of conforming to the `MenuStyle`
/// protocol: ``MenuStyle/makeBody(configuration:)``. It takes a
/// `configuration` parameter of type ``MenuStyleConfiguration``
/// which can be passed to ``Menu``'s ``Menu/init(_:)`` initializer:
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
/// After creating a `MenuStyle`, you can apply it to a ``Menu`` using the
/// ``View/menuStyle(_:)`` view modifier:
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
/// ### Pre-Packaged Styles
///
/// Existing menu styles include:
/// - ``DefaultMenuStyle``
/// - ``BorderlessButtonMenuStyle``
/// - ``BorderedButtonMenuStyle`` (on macOS)
///
/// On iOS, ``BorderlessButtonMenuStyle`` is the
/// ``DefaultMenuStyle``, so there is no reason to use these.
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol MenuStyle {
    
    /// A view that represents the body of a menu.
    associatedtype Body : View

    /// Creates a view that represents the body of a menu.
    ///
    /// Implement this function to conform to the
    /// ``MenuStyle`` protocol. It is the only requirement.
    ///
    /// This function takes in a `configuration` paramter of type
    /// ``MenuStyleConfiguration``. You can initialize a ``Menu``
    /// using the ``Menu/init(_:)`` initializer and this parameter,
    /// and then style it. Return the result:
    ///
    /// ```
    /// struct RedBorderMenuStyle: MenuStyle {
    ///     func makeBody(configuration: Configuration) -> some View {
    ///         return Menu(configuration)
    ///             .border(Color.red)
    ///     }
    /// }
    /// ```
    ///
    /// After implementing this function, pass an instance of your structure
    /// to the ``View/menuStyle(_:)`` view modifier to style a ``Menu``:
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
    /// - Parameter configuration: The properties of the menu.
    func makeBody(configuration: Self.Configuration) -> Self.Body { }

    /// The properties of a menu.
    ///
    /// This is just a convenience type alias. See ``MenuStyleConfiguration``
    /// for more.
    typealias Configuration = MenuStyleConfiguration

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension MenuStyle where Self == DefaultMenuStyle {
    
    /// The default menu style, based on the menu's context.
    ///
    /// The default menu style can vary by platform. By default, macOS uses the
    /// bordered button style.
    ///
    /// If you create a menu inside a container, the style resolves to the
    /// recommended style for menus inside that container for that specific
    /// platform. For example, a menu nested within another menu will resolve to
    /// a submenu:
    ///
    ///     Menu("Edit") {
    ///         Menu("Arrange") {
    ///             Button("Bring to Front", action: moveSelectionToFront)
    ///             Button("Send to Back", action: moveSelectionToBack)
    ///         }
    ///         Button("Delete", action: deleteSelection)
    ///     }
    ///
    /// You can override a menu's style. To apply the default style to a menu,
    /// or to a view that contains a menu, use the ``View/menuStyle(_:)``
    /// modifier.
    public static var automatic: DefaultMenuStyle { get }
}

@available(iOS 16.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension MenuStyle where Self == ButtonMenuStyle {

    /// A menu style that displays a button that toggles the display of
    /// the menu's contents when pressed.
    ///
    /// On macOS, the button displays an arrow to indicate that it presents a
    /// menu.
    ///
    /// Pressing and then dragging into the contents activates the selected
    /// action on release.
    public static var button: ButtonMenuStyle { get }
}

@available(iOS, introduced: 14.0, deprecated: 100000.0, message: "Use .menuStyle(.button) and .buttonStyle(.borderless).")
@available(macOS, introduced: 11.0, deprecated: 100000.0, message: "Use .menuStyle(.button) and .buttonStyle(.borderless).")
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension MenuStyle where Self == BorderlessButtonMenuStyle {

    /// A menu style that displays a borderless button that toggles the display of
    /// the menu's contents when pressed.
    ///
    /// On macOS, the button optionally displays an arrow indicating that it
    /// presents a menu.
    ///
    /// Pressing and then dragging into the contents triggers the chosen action on
    /// release.
    public static var borderlessButton: BorderlessButtonMenuStyle { get }
}
