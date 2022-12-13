/// A structure which defines the placement of a toolbar item.
///
/// There are two types of placements:
/// - Semantic placements, such as `.principal` and `.navigation`,
/// which denote the intent of the item being added.
/// SwiftUI will determine the appropriate placement for the item
/// based on this intent, as well as the current platform.
/// - Positional placements, such as `.navigationBarLeading`,
/// which denote a precise placement for the item,
/// usually for a particular platform.
///
/// Toolbar placements are used with the ``ToolbarItem`` when defining a toolbar.
/// For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Text("🍌🍌")
///             .toolbar {
///                 ToolbarItem(placement: .bottomBar) {
///                     Button("Bottom bar button") { }
///                 }
///             }
///     }
/// }
/// ```
///
/// ![A screenshot displaying a text view with two banana emojis in the center
/// of the screen and a button on the bottom that reads "Bottom bar button."
/// The button is placed at the bottom using the toolbar modifier with bottomBar
/// placement.](9B900A7C-AA39-4C5B-9022-EFFF9308F236.png)
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ToolbarItemPlacement {

    /// The item is placed automatically, depending on many factors including
    /// the platform, size class, or presence of other items.
    ///
    /// On macOS and Mac Catalyst, items are placed in the current toolbar
    /// section in order of leading to trailing. On watchOS, only the first
    /// item will appear, pinned beneath the navigation bar.
    ///
    /// On iOS, iPadOS and tvOS, items are placed in the trailing position of
    /// the navigation bar.
    ///
    /// In compact horizontal size classes, both the leading and the trailing
    /// positions of the navigation bar are limited to a single item each.
    public static let automatic: ToolbarItemPlacement

    /// The item is placed in the principal item section.
    ///
    /// Principal actions receive prominent placement.
    /// As an example, the location field for a web browser would be
    /// considered a principal item.
    ///
    /// On macOS and Mac Catalyst, the principal item will be placed in the
    /// center of the toolbar.
    ///
    /// On iOS, iPadOS, and tvOS, the principal item will be placed in
    /// the center of the navigation bar. This item will take precedent over
    /// a title specified through `.navigationTitle()`.
    @available(watchOS, unavailable)
    public static let principal: ToolbarItemPlacement

    /// The item represents a navigation action.
    ///
    /// Navigation actions allow the user to move between contexts.
    /// For example, the forward and back buttons of a web browser
    /// are considered navigation actions.
    ///
    /// On macOS and Mac Catalyst, navigation items will be placed in the
    /// leading edge of the toolbar ahead of the inline title if that is
    /// present in the toolbar.
    ///
    /// On iOS, iPadOS, and tvOS, navigation items will appear in the leading
    /// edge of the navigation bar. If a system navigation item like a back
    /// button is present in a compact width, they will instead appear in
    /// the .primaryAction placement.
    @available(watchOS, unavailable)
    public static let navigation: ToolbarItemPlacement

    /// The item represents a primary action.
    ///
    /// A primary action is considered to be a more frequently used action
    /// for the current context. For example, a button which allows the user
    /// to compose a new message in a chat application.
    ///
    /// On macOS and Mac Catalyst, the primary action is considered to be the
    /// leading edge of the toolbar.
    ///
    /// On iOS, iPadOS and tvOS, the primary action is considered to be
    /// the trailing edge of the navigation bar.
    ///
    /// On watchOS, the primary action is placed beneath the navigation
    /// bar and revealed by scrolling.
    public static let primaryAction: ToolbarItemPlacement

    /// The item represents a change in status for the current context.
    ///
    /// Status items are informational in nature,
    /// and do not represent an action that can be taken by the user.
    /// For example, a message indicating the last time the server has been
    /// checked for new messages.
    ///
    /// On macOS and Mac Catalyst, status items will be placed in the center
    /// of the toolbar.
    ///
    /// On iOS and iPadOS, status items will be placed in the center of the
    /// bottom toolbar.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let status: ToolbarItemPlacement

    /// The item represents a confirmation action for a modal interface.
    ///
    /// Confirmation actions are used to receive user confirmation of a
    /// particular action. An example of a confirmation action would be
    /// an action with the label "Add" to add a new event to the calendar.
    ///
    /// On macOS and Mac Catalyst, confirmationAction items will be placed
    /// on the trailing edge in the trailing-most position of the sheet
    /// and gain the apps accent color as a background color.
    ///
    /// On iOS, iPadOS, and tvOS, confirmationAction items will be placed in
    /// the same location as a `.primaryAction` placement.
    ///
    /// On watchOS, confirmationAction items will be placed in the trailing
    /// edge of the navigation bar.
    public static let confirmationAction: ToolbarItemPlacement

    /// The item represents a cancellation action for a modal interface.
    ///
    /// Cancellation actions can be used to dismiss the modal interface
    /// without taking any action, usually via a 'Cancel' button.
    ///
    /// On macOS and Mac Catalyst, cancellationAction items will be placed
    /// on the trailing edge of the sheet but be placed before any
    /// confirmationAction items.
    ///
    /// On iOS, iPadOS, tvOS and watchOS, cancellationAction items will
    /// be placed on the leading edge of the navigation bar.
    public static let cancellationAction: ToolbarItemPlacement

    /// The item represents a destructive action for a modal interface.
    ///
    /// Destructive actions are used represent the opposite of a
    /// confirmational action. For example, a button labeled 'Don't Save',
    /// which declines to save the current document before quitting.
    ///
    /// On macOS and Mac Catalyst, destructiveAction items will be placed in
    /// the leading edge of the sheet and will be given a special appearance
    /// to caution against accidental use.
    ///
    /// On iOS, tvOS and watchOS, destructiveAction items will be placed in the
    /// trailing edge of the navigation bar.
    public static let destructiveAction: ToolbarItemPlacement
    
    /// The item is placed in the keyboard section.
    ///
    /// On iOS, keyboard items are above the software keyboard when present,
    /// or at the bottom of the screen when a hardware keyboard is attached.
    ///
    /// On macOS, keyboard items will be placed inside the Touch Bar.
    ///
    /// A `FocusedValue`can be used to adjust the content of the keyboard bar
    /// based on the currently focused view. In the example below, the keyboard
    /// bar gains additional buttons only when the appropriate `TextField` is
    /// focused.
    ///
    ///     enum Field {
    ///         case suit
    ///         case rank
    ///     }
    ///
    ///     struct KeyboardBarDemo : View {
    ///         @FocusedValue(\.field) var field: Field?
    ///
    ///         var body: some View {
    ///             HStack {
    ///                 TextField("Suit", text: $suitText)
    ///                     .focusedValue(\.field, .suit)
    ///                 TextField("Rank", text: $rankText)
    ///                     .focusedValue(\.field, .rank)
    ///             }
    ///             .toolbar {
    ///                 ToolbarItemGroup(placement: .keyboard) {
    ///                     if field == .suit {
    ///                         Button("♣️", action: {})
    ///                         Button("♥️", action: {})
    ///                         Button("♠️", action: {})
    ///                         Button("♦️", action: {})
    ///                     }
    ///                     DoneButton()
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let keyboard: ToolbarItemPlacement

    /// The item is placed in the leading edge of the navigation bar. Applies
    /// to iOS, iPadOS, tvOS, and Mac Catalyst.
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public static let navigationBarLeading: ToolbarItemPlacement

    /// The item is placed in the trailing edge of the navigation bar. Applies
    /// to iOS, iPadOS, tvOS, and Mac Catalyst.
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public static let navigationBarTrailing: ToolbarItemPlacement

    /// The item is placed in the bottom toolbar. Applies to iOS, iPadOS, and
    /// Mac Catalyst.
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let bottomBar: ToolbarItemPlacement
}

