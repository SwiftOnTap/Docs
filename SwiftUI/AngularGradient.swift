/// An angular gradient.
///
/// An angular gradient is also known as a "conic" gradient. This gradient
/// applies the color function as the angle changes, relative to a center point
/// and defined start and end angles. If `endAngle - startAngle > 2π`, the
/// gradient only draws the last complete turn. If `endAngle - startAngle < 2π`,
/// the gradient fills the missing area with the colors defined by gradient
/// locations one and zero, transitioning between the two halfway across the
/// missing area. The gradient maps the unit-space center point into the
/// bounding rectangle of each shape filled with the gradient.
///
/// There are 3 main cases where AngularGradient can change:
/// 1. `endAngle - startAngle = 2π`
/// 2. `endAngle - startAngle > 2π`
/// 3. `endAngle - startAngle < 2π`
///
/// Note: Angles default to a clockwise rotation, but angles can be a negative
/// value which will rotate the color counter-clockwise.
///
/// ## End Angle - Start Angle = 2π
///
/// This is the normal case where the start and end angles make a complete circle.
/// Every color will evenly distribute.
///
/// ```
/// struct AngularGradientView: View {
///     let colors: [Color] = [.yellow, .red,.blue, .purple]
///
///     var body: some View {
///         Rectangle()
///             .fill(AngularGradient(gradient: Gradient(colors: colors), center: .center))
///             .frame(width:200, height:200)
///     }
/// }
/// ```
///
/// ![A view containing a rectangle with a frame of width and height 200 and an
/// angular gradient fill in which the end and start angles make a complete
/// circle; this results in a square that fades from yellow to red to blue to
/// purple starting and the center and going clockwise.](491E0F0F-86BB-4B03-B05A-C6ABEA7CDC13.png)
///
/// ## End Angle - Start Angle > 2π
///
/// This is the case where the total angle is greater than a circle.
/// The gradient will only draw the last complete turn which effectively writes
/// over the first circle portion.
///
/// ```
/// struct AngularGradientView: View {
///     let colors: [Color] = [.yellow, .red,.blue, .purple]
///
///     var body: some View {
///         VStack {
///             Rectangle()
///                 .fill(AngularGradient(gradient: Gradient(colors: colors), center: .center))
///                 .frame(width:200, height:200)
///             Rectangle()
///                 .fill(AngularGradient(gradient: Gradient(colors: colors), center: .center,startAngle: .degrees(0), endAngle: .degrees(360 + 45)))
///                 .frame(width:200, height:200)
///         }
///     }
/// }
/// ```
///
/// ![A view containing a VStack with two rectangles, one with an angular
/// gradient fill in which the end and start angles make a complete
/// circle and the other in which the total angle is greater than a circle;
/// this results in both squares fading from yellow to red to blue to
/// purple, one starting at the center and the other at the bottom right corner.](89BED914-29DA-4009-9EA1-96E1849E55F0.png)
///
/// ## End Angle - Start Angle < 2π
///
/// This is the case where the total angle is less than a circle.
/// The gradient will not make a complete circle, but the missing area between
/// the start and end will be evenly colored with the
/// first and last color of the gradient.
///
/// ```
/// struct AngularGradientView: View {
///     let colors: [Color] = [.yellow, .red,.blue, .purple]
///
///     var body: some View {
///         VStack {
///             Rectangle()
///                 .fill(AngularGradient(gradient: Gradient(colors: colors), center: .center))
///                 .frame(width:200, height:200)
///             Rectangle()
///                 .fill(AngularGradient(gradient: Gradient(colors: colors), center: .center,startAngle: .degrees(0), endAngle: .degrees(180)))
///                 .frame(width:200, height:200)
///         }
///     }
/// }
/// ```
///
/// ![A view containing a VStack with two rectangles, one with an angular
/// gradient fill in which the end and start angles make a complete
/// circle and the other in which the total angle is less than a circle;
/// this results in both squares fading from yellow to red to blue to
/// purple, one starting at the center and the other at the top center.](94015C67-FC57-44CC-9EA4-F982A47AEB7D.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct AngularGradient : ShapeStyle, View {

    /// Creates an angular gradient from a starting and ending angle.
    ///
    /// Gradient behavior acts differently according to whether the end angle -
    /// start angle is greater than, less than or equal to 2π.
    /// See ``AngularGradient`` for more information.
    /// An example,
    ///
    /// ```
    /// struct AngularGradientView: View {
    ///     let colors: [Color] = [.yellow, .red,.blue, .purple]
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .fill(AngularGradient(gradient: Gradient(colors: colors), center: .center))
    ///                 .frame(width:200, height:200)
    ///             Rectangle()
    ///                 .fill(AngularGradient(gradient: Gradient(colors: colors), center: .center,startAngle: .degrees(0), endAngle: .degrees(180)))
    ///                 .frame(width:200, height:200)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with two rectangles, one with an angular
    /// gradient fill in which the end and start angles make a complete
    /// circle and the other in which the total angle is less than a circle;
    /// this results in both squares fading from yellow to red to blue to
    /// purple, one starting at the center and the other at the top center.](angular-gradient-example-3.png)
    ///
    /// - Parameters:
    ///   - gradient: The gradient with the colors to use.
    ///   - center: The unit point that is center of the angular gradient.
    ///   - startAngle: The ``Angle`` where the gradient starts. Defaults to zero.
    ///   - endAngle: The ``Angle`` where the gradient ends. Defaults to zero.
    public init(gradient: Gradient, center: UnitPoint, startAngle: Angle = .zero, endAngle: Angle = .zero) { }

    /// Creates an angular gradient starting at and angle and going all the way around in a circle.
    ///
    /// For example,
    ///
    /// ```
    /// struct ExampleView: View {
    ///     let colors: [Color] = [.yellow, .red,.blue, .purple]
    ///
    ///     var body: some View {
    ///         Rectangle()
    ///             .fill(AngularGradient(gradient: Gradient(colors: colors), center: .center))
    ///             .frame(width:200, height:200)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rectangle with a frame of width and height 200 and an
    /// angular gradient fill in which the end and start angles make a complete
    /// circle; this results in a square that fades from yellow to red to blue to
    /// purple starting at the center and going clockwise.](angular-gradient-example-1.png)
    ///
    /// - Parameters:
    ///   - gradient: The gradient with the colors to use.
    ///   - center: The unit point that is center of the angular gradient.
    ///   - angle: The ``Angle`` where the gradient starts. Defaults to zero.
    public init(gradient: Gradient, center: UnitPoint, angle: Angle = .zero) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

