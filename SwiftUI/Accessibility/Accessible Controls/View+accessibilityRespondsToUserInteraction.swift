@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Explicitly set whether this Accessibility element responds to user
    /// interaction and would thus be interacted with by technologies such as
    /// Switch Control, Voice Control or Full Keyboard Access.
    ///
    /// If this is not set, the value is inferred from the traits of the
    /// Accessibility element, the presence of Accessibility actions on the
    /// element, or the presence of gestures on the element or containing views.
    public func accessibilityRespondsToUserInteraction(_ respondsToUserInteraction: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }
}
