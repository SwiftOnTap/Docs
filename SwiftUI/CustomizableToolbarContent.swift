/// Conforming types represent items that can be placed in various locations
/// in a customizable toolbar.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol CustomizableToolbarContent : ToolbarContent where Self.Body : CustomizableToolbarContent { }
extension CustomizableToolbarContent : ToolbarContent where Self.Body : CustomizableToolbarContent {
}

