/// A geometric angle whose value you access in either radians or degrees.
///
/// `Angle`s are used all over SwiftUI to specify a geometric angle.
/// Common uses include **rotation** and **drawing**.
///
/// ### Creating an `Angle`
///
/// You can create an ``Angle`` by using either **radians** or **degrees**.
/// Each has an initializer as well as a static method:
///
/// - **Radians**:
///     - ``Angle/init(radians:)``
///     - ``Angle/radians(_:)``
/// - **Degrees**:
///     - ``Angle/init(degrees:)``
///     - ``Angle/degrees(_:)``
///
/// See usage examples below.
///
/// ### Using an `Angle` with rotation
///
/// `Angles` are commonly used with the ``View/rotationEffect(_:anchor:)``
/// and similar modifiers:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack(spacing: 50) {
///             Rectangle()
///                 .frame(width: 100, height: 100)
///                 .rotationEffect(Angle(degrees: 15))
///                 .border(Color.orange)
///             Rectangle()
///                 .frame(width: 100, height: 100)
///                 .rotationEffect(.degrees(15))
///                 .border(Color.orange)
///         }
///     }
/// }
/// ```
///
/// ![A view containing a VStack with two rectangle, each with a frame width and
/// height of 100, a 15 degree rotation effect, and border color orange, which
/// illustrates the rotation by remaining in the original position; one rectangles
/// rotation effect is defined by the init modifier and the other with the angle modifier.](angle.png)
///
/// ### Using an `Angle` with drawing
///
/// `Angle`s can also be used with drawing. Below, we define a custom
/// ``Shape`` called `Arc`, and make its parameter type `Angle`. In our
/// ``View``, we pass `270` as the degrees parameter to specify the size of
/// the `Arc` to be displayed:
///
/// ```
/// struct Arc: Shape {
///     var endAngle: Angle
///
///     func path(in rect: CGRect) -> Path {
///         Path { p in
///             p.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
///                      radius: rect.width / 2 ,
///                      startAngle: Angle.zero,
///                      endAngle: endAngle,
///                      clockwise: false)
///         }
///     }
/// }
///
/// struct ArcView: View {
///     var body: some View {
///         Arc(endAngle: Angle.degrees(270))
///             .stroke(Color.orange, lineWidth: 20)
///     }
/// }
/// ```
///
/// ![A view containing an arch, which has been defined by a shape struct in the
/// code, with stroke color orange and line width 20; the orange arch completes
/// 270 degrees of a circle, as defined by the parameter type angle and degrees
/// parameter of 270.](angle-2.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Angle {

    /// The size of the angle, measured in radians.
    ///
    /// Usually, this property is specified using the
    /// ``Angle/init(radians:)`` initializer, or the
    /// ``Angle/radians(_:)`` static function.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let angle = Angle(radians: Double.pi / 6)
    ///
    ///     var body: some View {
    ///         Rectangle()
    ///             .rotationEffect(angle)
    ///             .frame(width: 100, height: 100)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rectangle, with a rotation effect defined by an
    /// radians, a frame width and height of 100, and border color
    /// orange, which illustrates the clockwise rotation by remaining in the
    /// original position.](angle-radians.png)
    ///
    public var radians: Double

    /// The size of the angle, measured in degrees.
    ///
    /// Usually, this property is specified using the
    /// ``Angle/init(degrees:)`` initializer, or the
    /// ``Angle/degrees(_:)`` static function.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let angle = Angle(degrees: 15)
    ///
    ///     var body: some View {
    ///         Rectangle()
    ///             .rotationEffect(angle)
    ///             .frame(width: 100, height: 100)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rectangle, with a rotation effect defined by an
    /// degrees, a frame width and height of 100, and border color
    /// orange, which illustrates the clockwise rotation by remaining in the
    /// original position.](angle-degrees.png)
    ///
    ///
    @inlinable public var degrees: Double

    /// Creates an angle of 0 degrees or 0 radians.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let angle = Angle()
    ///
    ///     var body: some View {
    ///         Rectangle()
    ///             .rotationEffect(angle) //Does nothing
    ///             .frame(width: 100, height: 100)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rectangle, with a rotation effect defined by an
    /// empty Angle() struct, a frame width and height of 100, and border color
    /// orange, which illustrates lack of rotation by the rectangle.](angle-zero.png)
    ///
    @inlinable public init() { }

    /// Creates an angle from a specified number of radians.
    ///
    /// Use this initializer to create an ``Angle`` of a specified number of `radians`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let angle = Angle(radians: Double.pi / 6)
    ///
    ///     var body: some View {
    ///         Rectangle()
    ///             .rotationEffect(angle)
    ///             .frame(width: 100, height: 100)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rectangle, with a rotation effect defined by
    /// radians in Angle(), a frame width and height of 100, and border color
    /// orange, which illustrates the clockwise rotation of the
    /// rectangle by remaining in the original position.](angle-radians.png)
    ///
    /// - Parameter radians: The number of radians in the angle.
    @inlinable public init(radians: Double) { }

    /// Creates an angle from a specified number of degrees.
    ///
    /// Use this initializer to create an ``Angle`` of a specified number of `degrees`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let angle = Angle(degrees: 15)
    ///
    ///     var body: some View {
    ///         Rectangle()
    ///             .rotationEffect(angle)
    ///             .frame(width: 100, height: 100)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rectangle, with a rotation effect defined by
    /// degrees in Angle(), a frame width and height of 100, and border color
    /// orange, which illustrates the 15 degree clockwise rotation of the rectangle by
    /// remaining in the original position.](angle-degrees.png)
    ///
    /// - Parameter degrees: The number of degrees in the angle.
    @inlinable public init(degrees: Double) { }

    /// Changes the size of an angle to a specified number of radians.
    ///
    /// This can be a convenient shorthand for the ``Angle/init(radians:)``
    /// initializer, especially when the type can be inferred.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .rotationEffect(.radians(Double.pi / 6))
    ///             .frame(width: 100, height: 100)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rectangle, with a rotation effect defined by
    /// radians, a frame width and height of 100, and border color
    /// orange, which illustrates the clockwise rotation of the rectangle by
    /// remaining in the original position.](angle-radians.png)
    ///
    /// - Parameter radians: The number of radians the new angle should be.
    @inlinable public static func radians(_ radians: Double) -> Angle { }

    /// Changes the size of an angle to a specified number of degrees.
    ///
    /// This can be a convenient shorthand for the ``Angle/init(degrees:)``
    /// initializer, especially when the type can be inferred.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .rotationEffect(.degrees(15))
    ///             .frame(width: 100, height: 100)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rectangle, with a rotation effect defined by
    /// degrees, a frame width and height of 100, and border color
    /// orange, which illustrates the clockwise rotation of the rectangle by
    /// remaining in the original position](angle-degrees.png)
    ///
    /// - Parameter degrees: The number of degrees the new angle should be.
    @inlinable public static func degrees(_ degrees: Double) -> Angle { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Angle : Hashable, Comparable {

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func < (lhs: Angle, rhs: Angle) -> Bool { }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Angle, b: Angle) -> Bool { }

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
extension Angle : Animatable {

    /// The data to animate.
    public var animatableData: Double

    /// Creates an angle of 0 degrees or 0 radians.
    ///
    /// This static property can be a convenient shorthand for
    /// the ``Angle/init()`` initializer, especially when the
    /// type can be inferred:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .rotationEffect(.zero) // Does nothing
    ///             .frame(width: 100, height: 100)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rectangle, with a rotation effect defined by
    /// the zero type property, a frame width and height of 100, and border color
    /// orange, which illustrates the lack of rotation of the rectangle.](angle-zero.png)
    ///
    @inlinable public static var zero: Angle { get }

    /// The type defining the data to animate.
    public typealias AnimatableData = Double
}

