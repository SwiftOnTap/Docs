/// A control for presenting a menu of actions.
///
/// A menu is created from a view builder of different views. Each
/// acceptable view will be shown as a different row in the menu.
/// The canonical view for using in a menu is ``Button``, but
/// these views also work: ``Menu``, ``Text``, ``Button``,
/// ``Link``, ``Label``, ``Divider``, and ``Image``.
///
/// There are 3 different initializers, one for each of the different label types:
///
/// 1. [`String`](https://developer.apple.com/documentation/swift/string)
/// 2. ``LocalizedStringKey``
/// 3. ``View``
///
/// The following example presents a menu of three buttons and a submenu, which
/// contains two buttons of its own.
///
/// ```
/// struct MenuView: View {
///     var body: some View {
///         Menu("Actions") {
///             Button("Duplicate", action: { print("‼️") })
///             Button("Delete…", action: { print("🗑") })
///             Menu("Copy") {
///                 Button("Copy", action: { print("📑") })
///                 Button("Copy Formatted", action: { print("🔤") })
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a single button in the center of the screen that reads
/// "Actions" which holds down to present a menu with three different options:
/// Copy, Delete..., or Duplicate. If selected, the Copy button prompts the
/// appearance of a submenu, which has the option to Copy or Copy Formatted.](menu-ex1.gif)
///
/// You can create the menu's title with a ``LocalizedStringKey``, as seen in
/// the previous example, or with a ``ViewBuilder`` that creates multiple views,
/// such as an image and a text view:
///
/// ```
/// struct MenuView: View {
///     var body: some View {
///         Menu {
///             Button("Open in Preview", action: { })
///             Button("Save as PDF", action: { })
///         } label: {
///             Image(systemName: "doc")
///             Text("PDF")
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a single label in the center of the screen that reads
/// "PDF" which holds down to reveal a menu with the options to Save as PDF or
/// Open in Preview.](menu-ex2.gif)
///
/// ### Styling Menus
///
/// Use the ``View/menuStyle(_:)`` modifier to change the style of all menus
/// in a view. See the ``MenuStyle`` page for more on the types of
/// styles available, as well as how to create your own style.
///
/// ```
/// struct MenuView: View {
///     var body: some View {
///         Menu("Editing") {
///             Button("Set In Point", action: { })
///             Button("Set Out Point", action: { })
///         }
///         .menuStyle(DefaultMenuStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a single button in the center of the screen that reads
/// "Editing" which holds down to reveal a menu with the options to Set Out Point
/// or Set In Point. The menu uses the menuStyle view modifier to apply a default
/// style.](menu-ex3.gif)
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct Menu<Label, Content> : View where Label : View, Content : View {

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Menu {

    /// Creates a menu with a view label.
    ///
    /// Use this initializer to create a ``Menu``.
    ///
    /// ```
    /// struct MenuView: View {
    ///     var body: some View {
    ///         Menu {
    ///             Button("Open in Preview", action: { })
    ///             Button("Save as PDF", action: { })
    ///         } label: {
    ///             Image(systemName: "doc")
    ///             Text("PDF")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a single label in the center of the screen that reads
    /// "PDF" which holds down to reveal a menu with the options to Save as PDF or
    /// Open in Preview.](label-init-image-ex.gif)
    ///
    /// - Parameters:
    ///     - content: A group of menu items.
    ///     - label: A view describing the content of the menu.
    public init(@ViewBuilder content: () -> Content, @ViewBuilder label: () -> Label) { }

    /// Creates a menu with a localized string key label.
    ///
    /// ```
    /// struct MenuView: View {
    ///     var body: some View {
    ///         Menu(LocalizedStringKey("Actions")) {
    ///             Button("Duplicate", action: { print("‼️") })
    ///             Button("Delete…", action: { print("🗑") })
    ///             Menu("Copy") {
    ///                 Button("Copy", action: { print("📑") })
    ///                 Button("Copy Formatted", action: { print("🔤") })
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a single button in the center of the screen that reads
    /// "Actions" which holds down to present a menu with three different options:
    /// Copy, Delete..., or Duplicate. If selected, the Copy button prompts the
    /// appearance of a submenu, which has the option to Copy or Copy Formatted.](menu-96799.gif)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the link's localized title, which describes
    ///         the contents of the menu.
    ///     - content: A group of menu items.
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content) where Label == Text { }

    /// Creates a menu with a string label.
    ///
    /// ```
    /// struct MenuView: View {
    ///     var body: some View {
    ///         Menu("Actions") {
    ///             Button("Duplicate", action: { print("‼️") })
    ///             Button("Delete…", action: { print("🗑") })
    ///             Menu("Copy") {
    ///                 Button("Copy", action: { print("📑") })
    ///                 Button("Copy Formatted", action: { print("🔤") })
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a single button in the center of the screen that reads
    /// "Actions" which holds down to present a menu with three different options:
    /// Copy, Delete..., or Duplicate. If selected, the Copy button prompts the
    /// appearance of a submenu, which has the option to Copy or Copy Formatted.](menu-96799.gif)
    ///
    /// - Parameters:
    ///     - title: A string that describes the contents of the menu.
    ///     - content: A group of menu items.
    public init<S>(_ title: S, @ViewBuilder content: () -> Content) where Label == Text, S : StringProtocol { }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Menu {

    /// Creates a menu with a custom primary action and custom label.
    ///
    /// - Parameters:
    ///     - content: A group of menu items.
    ///     - label: A view describing the content of the menu.
    ///     - primaryAction: The action to perform on primary
    ///         interaction with the menu.
    public init(@ViewBuilder content: () -> Content, @ViewBuilder label: () -> Label, primaryAction: @escaping () -> Void) { }

    /// Creates a menu with a custom primary action that generates its label
    /// from a localized string key.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the link's localized title, which describes
    ///         the contents of the menu.
    ///     - primaryAction: The action to perform on primary
    ///         interaction with the menu.
    ///     - content: A group of menu items.
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content, primaryAction: @escaping () -> Void) where Label == Text { }

    /// Creates a menu with a custom primary action that generates its label
    /// from a string.
    ///
    /// To create the label with a localized string key, use
    /// `Menu(_:primaryAction:content:)` instead.
    ///
    /// - Parameters:
    ///     - title: A string that describes the contents of the menu.
    ///     - primaryAction: The action to perform on primary
    ///         interaction with the menu.
    ///     - content: A group of menu items.
    public init<S>(_ title: S, @ViewBuilder content: () -> Content, primaryAction: @escaping () -> Void) where Label == Text, S : StringProtocol { }
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Menu where Label == MenuStyleConfiguration.Label, Content == MenuStyleConfiguration.Content {

    /// Creates a menu based on a style configuration.
    ///
    /// Use this initializer within the ``MenuStyle/makeBody(configuration:)``
    /// function of a custom ``MenuStyle``. It takes a parameter of the
    /// exact same type as `makeBody(configuration:)`, so you don't have to
    /// worry about reconstructing the ``Menu``.
    ///
    /// For example, the following code creates a new, custom style that adds a
    /// red border around the current menu style:
    ///
    ///     struct RedBorderMenuStyle: MenuStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             Menu(configuration)
    ///                 .border(Color.red)
    ///         }
    ///     }
    ///
    /// You can then apply this custom style to your ``Menu`` using the
    /// ``View/menuStyle(_:)`` view modifier:
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             Menu {
    ///                 Button("Open in Preview", action: { })
    ///                 Button("Save as PDF", action: { })
    ///             } label: {
    ///                 Image(systemName: "doc")
    ///                 Text("PDF")
    ///             }
    ///             .menuStyle(RedBorderMenuStyle())
    ///         }
    ///     }
    ///
    /// ![A gif with a button in the center of the screen that reads "PDF" with
    /// the system doc image preceding it, all surrounded by a rectangular red border,
    /// which holds down to reveal a menu with two options: Save as PDF or Open in Preview
    /// box as rendered by passing BorderlessButtonMenuStyle to the modifier.](menu-init-ex.gif)
    ///
    /// - Parameter configuration: The ``MenuStyleConfiguration`` value
    /// passed to ``MenuStyle/makeBody(configuration:)``.
    ///
    public init(_ configuration: MenuStyleConfiguration) { }
}

