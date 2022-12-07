/// Specifies the timing curve of a changing on-screen value.
///
/// ### An `Animation` is just a timing curve
///
/// Every animation has 3 parts:
/// 1. The numerical value in memory that changes over time --- usually
/// a `@State` property
/// 2. How the ``View`` depends on this numerical value --- often using
/// a view modifier
/// 3. The timing curve describing how this change happens --- this is the
/// ``Animation``
///
/// For example, say I want the screen to be **green** sometimes, but **red**
/// at other times. The current color of the screen would be stored as a
/// `@State` property. Then, the screen might use the
/// ``View/foregroundColor(_:)`` modifier to actually make the screen this
/// color. And finally, when I change the screen color, I can specify a
/// *timing curve*, or ``Animation``, to describe how it will happen.
///
/// ### Types of timing curves
///
/// There are many different types of timing curves, or `Animation`s.
/// For example, how long does the animation last (**duration**)? Does it move
/// at the same speed the whole time (**linear**), or does it **ease in and out**?
/// Or maybe it goes so fast at the beginning that it actually overshoots
/// the target and has to go back. This is called a **spring** animation.
///
/// #### Main types
///
/// There are a few main types of timing curves:
/// - ``Animation/linear``: The value changes at the same speed the whole time.
/// - ``Animation/easeIn``: The value begins by changing slowly, then speeds
/// up towards the end.
/// - ``Animation/easeOut``: The value begins quickly, and slows down towards
/// the end.
/// - ``Animation/easeInOut``: The value begins by changing slowly, goes quickly
/// in the middle, and ends slowly.
/// - ``Animation/spring(response:dampingFraction:blendDuration:)``: The value begins very quickly, then overshoots
/// the target and springs back.
///
/// #### Modifiers
///
/// There are also a few modifiers that can be applied to timing curves:
/// - ``Animation/delay(_:)``: Waits a period of time before doing the
/// animation.
/// - ``Animation/speed(_:)``: Speeds up or slows down the animation.
/// - ``Animation/repeatCount(_:autoreverses:)``: Repeats the animation a number of
/// times.
/// - ``Animation/repeatForever(autoreverses:)``: Repeats the animation
/// forever
///
/// ### Using an animation
///
/// Once you have an animation, there are 3 main ways to use it:
///
/// 1. By applying it to a view using ``View/animation(_:)``,
/// so any animatable properties of the view change with that
/// timing curve.
/// 2. Directly when changing a `@State` property, using the
/// ``withAnimation(_:_:)`` global function.
/// 3. By attaching the timing curve directly to a `@Binding` property,
/// using ``Binding/animation(_:)``, so any changes to the binding happen
/// with a certain animation.
///
/// See each of those respective pages for specifics of how to use each.
///
/// ### Putting it all together
///
/// Putting all of the sections above together into one example, here
/// is what it looks like:
///
/// ```
/// struct AnimateView: View {
///     @State private var flag = true
///
///     var body: some View {
///         VStack {
///             Rectangle()
///                 .foregroundColor(flag ? .yellow : .red)
///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
///                 .rotationEffect(.degrees(flag ? 90 : 0))
///                 .animation(.easeInOut)
///
///             Button("Animate") {
///                 self.flag.toggle()
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing state variable flag and a VStack with
/// a rectangle and a button reading "Animate"; when the button is pressed, flag
/// is toggled and the properties of the rectangle change, resulting in it
/// changing from yellow to red, growing in size, and rotating 90 degrees, all
/// in an easeInOut animation timing curve type.](animation-ex.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Animation : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Animation, rhs: Animation) -> Bool { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// A persistent spring animation.
    ///
    /// This is a timing curve where the animation happens very quickly
    /// in the beginning, then overshoots the target, and returns back
    /// with a spring effect.
    ///
    /// For example:
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.spring())
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle change
    /// in a fashion where the animation happens very quickly in the beginning,
    /// then overshoots the target, and returns back with a spring effect.](animation-spring-noparams-ex.gif)
    ///
    /// Here, `spring(response:dampingFraction:blendDuration:)`'s parameters
    /// have been adjusted to pronounce the spring:
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.spring(response: 0.75, dampingFraction: 0.5, blendDuration: 0))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle change
    /// in a pronounced spring fashion, as defined by the adjusted response,
    /// dampingFraction, and blendDuration parameters of spring.](animation-spring-pronounced-ex.gif)
    ///
    /// When mixed with other ``Animation/spring(response:dampingFraction:blendDuration:)``
    /// or ``Animation/interactiveSpring(response:dampingFraction:blendDuration:)``
    /// animations on the same property, each
    /// animation will be replaced by their successor, preserving
    /// velocity from one animation to the next. Optionally blends the
    /// response values between springs over a time period.
    ///
    /// - Parameters:
    ///   - response: The stiffness of the spring, defined as an
    ///     approximate duration in seconds. A value of zero requests
    ///     an infinitely-stiff spring, suitable for driving
    ///     interactive animations.
    ///   - dampingFraction: The amount of drag applied to the value
    ///     being animated, as a fraction of an estimate of amount
    ///     needed to produce critical damping.
    ///   - blendDuration: The duration in seconds over which to
    ///     interpolate changes to the response value of the spring.
    /// - Returns: a spring animation.
    public static func spring(response: Double = 0.55, dampingFraction: Double = 0.825, blendDuration: Double = 0) -> Animation { }

    /// A convenience for a `spring()` animation with a lower
    /// `response` value, intended for driving interactive animations.
    ///
    /// This is a timing curve where the animation happens very quickly
    /// in the beginning, then overshoots the target, and returns back
    /// with a spring effect.
    ///
    /// When passed no parameters, the effect does not show, unlike
    /// ``Animation/spring(response:dampingFraction:blendDuration:)``.
    ///
    /// For example:
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.interactiveSpring())
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle change
    /// in a fashion without the spring effect showing.](animation-interactive-spring-ex.gif)
    ///
    /// When passed the same parameters, `interactiveSpring(response:dampingFraction:blendDuration:)`
    /// and ``Animation/spring(response:dampingFraction:blendDuration:)`` produce the same result:
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.interactiveSpring(response: 0.75, dampingFraction: 0.5, blendDuration: 0))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle change
    /// in a pronounced spring fashion, as defined by the adjusted response,
    /// dampingFraction, and blendDuration parameters of interactive spring.](animation-interactive-spring-pronounced-ex.gif)
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.spring(response: 0.75, dampingFraction: 0.5, blendDuration: 0))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle change
    /// in a pronounced spring fashion, as defined by the adjusted response,
    /// dampingFraction, and blendDuration parameters of spring.](animation-spring-pronounced-ex.gif)
    ///
    public static func interactiveSpring(response: Double = 0.15, dampingFraction: Double = 0.86, blendDuration: Double = 0.25) -> Animation { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// An identity animation that happens immediately.
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.default)
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle change
    /// immediately, as defined by the default type property.](animation-default-ex.gif)
    ///
    public static let `default`: Animation
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// An animation where the effect starts out slower and ends slower, while
    /// moving most quickly in the middle.
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.easeInOut(duration: 3.0))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle
    /// change over three seconds, as defined by the duration parameter,
    /// in a fashion where the effect starts out slower and ends slower, while
    /// moving most quickly in the middle.](animation-easeinout-ex.gif)
    ///
    /// - Parameter duration: How long the effect should last.
    public static func easeInOut(duration: Double) -> Animation { }

    /// An animation where the effect starts out slower and ends slower, while
    /// moving most quickly in the middle.
    ///
    /// Uses the default timing of 1 second.
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.easeInOut)
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle
    /// change in a fashion where the effect starts out slower and ends slower,
    /// while moving most quickly in the middle.](animation-ease-in-out-ex.gif)
    ///
    public static var easeInOut: Animation { get }

    /// An animation where the effect starts out slower and then ends more quickly.
    ///
    /// For example,
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.easeIn(duration: 3.0))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle
    /// change over three seconds, as defined by the duration parameter,
    /// in a fashion where the effect starts out slower and then ends more quickly.](animation-ease-in-duration-ex.gif)
    ///
    /// - Parameter duration: How long the effect should last.
    public static func easeIn(duration: Double) -> Animation { }

    /// An animation where the effect starts out slower and then ends more quickly.
    ///
    /// Uses the default timing of 1 second.
    ///
    /// For example,
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.easeIn)
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle
    /// change in a fashion where the effect starts out slower and then ends more
    /// quickly.](animation-ease-in-ex.gif)
    ///
    public static var easeIn: Animation { get }

    /// An animation where the effect starts out more quickly and then slows down.
    ///
    /// For example,
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.easeOut(duration: 3.0))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle
    /// change over three seconds, as defined by the duration parameter,
    /// in a fashion where the effect starts out more quickly and then slows down.](animation-ease-out-duration-ex.gif)
    ///
    /// - Parameter duration: How long the effect should last.
    public static func easeOut(duration: Double) -> Animation { }

    /// An animation where the effect starts out more quickly and then slows down.
    ///
    /// Uses the default timing of 1 second.
    ///
    /// For example,
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.easeOut)
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// !A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle
    /// change in a fashion where the effect starts out more quickly and then
    ///  slows down.](animation-ease-out-ex.gif)
    ///
    public static var easeOut: Animation { get }

    /// An animation where the effect happens at a constant speed throughout.
    ///
    /// For example,
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.linear(duration: 3.0))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle
    /// change over three seconds, as defined by the duration parameter,
    /// in a fashion where the effect happens at a constant speed throughout.](animation-linear-duration-ex.gif)
    ///
    /// - Parameter duration: How long the effect should last.
    public static func linear(duration: Double) -> Animation { }

    /// An animation where the effect happens at a constant speed throughout.
    ///
    /// Uses the default timing of 1 second.
    ///
    /// For example,
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.linear)
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle
    /// change in a fashion where the effect happens at a constant speed
    /// throughout.](animation-linear-ex.gif)
    ///
    public static var linear: Animation { get }

    /// An animation with a fully customized timing curve.
    ///
    /// Use this animation to fully specify a cubic bezier curve for how
    /// the animation moves over a specified duration. In the model,
    /// the x-axis is time, specified as a 0-through-1 fraction.
    /// of the total duration. The y-axis is the 0-through-1 fraction
    /// that the animated property has progressed from beginning to end.
    ///
    /// See [this website](https://cubic-bezier.com/)
    /// for an interactive chart of how the two control points influence
    /// the animation curve.
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.timingCurve(0.42, 0, 0.58, 1, duration: 1.0))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing state variable flag and a VStack with
    /// a rectangle and a button reading "Animate"; when the button is pressed, flag
    /// is toggled and the properties of the rectangle change, resulting in it
    /// changing from yellow to red, growing in size, and rotating 90 degrees,
    /// in a fashion defined by a fully customized timing curve.](animation-timing-curve-ex.gif)
    ///
    /// - Parameters:
    ///   - c0x: The x-coordinate of the first control point.
    ///   - c0y: The y-coordinate of the first control point.
    ///   - c1x: The x-coordinate of the second control point.
    ///   - c1y: The y-coordinate of the second control point.
    ///   - duration: How long the effect should last.
    public static func timingCurve(_ c0x: Double, _ c0y: Double, _ c1x: Double, _ c1y: Double, duration: Double = 0.35) -> Animation { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// A persistent spring animation, specified using a physics spring model.
    ///
    /// An interpolating spring animation that uses a damped spring
    /// model to produce values in the range [0, 1] that are then used
    /// to interpolate within the [from, to] range of the animated
    /// property. Preserves velocity across overlapping animations by
    /// adding the effects of each animation.
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 10))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle
    /// change repeatedly in a persistent spring animation, as specified using a
    /// physics spring model.](animation-interpolating-ex.gif)
    ///
    /// - Parameters:
    ///   - mass: The mass of the object attached to the spring.
    ///   - stiffness: The stiffness of the spring.
    ///   - damping: The spring damping value.
    ///   - initialVelocity: the initial velocity of the spring, as
    ///     a value in the range [0, 1] representing the magnitude of
    ///     the value being animated.
    /// - Returns: a spring animation.
    public static func interpolatingSpring(mass: Double = 1.0, stiffness: Double, damping: Double, initialVelocity: Double = 0.0) -> Animation { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// Adds delay to your animation that runs before it starts.
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(Animation.easeInOut.delay(1))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, there is a one second delay and
    /// then the properties of the rectangle change in an easeInOut fashion.](animation-delay-ex.gif)
    ///
    /// - Parameter delay: How long the animation will wait before starting, in seconds.
    public func delay(_ delay: Double) -> Animation { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// Changes the speed of an animation.
    ///
    /// Returns an animation that has its speed multiplied by `speed`. For
    /// example, if you had `oneSecondAnimation.speed(0.25)`, it would be at 25%
    /// of its normal speed, so you would have an animation that would last 4
    /// seconds.
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(Animation.easeInOut.speed(2))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the properties of the rectangle
    /// change quickly in an easeInOut fashion, as specified by a higher speed.](animation-speed-ex.gif)
    ///
    public func speed(_ speed: Double) -> Animation { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// Adjusts the number of times the animation should repeat itself.
    ///
    /// ```
    /// struct AnimateView: View {
    ///     @State private var flag = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .foregroundColor(flag ? .yellow : .red)
    ///                 .frame(width: flag ? 50 : 100, height: flag ? 50 : 100)
    ///                 .rotationEffect(.degrees(flag ? 90 : 0))
    ///                 .animation(Animation.easeInOut.repeatCount(2, autoreverses: false))
    ///
    ///             Button("Animate") {
    ///                 flag.toggle()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a yellow rectangle and a button reading
    /// "Animate"; when the button is pressed, the animation of the rectangles
    /// spinning and changing color occurs twice, as as defined by the
    /// repeatCount instance method.](animation-rep-count-ex.gif)
    ///
    /// - Parameters:
    ///   - repeatCount: The number of times the animation should repeat.
    ///   - autoreverses: Whether the animation should reverse when repeating.
    public func repeatCount(_ repeatCount: Int, autoreverses: Bool = true) -> Animation { }

    /// Adjusts whether the animation repeats forever.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State var progress: CGFloat = 0
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text("Banana🍌🍌")
    ///                 .font(.largeTitle)
    ///                 .modifier(CircleAnimation(radius: 24, progress: progress))
    ///                 .onAppear {
    ///                     withAnimation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: false)) {
    ///                         progress = 1.0
    ///                     }
    ///                 }
    ///         }
    ///     }
    /// }
    ///
    /// struct CircleAnimation: AnimatableModifier {
    ///     let radius: CGFloat
    ///     var progress: CGFloat = 0
    ///
    ///     var animatableData: CGFloat {
    ///         get {
    ///             progress
    ///         } set {
    ///             progress = newValue
    ///         }
    ///     }
    ///
    ///     func body(content: Content) -> some View {
    ///         content.offset(
    ///             x: radius * cos(progress * (2 * CGFloat.pi)),
    ///             y: radius * sin(progress * (2 * CGFloat.pi))
    ///         )
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif showing the animation of the text "Banana🍌🍌" moving in a small
    /// clockwise oval around the center of the page repeatedly, forever.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Animatable-example-2.gif)
    ///
    /// - Parameter autoreverses: Whether the animation should reverse when repeating.
    public func repeatForever(autoreverses: Bool = true) -> Animation { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation : CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `description` property for types that conform to
    /// `CustomStringConvertible`:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    public var description: String { get }

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `debugDescription` property for types that conform to
    /// `CustomDebugStringConvertible`:
    ///
    ///     struct Point: CustomDebugStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var debugDescription: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `debugDescription` property.
    public var debugDescription: String { get }

    /// The custom mirror for this instance.
    ///
    /// If this type has value semantics, the mirror should be unaffected by
    /// subsequent mutations of the instance.
    public var customMirror: Mirror { get }
}

