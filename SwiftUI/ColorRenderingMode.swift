/// The working color space for color-compositing operations.
///
/// Each color space guarantees to preserve a particular range of color values.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ColorRenderingMode {

    /// The non-linear sRGB working color space, with color component values
    /// outside the range `[0, 1]` producing undefined results.
    ///
    /// This color space is gamma corrected.
    case nonLinear

    /// The linear sRGB working color space, with color component values outside
    /// the range `[0, 1]` producing undefined results.
    ///
    /// This color space isn't gamma corrected.
    case linear

    /// The linear sRGB working color space, with color component values outside
    /// the range `[0, 1]` preserved.
    ///
    /// This color space isn't gamma corrected.
    case extendedLinear

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ColorRenderingMode, b: ColorRenderingMode) -> Bool { }

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
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorRenderingMode : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorRenderingMode : Hashable {
}

