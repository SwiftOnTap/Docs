/// A structure describing how to stroke a ``Shape`` in a particular style.
///
/// Use this structure to stroke (add a border to) a ``Shape`` in a customized way.
///
/// - Note: You cannot use a `StrokeStyle` when applying a
/// ``View/border(_:width:)`` to a ``View``. Instead, use ``ShapeStyle``.
///
/// ### Creating a `StrokeStyle`
///
/// Create a `StrokeStyle` using its initilizer,
/// ``StrokeStyle/init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)``.
/// A simple example is below.
///
/// ```
/// let style = StrokeStyle(lineWidth: 5, lineCap: .butt)
/// ```
///
/// ### Using a `StrokeStyle`
///
/// Use the ``Shape/stroke(_:style:)``
/// or ``Shape/stroke(style:)`` methods to add a custom stroke
/// to a ``Shape``.
///
/// For example, here is a stroke style applied to a ``Capsule``:
///
/// ```
/// struct StrokedCapsuleView: View {
///     let style = StrokeStyle(lineWidth: 5,
///                             lineCap: .round,
///                             lineJoin: .miter,
///                             miterLimit: 0,
///                             dash: [5, 10],
///                             dashPhase: 0)
///     var body: some View {
///         Capsule()
///             .stroke(Color.purple, style: style)
///     }
/// }
/// ```
///
/// ![A screenshot displaying a purple capsule shape made up of purple dashes
/// that touches all four edges of the screen. StrokeStyle is used to specify
/// the style of the dashes that make up the capsule shape.](stroke-style.png)
///
/// In addition, two special kinds of ``Shape``s have their own methods
/// for adding strokes with custom styles:
/// - ``InsettableShape``: An insettable shape allows you to inset the shape
/// by half the stroke width, then apply the stroke, so that the final
/// result remains inside the original frame. To achieve this effect,
/// use one of these methods:
///     - ``InsettableShape/strokeBorder(_:style:antialiased:)``
///     - ``InsettableShape/strokeBorder(style:antialiased:)``
///
/// ```
/// struct CircleView: View {
///     var body: some View {
///         let style = StrokeStyle(lineWidth: 15,
///                                 lineCap: .butt,
///                                 lineJoin: .round,
///                                 miterLimit: 1,
///                                 dash: [],
///                                 dashPhase: 0)
///
///         return Circle()
///             .strokeBorder(style: style)
///             .border(Color.primary)
///     }
/// }
/// ```
///
/// ![A screenshot displaying a thin black rectangular border hugging the edges
/// of the screen with a thick black circular border inset. Here, there is no value
/// passed to dash, so the circle appears as a consistent thick line.](insettableshape-strokeborder.png)
///
/// - ``Path``: A path is a special kind of customizable shape. Use path's
/// special stroking method, ``Path/strokedPath(_:)``, to return another path,
/// rather than a generic shape.
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
/// ![A screenshot displaying a black rectangular border hugging the edges
/// of the screen made up of two dashes followed by a dot. Setting the lineJoin
/// parameter as bevel places the dot between the dashes.](strokedpath.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct StrokeStyle : Equatable {

    /// The width of the stroke, specified in points.
    ///
    /// This property can be written to or read directly, but it
    /// can also be specified in the initilizer,
    /// ``StrokeStyle/init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)``.
    ///
    /// ```
    /// struct CircleView: View {
    ///     var body: some View {
    ///         var style = StrokeStyle()
    ///         style.lineWidth = 16
    ///
    ///         return Circle()
    ///             .stroke(style: style)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a large circle in the center of the screen
    /// which has its lineWidth set to 16 points, rendering as a thick black
    /// border.](strokestyle-linewidth.png)
    ///
    /// - Note: If you just want to specify a stroke's line width,
    /// you can do this directly using ``Shape/stroke(lineWidth:)``.
    public var lineWidth: CGFloat

    /// The style for rendering the endpoint of the stroke line.
    ///
    /// This property can be written to or read directly, but it
    /// can also be specified in the initilizer,
    /// ``StrokeStyle/init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)``.
    ///
    /// There are 3 types of line caps:
    /// - `.square`
    /// - `.round`
    /// - `.butt`
    ///
    /// To illustrate, begin with this custom semicircle shape:
    ///
    /// ```
    /// struct Semicircle: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let center = CGPoint(x: rect.midX, y: rect.midY)
    ///         let radius = rect.width / 3
    ///         let startAngle = Angle.zero
    ///         let endAngle = Angle(degrees: 180)
    ///         let clockwise = true
    ///
    ///         return Path { p in
    ///             p.addArc(center: center,
    ///                      radius: radius,
    ///                      startAngle: startAngle,
    ///                      endAngle: endAngle,
    ///                      clockwise: clockwise)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// Now apply `.square` line cap, and some ``StrokeStyle/lineWidth`` so we can see
    /// the effect:
    ///
    /// ```
    /// struct CircleView: View {
    ///     var body: some View {
    ///         var style = StrokeStyle()
    ///         style.lineCap = .square
    ///         style.lineWidth = 20
    ///
    ///         return Semicircle()
    ///             .stroke(Color.pink, style: style)
    ///     }
    /// }
    /// ```
    ///
    /// ![A pink semicircle in the center of the screen with square edges,
    /// appearing as if the circle had its bottom half sliced off.](linecap-square.png)
    ///
    /// You can see the edges protrude slightly as squares.
    /// If we change the `lineCap` to `.round`, we can see the corners
    /// change look:
    ///
    /// ```
    /// struct CircleView: View {
    ///     var body: some View {
    ///         var style = StrokeStyle()
    ///         style.lineCap = .round
    ///         style.lineWidth = 20
    ///
    ///         return Semicircle()
    ///             .stroke(Color.purple, style: style)
    ///     }
    /// }
    /// ```
    ///
    /// ![A pink semicircle in the center of the screen with round edges on either
    /// end, rendered by setting the linecap to round.](linecap-round.png)
    ///
    /// That's a bit softer. Finally, `.butt` is just standard, cut-off
    /// line caps as you would expect:
    ///
    /// ```
    /// struct CircleView: View {
    ///     var body: some View {
    ///         var style = StrokeStyle()
    ///         style.lineCap = .butt
    ///         style.lineWidth = 20
    ///
    ///         return Semicircle()
    ///             .stroke(Color.orange, style: style)
    ///     }
    /// }
    /// ```
    ///
    /// ![An orange semicircle in the center of the screen with flat edges,
    /// appearing as if the circle had its bottom half sliced off. Here, the
    /// edges protrude slightly less than they would had the square case been used.](linecap-butt.png)
    ///
    public var lineCap: CGLineCap

    /// The style for rendering the joining point of stroked lines.
    ///
    /// Line join is the property of a ``StrokeStyle`` describing what
    /// happens at places where the ``Path`` makes sharp turns. There
    /// are 3 types of `lineJoin`:
    /// - `.bevel` - Chopped-off corners
    /// - `.miter` - Sharp corners
    /// - `.round` - Smooth corners
    ///
    /// This property can be written to or read directly, but it
    /// can also be specified in the initilizer,
    /// ``StrokeStyle/init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)``.
    ///
    /// To illustrate, begin with this custom arch shape:
    ///
    /// ```
    /// struct Arch: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let point1 = CGPoint(x: rect.minX, y: rect.midY)
    ///         let point2 = CGPoint(x: rect.midX, y: rect.midY - rect.width / 2)
    ///         let point3 = CGPoint(x: rect.maxX, y: rect.midY)
    ///
    ///         return Path { p in
    ///             p.move(to: point1)
    ///             p.addLine(to: point2)
    ///             p.addLine(to: point3)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// Stroke it to see the shape:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Arch().stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![Two thin black line segments that originate on either side of the
    /// center of the screen and join at a point in the upper half.](linejoin.png)
    ///
    /// Now apply `.bevel` line join, and some ``StrokeStyle/lineWidth`` so we can see
    /// the effect:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         var style = StrokeStyle()
    ///         style.lineJoin = .bevel
    ///         style.lineWidth = 50
    ///
    ///         return Arch()
    ///             .stroke(Color.pink, style: style)
    ///             .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![Two thick pink line segments that originate on either side of the center
    /// of the screen and join at a bevel in the upper half, giving the point a
    /// flat top.](bevel.png)
    ///
    /// You can see the "chopped off" corners.
    /// If we change the `lineJoin` to `.round`, we can see the corners
    /// change look:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         var style = StrokeStyle()
    ///         style.lineJoin = .round
    ///         style.lineWidth = 50
    ///
    ///         return Arch()
    ///             .stroke(Color.purple, style: style)
    ///             .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![Two thick purple line segments that originate on either side of the center
    /// of the screen and meet at a rounded point in the upper half, as rendered
    /// by changing the lineJoin style to .round.](linejoin-round.png)
    ///
    /// That's a bit softer. Finally, `.miter` is just standard, sharp
    /// corners as you would expect:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         var style = StrokeStyle()
    ///         style.lineJoin = .miter
    ///         style.lineWidth = 50
    ///
    ///         return Arch()
    ///             .stroke(Color.orange, style: style)
    ///             .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![Two thick purple line segments that originate on either side of the center
    /// of the screen and join at a sharp point in the upper half, as rendered
    /// by changing the lineJoin style to .miter.](linejoin-miter.png)
    public var lineJoin: CGLineJoin

    /// The limit on the ratio of the miter length to stroke width.
    ///
    /// According to Apple's documentation, `miterLimit` is "the limit
    /// on the ratio of the miter length to stroke width." If this is
    /// still unclear, here is a deep dive.
    ///
    /// ### What is miter length?
    ///
    /// `miter` is a type of ``StrokeStyle/lineJoin`` which has
    /// pointed corners at sharp turns. This is in contrast to `round`
    /// ``StrokeStyle/lineJoin``, which has rounded corners, and
    /// `bevel` ``StrokeStyle/lineJoin``, which has chopped-off corners.
    ///
    /// Take a shape like this:
    ///
    /// ```
    /// struct Arch: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let point1 = CGPoint(x: rect.minX, y: rect.midY)
    ///         let point2 = CGPoint(x: rect.midX, y: rect.midY - rect.width / 2)
    ///         let point3 = CGPoint(x: rect.maxX, y: rect.midY)
    ///
    ///         return Path { p in
    ///             p.move(to: point1)
    ///             p.addLine(to: point2)
    ///             p.addLine(to: point3)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// Apply ``Shape/stroke(lineWidth:)`` to see the shape:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Arch().stroke()
    ///     }
    /// }
    /// ```
    ///
    /// ![Two thin black line segments that originate on either side of the
    /// center of the screen and join at a point in the upper half.](linejoin.png)
    ///
    /// Now, stroke it with `50` pt ``StrokeStyle/lineWidth``, and
    /// compare `miter` ``StrokeStyle/lineJoin`` with `bevel`
    /// ``StrokeStyle/lineJoin``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     let style1 = StrokeStyle(lineWidth: 50, lineJoin: .miter)
    ///     let style2 = StrokeStyle(lineWidth: 50, lineJoin: .bevel)
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Arch()
    ///                 .stroke(Color.pink, style: style1) // Miter
    ///             Arch()
    ///                 .stroke(Color.purple, style: style2) // Bevel
    ///         }
    ///         .padding(50)
    ///     }
    /// }
    /// ```
    ///
    /// ![Two arches in a VStack; the first is made up of two thick pink lines
    /// that join using miter and form a sharp point, the second is made up of two
    /// thick purple lines that join at a bevel and form a flat top.](miter-bevel.png)
    ///
    /// So what is the **miter length**? We can figure this out using math. In the
    /// top image above, miter length is the distance from the inside of the
    /// corner to the outside. Well, we know the line width (`50`), and we
    /// know the angle of the line join is 90 degrees, so we can use
    /// trigonometry.
    ///
    /// Looking at the following diagram, we can see that the **miter length**
    /// of the corner on top
    /// is the square root of 2, or about `1.4142135`, times the line width, `50`:
    ///
    /// ![An isosceles right triangle with sides 1 and hypotenuse square root 2.](square-root-of-2.png)
    ///
    /// ### What is miter limit?
    ///
    /// Once we know the miter length, we can figure out what the maximum
    /// possible miter limit. Recall, miter limit is the **maximum
    /// ratio of the miter length to stroke width**.
    ///
    /// So if we pass in a miter limit greater than the square root of 2,
    /// we should get normal miters. And if we we pass in a miter
    /// limit less than the square root of 2, we should get "limited"
    /// miters:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         var style1 = StrokeStyle(lineWidth: 50, lineJoin: .miter)
    ///         var style2 = StrokeStyle(lineWidth: 50, lineJoin: .miter)
    ///
    ///         style1.miterLimit = 1.4142136
    ///         style2.miterLimit = 1.4142135
    ///
    ///         return VStack {
    ///             Arch()
    ///                 .stroke(Color.pink, style: style1) // ...6
    ///             Arch()
    ///                 .stroke(Color.orange, style: style2) // ...5
    ///         }
    ///         .padding(50)
    ///     }
    /// }
    /// ```
    ///
    /// ![Two arches in a VStack; the first is made up of two thick pink lines
    /// that join using miter and form a sharp point, the second is made up of two
    /// thick orange lines that join at a bevel and form a flat top. Both use
    /// the miter style for joining lines, but in the second the actual miter in the
    /// shape exceeds the set miter limit, so it turns to a bevel.](miter-limit.png)
    ///
    /// So if the actual miter in the shape exceeds the `miterLimit` that
    /// you set, your ``ShapeStyle/lineJoin`` turns from `miter` to `bevel`!
    /// That's what it means to have limited miters.
    ///
    public var miterLimit: CGFloat

    /// The dash array for allowing the stroke to show discontinuities.
    ///
    /// The dash array specifies the length of **drawn** and **un-drawn** portions
    /// of a stroked path.
    ///
    /// To follow along, use this straight, horizontal line ``Shape``:
    ///
    /// ```
    /// struct Line: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let start = CGPoint(x: rect.minX, y: rect.midY)
    ///         let end = CGPoint(x: rect.maxX, y: rect.midY)
    ///
    ///         return Path { p in
    ///             p.move(to: start)
    ///             p.addLine(to: end)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// By default, the dash array is empty, meaning the line is solid:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         let style = StrokeStyle(lineWidth: 20)
    ///
    ///         return Line()
    ///             .stroke(Color.pink, style: style)
    ///     }
    /// }
    /// ```
    ///
    /// ![A thick horizontal pink line spanning the center of the screen. The
    /// empty dash array renders a solid line.](dash-1.png)
    ///
    /// If we specify a dash array of `[40]`, then there is only one element.
    /// This means the first line gets drawn `40` pts long, then the pattern
    /// repeats. A blank space `40` pts long gets drawn, then another `40` pt
    /// line, and so on:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         var style = StrokeStyle(lineWidth: 20)
    ///         style.dash = [40]
    ///
    ///         return Line()
    ///             .stroke(Color.pink, style: style)
    ///     }
    /// }
    /// ```
    ///
    /// ![A thick dashed, horizontal pink line spanning the center of the screen.
    /// Here, the dash array is passed a single value of 40, so there is a single
    /// pattern that repeats with the white space as long as its corresponding
    /// pink space.](dash-2.png)
    ///
    /// Next, we specify a dash array of `[60, 20]`. This begins by drawing
    /// a `60` pt line, then a `20` pt space. Then the pattern repeats
    /// with a `60` pt line, another `20` pt space, and so on:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         var style = StrokeStyle(lineWidth: 20)
    ///         style.dash = [60, 20]
    ///
    ///         return Line()
    ///             .stroke(Color.pink, style: style)
    ///     }
    /// }
    /// ```
    ///
    /// ![A thick dashed, horizontal pink line spanning the center of the screen.
    /// Here, the dash array is passed two values of 60 and 20, so the pink lines
    /// extend 60 points followed by 20 points of white space.](dash-3.png)
    ///
    /// Finally, we specify a dash array of `[30, 10, 5]`. This begins by
    /// drawing a `30` pt line, then a `10` pt space, then a `5` pt line.
    /// Then the pattern repeats, so it draws a `30` pt space, then a
    /// `10` pt line, then a `5` pt space. And so on. We get a funny
    /// looking dash here, but the pattern makes sense if you follow it:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         var style = StrokeStyle(lineWidth: 20)
    ///         style.dash = [30, 10, 5]
    ///
    ///         return Line()
    ///             .stroke(Color.pink, style: style)
    ///     }
    /// }
    /// ```
    ///
    /// ![A thick dashed, horizontal pink line spanning the center of the screen.
    /// Here, the dash array is passed three values of 30, 10 and 5, so the pink lines
    /// are no longer uniform. Instead, there is a pink dash 30 points long, followed
    /// by a 10 point space, followed by a 5 point dash, and then a 30 point space.](dash-4.png)
    ///
    /// We could continue this pattern indefinitely.
    ///
    public var dash: [CGFloat]

    /// The dash phase for moving the dashes forward or backward along the stroke.
    ///
    /// This property offsets the phase of the dash pattern by a
    /// specified number of pts. (See ``StrokeStyle/dash`` if you aren't
    /// familiary with how to create a dashed ``StrokeStyle``.)
    ///
    /// Take this `Line` ``Shape``:
    ///
    /// ```
    /// struct Line: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         let start = CGPoint(x: rect.minX, y: rect.midY)
    ///         let end = CGPoint(x: rect.maxX, y: rect.midY)
    ///
    ///         return Path { p in
    ///             p.move(to: start)
    ///             p.addLine(to: end)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// Applying a `dashPhase` will move the first dash up by 15 points.
    /// Compare the two stroked lines below:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         var style1 = StrokeStyle(lineWidth: 10, dash: [80, 5])
    ///         var style2 = StrokeStyle(lineWidth: 10, dash: [80, 5])
    ///
    ///         style1.dashPhase = 15 // Move the first line up 15 pts
    ///         style2.dashPhase = 0
    ///
    ///         return VStack {
    ///             Line()
    ///                 .stroke(Color.pink, style: style1)
    ///             Line()
    ///                 .stroke(Color.pink, style: style2)
    ///         }
    ///         .frame(height: 30)
    ///     }
    /// }
    /// ```
    ///
    /// ![Two dashed pink lines in a VStack that span the center of the screen.
    /// The lines are identical, but the first applies a dash phase of 15 pts, which
    /// moves it "back" in its cycle, making the first dash appear shorter.](dashphase.png)
    ///
    public var dashPhase: CGFloat

       /// Creates a custom stroke style.
    ///
    /// A stoke style has 6 components:
    /// - ``StrokeStyle/lineWidth``
    /// - ``StrokeStyle/lineCap``
    /// - ``StrokeStyle/lineJoin``
    /// - ``StrokeStyle/miterLimit``
    /// - ``StrokeStyle/dash``
    /// - ``StrokeStyle/dashPhase``
       ///
    /// Visit one of those pages to learn more about an individual property,
    /// or play with the values in the example below.
    /// See ``StrokeStyle`` for info on how to use a stroke style once it
    /// is created.
    ///
    /// ```
    /// struct WeirdStrokedCircleView: View {
    ///     let style = StrokeStyle(lineWidth: 15.0,
    ///                             lineCap: .butt,
    ///                             lineJoin: .bevel,
    ///                             miterLimit: 24.0,
    ///                             dash: [25.0, 25.0, 0.0, 25.0],
    ///                             dashPhase: 3.0)
    ///     var body: some View {
    ///         Circle()
    ///             .stroke(style: style)
    ///     }
    /// }
    /// ```
    ///
    /// ![A large black circle in the center of the screen with a stroke that
    /// alternates between a thick black dash, white space, and a thin black dash.
    /// The custom stroke style is set within the initializer.](weird-circle.png)
    ///
       /// - Parameters:
       ///   - lineWidth: The stroke line width.
       ///   - lineCap: The stroke line cap style.
       ///   - lineJoin: The stroke line join style.
       ///   - miterLimit: The stroke miter limit.
       ///   - dash: The stroke dash array.
       ///   - dashPhase: The stroke dash phase.
    public init(lineWidth: CGFloat = 1, lineCap: CGLineCap = .butt, lineJoin: CGLineJoin = .miter, miterLimit: CGFloat = 10, dash: [CGFloat] = [CGFloat](), dashPhase: CGFloat = 0) { }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: StrokeStyle, b: StrokeStyle) -> Bool { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension StrokeStyle : Animatable {

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>

    /// The data to animate.
    public var animatableData: StrokeStyle.AnimatableData
}

