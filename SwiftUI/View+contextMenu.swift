@available(iOS 13.0, macOS 10.15, tvOS 14.0, *)
@available(watchOS, introduced: 6.0, deprecated: 7.0)
extension View {

    /// A view modifier that provides right click (macOS) or long hold (iOS) menu items.
    ///
    /// Use contextual menus to add actions that change depending on the user's
    /// current focus and task.
    ///
    /// The following example creates a ``Text`` view with a contextual menu.
    /// Note that the actions invoked by the menu selection could be coded
    /// directly inside the button closures or, as shown below, invoked via
    /// function references.
    ///
    /// ```
    /// struct ContextMenuView: View {
    ///     var body: some View {
    ///         Text("Press and hold for cards")
    ///             .contextMenu {
    ///                 Button("♥️ - Hearts", action: { })
    ///                 Button("♣️ - Clubs", action: { })
    ///                 Button("♠️ - Spades", action: { })
    ///                 Button("♦️ - Diamonds", action: { })
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a button in the center of the screen that reads "Press and
    /// hold for cards." When held, the view modifier renders a context menu with four items,
    /// each reading a different suit in a standard deck of cards.](context-menu-card-ex.gif)
    ///
    /// - Parameter menuItems: A ``contextMenu`` that contains one or more menu items.
    /// - Returns: A view that adds a contextual menu to this view.
    public func contextMenu<MenuItems>(@ViewBuilder menuItems: () -> MenuItems) -> some View where MenuItems : View { }

}

@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use `contextMenu(menuItems:)` instead.")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use `contextMenu(menuItems:)` instead.")
@available(tvOS, unavailable)
@available(watchOS, introduced: 6.0, deprecated: 7.0)
extension View {

    /// A deprecated view modifier that attaches a context menu and its children to the view.
    ///
    /// Use `contextMenu(_:)` to attach a contextual menu struct and its
    /// children to the view. This modifier allows for the contextual menu to be
    /// conditionally available by passing `nil` as the value for `contextMenu`.
    ///
    /// In the example below a ``ContextMenu`` that contains four menu items is
    /// created and is passed into the `contextMenu(_:)` modifier. The
    /// attachment of context menu is controlled by the Boolean value
    /// `shouldShowMenu` which is `true`, enabling the contextual menu.
    ///
    /// Note that the actions invoked by the menu selection could be coded
    /// directly inside the button closures or, as shown below, invoked via
    /// function references.
    ///
    ///     func selectHearts() {
    ///         // Act on hearts selection.
    ///     }
    ///     func selectClubs() { }
    ///     func selectSpades() { }
    ///     func selectDiamonds() { }
    ///
    ///     let menuItems = ContextMenu {
    ///         Button("♥️ - Hearts", action: selectHearts)
    ///         Button("♣️ - Clubs", action: selectClubs)
    ///         Button("♠️ - Spades", action: selectSpades)
    ///         Button("♦️ - Diamonds", action: selectDiamonds)
    ///     }
    ///
    ///     struct ContextMenuMenuItems: View {
    ///         private var shouldShowMenu = true
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Text("Press and hold for cards")
    ///                     .padding()
    ///                     .contextMenu(shouldShowMenu ? menuItems : nil)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif with a button in the center of the screen that reads "Press and
    /// hold for cards." When held, the view modifier renders a context menu with four items,
    /// each reading a different suit in a standard deck of cards.](context-menu-card-ex.gif)
    ///
    /// - Parameter contextMenu: A context menu container for views that you
    ///   present as menu items in a contextual menu.
    ///
    /// - Returns: A view that adds a contextual menu to this view.
    public func contextMenu<MenuItems>(_ contextMenu: ContextMenu<MenuItems>?) -> some View where MenuItems : View { }

}
