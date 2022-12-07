/// A ``ViewModifier`` used to provide accessibility content.
///
/// The ``AccessibilityAttachmentModifier`` is most commonly found as the
/// modified content in an accessibility modifiers attached to a View.
/// See ``View/accessibilityAction(_:_:)`` for example usage. See
/// [Creating Accessible Views](https://developer.apple.com/documentation/swiftui/view/accessibility/creating_accessible_views?changes=_8)
/// for an example accessibility project.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityAttachmentModifier : ViewModifier {

    /// The type of view representing the body.
    public typealias Body = Never
}
