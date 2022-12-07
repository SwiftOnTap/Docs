/// A model to represent a navigation item.
///
/// A model that represents a toolbar or navigation item.
///
/// A ``ToolbarItem`` is essentially the following structure:
///
/// ```
/// struct ToolbarItem<ID, Content: View> {
///     let id: ID
///     let placement: ToolbarItemPlacement
///     let content: Content
/// }
/// ```
///
/// - `id` is responsible for efficient updates to the toolbar item.
/// - `placement` controls where the item is placed.
/// - `content` represents the actual content of the item.
///
/// ### Adding toolbar items
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         NavigationView {
///             Text("Hello, World!")
///                 .toolbar {
///                     ToolbarItem(id: "bananas") {
///                         Text("🍌🍌")
///                     }
///                 }
///         }
///     }
/// }
/// ```
///
/// ![A navigation view displaying the text "Hello, World!" and a toolbar along the top edge of the frame containing the right-aligned item "🍌🍌".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/toolbar-example-1.png)
///
/// ### Placing a toolbar item on the navigation bar
///
/// `ToolbarItem` can be explicitly placed on the navigation bar using either
/// ``ToolbarItemPlacement/navigationBarLeading`` or
/// ``ToolbarItemPlacement/navigationBarTrailing``. For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         NavigationView {
///             Text("Hello, World!")
///                 .toolbar {
///                     ToolbarItem(id: "bananas", placement: .navigationBarLeading) {
///                         Text("🍌🍌")
///                         Spacer()
///                     }
///                 }
///         }
///     }
/// }
/// ```
///
/// ![A navigation view displaying the text "Hello, World!" and a toolbar along the top edge of the frame containing the leading / left-aligned item "🍌🍌".](toolbar-leading.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ToolbarItem<ID, Content> : ToolbarContent where Content : View {

    /// The type of content representing the body of this toolbar content.
    public typealias Body = Never
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarItem where ID == Void {

    /// Creates a toolbar item with the specified placement and content.
    ///
    /// - Parameters:
    ///   - placement: Which section of the toolbar
    ///     the item should be placed in.
    ///   - content: The content of the item.
    public init(placement: ToolbarItemPlacement = .automatic, @ViewBuilder content: () -> Content) { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarItem : CustomizableToolbarContent where ID == String {

    /// Creates a toolbar item with the specified placement and content,
    /// which allows for user customization.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for this item.
    ///   - placement: Which section of the toolbar
    ///     the item should be placed in.
    ///   - showsByDefault: Whether the item appears by default in the toolbar,
    ///     or only shows if the user explicitly adds it via customization.
    ///   - content: The content of the item.
    public init(id: String, placement: ToolbarItemPlacement = .automatic, showsByDefault: Bool = true, @ViewBuilder content: () -> Content) { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarItem : Identifiable where ID : Hashable {

    /// The stable identity of the entity associated with this instance.
    public var id: ID { get }
}

