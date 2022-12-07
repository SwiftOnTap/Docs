/// Some options for specifying the preferred size of your content.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
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

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ContentSizeCategory, b: ContentSizeCategory) -> Bool { }

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) { }

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

