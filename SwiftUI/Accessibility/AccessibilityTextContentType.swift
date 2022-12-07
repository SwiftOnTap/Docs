/// Textual context that assistive technologies can use to improve the
/// presentation of spoken text.
///
/// Use an `AccessibilityTextContentType` value when setting the accessibility text content
/// type of a view using the ``View/accessibilityTextContentType(_:)`` modifier.
///
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct AccessibilityTextContentType {

    /// A type that represents generic text that has no specific type.
    public static let plain: AccessibilityTextContentType

    /// A type that represents text used for input, like in the Terminal app.
    public static let console: AccessibilityTextContentType

    /// A type that represents text used by a file browser, like in the Finder app in macOS.
    public static let fileSystem: AccessibilityTextContentType

    /// A type that represents text used in a message, like in the Messages app.
    public static let messaging: AccessibilityTextContentType

    /// A type that represents text used in a story or poem, like in the Books app.
    public static let narrative: AccessibilityTextContentType

    /// A type that represents text used in source code, like in Swift Playgrounds.
    public static let sourceCode: AccessibilityTextContentType

    /// A type that represents text used in a grid of data, like in the Numbers app.
    public static let spreadsheet: AccessibilityTextContentType

    /// A type that represents text used in a document, like in the Pages app.
    public static let wordProcessing: AccessibilityTextContentType
}

