/// The different text directions used in different languages.
///
/// Use this enumeration with the ``layoutDirection``
/// environment property. See
/// ``EnvironmentValues/layoutDirection`` for more on accessing
/// and changing this property.
///
/// There are two possible layout directions:
///
/// 1. ``LayoutDirection/leftToRight``
/// 2. ``LayoutDirection/rightToLeft``
///
/// Examples of left-to-right layout directions are English and Russian.
/// Examples of right-to-left layout directions are Arabic and Hebrew.
///
/// In the example below, the left to right arrow is printed since we're
/// in the English locale.
///
/// ```
/// struct ContentView: View {
///     @Environment(\.layoutDirection) var direction
///
///     var body: some View {
///         Text(direction == LayoutDirection.leftToRight ? "➡️" : "⬅️")
///             .font(.title)
///     }
/// }
/// ```
///
/// ![A screenshot of a right facing arrow emoji centered on a screen with a white background.](layoutdirection.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum LayoutDirection : Hashable, CaseIterable {

    /// The text is read and written from left to right.
    ///
    /// In this layout direction, the leading edge would be on the left side,
    /// and the trailing edge would be on the right side.
    ///
    /// Use this enumeration case with the ``layoutDirection``
    /// environment property. See
    /// ``EnvironmentValues/layoutDirection`` for more on accessing
    /// and changing this property.
    ///
    /// Examples of left-to-right layout directions are English and Russian.
    ///
    /// In the example below, the left to right arrow is printed since we're
    /// in the English locale.
    ///
    /// ```
    /// struct LayoutView: View {
    ///     @Environment(\.layoutDirection) var direction
    ///
    ///     var body: some View {
    ///         Text(direction == .leftToRight ? "➡️" : "⬅️")
    ///             .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a right facing arrow emoji centered on a screen with a white background.](layoutdirection.png)
    ///
    case leftToRight

    /// The text is read and written from right to left.
    ///
    /// In this layout direction, the leading edge would be on the right side,
    /// and the trailing edge would be on the left side.
    ///
    /// Use this enumeration case with the ``layoutDirection``
    /// environment property. See
    /// ``EnvironmentValues/layoutDirection`` for more on accessing
    /// and changing this property.
    ///
    /// There are two possible layout directions:
    ///
    /// Examples of right-to-left layout directions are Arabic and Hebrew.
    ///
    /// In the example below, the left to right arrow is printed since we're
    /// in the English locale.
    ///
    /// ```
    /// struct LayoutView: View {
    ///     @Environment(\.layoutDirection) var direction
    ///
    ///     var body: some View {
    ///         Text(direction == .rightToLeft ? "⬅️" : "➡️")
    ///             .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![](layoutdirection.png)
    ///
    case rightToLeft

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: LayoutDirection, b: LayoutDirection) -> Bool { }

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
    public typealias AllCases = [LayoutDirection]

    /// A collection of all values of this type.
    public static var allCases: [LayoutDirection] { get }
}

extension LayoutDirection {

    /// Create a direction from its UITraitEnvironmentLayoutDirection equivalent.
    ///
    /// This initializer is rarely used in SwiftUI. See
    /// [these docs](https://developer.apple.com/documentation/uikit/uitraitenvironmentlayoutdirection)
    /// for more info on layout direction in UIKit.
    ///
    /// - Note: This is a failable initializer, so it must be unwrapped for
    /// many use cases.
    ///
    /// See below for a simple example of how to use this.
    ///
    /// ```
    /// import SwiftUI
    /// import UIKit
    ///
    /// struct LayoutView: View {
    ///     @Environment(\.layoutDirection) var direction
    ///     let leftToRight = UITraitEnvironmentLayoutDirection.leftToRight
    ///
    ///     var body: some View {
    ///         Text(direction == LayoutDirection(leftToRight)! ? "➡️" : "⬅️")
    ///             .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a right facing arrow emoji centered on a screen with a white background.](layoutdirection.png)
    ///
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiLayoutDirection: UITraitEnvironmentLayoutDirection) { }
}

