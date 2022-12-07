/// A model that represents a group of ``ToolbarItem``s which can be placed in
/// the toolbar or navigation bar.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ToolbarItemGroup<Content> : ToolbarContent where Content : View {

    /// Creates a toolbar item group with a specified placement and content.
    ///
    /// - Parameters:
    ///  - placement: Which section of the toolbar all of its vended
    ///    ``ToolbarItem``s should be placed in.
    ///  - content: The content of the group. Each view specified in the
    ///    `ViewBuilder` will be given its own ``ToolbarItem`` in the toolbar.
    public init(placement: ToolbarItemPlacement = .automatic, @ViewBuilder content: () -> Content) { }

    /// The type of content representing the body of this toolbar content.
    public typealias Body = Never
}

