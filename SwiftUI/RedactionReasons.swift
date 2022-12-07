/// The reasons to apply a redaction to data displayed on screen.
///
/// Use this type with the ``View/redacted(reason:)`` view modifier to
/// "redact" a view's contents. For now, that simply means to replace
/// the view with a placeholder.
///
/// In the future, this type may get more optionality, but as of now,
/// the only redaction reason is ``RedactionReasons/placeholder``
///
/// See the following example for adding redaction to a view.
///
/// ```
/// struct RedactedView: View {
///     var body: some View {
///         VStack {
///             Label("Taylor Swift", systemImage: "person.fill")
///             Label("Kanye West", systemImage: "person.fill")
///                 .redacted(reason: .placeholder)
///         }
///     }
/// }
/// ```
///
/// ![A screenshot displaying two labels in a VStack, each composed of a person
/// icon followed by text. The first reads "Taylor Swift" next to the icon, while
/// the second is redacted and has a gray square followed by a gray rectangle.](redactionreasons.png)
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct RedactionReasons : OptionSet {

    /// The raw value.
    public let rawValue: Int

    /// Creates a new set from a raw value.
    ///
    /// Do not use this initializer directly. Rather, use one of the
    /// static constants of the strucutre:
    /// - ``RedactionReasons/placeholder``
    ///
    /// - Parameter rawValue: The raw value with which to create the
    ///   reasons for redaction.
    public init(rawValue: Int) { }

    /// Displayed data should appear as generic placeholders.
    ///
    /// Text and images will be automatically masked to appear as
    /// generic placeholders, though maintaining their original size and shape.
    /// Use this to create a placeholder UI without directly exposing
    /// placeholder data to users.
    ///
    /// In the future, this type may get more optionality, but as of now,
    /// this is the only property in ``RedactionReasons``.
    ///
    /// ```
    /// struct RedactedView: View {
    ///     var body: some View {
    ///         Label("Taylor Swift", systemImage: "person.fill")
    ///         Label("Kanye West", systemImage: "person.fill")
    ///             .redacted(reason: .placeholder)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two labels in a VStack, each composed of a person
    /// icon followed by text. The first reads "Taylor Swift" next to the icon, while
    /// the second is redacted and has a gray square followed by a gray rectangle.
    /// Displayed data appears as a generic placeholder.](redactionreasons.png)
    public static let placeholder: RedactionReasons

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = RedactionReasons

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = RedactionReasons

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int
}

