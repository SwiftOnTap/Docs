/// A struct style for rasterizing vector shapes.
///
/// `FillStyle` determines the even-odd fill mode and antialiased mode on the style.
/// When initializing a new `FillStyle`, eoFill is set to false by default and
/// antialiased is set to true by default.
///
/// The even-odd rule fills a path depending on what is overlapping in the path.
/// For example, a path with no overlaps will be fully filled but a path with
/// an overlap will not have the overlapping part filled. See ``FillStyle/isEOFilled`` for an example.
/// Anti-aliased smooths pixels on jagged edges by averaging the colors of the pixels
/// at the boundary.
///
/// For example, to create a view with a circle shape and fill style:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Circle()
///             .fill(Color.pink, style: FillStyle(eoFill: true))
///     }
/// }
/// ```
///
/// ![A view containinf a circle with pink fill with eoFill set to true, causing
/// the use of the even-odd rule in the rendering of the shape.](3D0FC026-AFA8-4995-8F6B-D48485049731.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct FillStyle : Equatable {

    /// A Boolean value that indicates whether to use the even-odd rule when
    /// rendering a shape.
    ///
    /// The even-odd rule fills a path depending on what is overlapping in the path.
    /// For example, a path with no overlaps will be fully filled but a path with
    /// an overlap will not have the overlapping part filled.
    ///
    /// ```
    /// struct EvenOddRuleView: View {
    ///     var body: some View {
    ///         VStack(spacing: 100) {
    ///             VStack {
    ///                 OverlappingRectangles()
    ///                     .fill(Color.pink, style: FillStyle(eoFill: true))
    ///                     .frame(width: 150, height: 100)
    ///
    ///                 Text("isEOFilled: true")
    ///             }
    ///
    ///             VStack {
    ///                 OverlappingRectangles()
    ///                     .fill(Color.pink, style: FillStyle(eoFill: false))
    ///                     .frame(width: 150, height: 100)
    ///
    ///                 Text("isEOFilled: false")
    ///             }
    ///         }
    ///     }
    /// }
    ///
    /// struct OverlappingRectangles: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let rectSize = CGSize(width: rect.height, height: rect.height)
    ///
    ///         var path = Path()
    ///
    ///         path.addRect(CGRect(origin: .zero, size: rectSize))
    ///         path.addRect(CGRect(origin: CGPoint(x: rect.width-rect.height, y: -50), size: rectSize))
    ///
    ///         return path
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with two VStacks, each with a custom
    /// OverlappingRectangle shape with pink fill and a frame of width 150 and
    /// height 100 as well as a text view; as stated by the text view beneath
    /// each, isOEFilled is set to true for the first and false for the second,
    /// resulting in the first having a blank white space where the overlap of
    /// the rectangles occurs and the second being completelt pink filled, even
    /// through the overlap.](fillstyle-eof-example.png)
    ///
    /// When `isEOFilled` is `false`, the style uses the non-zero winding number
    /// rule.
    public var isEOFilled: Bool

    /// A Boolean value that indicates whether to apply antialiasing the edges
    /// of a shape.
    public var isAntialiased: Bool

    /// Creates a new fill style with the specified settings.
    ///
    /// For example, to create a new fill style:
    ///
    /// ```
    /// struct ExampleView: View {
    ///
    ///     var body: some View {
    ///         Circle()
    ///             .fill(Color.pink, style: FillStyle(eoFill: true, antialiased: true))
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a circle with pink fill, eoFill set to true, and
    /// antialiased set to true.](3D0FC026-AFA8-4995-8F6B-D48485049731.png)
    ///
    /// - Parameters:
    ///   - eoFill: A Boolean value that indicates whether to use the even-odd
    ///     rule for rendering a shape. Pass `false` to use the non-zero winding
    ///     number rule instead. If no value is specified, eoFill defaults to false.
    ///     For more information on the even-odd rule, see ``FillStyle/isOEFilled``.
    ///   - antialiased: A Boolean value that indicates whether to use
    ///     antialiasing when rendering the edges of a shape. If no value is specified
    ///     antialiased defaults to true.
    public init(eoFill: Bool = false, antialiased: Bool = true) { }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: FillStyle, b: FillStyle) -> Bool { }
}

