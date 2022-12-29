/// The outline of a custom shape.
///
/// Use this structure to outline a custom shape.
///
/// ### Creating a path
///
/// There are 8 different ways to create a path:
///
/// 1. Empty path: ``Path/init()``
/// 2. Path from closure: ``Path/init(_:)-13504``
/// 3. Path from [`CGMutablePath`](https://developer.apple.com/documentation/coregraphics/cgmutablepath)
/// 4. Path from [`CGPath`](https://developer.apple.com/documentation/coregraphics/cgpath)
/// 5. Path from ``Rectangle``
/// 6. Path from [`String`](https://developer.apple.com/documentation/swift/string)
/// 7. Path from ellipse:
/// ``Path/init(ellipseIn:)``
/// 8. Path from ``RoundedRectangle``:
///     1. ``Path/init(roundedRect:cornerSize:style:)``
///     2. ``Path/init(roundedRect:cornerRadius:style:)``
///
/// ### Modifying and mutating a path
///
/// Use mutating path methods in conjunction with the init-from-a-closure
/// path initializer to mutate the path before returning it. These methods
/// mutate and return the path.
///
/// Use non-mutating (modifying) path methods on already existing paths
/// similarly to view modifiers to update and return something new.
///
/// In the following example, `move(to:)` and `addLine(to:)` are
/// mutating methods, while `stroke()` is a non-mutating method.
///
/// ```
/// struct PathView: View {
///     var body: some View {
///         Path { path in
///             path.move(to: .zero)
///             path.addLine(to: CGPoint(x: 300, y: 300))
///         }
///         .stroke(Color.orange, lineWidth: 5)
///     }
/// }
/// ```
///
/// ![75F56224-5C30-4AE3-B526-336907676D1E](path.png)
///
/// ### Using a path
///
/// The primary way to use a path is in conjunction with the
/// ``Shape/path(in:)`` function. Create a custom path,
/// and return it to this function in order to create
/// a custom shape:
///
/// ```
/// struct CustomShapeView: View {
///     var body: some View {
///         CustomShape()
///             .stroke(Color.orange, linewidth: 10)
///     }
/// }
///
/// struct CustomShape: Shape {
///     func path(in rect: CGRect) -> Path {
///         return Path(rect)
///     }
/// }
/// ```
///
/// ![CE1CCD64-157A-4908-B57D-96FC577A693D](path-2.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Path : Equatable, LosslessStringConvertible {

    /// Creates an empty path.
    ///
    /// Use this initializer to create an empty path which can be
    /// mutated later.
    ///
    /// In the following example, we start out by making an empty path,
    /// but then mutate it to the desired shape:
    ///
    /// ```
    /// struct CustomShapeView: View {
    ///     var body: some View {
    ///         CustomShape()
    ///             .stroke(Color.orange, lineWidth: 5)
    ///     }
    /// }
    ///
    /// struct CustomShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         var path = Path()
    ///
    ///         path.move(to: .zero)
    ///         path.addLine(to: CGPoint(x: 300, y: 300))
    ///
    ///         return path
    ///     }
    /// }
    /// ```
    ///
    /// ![](path.png)
    ///
    public init() { }

    /// Creates a path from a CGPath.
    ///
    /// Use this initializer when you have already constructed a
    /// `CGPath` and would like to turn it into a ``Path``.
    ///
    /// `CGPath` objects are from the Core Graphics library. More
    /// info can be found [here](https://developer.apple.com/documentation/coregraphics/cgpath).
    ///
    /// ```
    /// struct CustomShapeView: View {
    ///     var body: some View {
    ///         CustomShape(Color.orange, lineWidth: 10)
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct CustomShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let cgPath = CGPath(rect: rect, transform: .none)
    ///         return Path(cgPath)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange line segment extending from the upper left
    /// hand corner of the screen to the middle right hand side. The path is
    /// initialized using a CGPath.](path.png)
    ///
    /// - Parameter path: A CGPath to define the path.
    public init(_ path: CGPath) { }

    /// Creates a path from a CGMutablePath.
    ///
    /// Use this initializer when you have already constructed a
    /// `CGMutablePath` andn would like to turn it into a ``Path``.
    ///
    /// - Note: `CGMutablePath` objects can be mutated after they are
    /// initialized. `CGPath` objects cannot.
    ///
    /// `CGMutablePath` objects are from the CoreGraphics library. More
    /// info can be found [here](https://developer.apple.com/documentation/coregraphics/cgmutablepath).
    ///
    /// ```
    /// struct CustomShapeView: View {
    ///     var body: some View {
    ///         CustomShape()
    ///             .stroke(Color.orange, lineWidth: 10)
    ///     }
    /// }
    ///
    /// struct CustomShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let cgMutablePath = CGPath(rect: rect, transform: .none).mutableCopy()!
    ///
    ///         cgMutablePath.move(to: .zero)
    ///         cgMutablePath.addLine(to: CGPoint(x: 200, y: 200))
    ///
    ///         return Path(cgMutablePath)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange border surrounding the screen with a
    /// line segment extending from the upper left hand corner to the center. The path is
    /// initialized using a CGMutablePath.](path-3.png)
    ///
    /// - Parameter path: A CGMutablePath to define the path.
    public init(_ path: CGMutablePath) { }

    /// Creates a path from a CGRect.
    ///
    /// `CGRect` objects are from the Core Graphics library. More
    /// info can be found [here](https://developer.apple.com/documentation/coregraphics/cgrect).
    ///
    /// ```
    /// struct CustomShapeView: View {
    ///     var body: some View {
    ///         CustomShape()
    ///             .stroke(Color.orange, lineWidth: 10)
    ///     }
    /// }
    ///
    /// struct CustomShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         return Path(rect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange border surrounding the screen which is
    /// initialized from a CGRect.](path-2.png)
    ///
    /// - Parameter path: A CGRect to define the path.
    public init(_ rect: CGRect) { }

    /// Creates a path as a rounded rectangle from a CGRect and a corner size.
    ///
    /// See ``RoundedCornerStyle`` for more info on the different corner
    /// options of a rounded rectangle.
    ///
    /// ```
    /// struct CustomShapeView: View {
    ///     var body: some View {
    ///         CustomShape()
    ///             .stroke(Color.orange, lineWidth: 5)
    ///             .padding()
    ///     }
    /// }
    ///
    /// struct CustomShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path(roundedRect: rect,
    ///              cornerSize: CGSize(width: 50, height: 50),
    ///              style: .continuous)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange rounded rectangular path occupying
    /// most of the screen which is initialized using a CGRect and cornerSize.](path-rounded.png)
    ///
    /// - Parameters:
    ///   - rect: A CGRect to define the sides of the path.
    ///   - cornerSize: A CGSize to define the size of the path's corners.
    ///   - style: A RoundedCornerStyle to define the type of corners for the path.
    public init(roundedRect rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .circular) { }

    /// Creates a path as a rounded rectangle from a CGRect and a corner radius.
    ///
    /// See ``RoundedCornerStyle`` for more info on the different corner
    /// options of a rounded rectangle.
    ///
    /// ```
    /// struct CustomShapeView: View {
    ///     var body: some View {
    ///         CustomShape()
    ///             .stroke(Color.orange, lineWidth: 5)
    ///             .padding()
    ///     }
    /// }
    ///
    /// struct CustomShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path(roundedRect: rect,
    ///              cornerRadius: CGFloat(50),
    ///              style: .continuous)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange rounded rectangular path occupying
    /// most of the screen which is initialized using a CGRect and cornerSize,
    /// as well as by specifying the style as continuous to render a smooth border.](path-rounded.png)
    ///
    /// - Parameters:
    ///   - rect: A CGRect to define the sides of the path.
    ///   - cornerRadius: A CGFloat to define the radius of the path's corners.
    ///   - style: A RoundedCornerStyle to define the type of corners for the path.
    public init(roundedRect rect: CGRect, cornerRadius: CGFloat, style: RoundedCornerStyle = .circular) { }

    /// Creates a path as an ellipse defined by a given rectangle.
    ///
    /// ```
    /// struct CustomShapeView: View {
    ///     var body: some View {
    ///         CustomShape()
    ///             .stroke(Color.orange, lineWidth: 10)
    ///     }
    /// }
    ///
    /// struct CustomShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         return Path(ellipseIn: rect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange elliptical path touching all four
    /// edges of the screen. The path is rendered by passing a rectangle to the
    /// ellipseIn initializer.](ellipse.png)
    ///
    /// - Parameter ellipseIn: The rectangle defining the outside of the ellipse.
    public init(ellipseIn rect: CGRect) { }

    /// Creates a path from a closure.
    ///
    /// - Note: You do not need to return the mutated path. It will be
    /// mutated automatically.
    ///
    /// ```
    /// struct PathFromClosureView: View {
    ///     var body: some View {
    ///         Path { path in
    ///             path.move(to: .zero)
    ///             path.addLine(to: CGPoint(x: 300, y: 300))
    ///         }
    ///         .stroke(Color.orange, lineWidth: 5)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange line segment extending from the upper left
    /// hand corner of the screen to the middle right hand side. The path is
    /// initialized using a closure.](path.png)
    ///
    /// - Parameter callback: A closure that takes in an empty path which
    /// can be mutated.
    public init(_ callback: (inout Path) -> ()) { }

    /// Creates a path from a string.
    ///
    /// Use this initializer to create a path from the result of a previous call to
    /// `Path.stringRepresentation`. Fails if the [`String`](https://developer.apple.com/documentation/swift/string) does not
    /// describe a valid path.
    ///
    /// ```
    /// struct PathFromStringView: View {
    ///     var pathString: String {
    ///         Path { path in
    ///             path.move(to: .zero)
    ///             path.addLine(to: CGPoint(x: 300, y: 300))
    ///         }
    ///         .description
    ///     }
    ///
    ///     var body: some View {
    ///         Path(pathString)!
    ///             .stroke(Color.orange, lineWidth: 10)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange line segment extending from the upper left
    /// hand corner of the screen to the middle right hand side. The path is
    /// initialized using a string.](path.png)
    ///
    /// - Parameter string: The string description of the path, obtained from `description`.
    public init?(_ string: String) { }

    /// A property that holds a string description of the path.
    ///
    /// Use this property to recreate the path via the
    /// ``Path/init?(_:)`` initializer.
    ///
    /// ```
    /// struct PathFromStringView: View {
    ///     var pathString: String {
    ///         let p = Path { path in
    ///             path.move(to: .zero)
    ///             path.addLine(to: CGPoint(x: 100, y: 100))
    ///         }
    ///         .description
    ///
    ///         print(p) //"0 0 m 100 100 l"
    ///
    ///         return p
    ///     }
    ///
    ///     var body: some View {
    ///         Path(pathString)!
    ///             .stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black line segment originating at the
    /// upper left hand corner of the screen and extending about an inch towards
    /// the center. The description property holds a string description of this path.](path-description-ex.png)
    ///
    public var description: String { get }

    /// A property that holds the path as a Core Graphics Path (CGPath).
    ///
    /// ```
    /// struct PathFromCGPathView: View {
    ///     var cgPath: CGPath {
    ///         Path { path in
    ///             path.move(to: .zero)
    ///             path.addLine(to: CGPoint(x: 100, y: 100))
    ///         }
    ///         .cgPath
    ///     }
    ///     var body: some View {
    ///         Path(cgPath)
    ///             .stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black line segment originating at the
    /// upper left hand corner of the screen and extending about an inch towards
    /// the center. The cgPath property holds the path as a CGPath.](path-cg.png)
    ///
    public var cgPath: CGPath { get }

    /// A Boolean property that contains whether the path is empty.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let path = Path()
    ///
    ///     var body: some View {
    ///
    ///         if path.isEmpty { //true
    ///             Text("Path is empty")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a text view reading "Path is empty". In this
    /// case, the path is empty so isEmpty returns true and triggers the text.](path-is-empty.png)
    ///
    public var isEmpty: Bool { get }

    /// A property that contains the outer bounding rectangle of the path.
    ///
    /// ```
    /// struct OddShapeView: View {
    ///     var body: some View {
    ///         BoxedOval()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct BoxedOval: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { path in
    ///             path.addEllipse(in: rect)
    ///             path.addRect(path.boundingRect)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black elliptical path that touches all
    /// four edges of the screen and is contained within a bounding rectangle.
    /// The rectangle is rendered as a direct container for the ellipse by using
    /// the boundingRect property.](path-bounding-rect.png)
    ///
    public var boundingRect: CGRect { get }

    /// Returns true if the path contains a specified point.
    ///
    /// If `eoFill` is `true`, this method uses the even-odd rule to define which
    /// points are inside the path. Otherwise, it uses the non-zero rule.
    ///
    /// ```
    /// struct LineView: View {
    ///     var body: some View {
    ///         let line = Path { path in
    ///             path.move(to: .zero)
    ///             path.addLine(to: CGPoint(x: 100, y: 100))
    ///         }
    ///
    ///         print(line.contains(CGPoint(x: 50, y: 50))) //true
    ///
    ///         return line.stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a terminal inset above it that reads "true." The
    /// screenshot displays a thin black line segment originating at the
    /// upper left hand corner of the screen and extending about an inch towards
    /// the center. The segment starts at x:0, y:0 and goes to x:100 and y:100,
  /// so the boolean for contains x:50, y:50 returns true.](path-contains.png)
    ///
    public func contains(_ p: CGPoint, eoFill: Bool = false) -> Bool { }

    /// An element of a path.
    ///
    /// These elements are passed in as parameters in the function parameter of
    /// ``Path/forEach(_:)``. Other than that, these elements are not really
    /// used.
    ///
    /// A path is made up of elements defined in this enumeration.
    ///
    /// The following example shows a function that loops through
    /// the elements in a path:
    ///
    /// ```
    /// struct OvalView: View {
    ///     var body: some View {
    ///         LoudPrintingOval() // Loud and printing 📢
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct LoudPrintingOval: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let ovalPath = Path(ellipseIn: rect)
    ///
    ///         ovalPath.forEach { element in
    ///             switch element {
    ///             case .move(let point):
    ///                 print("I moved to \(point).")
    ///             case .line(let point):
    ///                 print("I drew a line to \(point).")
    ///             case .quadCurve(let point, let control):
    ///                 print("I drew a quad curve to \(point).")
    ///             case .curve(let point, let control1, let control2):
    ///                 print("I drew a curve to \(point).")
    ///             case .closeSubpath:
    ///                 print("I am finished being loud.")
    ///             }
    ///         }
    ///
    ///         return ovalPath
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black elliptical path that touches all four
    /// edges of the screen. The path is made up of elements defined in the code block.](path-element.png)
    ///
    @frozen public enum Element : Equatable {

        /// A path element that terminates the current subpath (without closing
        /// it) and defines a new current point.
        ///
        /// To add this enumeration case to your path, use the
        /// ``Path/move(to:)`` mutating function:
        ///
        /// ```
        /// struct OneHundredPointLine: View {
        ///     var body: some View {
        ///         Path { path in
        ///             path.move(to: .zero)
        ///             path.addLine(to: CGPoint(x: 100, y: 0))
        ///         }
        ///         .stroke()
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a short line segment originating at the upper
        /// left hand corner of the screen and extending directly to the right. Here,
        /// the move element is used to define the upper left hand corner as the starting
        /// point for the path.](path-element-move.png)
        ///
        case move(to: CGPoint)

        /// A line from the previous current point to the given point, which
        /// becomes the new current point.
        ///
        /// To add this enumeration case to your path, use the
        /// ``Path.addLine(to:)`` mutating function:
        ///
        /// ```
        /// struct OneHundredPointLine: View {
        ///     var body: some View {
        ///         Path { path in
        ///             path.move(to: .zero)
        ///             path.addLine(to: CGPoint(x: 100, y: 0))
        ///         }
        ///         .stroke()
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a short line segment originating at the upper
        /// left hand corner of the screen and extending directly to the right. Here,
        /// the addLine element is used to define the line itself and the new current point.](path-element-move.png)
        ///
        case line(to: CGPoint)

        /// A quadratic Bézier curve from the previous current point to the
        /// given end-point, using the single control point to define the curve.
        ///
        /// The end-point of the curve becomes the new current point.
        ///
        /// To add this enumeration case to your path, use the
        /// ``Path.addQuadCurve(to:control:)`` mutating function:
        ///
        /// ```
        /// struct CurvedLineView: View {
        ///     var body: some View {
        ///         Path { path in
        ///             path.move(to: .zero)
        ///             path.addQuadCurve(to: CGPoint(x: 100, y: 100),
        ///                               control: CGPoint(x: 200, y: 0))
        ///         }
        ///         .stroke()
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a thin black quadcurve originating at the
        /// upper left hand corner of the screen, which curves into the screen
        /// and then promptly back out as rendered by the addQuadCurve element.](QUADCURVE.png)
        ///
        case quadCurve(to: CGPoint, control: CGPoint)

        /// A cubic Bézier curve from the previous current point to the given
        /// end-point, using the two control points to define the curve.
        ///
        /// The end-point of the curve becomes the new current point.
        ///
        /// To add this enumeration case to your path, use the
        /// ``Path.addCurve(to:control1:control2:)`` mutating function:
        ///
        /// ```
        /// struct FunkySView: View {
        ///     var body: some View {
        ///         Path { path in
        ///             path.move(to: .zero)
        ///             path.addCurve(to: CGPoint(x: 100, y: 100),
        ///                           control1: CGPoint(x: 100, y: 0),
        ///                           control2: CGPoint(x: 0, y: 100))
        ///         }
        ///         .stroke()
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a small curve originating at the upper
        /// left hand corner of the screen which curves into the screen, then down,
        /// and then further to the right into the screen. The inflection points of
        /// this curve are dictated by the control points as passed to addCurve.](path-element-curve.png)
        ///
        case curve(to: CGPoint, control1: CGPoint, control2: CGPoint)

        /// A line from the start point of the current subpath (if any) to the
        /// current point, which terminates the subpath.
        ///
        /// After closing the subpath, the current point becomes undefined.
        ///
        /// To add this enumeration case to your path, use the
        /// ``Path.closeSubpath()`` mutating function:
        ///
        /// ```
        /// struct LazyTriangleView: View {
        ///     var body: some View {
        ///         Path { path in
        ///             path.move(to: .zero)
        ///             path.addLine(to: CGPoint(x: 100, y: 0))
        ///             path.addLine(to: CGPoint(x: 100, y: 100))
        ///             // Getting lazy 😴
        ///             path.closeSubpath()
        ///         }
        ///         .stroke()
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a small triangle in the upper left hand
        /// corner of the screen which is closed using the closeSubpath element.](lazy-triangle.png)
        ///
        case closeSubpath

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Path.Element, b: Path.Element) -> Bool { }
    }

    /// Calls a function for every element in the path.
    ///
    /// Use this function to loop over every element in a path.
    ///
    /// A path is made up of elements defined in
    /// ``Path.Element``.
    ///
    /// ```
    /// struct OvalView: View {
    ///     var body: some View {
    ///         LoudPrintingOval() // Loud and printing 📢
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct LoudPrintingOval: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let ovalPath = Path(ellipseIn: rect)
    ///
    ///         ovalPath.forEach { element in
    ///             switch element {
    ///             case .move(let point):
    ///                 print("I moved to \(point).")
    ///             case .line(let point):
    ///                 print("I drew a line to \(point).")
    ///             case .quadCurve(let point, let control):
    ///                 print("I drew a quad curve to \(point).")
    ///             case .curve(let point, let control1, let control2):
    ///                 print("I drew a curve to \(point).")
    ///             case .closeSubpath:
    ///                 print("I am finished being loud.")
    ///             }
    ///         }
    ///
    ///         return ovalPath
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black elliptical path which touches
    /// all four corners of the screen.](path-element.png)
    ///
    public func forEach(_ body: (Path.Element) -> Void) { }

    /// Sets the style for a path's stroke.
    ///
    /// Use this method to set a path's strole style. When the path
    /// is eventually stroked, it will have the declared style.
    ///
    /// See ``StrokeStyle`` for info on how to create a style.
    ///
    /// ```
    /// struct PaperCutoutView: View {
    ///     var body: some View {
    ///         CutHereLines()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct CutHereLines: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let style = StrokeStyle(lineWidth: 3.0,
    ///                                 lineCap: .butt,
    ///                                 lineJoin: .bevel,
    ///                                 miterLimit: 3.0,
    ///                                 dash: [9.0, 9.0, 0.0, 9.0, 9.0, 9.0],
    ///                                 dashPhase: 0.0)
    ///         return Path(rect)
    ///             .strokedPath(style)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a rectangular border around the screen which
    /// appears as a series of small rectangles and dots. The strokedPath instance
    /// method renders the style according to the requirements set by the user.](strokedpath.png)
    ///
    public func strokedPath(_ style: StrokeStyle) -> Path { }

    /// Trims a path along a given 0 to 1 percentage range.
    ///
    /// The returned path contains the region between `from` and `to`, both of
    /// which must be fractions between zero and one defining points
    /// linearly-interpolated along the path.
    ///
    /// ```
    /// struct TrimmedPathView: View {
    ///     var body: some View {
    ///         Path { path in
    ///             path.move(to: .zero)
    ///             path.addQuadCurve(to: CGPoint(x: 100, y: 100),
    ///                               control: CGPoint(x: 200, y: 0))
    ///         }
    ///         .trimmedPath(from: 0.25, to: 0.75)
    ///         .stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a clipped quad curve. The trimmedPath method
    /// clips the first and last quarter of the path, so instead of originating
    /// in the upper left corner, it is inset to the right and only vaguely curves
    /// back out to the left side of the screen.](trimmed-path.png)
    ///
    public func trimmedPath(from: CGFloat, to: CGFloat) -> Path { }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Path, b: Path) -> Bool { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Path : Shape {

    /// Describes the path as a path within a rectangular frame of reference.
    ///
    /// This method is rarely used directly. For path, it just returns the
    /// same path.
    ///
    /// This method makes ``Path`` a ``Shape`` itself!
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in _: CGRect) -> Path { }

    /// The type defining the data to animate.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Path {

    /// Begins a new subpath at the specified point.
    ///
    /// ```
    /// struct OneHundredPointLine: View {
    ///     var body: some View {
    ///         Path { path in
    ///             path.move(to: .zero)
    ///             path.addLine(to: CGPoint(x: 100, y: 0))
    ///         }
    ///         .stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a short line segment originating at the upper
    /// left hand corner of the screen and extending directly to the right. Here,
    /// the move element is used to define the upper left hand corner as the starting
    /// point for the path.](path-element-move.png)
    ///
    /// - Parameter p: The point to move the path to.
    public mutating func move(to p: CGPoint) { }

    /// Appends a straight line segment from the current point to the specified
    /// point.
    ///
    /// ```
    /// struct OneHundredPointLine: View {
    ///     var body: some View {
    ///         Path { path in
    ///             path.move(to: .zero)
    ///             path.addLine(to: CGPoint(x: 100, y: 0))
    ///         }
    ///         .stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a short line segment originating at the upper
    /// left hand corner of the screen and extending directly to the right. Here,
    /// the addLine element is used to define the line itself and the new current point.](path-element-move.png)
    ///
    /// - Parameter p: The point to draw a line to.
    public mutating func addLine(to p: CGPoint) { }

    /// Adds a quadratic Bézier curve to the path, with the specified end point
    /// and control point.
    ///
    /// ```
    /// struct CurvedLineView: View {
    ///     var body: some View {
    ///         Path { path in
    ///             path.move(to: .zero)
    ///             path.addQuadCurve(to: CGPoint(x: 100, y: 100),
    ///                               control: CGPoint(x: 200, y: 0))
    ///         }
    ///         .stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black quadcurve originating at the
    /// upper left hand corner of the screen, which curves into the screen
    /// and then promptly back out as rendered by the addQuadCurve element.](QUADCURVE.png)
    ///
    /// - Parameters:
    ///   - p: The point to end the quad curve at.
    ///   - cp: The control point to use for drawing the quad curve.
    public mutating func addQuadCurve(to p: CGPoint, control cp: CGPoint) { }

    /// Adds a cubic Bézier curve to the path, with the specified end point and
    /// control points.
    ///
    /// ```
    /// struct FunkySView: View {
    ///     var body: some View {
    ///         Path { path in
    ///             path.move(to: .zero)
    ///             path.addCurve(to: CGPoint(x: 100, y: 100),
    ///                           control1: CGPoint(x: 100, y: 0),
    ///                           control2: CGPoint(x: 0, y: 100))
    ///         }
    ///         .stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a small curve originating at the upper
    /// left hand corner of the screen which curves into the screen, then down,
    /// and then further to the right into the screen. The inflection points of
    /// this curve are dictated by the control points as passed to addCurve.](path-element-curve.png)
    ///
    /// - Parameters:
    ///   - p: The point to end the curve at.
    ///   - cp1: The first control point to use for drawing the curve.
    ///   - cp2: The second control point to use for drawing the curve.
    public mutating func addCurve(to p: CGPoint, control1 cp1: CGPoint, control2 cp2: CGPoint) { }

    /// Closes and completes the current subpath.
    ///
    /// ```
    /// struct LazyTriangleView: View {
    ///     var body: some View {
    ///         Path { path in
    ///             path.move(to: .zero)
    ///             path.addLine(to: CGPoint(x: 100, y: 0))
    ///             path.addLine(to: CGPoint(x: 100, y: 100))
    ///             // Getting lazy 😴
    ///             path.closeSubpath()
    ///         }
    ///         .stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a small triangle in the upper left hand
    /// corner of the screen which is closed using the closeSubpath element.](lazy-triangle.png)
    ///
    public mutating func closeSubpath() { }

    /// Adds a rectangular subpath to the path.
    ///
    /// Use this method to add a rectangular subpath to an existing path.
    /// See [`CGRect`](https://developer.apple.com/documentation/coregraphics/cgrect)
    /// for info on how to make a rectangle.
    /// See
    /// [`CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgaffinetransform)
    /// for info on how to make an affine transform.
    ///
    /// ```
    /// struct RectangularPathView: View {
    ///     var body: some View {
    ///         RectangularShape()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct RectangularShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { path in
    ///             path.addRect(rect, transform: .init(scaleX: 0.5, y: 0.25))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black rectangle in the upper left corner
    /// of the screen, which spans half the width of the screen and a quarter of the
    /// height, as rendered by the transform applied to the path.](path-addrect-transform.png)
    ///
    /// - Parameters:
    ///   - rect: The rectangle to use for adding the rectangular path.
    ///   - transform: The CGAffineTransform to apply to the rectangular path.
    public mutating func addRect(_ rect: CGRect, transform: CGAffineTransform = .identity) { }

    /// Adds a rounded rectangle to the path.
    ///
    /// Use this method to add a rounded rectangular subpath to an existing
    /// path. See [`CGRect`](https://developer.apple.com/documentation/coregraphics/cgrect)
    /// for info on how to make an rectangle.
    /// See [`CGSize`](https://developer.apple.com/documentation/coregraphics/cgsize)
    /// for info on how to create a corner size.
    /// See ``RoundedCornerStyle`` for info on the available corner
    /// styles.
    /// See [`CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgaffinetransform)
    /// for info on how to make an affine
    /// transform.
    ///
    /// ```
    /// struct RoundedRectangularPathView: View {
    ///     var body: some View {
    ///         RoundedRectangularShape()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct RoundedRectangularShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { path in
    ///             path.addRoundedRect(in: rect,
    ///                          cornerSize: .init(width: 10, height: 10),
    ///                          style: .continuous,
    ///                          transform: .init(scaleX: 0.5, y: 0.25))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - rect: The rectangular bounds for the rounded rectangle subpath.
    ///   - cornerSize: The CGSize for the rounded corners.
    ///   - style: The rounded corner style.
    ///   - transform: The affine transform to apply to the rounded
    ///   rectangle subpath.
    ///
    /// ![A screenshot displaying a thin black rounded rectangle in the upper left corner
    /// of the screen, which spans half the width of the screen and a quarter of the
    /// height, as rendered by the transform applied to the path.](add-rr.png)
    ///
    public mutating func addRoundedRect(in rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .circular, transform: CGAffineTransform = .identity) { }

    /// Adds an ellipse to the path.
    ///
    /// Use this method to add an oval subpath to an existing path.
    /// See [`CGRect`](https://developer.apple.com/documentation/coregraphics/cgrect)
    /// for info on how to make a rectangle.
    /// See [`CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgaffinetransform)
    /// for info on how to make an affine transform.
    ///
    /// ```
    /// struct OvalPathView: View {
    ///     var body: some View {
    ///         OvalShape()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct OvalShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { path in
    ///             path.addEllipse(in: rect, transform: .init(scaleX: 0.5, y: 0.25))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black ellipse in the upper left corner
    /// of the screen, which spans half the width of the screen and a quarter of the
    /// height, as rendered by the transform applied to the path.](path-add-ellipse.png)
    ///
    /// - Parameters:
    ///   - rect: The bounding rectangle for the oval subpath.
    ///   - transform: The transform to apply to the oval subpath.
    public mutating func addEllipse(in rect: CGRect, transform: CGAffineTransform = .identity) { }

    /// Adds a sequence of rectangular subpaths to the path.
    ///
    /// Use this method to add an oval subpath to an existing path.
    /// See [`CGRect`](https://developer.apple.com/documentation/coregraphics/cgrect)
    /// for info on how to make a rectangle.
    /// See [`CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgaffinetransform)
    /// for info on how to make an affine transform.
    ///
    /// ```
    /// struct RectanglesPathView: View {
    ///     var body: some View {
    ///         RectanglesShape()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct RectanglesShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let rects = [
    ///             rect,
    ///             rect.insetBy(dx: 30, dy: 10)
    ///         ]
    ///         return Path { path in
    ///             path.addRects(rects, transform: .init(scaleX: 0.5, y: 0.25))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying one rectangle inset within another in the upper
    /// left corner of the screen. The path transform renders both rectangles at the
    /// same scale and maintains their relative positions.](add-Rects.png)
    ///
    /// - Parameters:
    ///   - rects: The rectangles for the rectangular subpaths.
    ///   - transform: The transform to apply to the rectangular subpaths.
    public mutating func addRects(_ rects: [CGRect], transform: CGAffineTransform = .identity) { }

    /// Adds a sequence of connected straight-line segments to the path.
    ///
    /// Use this method to add connected lines to a path by specifying
    /// their connecting points. See
    /// [`CGPoint`](https://developer.apple.com/documentation/coregraphics/cgpoint)
    /// for info on how to create a point.
    ///
    /// ```
    /// struct LinesPathView: View {
    ///     var body: some View {
    ///         LinesShape()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct LinesShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let points = [
    ///             CGPoint(x: 0, y: 0),
    ///             CGPoint(x: 50, y: 300),
    ///             CGPoint(x: 300, y: 300)
    ///         ]
    ///         return Path { path in
    ///             path.addLines(points)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black path made up of two line segments;
    /// the first extends from the upper left corner towards the center of the screen,
    /// while the second extends directly to the right from the endpoint of the first.
    /// The path is made up of a series of three CGPoints (including zero as a start
    /// point) connected by the addLines method.](path-addlines.png)
    ///
    /// - Parameter lines: The ordered points specifying the connecting places
    /// for the new subpath to be added.
    public mutating func addLines(_ lines: [CGPoint]) { }

    /// Adds an arc of a circle to the path, specified with a radius and a
    /// difference in angle.
    ///
    /// Use this method to add a relative arc to an existing path.
    /// See [`CGPoint`](https://developer.apple.com/documentation/coregraphics/cgpoint)
    /// for how to create a relative center point.
    /// See ``Angle`` for info on how to create an angle.
    /// See [`CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgaffinetransform)
    /// for info on how to create a transform.
    ///
    /// ```
    /// struct RelativeArcPathView: View {
    ///     var body: some View {
    ///         RelativeArcShape()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct RelativeArcShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { path in
    ///             path.addRelativeArc(center: CGPoint(x: 200, y: 200),
    ///                                 radius: 300,
    ///                                 startAngle: Angle(degrees: 180),
    ///                                 endAngle: Angle(degrees: 90),
    ///                                 transform: CGAffineTransform(scaleX: 0.5, y: 0.25))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black arc in the upper half of the screen,
    /// which is rendered by the addRelativeArc method with a new center defined
    /// in the upper left, inset from the corner.](path-relativearc.png)
    ///
    /// - Parameters:
    ///   - center: The center point of the relative arc.
    ///   - radius: The radius of the relative arc.
    ///   - startAngle: The starting angle of the relative arc, measured
    ///   clockwise from the 3 o'clock position.
    ///   - delta: The angle to draw the relative arc, beginning with the
    ///   start angle and sweeping clockwise.
    ///   - trasnform: The affine transform to apply to the arc.
    public mutating func addRelativeArc(center: CGPoint, radius: CGFloat, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity) { }

    /// Adds an arc of a circle to the path, specified with a radius and angles.
    ///
    /// Use this method to add an arc by specifying a start angle and an
    /// end angle.
    ///
    /// To instead add an arc subpath via a relative angle to a starting point,
    /// use ``Path/addRelativeArc(center:radius:startAngle:delta:transform:)``.
    ///
    /// ```
    /// struct ArcPathView: View {
    ///     var body: some View {
    ///         ArcShape()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct ArcShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { path in
    ///             path.addArc(center: CGPoint(x: 200, y: 200),
    ///                         radius: 100,
    ///                         startAngle: .degrees(180),
    ///                         endAngle: .degrees(90),
    ///                         clockwise: true,
    ///                         transform: CGAffineTransform(scaleX: 0.5, y: 0.25))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black arc in the upper half of the screen,
    /// which is rendered by the addArc method with a new center defined
    /// in the upper left, inset from the corner.](path-addarc.png)
    ///
    /// - Parameters:
    ///   - center: The center point of the relative arc.
    ///   - radius: The radius of the relative arc.
    ///   - startAngle: The starting angle of the arc, measured
    ///   clockwise from the 3 o'clock position.
    ///   - endAngle: The ending angle of the arc, measured clockwise
    ///   from the 3 o'clock position.
    ///   clockwise: Whether to draw the arc clockwise (false means counter-clockwise).
    ///   transform: The affine transform to apply to the arc.
    public mutating func addArc(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool, transform: CGAffineTransform = .identity) { }

    /// Adds an arc of a circle to the path, specified with a radius and two
    /// tangent lines.
    ///
    /// Use this method to add an arc subpath to the path by specifying
    /// a radius along with the two tangent lines.
    ///
    /// ```
    /// struct ArcPathView: View {
    ///     var body: some View {
    ///         ArcShape()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct ArcShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { path in
    ///             path.move(to: .zero)
    ///             path.addArc(tangent1End: CGPoint(x: 100, y: 150),
    ///                         tangent2End: CGPoint(x: 300, y: 50),
    ///                         radius: 100,
    ///                         transform: CGAffineTransform(scaleX: 0.9, y: 1.1))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black arc that originates in the upper left
    /// corner of the screen and extends towards the center before turning back up
    /// towards the top. The arc is rendered by specifying two lines tangent to it
    /// along with a radius.](path-addarc-2.png)
    ///
    /// - Parameters:
    ///   - p1: The first point that defines the tangent line of the arc.
    ///   - p2: The second point that defines the tangent line of the arc.
    ///   - radius: The radius of the arc.
    ///   - transform: The affine transform to apply to the subpath.
    public mutating func addArc(tangent1End p1: CGPoint, tangent2End p2: CGPoint, radius: CGFloat, transform: CGAffineTransform = .identity) { }

    /// Appends a copy of the given path to this path.
    ///
    /// Use this method if your subpath has already been created, and
    /// you would like to append it to this path.
    ///
    /// ```
    /// struct LongWindedRectangleView: View {
    ///     var body: some View {
    ///         LongWindedRectangle()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct LongWindedRectangle: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { path in
    ///             path.addPath(Path(rect))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black rectangular path inset slightly
    /// from the edges of the screen.](path-addpath.png)
    ///
    /// - Parameters:
    ///   - path: The path to add as a subpath to this path.
    ///   - transform: The affine transform to apply to the subpath.
    public mutating func addPath(_ path: Path, transform: CGAffineTransform = .identity) { }

    /// Returns the last point in the path, or nil if the path contains
    /// no points.
    ///
    /// ```
    /// struct ShapeView: View {
    ///     var body: some View {
    ///         AnotherShape()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct AnotherShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { path in
    ///             path.addArc(center: .zero, radius: 100,
    ///                         startAngle: .zero, endAngle: .degrees(60), clockwise: false)
    ///             path.addArc(center: path.currentPoint!, radius: 100,
    ///                         startAngle: .zero, endAngle: .degrees(60), clockwise: false)
    ///             path.addArc(center: path.currentPoint!, radius: 100,
    ///                         startAngle: .zero, endAngle: .degrees(60), clockwise: false)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a set of three identical arcs each attached
    /// by a line segment. currentPoint is used to specify where each new arc needs
    /// to start in order for them all to be evenly connected.](path-currentpoint.png)
    public var currentPoint: CGPoint? { get }

    /// Returns a path constructed by applying the transform to all points of
    /// the path.
    ///
    /// ```
    /// struct SlightlyDistortedShapeView: View {
    ///     var body: some View {
    ///         NormalShape()
    ///             .stroke()
    ///             .padding()
    ///     }
    /// }
    ///
    /// struct NormalShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path(rect)
    ///             .applying(CGAffineTransform(scaleX: 0.5, y: 1))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black rectangle that spans the left side
    /// of the screen. The transform applies to the entire path and scales the x
    /// axis down so that the rectangle only occupies the left side.](path-applying.png)
    ///
    /// - Parameter transform: The affine transform to apply to this path.
    public func applying(_ transform: CGAffineTransform) -> Path { }

    /// Returns a path constructed by translating `self` by `(dx, dy)`.
    ///
    /// ```
    /// struct SlightlyOffsetShapeView: View {
    ///     var body: some View {
    ///         Mirror()
    ///             .stroke()
    ///     }
    /// }
    ///
    /// struct Mirror: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path(ellipseIn: rect)
    ///             .offsetBy(dx: 20, dy: 20)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin black elliptical path that is offset
    /// to the lower right of the screen, cutting off its right side and bottom.](path-offset.png)
    ///
    /// - Parameters:
    ///   - dx: The number of points of horizontal offset to the right.
    ///   - dy: The number of points of vertical offset down.
    public func offsetBy(dx: CGFloat, dy: CGFloat) -> Path { }
}

