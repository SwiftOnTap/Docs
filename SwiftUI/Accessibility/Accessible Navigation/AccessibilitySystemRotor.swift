/// Designates a Rotor that replaces one of the automatic, system-provided
/// Rotors with a developer-provided Rotor.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct AccessibilitySystemRotor {

    /// System Rotors allowing users to iterate through links or visited links.
    public static func links(visited: Bool) -> AccessibilitySystemRotor { }

    /// System Rotor allowing users to iterate through all links.
    public static var links: AccessibilitySystemRotor { get }

    /// System Rotors allowing users to iterate through all headings, of various
    /// heading levels.
    public static func headings(level: AccessibilityHeadingLevel) -> AccessibilitySystemRotor { }

    /// System Rotor allowing users to iterate through all headings.
    public static var headings: AccessibilitySystemRotor { get }

    /// System Rotor allowing users to iterate through all the ranges of
    /// bolded text.
    public static var boldText: AccessibilitySystemRotor { get }

    /// System Rotor allowing users to iterate through all the ranges of
    /// italicized text.
    public static var italicText: AccessibilitySystemRotor { get }

    /// System Rotor allowing users to iterate through all the ranges of
    /// underlined text.
    public static var underlineText: AccessibilitySystemRotor { get }

    /// System Rotor allowing users to iterate through all the ranges of
    /// mis-spelled words.
    public static var misspelledWords: AccessibilitySystemRotor { get }

    /// System Rotor allowing users to iterate through all images.
    public static var images: AccessibilitySystemRotor { get }

    /// System Rotor allowing users to iterate through all text fields.
    public static var textFields: AccessibilitySystemRotor { get }

    /// System Rotor allowing users to iterate through all tables.
    public static var tables: AccessibilitySystemRotor { get }

    /// System Rotor allowing users to iterate through all lists.
    public static var lists: AccessibilitySystemRotor { get }

    /// System Rotor allowing users to iterate through all landmarks.
    public static var landmarks: AccessibilitySystemRotor { get }
}

