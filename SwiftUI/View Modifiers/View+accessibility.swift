@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Specifies whether to hide this view from system accessibility features.
    public func accessibilityHidden(_ hidden: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel(_ label: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue(_ value: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint(_ hint: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// - Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   `accessibilityLabel()` modifier.
    ///
    /// - Parameter inputLabels: An array of Text elements to use as input labels.
    public func accessibilityInputLabels(_ inputLabels: [Text]) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Adds the given traits to the view.
    public func accessibilityAddTraits(_ traits: AccessibilityTraits) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Removes the given traits from this view.
    public func accessibilityRemoveTraits(_ traits: AccessibilityTraits) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Uses the specified string to identify the view.
    ///
    /// Use this value for testing. It isn't visible to the user.
    public func accessibilityIdentifier(_ identifier: String) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Sets the sort priority order for this view's accessibility element,
    /// relative to other elements at the same level.
    ///
    /// Higher numbers are sorted first. The default sort priority is zero.
    public func accessibilitySortPriority(_ sortPriority: Double) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Specifies the point where activations occur in the view.
    public func accessibilityActivationPoint(_ activationPoint: CGPoint) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Specifies the unit point where activations occur in the view.
    public func accessibilityActivationPoint(_ activationPoint: UnitPoint) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel(_ labelKey: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel<S>(_ label: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol { }

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue(_ valueKey: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue<S>(_ value: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol { }

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint(_ hintKey: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint<S>(_ hint: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol { }

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// - Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   `accessibilityLabel()` modifier.
    public func accessibilityInputLabels(_ inputLabelKeys: [LocalizedStringKey]) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// - Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   `accessibilityLabel()` modifier.
    public func accessibilityInputLabels<S>(_ inputLabels: [S]) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Links multiple accessibility elements so that the user can quickly
    /// navigate from one element to another, even when the elements are not near
    /// each other in the accessibility hierarchy.
    ///
    /// This can be useful to allow quickly jumping between content in a list and
    /// the same content shown in a detail view, for example. All elements marked
    /// with `accessibilityLinkedGroup` with the same namespace and identifier will be
    /// linked together.
    ///
    /// - Parameters:
    ///   - id: A hashable identifier used to separate sets of linked elements
    ///     within the same namespace. Elements with matching ``namespace`` and `id`
    ///     will be linked together.
    ///   - namespace: The namespace to use to organize linked accessibility
    ///     elements. All elements marked with `accessibilityLink` in this
    ///     namespace and with the specified `id` will be linked together.
    public func accessibilityLinkedGroup<ID>(id: ID, in namespace: Namespace.ID) -> some View where ID : Hashable { }


    /// Pairs two views, where one is the content and one is the label, for accessibility purposes.
    ///
    /// Use `accessibilityLabeledPair` with a role of `AccessibilityLabeledPairRole.label`
    /// to identify the label, and a role of `AccessibilityLabeledPairRole.content`
    /// to identify the content.
    /// This improves the behavior of accessibility features such as VoiceOver
    /// when navigating such elements, allowing users to better understand the
    /// relationship between them.
    ///
    /// - Parameters:
    ///   - role: Determines whether this element should be used as the label
    ///     in the pair, or the content in the pair.
    ///   - id: The identifier for the label / content pair. Elements with
    ///     matching identifiers within the same namespace will be paired
    ///     together.
    ///   - namespace: The namespace used to organize label and content. Label
    ///     and content under the same namespace with matching identifiers will
    ///     be paired together.
    public func accessibilityLabeledPair<ID>(role: AccessibilityLabeledPairRole, id: ID, in namespace: Namespace.ID) -> some View where ID : Hashable { }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an accessibility scroll action to the view.
    public func accessibilityScrollAction(_ handler: @escaping (Edge) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }
}
