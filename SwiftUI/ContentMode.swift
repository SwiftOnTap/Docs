/// Constants that define how a view's content fills the available space.
///
/// Use this enumeration along with the
/// ``View/aspectRatio(_:contentMode:)-6576a`` and
/// ``View/aspectRatio(_:contentMode:)-505fa`` modifiers
/// to specify how to change the aspect ratio of a view.
///
/// This enum has 2 options:
///
/// 1. ``ContentMode/fit``: Scale the content so that it can be fully seen
/// in the available space.
/// 2. ``ContentMode/fill``: Scale the content so that it fully fills
/// the available space.
///
/// In the following example, we scale the ellipse down so that it fits
/// perfectly in the space.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack {
///             Ellipse()
///                 .aspectRatio(1.5, contentMode: ContentMode.fit)
///                 .frame(width: 200, height: 200)
///                 .border(Color.orange)
///             Ellipse()
///                 .aspectRatio(1.5, contentMode: ContentMode.fill)
///                 .frame(width: 200, height: 200)
///                 .border(Color.orange)
///         }
///     }
/// }
/// ```
///
/// ![A screenshot displaying two identical orange square outlines on top of each other. In the top one, there is a black ellipse that fits within the confines of the square. The bottom one has a black ellipse that fills the square vertically, taking up nearly all the space in the square.](contentmode.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public enum ContentMode : Hashable, CaseIterable {

      /// Fill mode that scales down view so that it can be fully seen in the
      /// available space, even it it leaves whitespace.
    ///
    /// Use this case along with the
    /// ``View/aspectRatio(_:contentMode:)-6576a`` and
    /// ``View/aspectRatio(_:contentMode:)-505fa`` modifiers
    /// to specify how to change the aspect ratio of a view.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Ellipse()
    ///                 .aspectRatio(1.5, contentMode: .fit)
    ///                 .frame(width: 200, height: 200)
    ///                 .border(Color.orange)
    ///             Ellipse()
    ///                 .aspectRatio(1.5, contentMode: .fill)
    ///                 .frame(width: 200, height: 200)
    ///                 .border(Color.orange)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two identical orange square outlines on top of each other. In the top one, there is a black ellipse that fits within the confines of the square. The bottom one has a black ellipse that fills the square vertically, taking up nearly all the space in the square.](contentmode.png)
    ///
    case fit

    /// Fill mode that scales the view so that it fills the available space
    /// entirely, even if not all of the view can be seen.
    ///
    /// Use this case along with the
    /// ``View/aspectRatio(_:contentMode:)-6576a`` and
    /// ``View/aspectRatio(_:contentMode:)-505fa`` modifiers
    /// to specify how to change the aspect ratio of a view.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Ellipse()
    ///                 .aspectRatio(1.5, contentMode: ContentMode.fit)
    ///                 .frame(width: 200, height: 200)
    ///                 .border(Color.orange)
    ///             Ellipse()
    ///                 .aspectRatio(1.5, contentMode: ContentMode.fill)
    ///                 .frame(width: 200, height: 200)
    ///                 .border(Color.orange)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two identical orange square outlines on top of each other. In the top one, there is a black ellipse that fits within the confines of the square. The bottom one has a black ellipse that fills the square vertically, taking up nearly all the space in the square.](contentmode.png)
    ///
    case fill

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ContentMode, b: ContentMode) -> Bool { }

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
    public typealias AllCases = [ContentMode]

    /// A collection of all values of this type.
    public static var allCases: [ContentMode] { get }
}

