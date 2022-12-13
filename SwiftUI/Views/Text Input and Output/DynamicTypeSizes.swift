/// A Dynamic Type size, which specifies how large scalable content should be.
///
/// For more information about Dynamic Type sizes in iOS, see iOS Human Interface Guidelines >
/// [Dynamic Type Sizes](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/#dynamic-type-sizes).
/// For more information about Dynamic Type sizes in watchOS, see watchOS Human Interface Guidelines >
/// [Dynamic Type Sizes](https://developer.apple.com/design/human-interface-guidelines/watchos/visual/typography/#dynamic-type-sizes).
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public enum DynamicTypeSize : Hashable, Comparable, CaseIterable {

    /// An extra small size.
    case xSmall

    /// A small size.
    case small

    /// A medium size.
    case medium

    /// A large size.
    case large

    /// An extra large size.
    case xLarge

    /// An extra extra large size.
    case xxLarge

    /// An extra extra extra large size.
    case xxxLarge

    /// The first accessibility size.
    case accessibility1

    /// The second accessibility size.
    case accessibility2

    /// The third accessibility size.
    case accessibility3

    /// The fourth accessibility size.
    case accessibility4

    /// The fifth accessibility size.
    case accessibility5

    /// A Boolean value indicating whether the size is one that is associated
    /// with accessibility.
    public var isAccessibilitySize: Bool { get }

}

@available(iOS 15.0, tvOS 15.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension DynamicTypeSize {

    /// Create a Dynamic Type size from its `UIContentSizeCategory` equivalent.
    public init?(_ uiSizeCategory: UIContentSizeCategory) { }
}

