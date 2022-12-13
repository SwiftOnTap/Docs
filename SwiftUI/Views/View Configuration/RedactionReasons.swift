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
    
    /// Displayed data should be obscured to protect private information.
    ///
    /// Views marked with `privacySensitive` will be automatically redacted
    /// using a standard styling. To apply a custom treatment the redaction
    /// reason can be read out of the environment.
    ///
    ///     struct BankingContentView: View {
    ///         @Environment(\.redactionReasons) var redactionReasons
    ///
    ///         var body: some View {
    ///             if redactionReasons.contains(.privacy) {
    ///                 FullAppCover()
    ///             } else {
    ///                 AppContent()
    ///             }
    ///         }
    ///     }
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public static let privacy: RedactionReasons

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = RedactionReasons

}

