/// Conforming types represent items that can be placed in various locations
/// in a toolbar.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol ToolbarContent { }

extension ToolbarContent {

    /// The type of content representing the body of this toolbar content.
    associatedtype Body : ToolbarContent

    /// The composition of content that comprise the toolbar content.
    @ToolbarContentBuilder var body: Self.Body { get }
}

