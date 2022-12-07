/// The kind of autocapitalization behavior applied during text input.
///
/// Pass an instance of `TextInputAutocapitalization` to the
/// ``View/textInputAutocapitalization(_:)`` view modifier.
@available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(macOS, unavailable)
public struct TextInputAutocapitalization {

    /// Defines an autocapitalizing behavior that will not capitalize anything.
    public static var never: TextInputAutocapitalization { get }

    /// Defines an autocapitalizing behavior that will capitalize the first
    /// letter of every word.
    public static var words: TextInputAutocapitalization { get }

    /// Defines an autocapitalizing behavior that will capitalize the first
    /// letter in every sentence.
    public static var sentences: TextInputAutocapitalization { get }

    /// Defines an autocapitalizing behavior that will capitalize every letter.
    public static var characters: TextInputAutocapitalization { get }
}

@available(iOS 15.0, tvOS 15.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension TextInputAutocapitalization {

    /// Creates a new ``TextInputAutocapitalization`` struct from a
    /// `UITextAutocapitalizationType` enum.
    public init?(_ type: UITextAutocapitalizationType) { }
}

