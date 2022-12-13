/// A dynamic data structure for representing a point in a view.
///
/// ### What is a `UnitPoint`?
///
/// A `UnitPoint` is a 2D coordinate. Its `x` and `y` values are measured
/// from `0.0` to `1.0`, and represent fractions of the parent view.
/// The positive **x-axis** runs from **leading** edge to **trailing** edge, and the positve
/// **y-axis** moves from **top** to **bottom**.
///
/// There are two ways to make a `UnitPoint`:
/// you can either customize the `x` and `y` coordinates, or you can use a
/// predefined constant.
/// SwiftUI has 10 `UnitPoint` constants:
/// 1. ``UnitPoint/zero``
/// 2. ``UnitPoint/center``
/// 3. ``UnitPoint/topleading``
/// 4. ``UnitPoint/top``
/// 5. ``UnitPoint/toptrailing``
/// 6. ``UnitPoint/trailing``
/// 7. ``UnitPoint/bottomtrailing``
/// 8. ``UnitPoint/bottom``
/// 9. ``UnitPoint/bottomleading``
/// 10. ``UnitPoint/leading``
///
/// ### How to use a `UnitPoint`
///
/// `UnitPoints`s can be used to specify the anchor point for view
/// transformations like ``View/rotationEffect(_:anchor:)``
/// and ``View/scaleEffect(_:anchor:)-92995``. They are used commonly in
/// ``Shape``s and gradients.
///
/// For example, a ``LinearGradient`` accepts a `UnitPoint` for the
/// `startPoint` and `endPoint` parameters.
/// This example uses the ``UnitPoint/top`` and ``UnitPoint/bottom``
/// unit points.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         let colors = [Color.yellow, Color.orange]
///         let gradient = Gradient(colors: colors)
///         let linearGradient = LinearGradient(gradient: gradient,
///                                             startPoint: UnitPoint.top,
///                                             endPoint: UnitPoint.bottom)
///         return Rectangle()
///             .fill(linearGradient)
///             .frame(width:100, height:100)
///     }
/// }
/// ```
///
/// ![A view displaying an orange square with linear gradient fill specificed
/// by start and end UnitPoints.](1199EBDE-F3C9-4FA5-900B-98139BD6C0CC.png)
///
/// To use a unit point as an anchor for rotation, pass it to the
/// ``View/rotationEffect(_:anchor:)`` modifier:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack(spacing: 200) {
///             Text("I'm rotated around my center 👈")
///                 .rotationEffect(.degrees(22), anchor: UnitPoint.center)
///                 .border(Color.gray)
///             Text("I'm rotated on the left 🍃")
///                 .rotationEffect(.degrees(22), anchor: UnitPoint.leading)
///                 .border(Color.gray)
///         }
///     }
/// }
/// ```
///
/// ![A view with a VStack containing two text views, one of which has been
/// rotated 22 degrees clockwise around it's center using UnitPoint, and one
/// which has been rotated 22 degrees clockwise around its leading edge; both
/// views have a unrotated gray border to show the rotation effect.](unitpoint-anchor.png)
///
/// You can get the same effect by creating your own custom `UnitPoint`s,
/// using the ``UnitPoint/init(x:y:)`` initialzer:
///
/// ```
/// struct ContentView: View {
///     let center = UnitPoint(x: 0.5, y: 0.5)
///     let leading = UnitPoint(x: 0, y: 0.5)
///
///     var body: some View {
///         VStack(spacing: 200) {
///             Text("I'm rotated around my center 👈")
///                 .rotationEffect(.degrees(22), anchor: center)
///                 .border(Color.gray)
///             Text("I'm rotated on the left 🍃")
///                 .rotationEffect(.degrees(22), anchor: leading)
///                 .border(Color.gray)
///         }
///     }
/// }
/// ```
///
/// ![A view with a VStack containing two text views, one of which has been
/// rotated 22 degrees clockwise around it's center using custom UnitPoints, and one
/// which has been rotated 22 degrees clockwise around its leading edge; both
/// views have a unrotated gray border to show the rotation effect.](unitpoint-anchor.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct UnitPoint : Hashable {

    /// The x coordinate of the point, measured in points.
    ///
    /// The `x` value of a ``UnitPoint`` runs from `0.0` to `1.0`,
    /// and represents the fractional distance of the parent view's
    /// width. `0` corresponds to the **leading** edge, and `1` corresponds
    /// to the **trailing** edge.
    ///
    /// You can also use values outside this range, like `2.0`, and they'll represent
    /// places **outside** of the view.
    ///
    /// You usually specify this value using the ``UnitPoint``
    /// ``UnitPoint/init(x:y:)`` initialzer, but you can also specify it
    /// directly:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         var point = UnitPoint()
    ///         point.x = 0.5
    ///
    ///         return Text("I'm rotated around my center 👈")
    ///             .rotationEffect(.degrees(22), anchor: point)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a rectangular border in the center of the screen
    /// with text rotated 22 degrees clockwise around its center reading "I'm
    /// rotated around my center." It's anchored in the center because the anchor is
    /// set at x coordinate 0.5.](unitpoint-rotation-center.png)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public var x: CGFloat

    /// The y coordinate of the point, measured in points.
    ///
    /// The `y` value of a ``UnitPoint`` runs from `0.0` to `1.0`,
    /// and represents the fractional distance of the parent view's
    /// height. `0` corresponds to the **top** edge, and `1` corresponds
    /// to the **bottom** edge.
    ///
    /// You can also use values outside this range, like `2.0`, and they'll represent
    /// places **outside** of the view.
    ///
    /// You usually specify this value using the ``UnitPoint``
    /// ``UnitPoint/init(x:y:)`` initialzer, but you can also specify it
    /// directly:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         var point = UnitPoint()
    ///         point.y = 0.5
    ///         point.x = 0.5
    ///
    ///         return Text("I'm rotated around my center 👈")
    ///             .rotationEffect(.degrees(22), anchor: point)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a rectangular border in the center of the screen
    /// with text rotated 22 degrees clockwise around its center reading "I'm
    /// rotated around my center." It's anchored in the center because the anchor is
    /// set at both x and y coordinate 0.5.](unitpoint-rotation-center.png)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public var y: CGFloat

    /// Creates a unit point with x and y values of 0.
    ///
    /// Use this convenience initializer to create a unit point with
    /// `x` and `y` values of `0`. This corresponds to the top leading
    /// edge of the view.
    ///
    /// This initializer is equivalent to ``UnitPoint``'s ``UnitPoint/zero``
    /// static constant.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let point = UnitPoint()
    ///
    ///     var body: some View {
    ///         Rectangle()
    ///             .frame(width: 100, height: 100)
    ///             .rotationEffect(.degrees(22), anchor: point)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange square border in the center of the screen
    /// with a black filled square of the same size anchored at its top left corner,
    /// rotated by 0.5 radians towards the bottom of the screen. The anchor is set
    /// as a unitpoint which initializes to 0 for both x and y, which refers to the top
    /// left corner.](unitpoint-zero.png)
    @inlinable public init() { }

    /// Creates a unit point from x and y values.
    ///
    /// Use this initializer to create a custom ``UnitPoint``.
    ///
    /// The `x` and `y` values of a ``UnitPoint`` run from `0.0` to `1.0`,
    /// and represents the fractional distance of the parent view's
    /// width. `0` corresponds to the **leading** or **top** edge,
    /// and `1` corresponds to the **trailing** or **bottom** edge.
    ///
    /// You can also use values outside this range, like `2.0`, and they'll represent
    /// places **outside** of the view.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let point = UnitPoint(x: 0.5, y: 0.5)
    ///
    ///     var body: some View {
    ///         Text("I'm rotated around my center 👈")
    ///             .rotationEffect(.degrees(22), anchor: point)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a rectangular border in the center of the screen
    /// with text rotated 22 degrees clockwise around its center reading "I'm
    /// rotated around my center." It's anchored in the center because the anchor is
    /// set at both x and y coordinate 0.5 as rendered by the unitpoint initializer.](unitpoint-rotation-center.png)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    ///
    /// - Parameters:
    ///   x: The x coordinate of the unit point.
    ///   y: The y coordinate of the unit point.
    @inlinable public init(x: CGFloat, y: CGFloat) { }

    /// A unit point with x and y values of 0.
    ///
    /// Use this static constant to specify a ``UnitPoint`` with an
    /// `x` of `0` and a `y` of `0`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .frame(width: 100, height: 100)
    ///             .rotationEffect(.degrees(22), anchor: .zero)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange square border in the center of the screen
    /// with a black filled square of the same size anchored at its top left corner,
    /// rotated by 0.5 radians towards the bottom of the screen. The anchor is set
    /// using the .zero property.](unitpoint-zero.png)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public static let zero: UnitPoint

    /// The unit point at the center of a given view.
    ///
    /// Use this static constant to specify a ``UnitPoint`` with:
    /// - `x = 0.5`
    /// - `y = 0.5`
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .frame(width: 100, height: 100)
    ///             .rotationEffect(.degrees(22), anchor: .center)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange square border in the center of the screen
    /// with a black filled square of the same size anchored at its center,
    /// rotated by 0.5 radians towards the bottom of the screen. The anchor is set
    /// using the .center property which causes it to rotate around its center.](unitpoint-center.png)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public static let center: UnitPoint

    /// The unit point at the middle of the leading edge of a given view.
    ///
    /// Use this static constant to specify a ``UnitPoint`` with:
    /// - `x = 0`
    /// - `y = 0.5`
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var angle: Double = 0
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Slider(value: $angle, in: 0...360)
    ///             Rectangle()
    ///                 .frame(width: 100, height: 100)
    ///                 .rotationEffect(.degrees(angle), anchor: .leading)
    ///                 .border(Color.orange)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a VStack with a slider and a
    /// an orange bordered 100 x 100 rectangle with a leading anchor; the square
    /// rotates 360 degrees lockwise around the center point of the leading side
    /// of the border as the slider is moved right and counterclockwise as it is
    /// moved back left, as the shape's degrees value is controlled by the slider
    /// value, which is bound to a state variable.](unipoint-leading-ex.gif)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public static let leading: UnitPoint

    /// The unit point at the middle of the trailing edge of a given view.
    ///
    /// Use this static constant to specify a ``UnitPoint`` with:
    /// - `x = 1`
    /// - `y = 0.5`
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var angle: Double = 0
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Slider(value: $angle, in: 0...360)
    ///             Rectangle()
    ///                 .frame(width: 100, height: 100)
    ///                 .rotationEffect(.degrees(angle), anchor: .trailing)
    ///                 .border(Color.orange)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a VStack with a slider and a
    /// an orange bordered 100 x 100 rectangle with a trailing anchor; the square
    /// rotates 360 degrees lockwise around the center point of the trailing side
    /// of the border as the slider is moved right and counterclockwise as it is
    /// moved back left, as the shape's degrees value is controlled by the slider
    /// value, which is bound to a state variable.](unipoint-trailing-ex.gif)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public static let trailing: UnitPoint

    /// The unit point at the middle of the top edge of a given view.
    ///
    /// Use this static constant to specify a ``UnitPoint`` with:
    /// - `x = 0.5`
    /// - `y = 1`
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var angle: Double = 0
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Slider(value: $angle, in: 0...360)
    ///             Rectangle()
    ///                 .frame(width: 100, height: 100)
    ///                 .rotationEffect(.degrees(angle), anchor: .top)
    ///                 .border(Color.orange)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a VStack with a slider and a
    /// an orange bordered 100 x 100 rectangle with a top anchor; the square
    /// rotates 360 degrees lockwise around the center point of the top side
    /// of the border as the slider is moved right and counterclockwise as it is
    /// moved back left, as the shape's degrees value is controlled by the slider
    /// value, which is bound to a state variable.](unipoint-top-ex.gif)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    ///
    public static let top: UnitPoint

    /// The unit point at the middle of the bottom edge of a given view.
    ///
    /// Use this static constant to specify a ``UnitPoint`` with:
    /// - `x = 0.5`
    /// - `y = 1`
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var angle: Double = 0
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Slider(value: $angle, in: 0...360)
    ///             Rectangle()
    ///                 .frame(width: 100, height: 100)
    ///                 .rotationEffect(.degrees(angle), anchor: .bottom)
    ///                 .border(Color.orange)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a VStack with a slider and a
    /// an orange bordered 100 x 100 rectangle with a bottom anchor; the square
    /// rotates 360 degrees lockwise around the center point of the bottom side
    /// of the border as the slider is moved right and counterclockwise as it is
    /// moved back left, as the shape's degrees value is controlled by the slider
    /// value, which is bound to a state variable.](unipoint-bottom-ex.gif)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public static let bottom: UnitPoint

    /// The unit point at the top leading corner of a given view.
    ///
    /// Use this static constant to specify a ``UnitPoint`` with:
    /// - `x = 0`
    /// - `y = 0`
    ///
    /// - Note: This is the same as ``UnitPoint/zero``.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .frame(width: 100, height: 100)
    ///             .rotationEffect(.degrees(22), anchor: .topLeading)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange square border in the center of the screen
    /// with a black filled square of the same size anchored at its top left corner,
    /// rotated by 0.5 radians towards the bottom of the screen. The anchor is set
    /// using the topLeading property, which has the same effect as anchoring it
    /// at zero in this case.](topleading.png)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public static let topLeading: UnitPoint

    /// The unit point at the top trailing corner of a given view.
    ///
    /// Use this static constant to specify a ``UnitPoint`` with:
    /// - `x = 1`
    /// - `y = 0`
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .frame(width: 100, height: 100)
    ///             .rotationEffect(.degrees(22), anchor: .topTrailing)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange square border in the center of the screen
    /// with a black filled square of the same size anchored at its top right corner,
    /// rotated by 0.5 radians towards the top of the screen. The anchor is set
    /// using the topTrailing property, which forces its rotation around the top right
    /// side of the original shape.](toptrailing.png)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public static let topTrailing: UnitPoint

    /// The unit point at the bottom leading corner of a given view.
    ///
    /// Use this static constant to specify a ``UnitPoint`` with:
    /// - `x = 0`
    /// - `y = 1`
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .frame(width: 100, height: 100)
    ///             .rotationEffect(.degrees(22), anchor: .bottomLeading)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange square border in the center of the screen
    /// with a black filled square of the same size anchored at its bottom left corner,
    /// rotated by 0.5 radians towards the bottom of the screen. The anchor is set
    /// using the bottomLeading property, which forces its rotation around the bottom left
    /// corner of the original shape.](bottomleading.png)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public static let bottomLeading: UnitPoint

    /// The unit point at the bottom trailing corner of a given view.
    ///
    /// Use this static constant to specify a ``UnitPoint`` with
    /// - `x = 1`
    /// - `y = 1`
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .frame(width: 100, height: 100)
    ///             .rotationEffect(.degrees(22), anchor: .bottomTrailing)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange square border in the center of the screen
    /// with a black filled square of the same size anchored at its bottom right corner,
    /// rotated by 0.5 radians towards the top of the screen. The anchor is set
    /// using the bottomTrailing property, which forces its rotation around the bottom right
    /// corner of the original shape.](bottomtrailing.png)
    ///
    /// See ``UnitPoint`` for more on how and when to use unit points.
    public static let bottomTrailing: UnitPoint

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

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: UnitPoint, b: UnitPoint) -> Bool { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension UnitPoint : Animatable {

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<CGFloat, CGFloat>

    /// The data to animate.
    public var animatableData: UnitPoint.AnimatableData
}

