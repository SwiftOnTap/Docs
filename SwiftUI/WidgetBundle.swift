/// A container used to expose multiple widgets from a single widget extension.
///
/// To support multiple types of widgets, add the `@main` attribute to a
/// structure that conforms to ``WidgetBundle``. For example, a game might have
/// one widget to display summary information about the game and a second
/// widget to display detailed information about individual characters.
///
///     @main
///     struct GameWidgets: WidgetBundle {
///         var body: some Widget {
///             GameStatusWidget()
///             CharacterDetailWidget()
///         }
///     }
///
/// Learn more about how to create a widget via the ``Widget`` documentation.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol WidgetBundle { }
extension WidgetBundle {

    /// The type of widget that represents the content of the bundle.
    ///
    /// When you support more than one widget, Swift infers this type from your
    /// implementation of the required `WidgetBundle/body-swift.property`
    /// property.
    associatedtype Body : Widget

    /// Creates a widget bundle using the bundle's body as its content.
    init() { }

    /// Declares the group of widgets that an app supports.
    ///
    /// The order that the widgets appear in this property determines the order
    /// they are shown to the user when adding a widget. The following example
    /// shows how to use a widget bundle builder to define a body showing
    /// a game status widget first and a character detail widget second:
    ///
    ///     @main
    ///     struct GameWidgets: WidgetBundle {
    ///         var body: some Widget {
    ///             GameStatusWidget()
    ///             CharacterDetailWidget()
    ///         }
    ///     }
    ///
    @WidgetBundleBuilder var body: Self.Body { get }
}

