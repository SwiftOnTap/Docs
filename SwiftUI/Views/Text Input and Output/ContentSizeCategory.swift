/// Some options for specifying the preferred size of your content.
@available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
@available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "DynamicTypeSize")
@available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
@available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
public enum ContentSizeCategory : Hashable, CaseIterable {

    /// Extra small content size.
    case extraSmall

    /// Small content size.
    case small

    /// Medium content size.
    case medium

    /// Large content size.
    case large

    /// Extra large content size.
    case extraLarge

    /// Double extra large content size.
    case extraExtraLarge

    /// The largest content size option.
    case extraExtraExtraLarge

    /// A medium content size reflecting the accessibility settings.
    case accessibilityMedium

    /// A large content size reflecting the accessibility settings.
    case accessibilityLarge

    /// An extra large content size reflecting the accessibility settings.
    case accessibilityExtraLarge

    /// An extra, extra large content size reflecting the accessibility settings.
    case accessibilityExtraExtraLarge

    /// A really enormous content size reflecting the accessibility settings.
    case accessibilityExtraExtraExtraLarge

    /// A `Bool` value indicating whether the content size category is one that
    /// is associated with accessibility.
    @available(iOS 13.4, macOS 10.15.4, tvOS 13.4, watchOS 6.2, *)
    public var isAccessibilityCategory: Bool { get }

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ContentSizeCategory]

    /// A collection of all values of this type.
    public static var allCases: [ContentSizeCategory] { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ContentSizeCategory {

    /// Returns a Boolean value indicating whether the value of the first argument is less than that of the second argument.
    public static func < (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool { }

    /// Returns a Boolean value indicating whether the value of the first argument is less than or equal to that of the second argument.
    public static func <= (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool { }

    /// Returns a Boolean value indicating whether the value of the first argument is greater than that of the second argument.
    public static func > (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool { }

    /// Returns a Boolean value indicating whether the value of the first argument is greater than or equal to that of the second argument.
    public static func >= (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool { }
}

extension ContentSizeCategory {

    /// Create a size category from its UIContentSizeCateogry equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiSizeCategory: UIContentSizeCategory) { }
}

