/// A type that describes the ability to select text.
///
/// To configure whether people can select text in your app, use the
/// ``View/textSelection(_:)`` modifier, passing in a text selectability
/// value like ``enabled`` or ``disabled``.
@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol TextSelectability {

    /// A Boolean value that indicates whether the selectability type allows
    /// selection.
    ///
    /// Conforming types, such as ``EnabledTextSelectability`` and
    /// ``DisabledTextSelectability``, return `true` or `false` for this
    /// property as appropriate. SwiftUI expects this value for a given
    /// selectability type to be constant, unaffected by global state.
    static var allowsSelection: Bool { get }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension TextSelectability where Self == EnabledTextSelectability {

    /// A selectability value that enables text selection by a person using your app.
    ///
    /// Enabling text selection allows people to perform actions on the text
    /// content, such as copying and sharing. Enable text selection in views
    /// where those operations are useful, such as copying unique IDs or
    /// error messages. This allows people to paste the data into
    /// emails or documents.
    ///
    /// The following example enables text selection on the second of two
    /// ``Text`` views in a ``VStack``.
    ///
    ///     VStack {
    ///         Text("Event Invite")
    ///             .font(.title)
    ///         Text(invite.date.formatted(date: .long, time: .shortened))
    ///             .textSelection(.enabled)
    ///     }
    ///
    public static var enabled: EnabledTextSelectability { get }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension TextSelectability where Self == DisabledTextSelectability {

    /// A selectability value that disables text selection by the person using your app.
    ///
    /// Use this property to disable text selection of views that
    /// you don't want people to select and copy, even if contained within an
    /// overall context that allows text selection.
    ///
    ///     content // Content that might contain Text views.
    ///        .textSelection(.disabled)
    ///        .padding()
    ///        .contentShape(Rectangle())
    ///        .gesture(someGesture)
    ///
    public static var disabled: DisabledTextSelectability { get }
}

