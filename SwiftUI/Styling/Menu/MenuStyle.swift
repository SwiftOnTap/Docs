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
public protocol MenuStyle { }
extension MenuStyle {

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

