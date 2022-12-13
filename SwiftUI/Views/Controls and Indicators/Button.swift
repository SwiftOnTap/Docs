/// A control that performs an action when triggered.
///
/// You create a button by providing an action and a label. The action is either
/// a method or closure property that does something when a user clicks or taps
/// the button. The label is a view that describes the button's action, for
/// example, by showing text such as Cancel or an icon such as a back arrow.
///
///
///     struct SignInView: View {
///         var body: some View {
///             Button(action: { /*sign the user in*/ }) {
///                 Text("Sign In")
///             }
///         }
///     }
///
/// ![Button with text reading "Sign in".](button-signin.png)
///
/// For the common case of text-only labels, you can use the convenience
/// initializer that takes a title string (or localized string key) as its first
/// parameter, instead of a trailing closure:
///
///     struct EasySignInView: View {
///         var body: some View {
///             Button("Sign In", action: { /*sign the user in*/ })
///         }
///     }
///
/// ![Button with text reading "Sign in".](button-signin.png)
///
/// The method of triggering the button varies by platform:
/// - In iOS and watchOS, the user triggers a standard button by tapping on it.
/// - In macOS, the user triggers a standard button by clicking on it.
/// - In tvOS, the user triggers a standard button by pressing "select" on an
///   external remote, like the Siri Remote, while focusing on the button.
///
/// ### Adding Buttons to Containers
///
/// Use buttons for any user interface element that triggers actions on press.
/// Buttons automatically adapt their visual style to match the expected style
/// within these different containers and contexts. For example, to create a
/// list cell that triggers an action when selected by the user, add a button to
/// the list's content. For example:
///
///     struct Item: Identifiable {
///         let id = UUID()
///         let title: String
///     }
///
///     struct ListView: View {
///         let items = [Item(title: "🍌"), Item(title: "🍑")]
///         var body: some View {
///             // A list of items, where the last row, when triggered,
///             // opens a UI for adding a new item.
///             List {
///                 ForEach(items) { item in
///                     Text(item.title)
///                 }
///                 Button("Add Item", action: { /* add item */ } )
///             }
///         }
///     }
///
/// ![A list with three items, the last of which is a button reading "Add Item".](AddItem.png)
///
/// Similarly, to create a context menu item that triggers an action, add a
/// button to the menu's content:
///
///     struct ContextMenuView: View {
///         var body: some View {
///             Text("Press and hold for copy-paste options")
///                 .contextMenu {
///                     Button("Cut", action: { /* cut */ } )
///                     Button("Copy", action: { /* copy */ } )
///                     Button("Paste", action: { /* paste */ } )
///                 }
///         }
///     }
///
///![A gif showing a view containing a button reading "Press and hold for copy-past options"; once the button is clicked, a pop-up containing three buttons, reading "Cut," "Copy," and "Paste", appears.](button-menu-content-ex.gif)
///
/// This pattern extends to most other container views in SwiftUI that have
/// customizable, interactive content, like forms (instances of ``Form``).
///
/// ### Styling Buttons
///
/// You can customize a button's appearance and interaction behavior. To add a
/// custom appearance with standard interaction behavior, create a style that
/// conforms to the ``ButtonStyle`` protocol. To customize both appearance and
/// interaction behavior, create a style that conforms to the
/// ``PrimitiveButtonStyle`` protocol. To set a specific style for all button
/// instances within a view, use the ``View/buttonStyle(_:)-3c92f`` modifier:
///
///     struct ButtonView: View {
///         var body: some View {
///             HStack {
///                 Button("Sign In", action: { /* sign in */ } )
///                 Button("Register", action: { /* register */ } )
///             }
///             .buttonStyle(PlainButtonStyle())
///         }
///     }
///
///![A view containing an HStack with two plain text buttons, "Sign In" and "Register".](Plain-Button.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Button<Label> : View where Label : View {

    /// Creates a button that displays a custom label.
    ///
    ///     struct SignInView: View {
    ///         var body: some View {
    ///             Button(action: { /* sign the user in */ }) {
    ///                 Text("Sign In")
    ///             }
    ///         }
    ///     }
    ///
    /// ![Button with text reading "Sign in".](button-signin.png)
    ///
    /// You can also use multiple trailing closure syntax to accomplish
    /// the same task:
    ///
    ///     struct SignInView: View {
    ///         var body: some View {
    ///             Button {
    ///                 /* sign the user in */
    ///             } label: {
    ///                 Text("Sign In")
    ///             }
    ///         }
    ///     }
    ///
    /// ![Button with a textview reading "Sign in" as its label. ](button-init.png)
    ///
    /// - Parameters:
    ///   - action: The action to perform when the user triggers the button.
    ///   - label: A view that describes the purpose of the button's `action`.
    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Button where Label == Text {

    /// Creates a button that generates its label from a localized string key.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:tableName:bundle:comment:)``. See
    /// ``Text`` for more information about localizing strings.
    ///
    /// To initialize a button with a string variable, use
    /// ``Button/init(_:action:)-0ffce`` instead.
    ///
    ///     struct EasySignInView: View {
    ///         let titleText = LocalizedStringKey("Sign In")
    ///
    ///         var body: some View {
    ///             Button(titleTiext, action: { /*sign the user in*/ })
    ///         }
    ///     }
    ///
    /// If you directly pass the button a [`String`](https://developer.apple.com/documentation/swift/string) literal, it will also
    /// treat it as a localization key:
    ///
    ///     struct EasySignInView: View {
    ///         var body: some View {
    ///             // "Sign In" gets localized
    ///             Button("Sign In", action: { /*sign the user in*/ })
    ///         }
    ///     }
    ///
    /// ![A gif displaying a view with the "Sign in" button being clicked; no
    /// effect results as the button has no action.](button-init-0ffce-ex.gif)
    ///
    /// - Parameters:
    ///   - titleKey: The key for the button's localized title, that describes
    ///     the purpose of the button's `action`.
    ///   - action: The action to perform when the user triggers the button.
    public init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void) { }

    /// Creates a button that generates its label from a string.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// title similar to ``Text/init(_:)-40ffd``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// To initialize a button with a localized string key, use
    /// ``Button/init(_:action:)-1de06`` instead.
    ///
    ///     struct EasySignInView: View {
    ///         let titleText = "Sign In"
    ///         var body: some View {
    ///             Button(titleText, action: { /*sign the user in*/ } )
    ///         }
    ///     }
    ///
    /// ![A gif displaying the clicking of a button labeled "Sign in", as generated
    /// by a string in the view; no effect results as the button has no action.](button-init-0ffce-ex.gif)
    ///
    /// - Parameters:
    ///   - title: A string that describes the purpose of the button's `action`.
    ///   - action: The action to perform when the user triggers the button.
    public init<S>(_ title: S, action: @escaping () -> Void) where S : StringProtocol { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Button where Label == PrimitiveButtonStyleConfiguration.Label {

    /// Creates a button based on a configuration for a style with a custom
    /// appearance and custom interaction behavior.
    ///
    /// Use this initializer within the
    /// ``PrimitiveButtonStyle/makeBody(configuration:)`` method of a
    /// ``PrimitiveButtonStyle`` to create an instance of the button that you
    /// want to style. This is useful for custom button styles that modify the
    /// current button style, rather than implementing a brand new style.
    ///
    /// For example, the following style adds a red border around the button,
    /// but otherwise preserves the button's current style:
    ///
    ///     struct RedBorderedButtonStyle: PrimitiveButtonStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             Button(configuration)
    ///                 .border(Color.red)
    ///         }
    ///     }
    ///
    /// You can then apply the style to a ``Button`` using the
    /// ``View/buttonStyle(_:)-d2d0a`` view modifier:
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             Button("Sign In") { }
    ///                 .buttonStyle(RedBorderedButtonStyle())
    ///         }
    ///     }
    ///
    /// ![A gif displaying the clicking of a red bordered button labeled "Sign
    /// in"; the button style is defined by a custom primitive button style struct.](button-init-red-outline-ex.gif)
    ///
    /// - Parameter configuration: A configuration for a style with a custom
    ///   appearance and custom interaction behavior.
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public init(_ configuration: PrimitiveButtonStyleConfiguration) { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Button {

    /// Creates a button with a specified role that displays a custom label.
    ///
    /// - Parameters:
    ///   - role: An optional semantic role that describes the button. A value of
    ///     `nil` means that the button doesn't have an assigned role.
    ///   - action: The action to perform when the user interacts with the button.
    ///   - label: A view that describes the purpose of the button's `action`.
    public init(role: ButtonRole?, action: @escaping () -> Void, @ViewBuilder label: () -> Label) { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Button where Label == Text {

    /// Creates a button with a specified role that generates its label from a
    /// localized string key.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:tableName:bundle:comment:)``. See
    /// ``Text`` for more information about localizing strings.
    ///
    /// To initialize a button with a string variable, use
    /// ``init(_:role:action:)-8y5yk`` instead.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the button's localized title, that describes
    ///     the purpose of the button's `action`.
    ///   - role: An optional semantic role describing the button. A value of
    ///     `nil` means that the button doesn't have an assigned role.
    ///   - action: The action to perform when the user triggers the button.
    public init(_ titleKey: LocalizedStringKey, role: ButtonRole?, action: @escaping () -> Void) { }

    /// Creates a button with a specified role that generates its label from a
    /// string.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// title similar to ``Text/init(_:)-9d1g4``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// To initialize a button with a localized string key, use
    /// ``init(_:role:action:)-93ek6`` instead.
    ///
    /// - Parameters:
    ///   - title: A string that describes the purpose of the button's `action`.
    ///   - role: An optional semantic role describing the button. A value of
    ///     `nil` means that the button doesn't have an assigned role.
    ///   - action: The action to perform when the user interacts with the button.
    public init<S>(_ title: S, role: ButtonRole?, action: @escaping () -> Void) where S : StringProtocol { }
}
