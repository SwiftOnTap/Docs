/// Pair related views such that one view serves as the view content, and one
/// view serves as the view label.
///
/// ``AccessibilityLabeledPairRole`` is almost always used in conjunction with the ``View/accessibilityLabeledPair(role:id:in:)`` modifier.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public enum AccessibilityLabeledPairRole {
    
    /// This element represents the label part of the label / content pair.
    ///
    /// For example, it might be the explanatory text to the left of a control,
    /// describing what the control does.
    case label
    
    /// This element represents the content part of the label / content pair.
    ///
    /// For example, it might be the custom control itself.
    case content
    
}
