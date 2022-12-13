/// A struct representing an entry in an Accessibility Rotor.
///
/// An Accessibility Rotor is a shortcut for Accessibility users to
/// quickly navigate to specific elements of the user interface,
/// and optionally specific ranges of text within those elements.
///
/// An entry in a Rotor may contain a label to identify the entry to the user,
/// and identifier used to determine which Accessibility element the Rotor entry
/// should navigate to, as well as an optional range used for entries that
/// navigate to a specific position in the text of their associated
/// Accessibility element. An entry can also specify a handler to be
/// called before the entry is navigated to, to do any manual work needed to
/// bring the Accessibility element on-screen.
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
///         // Not all the `MessageView`s are generated at once, but the model
///         // knows about all the messages.
///         ForEach(messages) { message in
///             // If the Message is from a VIP, make a Rotor entry for it.
///             if message.isVIP {
///                 AccessibilityRotorEntry(message.subject, id: message.id)
///             }
///         }
///     }
///
/// An entry may also be created using an optional namespace, for situations
/// where there are multiple Accessibility elements within a ForEach iteration
/// or where a `ScrollView` is not present. In this case, the `prepare` closure
/// may be needed in order to scroll the element into position using
/// `ScrollViewReader`. The same namespace should be passed to calls to
/// `accessibilityRotorEntry(id:in:)` to tag the Accessibility elements
/// associated with this entry.
///
/// In the following example, a Message application creates a Rotor
/// allowing users to navigate to specifically the messages originating from
/// VIPs. The Rotor entries are associated with the content text of the message,
/// which is one of the two views within the ForEach that generate Accessibility
/// elements. That view is tagged with `accessibilityRotorEntry(id:in:)` so that
/// it can be found by the `AccessibilityRotorEntry`, and `ScrollViewReader` is
/// used with the `prepare` closure to scroll it into position.
///
///     struct MessageListView: View {
///         @Namespace var namespace
///
///         var body: some View {
///             ScrollViewReader { scroller in
///                  ScrollView {
///                     LazyVStack {
///                         ForEach(allMessages) { message in
///                             VStack {
///                                 Text(message.subject)
///                                 // Tag this `Text` as an element associated
///                                 // with a Rotor entry.
///                                 Text(message.content)
///                                     .accessibilityRotorEntry(
///                                         "\(message.id)_content",
///                                         in: namespace
///                                     )
///                             }
///                         }
///                     }
///                 }
///                 .accessibilityElement(children: .contain)
///                 .accessibilityRotor("VIP Messages") {
///                     ForEach(vipMessages) { vipMessage in
///                         // The Rotor entry points to a specific ID we
///                         // defined within a given `ForEach` iteration,
///                         // not to the entire `ForEach` iteration.
///                         AccessibilityRotorEntry(vipMessage.subject,
///                             id: "\(vipMessage.id)_content", in: namespace)
///                         {
///                             // But the ID we give to `ScrollViewReader`
///                             // matches the one used in the `ForEach`, which
///                             // is the identifier for the whole iteration
///                             // and what `ScrollViewReader` requires.
///                             scroller.scrollTo(vipMessage.id)
///                         }
///                     }
///                 }
///             }
///         }
///     }
///
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct AccessibilityRotorEntry<ID> where ID : Hashable {

    /// Create a Rotor entry with a specific label and identifier, with an
    /// optional range.
    /// - Parameters:
    ///   - label: Localized string used to show this Rotor entry
    ///     to users.
    ///   - id: Used to find the UI element associated with this
    ///     Rotor entry. This identifier should be used within a `scrollView`,
    ///     either in a `ForEach` or using an `id` call.
    ///   - textRange: Optional range of text associated with this Rotor
    ///     entry. This should be a range within text that is set as the
    ///     either label or accessibility value of the associated element.
    ///   - prepare: Optional closure to run before a Rotor entry
    ///     is navigated to, to prepare the UI as needed. This can be used to
    ///     bring the UI element on-screen if it isn't already, and SwiftUI
    ///     is not able to automatically scroll to it.
    public init(_ label: Text, id: ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) { }

    /// Create a Rotor entry with a specific label, identifier and namespace,
    /// and with an optional range.
    /// - Parameters:
    ///   - label: Localized string used to show this Rotor entry
    ///     to users.
    ///   - id: Used to find the UI element associated with this
    ///     Rotor entry. This identifier and namespace should match a call to
    ///     `accessibilityRotorEntry(id:in)`.
    ///   - namespace: Namespace for this identifier. Should match a call
    ///     to `accessibilityRotorEntry(id:in)`.
    ///   - textRange: Optional range of text associated with this Rotor
    ///     entry. This should be a range within text that is set as the
    ///     accessibility label or accessibility value of the associated
    ///     element.
    ///   - prepare: Optional closure to run before a Rotor entry
    ///     is navigated to, to prepare the UI as needed. This should be used to
    ///     bring the Accessibility element on-screen, if scrolling is needed to
    ///     get to it.
    public init(_ label: Text, id: ID, in namespace: Namespace.ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) { }

    /// Create a Rotor entry with a specific label and range. This Rotor entry
    /// will be associated with the Accessibility element that owns the Rotor.
    /// - Parameters:
    ///   - label: Optional localized string used to show this Rotor entry
    ///     to users. If no label is specified, the Rotor entry will be labeled
    ///     based on the text at that range.
    ///   - range: Range of text associated with this Rotor
    ///     entry.
    ///   - prepare: Optional closure to run before a Rotor entry
    ///     is navigated to, to prepare the UI as needed. This can be used to
    ///     bring the UI element or text on-screen if it isn't already,
    ///     and SwiftUI not able to automatically scroll to it.
    public init(_ label: Text? = nil, textRange: Range<String.Index>, prepare: @escaping (() -> Void) = {}) where ID == Never { }

    /// Create a Rotor entry with a specific label and identifier, with an
    /// optional range.
    /// - Parameters:
    ///   - id: Used to find the UI element associated with this
    ///     Rotor entry. This identifier should be used within a `scrollView`,
    ///     either in a `ForEach` or using an `id` call.
    ///   - label: Localized string used to show this Rotor entry
    ///     to users.
    ///   - textRange: Optional range of text associated with this Rotor
    ///     entry. This should be a range within text that is set as the
    ///     accessibility label or accessibility value of the associated
    ///     element.
    ///   - prepare: Optional closure to run before a Rotor entry
    ///     is navigated to, to prepare the UI as needed. This can be used to
    ///     bring the UI element on-screen if it isn't already, and SwiftUI
    ///     is not able to automatically scroll to it.
    public init(_ labelKey: LocalizedStringKey, id: ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) { }

    /// Create a Rotor entry with a specific label and identifier, with an
    /// optional range.
    /// - Parameters:
    ///   - label: Localized string used to show this Rotor entry
    ///     to users.
    ///   - id: Used to find the UI element associated with this
    ///     Rotor entry. This identifier should be used within a `scrollView`,
    ///     either in a `ForEach` or using an `id` call.
    ///   - textRange: Optional range of text associated with this Rotor
    ///     entry. This should be a range within text that is set as the
    ///     accessibility label or accessibility value of the associated
    ///     element.
    ///   - prepare: Optional closure to run before a Rotor entry
    ///     is navigated to, to prepare the UI as needed. This can be used to
    ///     bring the UI element on-screen if it isn't already, and SwiftUI
    ///     is not able to automatically scroll to it.
    public init<L>(_ label: L, id: ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) where L : StringProtocol { }

    /// Create a Rotor entry with a specific label, identifier and namespace,
    /// and with an optional range.
    /// - Parameters:
    ///   - labelKey: Localized string used to show this Rotor entry
    ///     to users.
    ///   - id: Used to find the UI element associated with this
    ///     Rotor entry. This identifier and namespace should match a call to
    ///     `accessibilityRotorEntry(id:in)`.
    ///   - namespace: Namespace for this identifier. Should match a call
    ///     to `accessibilityRotorEntry(id:in)`.
    ///   - textRange: Optional range of text associated with this Rotor
    ///     entry. This should be a range within text that is set as the
    ///     accessibility label or accessibility value of the associated
    ///     element.
    ///   - prepare: Optional closure to run before a Rotor entry
    ///     is navigated to, to prepare the UI as needed. This should be used to
    ///     bring the Accessibility element on-screen, if scrolling is needed to
    ///     get to it.
    public init(_ labelKey: LocalizedStringKey, id: ID, in namespace: Namespace.ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) { }

    /// Create a Rotor entry with a specific label, identifier and namespace,
    /// and with an optional range.
    /// - Parameters:
    ///   - label: Localized string used to show this Rotor entry
    ///     to users.
    ///   - id: Used to find the UI element associated with this
    ///     Rotor entry. This identifier and namespace should match a call to
    ///     `accessibilityRotorEntry(id:in)`.
    ///   - namespace: Namespace for this identifier. Should match a call
    ///     to `accessibilityRotorEntry(id:in)`.
    ///   - textRange: Optional range of text associated with this Rotor
    ///     entry. This should be a range within text that is set as the
    ///     accessibility label or accessibility value of the associated
    ///     element.
    ///   - prepare: Optional closure to run before a Rotor entry
    ///     is navigated to, to prepare the UI as needed. This should be used to
    ///     bring the Accessibility element on-screen, if scrolling is needed to
    ///     get to it.
    public init<L>(_ label: L, _ id: ID, in namespace: Namespace.ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) where L : StringProtocol { }

    /// Create a Rotor entry with a specific label and range. This Rotor entry
    /// will be associated with the Accessibility element that owns the Rotor.
    /// - Parameters:
    ///   - labelKey: Localized string used to show this Rotor entry
    ///     to users. If no label is specified, the Rotor entry will be labeled
    ///     based on the text at that range.
    ///   - range: Range of text associated with this Rotor
    ///     entry.
    ///   - prepare: Optional closure to run before a Rotor entry
    ///     is navigated to, to prepare the UI as needed. This can be used to
    ///     bring the UI element or text on-screen if it isn't already,
    ///     and SwiftUI not able to automatically scroll to it.
    public init(_ labelKey: LocalizedStringKey, textRange: Range<String.Index>, prepare: @escaping (() -> Void) = {}) { }

    /// Create a Rotor entry with a specific label and range. This Rotor entry
    /// will be associated with the Accessibility element that owns the Rotor.
    /// - Parameters:
    ///   - label: Localized string used to show this Rotor entry
    ///     to users. If no label is specified, the Rotor entry will be labeled
    ///     based on the text at that range.
    ///   - range: Range of text associated with this Rotor
    ///     entry.
    ///   - prepare: Optional closure to run before a Rotor entry
    ///     is navigated to, to prepare the UI as needed. This can be used to
    ///     bring the UI element or text on-screen if it isn't already,
    ///     and SwiftUI not able to automatically scroll to it.
    public init<L>(_ label: L, textRange: Range<String.Index>, prepare: @escaping (() -> Void) = {}) where ID == Never, L : StringProtocol { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension AccessibilityRotorEntry : AccessibilityRotorContent {

    /// The internal content of this `AccessibilityRotorContent`.
    public var body: Never { get }

    /// The type for the internal content of this `AccessibilityRotorContent`.
    public typealias Body = Never
}

