@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Create an Accessibility Rotor with the specified user-visible label,
    /// and entries generated from the content closure.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to specifically the messages originating from
    /// VIPs.
    ///
    ///     // `messages` is a list of `Identifiable` `Message`s.
    ///
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messages) { message in
    ///                 MessageView(message)
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor("VIPs") {
    ///         // Not all the MessageViews are generated at once, the model knows
    ///         // about all the messages.
    ///         ForEach(messages) { message in
    ///             // If the Message is from a VIP, make a Rotor entry for it.
    ///             if message.isVIP {
    ///                 AccessibilityRotorEntry(message.subject, id: message.id)
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - entries: Content used to generate Rotor entries. This can
    ///     include AccessibilityRotorEntry structs, as well as constructs such
    ///     as if and ForEach.
    public func accessibilityRotor<Content>(_ label: Text, @AccessibilityRotorContentBuilder entries: @escaping () -> Content) -> some View where Content : AccessibilityRotorContent { }


    /// Create an Accessibility Rotor replacing the specified system-provided
    /// Rotor.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    /// Replacing system Rotors this way is useful when the System Rotor
    /// does not automatically pick up elements that aren't on-screen,
    /// such as elements far down in a `LazyVStack` or `List`.
    ///
    /// In the following example, a Message application adds a Rotor allowing
    /// the user to navigate through all the ranges of text containing
    /// headings.
    ///
    ///     extension Message {
    ///         // Ranges of special areas in the `content` text. Calculated
    ///         // when `content` is set and then cached so that we don't have
    ///         // to re-compute them.
    ///         var contentHeadingRanges: [Range<String.Index>]
    ///     }
    ///
    ///     struct MessageContentView: View {
    ///         TextEditor(.constant(message.content))
    ///             .accessibilityRotor(.heading) {
    ///                 ForEach(range in message.contentHeadingRanges) {
    ///                     AccessibilityRotorEntry(textRange: range)
    ///                 }
    ///             }
    ///     }
    ///
    /// - Parameters:
    ///   - systemRotor: The system-provided Rotor that will be overridden
    ///     by this custom Rotor.
    ///   - entries: Content used to generate Rotor entries. This can
    ///     include AccessibilityRotorEntry structs, as well as constructs such
    ///     as if and ForEach.
    public func accessibilityRotor<Content>(_ systemRotor: AccessibilitySystemRotor, @AccessibilityRotorContentBuilder entries: @escaping () -> Content) -> some View where Content : AccessibilityRotorContent { }


    /// Create an Accessibility Rotor with the specified user-visible label
    /// and entries.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// Using this modifier requires
    /// that the Rotor be attached to a `ScrollView`, or an Accessibility
    /// Element directly within a `ScrollView`, such as a `ForEach`.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to specifically the messages originating from
    /// VIPs.
    ///
    ///     // `messages` is a list of `Identifiable` `Message`s that have a
    ///     // `subject`.
    ///     // `vipMessages` is a filtered version of that list containing only
    ///     // messages from VIPs.
    ///
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messages) { message in
    ///                 MessageView(message)
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor("VIPs", entries: vipMessages, label: \.subject)
    ///
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of identifiable values that will be
    ///     used to generate the entries of the Rotor. The identifiers
    ///     of the `Identifiable` values must match up with identifiers in a
    ///     `ForEach` or explicit `id` calls within the `ScrollView`.
    ///     When the user navigates to entries from this Rotor, SwiftUI will
    ///     automatically scroll them into place as needed.
    ///   - entryLabel: Key path on the `Identifiable` type that can be
    ///     used to get a user-visible label for every Rotor entry. This is used
    ///     on macOS when the user opens the list of entries for the Rotor.
    public func accessibilityRotor<EntryModel>(_ rotorLabel: Text, entries: [EntryModel], entryLabel: KeyPath<EntryModel, String>) -> some View where EntryModel : Identifiable { }


    /// Create an Accessibility Rotor with the specified user-visible label
    /// and entries.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// Using this modifier requires
    /// that the Rotor be attached to a `ScrollView`, or an Accessibility
    /// Element directly within a `ScrollView`, such as a `ForEach`.
    /// When the user navigates to entries from this Rotor, SwiftUI will
    /// automatically scroll them into place as needed.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to specifically the messages originating from
    /// VIPs.
    ///
    ///     // `messages` is a list of `Message`s that have a `subject` and a
    ///     // `uuid`. `vipMessages` is a filtered version of that list
    ///     // containing only messages from VIPs.
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messages) { message in
    ///                 MessageView(message)
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor("VIPs", entries: vipMessages,
    ///         id: \.uuid, label: \.subject)
    ///
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of values that will be used to generate
    ///     the entries of the Rotor.
    ///   - entryID: Key path on the entry type that can be used
    ///     to generate an identifier for the Entry. The identifiers
    ///     must match up with identifiers in `ForEach` or explicit `id` calls
    ///     within the `ScrollView`.
    ///   - entryLabel: Key path on the entry type that can be
    ///     used to get a user-visible label for every Rotor entry. This is used
    ///     on macOS when the user opens the list of entries for the Rotor.
    public func accessibilityRotor<EntryModel, ID>(_ rotorLabel: Text, entries: [EntryModel], entryID: KeyPath<EntryModel, ID>, entryLabel: KeyPath<EntryModel, String>) -> some View where ID : Hashable { }


    /// Create an Accessibility Rotor replacing the specified system-provided
    /// Rotor.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// Using this modifier requires
    /// that the Rotor be attached to a `ScrollView`, or an Accessibility
    /// Element directly within a `ScrollView`, such as a `ForEach`.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to the headings in its vertical stack of
    /// messages.
    ///
    ///     // `messageListItems` is a list of `Identifiable` `MessageListItem`s
    ///     // that are either a `Message` or a heading, containing a `subject`.
    ///     // `headingMessageListItems` is a filtered list of
    ///     // `messageListItems` containing just the headings.
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messageListItems) { messageListItem in
    ///                 switch messageListItem {
    ///                     case .heading(let subject):
    ///                         Text(subject)
    ///                     case .message(let message):
    ///                         MessageView(message)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor(
    ///         .heading, entries: headingMessageListItems, label: \.subject)
    ///
    /// - Parameters:
    ///   - systemRotor: The system-provided Rotor that will be overridden
    ///     by this custom Rotor.
    ///   - entries: An array of identifiable values that will be
    ///     used to generate the entries of the Rotor. The identifiers
    ///     of the `Identifiable` values must match up with identifiers in a
    ///     `ForEach` or explicit `id` calls within the `ScrollView`.
    ///     When the user navigates to entries from this Rotor, SwiftUI will
    ///     automatically scroll them into place as needed.
    ///   - entryLabel: Key path on the `Identifiable` type that can be
    ///     used to get a user-visible label for every Rotor entry. This is used
    ///     on macOS when the user opens the list of entries for the Rotor.
    public func accessibilityRotor<EntryModel>(_ systemRotor: AccessibilitySystemRotor, entries: [EntryModel], entryLabel: KeyPath<EntryModel, String>) -> some View where EntryModel : Identifiable { }


    /// Create an Accessibility Rotor replacing the specified system-provided
    /// Rotor.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// Using this modifier requires
    /// that the Rotor be attached to a `ScrollView`, or an Accessibility
    /// Element directly within a `ScrollView`, such as a `ForEach`.
    /// When the user navigates to entries from this Rotor, SwiftUI will
    /// automatically scroll them into place as needed.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to the headings in its vertical stack of
    /// messages.
    ///
    ///     // `messageListItems` is a list of `MessageListItem`s
    ///     // that are either a `Message` or a heading, containing a `subject`
    ///     // and a `uuid`.
    ///     // `headingMessageListItems` is a filtered list of
    ///     // `messageListItems` containing just the headings.
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messageListItems) { messageListItem in
    ///                 switch messageListItem {
    ///                     case .heading(let subject):
    ///                         Text(subject)
    ///                     case .message(let message):
    ///                         MessageView(message)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor(
    ///         .heading, entries: headingMessageListItems,
    ///         entryID: \.uuid, label: \.subject
    ///     )
    ///
    /// - Parameters:
    ///   - systemRotor: The system-provided Rotor that will be overridden
    ///     by this custom Rotor.
    ///   - entries: An array of values that will be used to generate
    ///     the entries of the Rotor.
    ///   - entryID: Key path on the entry type that can be used
    ///     to generate an identifier for the Entry. The identifiers
    ///     must match up with identifiers in `ForEach` or explicit `id` calls
    ///     within the `ScrollView`.
    ///   - entryLabel: Key path on the entry type that can be
    ///     used to get a user-visible label for every Rotor entry. This is used
    ///     on macOS when the user opens the list of entries for the Rotor.
    public func accessibilityRotor<EntryModel, ID>(_ systemRotor: AccessibilitySystemRotor, entries: [EntryModel], entryID: KeyPath<EntryModel, ID>, entryLabel: KeyPath<EntryModel, String>) -> some View where ID : Hashable { }


    /// Create an Accessibility Rotor with the specified user-visible label
    /// and entries for each of the specified ranges. The Rotor will be attached
    /// to the current Accessibility element, and each entry will go the
    /// specified range of that element.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// In the following example, a Message application adds a Rotor allowing
    /// the user to navigate through all the ranges of text containing
    /// email addresses.
    ///
    ///     extension Message {
    ///         // Ranges of special areas in the `content` text. Calculated
    ///         // when `content` is set and then cached so that we don't have
    ///         // to re-compute them.
    ///         var emailAddressRanges: [Range<String.Index>]
    ///     }
    ///
    ///     struct MessageContentView: View {
    ///         TextEditor(.constant(message.content))
    ///             .accessibilityRotor("Email Addresses",
    ///                 textRanges: message.emailAddressRanges)
    ///     }
    ///
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - textRanges: An array of ranges that will be used to generate
    ///     the entries of the Rotor.
    public func accessibilityRotor(_ label: Text, textRanges: [Range<String.Index>]) -> some View { }


    /// Create an Accessibility Rotor replacing the specified system-provided
    /// Rotor. The Rotor will be attached to the current Accessibility element,
    /// and each entry will go the specified range of that element.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// In the following example, a Message application adds a Rotor allowing
    /// the user to navigate through all the ranges of text containing headings.
    ///
    ///     extension Message {
    ///         // Ranges of special areas in the `content` text. Calculated when
    ///         // `content` is set and then cached so that we don't have to
    ///         // re-compute them.
    ///         var headingRanges: [Range<String.Index>]
    ///     }
    ///
    ///     struct MessageContentView: View {
    ///         TextEditor(.constant(message.content))
    ///             .accessibilityRotor(
    ///                 .heading,
    ///                 textRanges: message.headingRanges
    ///             )
    ///     }
    ///
    /// - Parameters:
    ///   - systemRotor: The system-provided Rotor that will be overridden
    ///     by this custom Rotor.
    ///   - textRanges: An array of ranges that will be used to generate
    ///     the entries of the Rotor.
    public func accessibilityRotor(_ systemRotor: AccessibilitySystemRotor, textRanges: [Range<String.Index>]) -> some View { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Create an Accessibility Rotor with the specified user-visible label,
    /// and entries generated from the content closure.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to specifically the messages originating from
    /// VIPs.
    ///
    ///     // `messages` is a list of `Identifiable` `Message`s.
    ///
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messages) { message in
    ///                 MessageView(message)
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor("VIPs") {
    ///         // Not all the MessageViews are generated at once, the model
    ///         // knows about all the messages.
    ///         ForEach(messages) { message in
    ///             // If the Message is from a VIP, make a Rotor entry for it.
    ///             if message.isVIP {
    ///                 AccessibilityRotorEntry(message.subject, id: message.id)
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - labelKey: Localized label identifying this Rotor to the user.
    ///   - entries: Content used to generate Rotor entries. This can
    ///     include AccessibilityRotorEntry structs, as well as constructs such
    ///     as if and ForEach.
    public func accessibilityRotor<Content>(_ labelKey: LocalizedStringKey, @AccessibilityRotorContentBuilder entries: @escaping () -> Content) -> some View where Content : AccessibilityRotorContent { }


    /// Create an Accessibility Rotor with the specified user-visible label,
    /// and entries generated from the content closure.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to specifically the messages originating from
    /// VIPs.
    ///
    ///     // `messages` is a list of `Identifiable` `Message`s.
    ///
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messages) { message in
    ///                 MessageView(message)
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor("VIPs") {
    ///         // Not all the MessageViews are generated at once, the model
    ///         // knows about all the messages.
    ///         ForEach(messages) { message in
    ///             // If the Message is from a VIP, make a Rotor entry for it.
    ///             if message.isVIP {
    ///                 AccessibilityRotorEntry(message.subject, id: message.id)
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - entries: Content used to generate Rotor entries. This can
    ///     include AccessibilityRotorEntry structs, as well as constructs such
    ///     as if and ForEach.
    public func accessibilityRotor<L, Content>(_ label: L, @AccessibilityRotorContentBuilder entries: @escaping () -> Content) -> some View where L : StringProtocol, Content : AccessibilityRotorContent { }


    /// Create an Accessibility Rotor with the specified user-visible label
    /// and entries.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// Using this modifier requires
    /// that the Rotor be attached to a `ScrollView`, or an Accessibility
    /// Element directly within a `ScrollView`, such as a `ForEach`.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to specifically the messages originating from
    /// VIPs.
    ///
    ///     // `messages` is a list of `Identifiable` `Message`s that have a
    ///     // `subject`.
    ///     // `vipMessages` is a filtered version of that list containing only
    ///     // messages from VIPs.
    ///
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messages) { message in
    ///                 MessageView(message)
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor("VIPs", entries: vipMessages,
    ///         entryLabel: \.subject)
    ///
    /// - Parameters:
    ///   - rotorLabelKey: Localized label identifying this Rotor to the user.
    ///   - entries: An array of identifiable values that will be
    ///     used to generate the entries of the Rotor. The identifiers
    ///     of the `Identifiable` values must match up with identifiers in a
    ///     `ForEach` or explicit `id` calls within the `ScrollView`.
    ///     When the user navigates to entries from this Rotor, SwiftUI will
    ///     automatically scroll them into place as needed.
    ///   - entryLabel: Key path on the `Identifiable` type that can be
    ///     used to get a user-visible label for every Rotor entry. This is used
    ///     on macOS when the user opens the list of entries for the Rotor.
    public func accessibilityRotor<EntryModel>(_ rotorLabelKey: LocalizedStringKey, entries: [EntryModel], entryLabel: KeyPath<EntryModel, String>) -> some View where EntryModel : Identifiable { }


    /// Create an Accessibility Rotor with the specified user-visible label
    /// and entries.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// Using this modifier requires
    /// that the Rotor be attached to a `ScrollView`, or an Accessibility
    /// Element directly within a `ScrollView`, such as a `ForEach`.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to specifically the messages originating from
    /// VIPs.
    ///
    ///     // `messages` is a list of `Identifiable` `Message`s that have a
    ///     // `subject`.
    ///     // `vipMesages` is a filtered version of that list containing only
    ///     // messages from VIPs.
    ///
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messages) { message in
    ///                 MessageView(message)
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor("VIPs", entries: vipMessages, label: \.subject)
    ///
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of identifiable values that will be
    ///     used to generate the entries of the Rotor. The identifiers
    ///     of the `Identifiable` values must match up with identifiers in a
    ///     `ForEach` or explicit `id` calls within the `ScrollView`.
    ///     When the user navigates to entries from this Rotor, SwiftUI will
    ///     automatically scroll them into place as needed.
    ///   - entry: Key path on the `Identifiable` type that can be
    ///     used to get a user-visible label for every Rotor entry. This is used
    ///     on macOS when the user opens the list of entries for the Rotor.
    public func accessibilityRotor<L, EntryModel>(_ rotorLabel: L, entries: [EntryModel], entryLabel: KeyPath<EntryModel, String>) -> some View where L : StringProtocol, EntryModel : Identifiable { }


    /// Create an Accessibility Rotor with the specified user-visible label
    /// and entries.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// Using this modifier requires that the Rotor be attached to a
    /// `ScrollView`, or an Accessibility Element directly within a
    /// `ScrollView`, such as a `ForEach`. When the user navigates to entries
    /// from this Rotor, SwiftUI will automatically scroll them into place as
    /// needed.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to specifically the messages originating from
    /// VIPs.
    ///
    ///     // `messages` is a list of `Message`s that have a `subject` and a
    ///     // `uuid`. `vipMesages` is a filtered version of that list
    ///     // containing only messages from VIPs.
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messages) { message in
    ///                 MessageView(message)
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor("VIPs", entries: vipMessages,
    ///         entryID: \.uuid, entryLabel: \.subject)
    ///
    /// - Parameters:
    ///   - labelKey: Localized label identifying this Rotor to the user.
    ///   - entries: An array of values that will be used to generate
    ///     the entries of the Rotor.
    ///   - entryID: Key path on the entry type that can be used
    ///     to generate an identifier for the Entry. The identifiers
    ///     must match up with identifiers in `ForEach` or explicit `id` calls
    ///     within the `ScrollView`.
    ///   - entryLabel: Key path on the entry type that can be
    ///     used to get a user-visible label for every Rotor entry. This is used
    ///     on macOS when the user opens the list of entries for the Rotor.
    public func accessibilityRotor<EntryModel, ID>(_ rotorLabelKey: LocalizedStringKey, entries: [EntryModel], entryID: KeyPath<EntryModel, ID>, entryLabel: KeyPath<EntryModel, String>) -> some View where ID : Hashable { }


    /// Create an Accessibility Rotor with the specified user-visible label
    /// and entries.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// Using this modifier requires
    /// that the Rotor be attached to a `ScrollView`, or an Accessibility
    /// Element directly within a `ScrollView`, such as a `ForEach`.
    /// When the user navigates to entries from this Rotor, SwiftUI will
    /// automatically scroll them into place as needed.
    ///
    /// In the following example, a Message application creates a Rotor
    /// allowing users to navigate to specifically the messages originating from
    /// VIPs.
    ///     // `messages` is a list of `Message`s that have a `subject` and a
    ///     // `uuid`. `vipMessages` is a filtered version of that list
    ///     // containing only messages from VIPs.
    ///     ScrollView {
    ///         LazyVStack {
    ///             ForEach(messages) { message in
    ///                 MessageView(message)
    ///             }
    ///         }
    ///     }
    ///     .accessibilityElement(children: .contain)
    ///     .accessibilityRotor("VIPs", entries: vipMessages,
    ///         id: \.uuid, label: \.subject)
    ///
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of values that will be used to generate
    ///     the entries of the Rotor.
    ///   - entryID: Key path on the entry type that can be used
    ///     to generate an identifier for the Entry. The identifiers
    ///     must match up with identifiers in `ForEach` or explicit `id` calls
    ///     within the `ScrollView`.
    ///   - entryLabel: Key path on the entry type that can be
    ///     used to get a user-visible label for every Rotor entry. This is used
    ///     on macOS when the user opens the list of entries for the Rotor.
    public func accessibilityRotor<L, EntryModel, ID>(_ rotorLabel: L, entries: [EntryModel], entryID: KeyPath<EntryModel, ID>, entryLabel: KeyPath<EntryModel, String>) -> some View where L : StringProtocol, ID : Hashable { }


    /// Create an Accessibility Rotor with the specified user-visible label
    /// and entries for each of the specified ranges. The Rotor will be attached
    /// to the current Accessibility element, and each entry will go the
    /// specified range of that element.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// In the following example, a Message application adds a Rotor allowing
    /// the user to navigate through all the ranges of text containing
    /// email addresses.
    ///
    ///     extension Message {
    ///         // Ranges of special areas in the `content` text. Calculated
    ///         // when `content` is set and then cached so that we don't have
    ///         // to re-compute them.
    ///         var emailAddressRanges: [Range<String.Index>]
    ///     }
    ///
    ///     struct MessageContentView: View {
    ///         TextEditor(.constant(message.content))
    ///             .accessibilityRotor("Email Addresses",
    ///                 textRanges: message.emailAddressRanges)
    ///     }
    ///
    /// - Parameters:
    ///   - labelKey: Localized label identifying this Rotor to the user.
    ///   - textRanges: An array of ranges that will be used to generate
    ///     the entries of the Rotor.
    public func accessibilityRotor(_ labelKey: LocalizedStringKey, textRanges: [Range<String.Index>]) -> some View { }


    /// Create an Accessibility Rotor with the specified user-visible label
    /// and entries for each of the specified ranges. The Rotor will be attached
    /// to the current Accessibility element, and each entry will go the
    /// specified range of that element.
    ///
    /// An Accessibility Rotor is a shortcut for Accessibility users to
    /// quickly navigate to specific elements of the user interface,
    /// and optionally specific ranges of text within those elements.
    ///
    /// In the following example, a Message application adds a Rotor allowing
    /// the user to navigate through all the ranges of text containing
    /// email addresses.
    ///
    ///     extension Message {
    ///         // Ranges of special areas in the `content` text. Calculated
    ///         // when `content` is set and then cached so that we don't have
    ///         // to re-compute them.
    ///         var emailAddressRanges: [Range<String.Index>]
    ///     }
    ///
    ///     struct MessageContentView: View {
    ///         TextEditor(.constant(message.content))
    ///             .accessibilityRotor("Email Addresses",
    ///                 textRanges: message.emailAddressRanges)
    ///     }
    ///
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - textRanges: An array of ranges that will be used to generate
    ///     the entries of the Rotor.
    public func accessibilityRotor<L>(_ label: L, textRanges: [Range<String.Index>]) -> some View where L : StringProtocol { }

}

