@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

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
    public func accessibilityCustomContent(_ key: AccessibilityCustomContentKey, _ value: Text?, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

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
    public func accessibilityCustomContent(_ key: AccessibilityCustomContentKey, _ valueKey: LocalizedStringKey, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

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
    public func accessibilityCustomContent<V>(_ key: AccessibilityCustomContentKey, _ value: V, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where V : StringProtocol { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

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
    public func accessibilityCustomContent(_ label: Text, _ value: Text, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

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
    public func accessibilityCustomContent(_ labelKey: LocalizedStringKey, _ value: Text, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

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
    public func accessibilityCustomContent(_ labelKey: LocalizedStringKey, _ valueKey: LocalizedStringKey, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> { }

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
    public func accessibilityCustomContent<V>(_ labelKey: LocalizedStringKey, _ value: V, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where V : StringProtocol { }
}

