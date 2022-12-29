/// A container for views that you present as menu items in a contextual menu
/// after completion of the standard system gesture.
///
/// A context menu view allows you to present a situationally specific menu to
/// the user allowing them to perform actions relevant to the current task
/// they're performing in your app.
///
/// You create a context menu by first defining a `ContextMenu` container
/// with the buttons that will represent the actions the user can select
/// from. Next, you add a ``View/contextMenu(_:)`` view modifier to the view that
/// will enable the context menu. The context menu view modifier takes
/// the menu items you defined above as its argument.
///
/// The example below creates a four-item context menu container
/// used by the context menu view modifier. The Boolean value
/// `shouldShowMenu` controls the attachment of context menu; it is set to
/// `true`, enabling the contextual menu.
///
/// Note that it is possible to place the actions performed by the menu
/// selection directly inside the button closures or, as shown below, to invoke
/// them via function references.
///
/// ```
/// func selectHearts() {
///     // Act on hearts selection.
/// }
/// func selectClubs() { }
/// func selectSpades() { }
/// func selectDiamonds() { }
///
/// let menuItems = ContextMenu {
///     Button("♥️ - Hearts", action: selectHearts)
///     Button("♣️ - Clubs", action: selectClubs)
///     Button("♠️ - Spades", action: selectSpades)
///     Button("♦️ - Diamonds", action: selectDiamonds)
/// }
///
/// struct ContextMenuMenuItems: View {
///     private var shouldShowMenu = true
///     var body: some View {
///         VStack {
///             Text("Favorite Card Suit")
///                 .padding()
///                 .contextMenu(shouldShowMenu ? menuItems : nil)
///         }
///     }
/// }
/// ```
///
/// ![A gif of a context menu showing four menu items: Hearts, Clubs,
/// Spades and Diamonds.](context-menu.gif)
///
@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use `contextMenu(menuItems:)` instead.")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use `contextMenu(menuItems:)` instead.")
@available(tvOS, unavailable)
@available(watchOS, introduced: 6.0, deprecated: 7.0)
public struct ContextMenu<MenuItems> where MenuItems : View {

    /// Creates a context menu from a builder of menu items.
    ///
    /// - Parameter menuItems: The builder of menu items to build your context menu.
    ///
    /// - SeeAlso: contextMenu(menuItems:)
    public init(@ViewBuilder menuItems: () -> MenuItems) { }
}

