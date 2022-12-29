/// A value with a modifier applied to it.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ModifiedContent<Content, Modifier> {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never

    /// The content that the modifier transforms into a new view or new
    /// view modifier.
    public var content: Content

    /// The view modifier.
    public var modifier: Modifier

    /// A structure that the defines the content and modifier needed to produce
    /// a new view or view modifier.
    ///
    /// If `content` is a `View` and `modifier` is a ``ViewModifier``, the
    /// result is a ``View``. If `content` and `modifier` are both view
    /// modifiers, then the result is a new ``ViewModifier`` combining them.
    ///
    /// - Parameters:
    ///     - content: The content that the modifier changes.
    ///     - modifier: The modifier to apply to the content.
    @inlinable public init(content: Content, modifier: Modifier) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Allow an assistive technology to programmatically invoke the actions of the modified view.
    public func accessibilityAction(_ actionKind: AccessibilityActionKind = .default, _ handler: @escaping () -> Void) -> ModifiedContent<Content, Modifier> { }

    /// Allow an assistive technology to programmatically invoke the actions of the modified view and all subviews.
    public func accessibilityAction(named name: Text, _ handler: @escaping () -> Void) -> ModifiedContent<Content, Modifier> { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Allow an assistive technology to programmatically invoke the actions of the modified view and all subviews.
    public func accessibilityAction(named nameKey: LocalizedStringKey, _ handler: @escaping () -> Void) -> ModifiedContent<Content, Modifier> { }

    /// Allow an assistive technology to programmatically invoke the actions of the modified view and all subviews.
    public func accessibilityAction<S>(named name: S, _ handler: @escaping () -> Void) -> ModifiedContent<Content, Modifier> where S : StringProtocol { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : View where Content : View, Modifier : ViewModifier {

    /// The content and behavior of the view.
    public var body: ModifiedContent<Content, Modifier>.Body { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : ViewModifier where Content : ViewModifier, Modifier : ViewModifier { }

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : DynamicViewContent where Content : DynamicViewContent, Modifier : ViewModifier {

    /// The collection of underlying data.
    public var data: Content.Data { get }

    /// The type of the underlying collection of data.
    public typealias Data = Content.Data
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ModifiedContent : Scene where Content : Scene, Modifier : _SceneModifier {

    /// The content and behavior of the scene.
    ///
    /// For any scene that you create, provide a computed `body` property that
    /// defines the scene as a composition of other scenes. You can assemble a
    /// scene from primitive scenes that SwiftUI provides, as well as other
    /// scenes that you've defined.
    ///
    /// Swift infers the scene's ``Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    public var body: ModifiedContent<Content, Modifier>.Body { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Add additional accessibility information to the view.
    ///
    /// Use this method to add information you want accessibility users to be
    /// able to access about this element, beyond the basics of label, value,
    /// and hint. For example, `accessibilityCustomContent` can be used to add
    /// information about the orientation of a photograph, or the number of
    /// people found in the picture.
    ///
    /// - Parameter key: Key used to specify the identifier and label of the
    ///   of the additional accessibility information entry.
    /// - Parameter value: Text value for the additional accessibility
    ///   information. For example: "landscape." A value of `nil` will remove
    ///   any entry of additional information added earlier for any `key` with
    ///   the same identifier.
    /// - Note: Repeated calls of `accessibilityCustomContent` with `key`s
    ///   having different identifiers will create new entries of
    ///   additional information.
    ///   Calling `accessibilityAdditionalContent` repeatedly with `key`s
    ///   having matching identifiers will replace the previous entry.
    public func accessibilityCustomContent(_ key: AccessibilityCustomContentKey, _ value: Text?, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Content, Modifier> { }

    /// Add additional accessibility information to the view.
    ///
    /// Use this method to add information you want accessibility users to be
    /// able to access about this element, beyond the basics of label, value,
    /// and hint. For example, `accessibilityCustomContent` can be used to add
    /// information about the orientation of a photograph, or the number of
    /// people found in the picture.
    ///
    /// - Parameter key: Key used to specify the identifier and label of the
    ///   of the additional accessibility information entry.
    /// - Parameter valueKey: Text value for the additional accessibility
    ///   information. For example: "landscape." A value of `nil` will remove
    ///   any entry of additional information added earlier for any `key` with
    ///   the same identifier.
    /// - Parameter importance: Importance of the accessibility information.
    ///   High-importance information gets read out immediately, while
    ///   default-importance information must be explicitly asked for by the
    ///   user.
    /// - Note: Repeated calls of `accessibilityCustomContent` with `key`s
    ///   having different identifiers will create new entries of
    ///   additional information.
    ///   Calling `accessibilityAdditionalContent` repeatedly with `key`s
    ///   having matching identifiers will replace the previous entry.
    public func accessibilityCustomContent(_ key: AccessibilityCustomContentKey, _ valueKey: LocalizedStringKey, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Content, Modifier> { }

    /// Add additional accessibility information to the view.
    ///
    /// Use this method to add information you want accessibility users to be
    /// able to access about this element, beyond the basics of label, value,
    /// and hint. For example, `accessibilityCustomContent` can be used to add
    /// information about the orientation of a photograph, or the number of
    /// people found in the picture.
    ///
    /// - Parameter key: Key used to specify the identifier and label of the
    ///   of the additional accessibility information entry.
    /// - Parameter value: Text value for the additional accessibility
    ///   information. For example: "landscape." A value of `nil` will remove
    ///   any entry of additional information added earlier for any `key` with
    ///   the same identifier.
    /// - Parameter importance: Importance of the accessibility information.
    ///   High-importance information gets read out immediately, while
    ///   default-importance information must be explicitly asked for by the
    ///   user.
    /// - Note: Repeated calls of `accessibilityCustomContent` with `key`s
    ///   having different identifiers will create new entries of
    ///   additional information.
    ///   Calling `accessibilityAdditionalContent` repeatedly with `key`s
    ///   having matching identifiers will replace the previous entry.
    public func accessibilityCustomContent<V>(_ key: AccessibilityCustomContentKey, _ value: V, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Content, Modifier> where V : StringProtocol { }

    /// Add additional accessibility information to the view.
    ///
    /// Use this method to add information you want accessibility users to be
    /// able to access about this element, beyond the basics of label, value,
    /// and hint. For example: `accessibilityCustomContent` can be used to add
    /// information about the orientation of a photograph, or the number of
    /// people found in the picture.
    ///
    /// - Parameter label: Localized text describing to the user what
    ///   is contained in this additional information entry. For example:
    ///   "orientation".
    /// - Parameter value: Text value for the additional accessibility
    ///   information. For example: "landscape."
    /// - Parameter importance: Importance of the accessibility information.
    ///   High-importance information gets read out immediately, while
    ///   default-importance information must be explicitly asked for by the
    ///   user.
    /// - Note: Repeated calls of `accessibilityCustomContent` with different
    ///   labels will create new entries of additional information. Calling
    ///   `accessibilityAdditionalContent` repeatedly with the same label will
    ///   instead replace the previous value and importance.
    public func accessibilityCustomContent(_ label: Text, _ value: Text, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Content, Modifier> { }

    /// Add additional accessibility information to the view.
    ///
    /// Use this method to add information you want accessibility users to be
    /// able to access about this element, beyond the basics of label, value,
    /// and hint. For example: `accessibilityCustomContent` can be used to add
    /// information about the orientation of a photograph, or the number of
    /// people found in the picture.
    ///
    /// - Parameter label: Localized text describing to the user what
    ///   is contained in this additional information entry. For example:
    ///   "orientation".
    /// - Parameter value: Text value for the additional accessibility
    ///   information. For example: "landscape."
    /// - Parameter importance: Importance of the accessibility information.
    ///   High-importance information gets read out immediately, while
    ///   default-importance information must be explicitly asked for by the
    ///   user.
    /// - Note: Repeated calls of `accessibilityCustomContent` with different
    ///   labels will create new entries of additional information. Calling
    ///   `accessibilityAdditionalContent` repeatedly with the same label will
    ///   instead replace the previous value and importance.
    public func accessibilityCustomContent(_ labelKey: LocalizedStringKey, _ value: Text, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Content, Modifier> { }

    /// Add additional accessibility information to the view.
    ///
    /// Use this method to add information you want accessibility users to be
    /// able to access about this element, beyond the basics of label, value,
    /// and hint. For example, `accessibilityCustomContent` can be used to add
    /// information about the orientation of a photograph, or the number of
    /// people found in the picture.
    ///
    /// - Parameter labelKey: Localized text describing to the user what
    ///   is contained in this additional information entry. For example:
    ///   "orientation".
    /// - Parameter value: Text value for the additional accessibility
    ///   information. For example: "landscape."
    /// - Parameter importance: Importance of the accessibility information.
    ///   High-importance information gets read out immediately, while
    ///   default-importance information must be explicitly asked for by the
    ///   user.
    /// - Note: Repeated calls of `accessibilityCustomContent` with different
    ///   labels will create new entries of additional information. Calling
    ///   `accessibilityAdditionalContent` repeatedly with the same label will
    ///   instead replace the previous value and importance.
    public func accessibilityCustomContent(_ labelKey: LocalizedStringKey, _ valueKey: LocalizedStringKey, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Content, Modifier> { }

    /// Add additional accessibility information to the view.
    ///
    /// Use this method to add information you want accessibility users to be
    /// able to access about this element, beyond the basics of label, value,
    /// and hint. For example, `accessibilityCustomContent` can be used to add
    /// information about the orientation of a photograph, or the number of
    /// people found in the picture.
    ///
    /// - Parameter labelKey: Localized text describing to the user what
    ///   is contained in this additional information entry. For example:
    ///   "orientation".
    /// - Parameter value: Text value for the additional accessibility
    ///   information. For example: "landscape."
    /// - Parameter importance: Importance of the accessibility information.
    ///   High-importance information gets read out immediately, while
    ///   default-importance information must be explicitly asked for by the
    ///   user.
    /// - Note: Repeated calls of `accessibilityCustomContent` with different
    ///   labels will create new entries of additional information. Calling
    ///   `accessibilityAdditionalContent` repeatedly with the same label will
    ///   instead replace the previous value and importance.
    public func accessibilityCustomContent<V>(_ labelKey: LocalizedStringKey, _ value: V, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Content, Modifier> where V : StringProtocol { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Explicitly set whether this Accessibility element responds to user
    /// interaction and would thus be interacted with by technologies such as
    /// Switch Control, Voice Control or Full Keyboard Access.
    ///
    /// If this is not set, the value is inferred from the traits of the
    /// Accessibility element, the presence of Accessibility actions on the
    /// element, or the presence of gestures on the element or containing views.
    public func accessibilityRespondsToUserInteraction(_ respondsToUserInteraction: Bool = true) -> ModifiedContent<Content, Modifier> { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Sets an accessibility text content type.
    ///
    /// Use this modifier to set the content type of this accessibility
    /// element. Assistive technologies can use this property to choose
    /// an appropriate way to output the text. For example, when
    /// encountering a source coding context, VoiceOver could
    /// choose to speak all punctuation.
    ///
    /// The default content type ``AccessibilityTextContentType/plain``.
    ///
    /// - Parameter value: The accessibility content type from the available
    /// ``AccessibilityTextContentType`` options.
    public func accessibilityTextContentType(_ textContentType: AccessibilityTextContentType) -> ModifiedContent<Content, Modifier> { }

    /// Set the level of this heading.
    ///
    /// Use this modifier to set the level of this heading in relation to other headings. The system speaks
    ///  the level number of levels ``AccessibilityHeadingLevel/h1``
    ///  through ``AccessibilityHeadingLevel/h6`` alongside the text.
    ///
    /// The default heading level if you don’t use this modifier
    /// is ``AccessibilityHeadingLevel/unspecified``.
    ///
    /// - Parameter level: The heading level to associate with this element
    ///   from the available ``AccessibilityHeadingLevel`` levels.
    public func accessibilityHeading(_ level: AccessibilityHeadingLevel) -> ModifiedContent<Content, Modifier> { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Specifies whether to hide this view from system accessibility features.
    public func accessibilityHidden(_ hidden: Bool) -> ModifiedContent<Content, Modifier> { }

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel(_ label: Text) -> ModifiedContent<Content, Modifier> { }

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue(_ value: Text) -> ModifiedContent<Content, Modifier> { }

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint(_ hint: Text) -> ModifiedContent<Content, Modifier> { }

    /// Sets alternate input labels with which users identify a view.
    ///
    /// If you don't specify any input labels, the user can still refer to the view using the accessibility
    /// label that you add with the accessibilityLabel() modifier. Provide labels in descending order
    /// of importance. Voice Control and Full Keyboard Access use the input labels.
    public func accessibilityInputLabels(_ inputLabels: [Text]) -> ModifiedContent<Content, Modifier> { }

    /// Adds the given traits to the view.
    public func accessibilityAddTraits(_ traits: AccessibilityTraits) -> ModifiedContent<Content, Modifier> { }

    /// Removes the given traits from this view.
    public func accessibilityRemoveTraits(_ traits: AccessibilityTraits) -> ModifiedContent<Content, Modifier> { }

    /// Uses the specified string to identify the view.
    ///
    /// Use this value for testing. It isn't visible to the user.
    public func accessibilityIdentifier(_ identifier: String) -> ModifiedContent<Content, Modifier> { }

    /// Sets the sort priority order for this view's accessibility
    /// element, relative to other elements at the same level.
    ///
    /// Higher numbers are sorted first. The default sort priority is zero.
    public func accessibilitySortPriority(_ sortPriority: Double) -> ModifiedContent<Content, Modifier> { }

    /// Specifies the point where activations occur in the view.
    public func accessibilityActivationPoint(_ activationPoint: CGPoint) -> ModifiedContent<Content, Modifier> { }

    /// Specifies the unit point where activations occur in the view.
    public func accessibilityActivationPoint(_ activationPoint: UnitPoint) -> ModifiedContent<Content, Modifier> { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel(_ labelKey: LocalizedStringKey) -> ModifiedContent<Content, Modifier> { }

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel<S>(_ label: S) -> ModifiedContent<Content, Modifier> where S : StringProtocol { }

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue(_ valueKey: LocalizedStringKey) -> ModifiedContent<Content, Modifier> { }

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue<S>(_ value: S) -> ModifiedContent<Content, Modifier> where S : StringProtocol { }

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint(_ hintKey: LocalizedStringKey) -> ModifiedContent<Content, Modifier> { }

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint<S>(_ hint: S) -> ModifiedContent<Content, Modifier> where S : StringProtocol { }

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// - Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   `accessibilityLabel()` modifier.
    public func accessibilityInputLabels(_ inputLabelKeys: [LocalizedStringKey]) -> ModifiedContent<Content, Modifier> { }

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// - Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   `accessibilityLabel()` modifier.
    public func accessibilityInputLabels<S>(_ inputLabels: [S]) -> ModifiedContent<Content, Modifier> where S : StringProtocol { }
}

extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Specifies whether to hide this view from system accessibility features.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    public func accessibility(hidden: Bool) -> ModifiedContent<Content, Modifier> { }

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    public func accessibility(label: Text) -> ModifiedContent<Content, Modifier> { }

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibility(label:),
    /// you can provide the current volume setting, like "60%", using accessibility(value:).
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    public func accessibility(value: Text) -> ModifiedContent<Content, Modifier> { }

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    public func accessibility(hint: Text) -> ModifiedContent<Content, Modifier> { }

    /// Sets alternate input labels with which users identify a view.
    ///
    /// If you don't specify any input labels, the user can still refer to the view using the accessibility
    /// label that you add with the accessibilityLabel() modifier. Provide labels in descending order
    /// of importance. Voice Control and Full Keyboard Access use the input labels.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    public func accessibility(inputLabels: [Text]) -> ModifiedContent<Content, Modifier> { }

    /// Adds the given traits to the view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    public func accessibility(addTraits traits: AccessibilityTraits) -> ModifiedContent<Content, Modifier> { }

    /// Removes the given traits from this view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    public func accessibility(removeTraits traits: AccessibilityTraits) -> ModifiedContent<Content, Modifier> { }

    /// Uses the specified string to identify the view.
    ///
    /// Use this value for testing. It isn't visible to the user.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    public func accessibility(identifier: String) -> ModifiedContent<Content, Modifier> { }

    @available(iOS, deprecated, introduced: 13.0)
    @available(macOS, deprecated, introduced: 10.15)
    @available(tvOS, deprecated, introduced: 13.0)
    @available(watchOS, deprecated, introduced: 6)
    public func accessibility(selectionIdentifier: AnyHashable) -> ModifiedContent<Content, Modifier> { }

    /// Sets the sort priority order for this view's accessibility
    /// element, relative to other elements at the same level.
    ///
    /// Higher numbers are sorted first. The default sort priority is zero.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    public func accessibility(sortPriority: Double) -> ModifiedContent<Content, Modifier> { }

    /// Specifies the point where activations occur in the view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    public func accessibility(activationPoint: CGPoint) -> ModifiedContent<Content, Modifier> { }

    /// Specifies the unit point where activations occur in the view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    public func accessibility(activationPoint: UnitPoint) -> ModifiedContent<Content, Modifier> { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Adds an accessibility scroll action to the view.
    public func accessibilityScrollAction(_ handler: @escaping (Edge) -> Void) -> ModifiedContent<Content, Modifier> { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Adds an accessibility adjustable action to the view.
    public func accessibilityAdjustableAction(_ handler: @escaping (AccessibilityAdjustmentDirection) -> Void) -> ModifiedContent<Content, Modifier> { }
}

