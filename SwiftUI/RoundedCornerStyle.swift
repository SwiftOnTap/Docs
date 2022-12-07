/// Defines the shape of a rounded rectangle's corners.
///
/// This rectangular corner style has two options:
/// 1. ``RoundedCornerStyle/circular``: The corners are quarter circles or ovals
/// 2. ``RoundedCornerStyle/continuous``: The corners are smooth
///
/// These styles have subtle but noticeable differences:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack(spacing: 20) {
///             RoundedRectangle(cornerRadius: 50, style: RoundedCornerStyle.circular)
///                 .frame(width: 250, height: 150)
///
///             RoundedRectangle(cornerRadius: 50, style: RoundedCornerStyle.continuous)
///                 .frame(width: 250, height: 150)
///         }
///     }
/// }
/// ```
///
/// ![A screenshot displaying two black rectangles with rounded corners stacked on top of each other, with empty space in between. The top rectangle has 'circular' corners, while the bottom has 'continuous', or smooth corners.](3680DF67-1241-4339-AC78-4452B24086B0.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum RoundedCornerStyle {

    /// Quarter-circle rounded rectangle corners.
    ///
    /// Use this case along with the
    ///
    /// In the example below, the top rectangle uses ``RoundedCornerStyle/circular``
    /// corners.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack(spacing: 20) {
    ///             RoundedRectangle(cornerRadius: 50, style: RoundedCornerStyle.circular)
    ///                 .frame(width: 250, height: 150)
    ///
    ///             RoundedRectangle(cornerRadius: 50, style: RoundedCornerStyle.continuous)
    ///                 .frame(width: 250, height: 150)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![RoundedRectangle init example](3680DF67-1241-4339-AC78-4452B24086B0.png)
    case circular

    /// Continuous curvature rounded rect corners.
    ///
    /// In the example below, the bottom rectangle uses ``RoundedCornerStyle/continuous``
    /// corners.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack(spacing: 20) {
    ///             RoundedRectangle(cornerRadius: 50, style: RoundedCornerStyle.circular)
    ///                 .frame(width: 250, height: 150)
    ///
    ///             RoundedRectangle(cornerRadius: 50, style: RoundedCornerStyle.continuous)
    ///                 .frame(width: 250, height: 150)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![RoundedRectangle init example](3680DF67-1241-4339-AC78-4452B24086B0.png)
    case continuous

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: RoundedCornerStyle, b: RoundedCornerStyle) -> Bool { }

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

