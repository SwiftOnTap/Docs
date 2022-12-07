/// Animate a view when data changes.
///
/// ``Animatable`` describes how to animate a view with respect to some change
/// in the view's data.
///
/// Use `Animatable` when you are unable to achieve the animation you want with
/// ``View/animation(_:)`` or ``withAnimation(_:_:)``.
///
/// `Animatable` allows fine-grained control over the animation of a SwiftUI
/// view's animatable values. It does so by requiring
/// `animatableData: AnimatableData', which represents a view's animatable data.
///
/// By conforming to ``Animatable``, you are able to effectively **decouple**
/// the animation of your view from the concept of *duration*, as you give
/// SwiftUI the ability to interpolate arbitrarily between two different values
/// for ``Animatable/animatableData-7101d``. This is also the reason why
/// ``Animatable/AnimatableData`` must conform to ``VectorArithmetic``,
/// which provides the runtime means to add, subtract and scale the animated
/// values as necessary to generate data points for each frame of the animation
/// over an arbitrary time interval.
/// [animatable-modifier ->]
/// ### Implementations
///
/// #### Using ``AnimatableModifier`` to implement a shake effect
///
/// ``Animatable`` is best used via `AnimatableModifier`, which is nothing but
/// a simple protocol that combines ``Animatable`` and ``ViewModifier``. This
/// allows you to decouple the animation effect from the view you want to
/// animate.
///
/// For example:
///
/// ```
/// struct ExampleView: View {
///     @State var numberOfShakes: CGFloat = 0
///
///     var body: some View {
///         VStack {
///             Text("Banana🍌🍌")
///                 .font(.largeTitle)
///                 .modifier(ShakeEffect(shakeNumber: numberOfShakes))
///                 .onAppear {
///                     withAnimation(.easeIn(duration: 2.0)) {
///                         numberOfShakes = 10
///                     }
///                 }
///         }
///     }
/// }
///
/// struct ShakeEffect: AnimatableModifier {
///     var shakeNumber: CGFloat = 0
///
///     var animatableData: CGFloat {
///         get {
///             shakeNumber
///         } set {
///             shakeNumber = newValue
///         }
///     }
///
///     func body(content: Content) -> some View {
///         content
///             .offset(x: sin(shakeNumber * .pi * 2) * 10)
///     }
/// }
/// ```
///![A gif that displays a VStack containing the text "Banana🍌🍌", which has
/// been animated to shake side to side / left to right ten times.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Animatable-example-1.gif)
///
///
/// This example demonstrates a horizontal "shake effect", applied on a
/// ``Text``. When run, the text animates by shaking 10 times. This is achieved
/// by triggering an animation using ``withAnimation(_:_:)``, and modifying the
/// `shakeNumber` to go from `0` to `10`.
///
/// Note:
/// - `shakeNumber` represents the *progress* of the animation. The SwiftUI
/// runtime can set this value through ``Animatable/animatableData-7101d``,
/// and it can be any value between the initial and the final value (`0.0`
/// and `10.0` in this case).
/// - `shakeNumber` is a `CGFloat` and not an `Int`. This is because the
/// runtime needs to be able to interpolate fractionally between `0.0` and
/// `10.0` 'shakes' - and it does so by making use of `CGFloat`'s
/// ``VectorArithmetic`` conformance.
/// - The exact mathematical function used to interpolate `shakeNumber` is
/// determined by what type of ``Animation`` is used in
/// ``withAnimation(_:_:)``, to animate the change from `0` shakes to `10`
/// shakes.
///
/// #### Using ``AnimatableModifier`` to continuously animate a view along a circle
///
/// ``AnimatableModifier``, used with
/// ``Animation/repeatForever(autoreverses:)`` can also be used to create a
/// continuous animation.
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
/// ![A gif that displays a VStack containing the text "Banana🍌🍌", which
/// has been animated to endlessly move in a circular motion around the view.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Animatable-example-2.gif)
///
/// In this example, `Text("Banana🍌🍌")` is animated along a circle continuously.
///
/// `CircleAnimation` is an implementation of an ``AnimatableModifier`` that
/// uses a simple mathematical function to calculate the `x` and `y` offset of
/// a view, given a radius and a progress value between `0.0` and `1.0`.
///
/// When the view appears, the `CircleAnimation` modifier is animated from a
/// progress value of `0.0` to `1.0` using ``withAnimation(_:_:)``. The
/// ``Animation`` used in ``withAnimation(_:_:)`` is modified using
/// ``Animation/repeatForever(autoreverses:)``, in order to create a loop.
/// Note that ``Animation/repeatForever(autoreverses:)`` is explicitly set as
/// `false` to prevent the animation from being reversed.
/// [<-]
/// ### Further notes
///
/// - ``Animatable`` along with ``View`` is currently broken on iOS 14,
/// please use ``AnimatableModifier``
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol Animatable { }
extension Animatable {

    /// The type defining the data to animate.
    associatedtype AnimatableData : VectorArithmetic

    /// The data to animate.
    var animatableData: Self.AnimatableData { get /*set*/ }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animatable where Self : VectorArithmetic {

    /// The data to animate.
    public var animatableData: Self
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animatable where Self.AnimatableData == EmptyAnimatableData {

    /// The data to animate.
    public var animatableData: EmptyAnimatableData
}

