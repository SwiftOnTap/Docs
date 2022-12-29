/// Creates a view animation.
///
/// This function sets the given ``Animation`` as the ``Transaction/animation``
/// property of the thread's current ``Transaction``.
///
/// ``withAnimation(_:_:)`` executes the code in it's closure, and displays the
/// results of that execution according to the provided animation.
///
/// For example, use ``withAnimation(_:_:)`` to animate a toggle. Here, the
/// action on the view is the `showBanana.toggle()`. Now, by using
/// ``withAnimation(_:_:)`` the results of that action will be animated
/// according to ``Animation/easeInOut``.
///
/// ```
/// struct ExplicitTransitionView: View {
///     @State var showBanana = false
///
///     var body: some View {
///         Button("Toggle") {
///             withAnimation(.easeInOut) { showBanana.toggle() }
///         }
///         if showBanana {
///             Text("🍌")
///                 .transition(.slide)
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a button reating "Toggle" that once
/// pressed triggers a toggle animation in which the text view "🍌" appears and
/// slides down and up in a v-shape underneath the button in an ease-in-out
/// style before disappearing again on the right side of the button.](with-animation-2.gif)
///
/// Or use ``withAnimation(_:_:)`` for a shake effect, like so:
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
///
/// ![A gif that displays a VStack containing the text "Banana🍌🍌", which has
/// been animated to shake side to side / left to right ten times.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Animatable-example-1.gif)
///
/// Alter the duration of your animation as follows:
///
/// ```
/// struct ExampleView: View {
///     @State private var opacity = 0.0
///
///     var body: some View {
///         Button("Cloud the Banana") {
///             withAnimation(.easeIn(duration: 4.0)) {
///                 opacity += 1.0
///             }
///         }
///         .padding()
///
///         ZStack {
///             Text("🍌🍌")
///             Text("☁️☁️☁️☁️")
///                 .opacity(opacity)
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a button reading "Cloud the Banana"
/// followed vertically by padding and then a ZStack containing two text views,
/// "🍌🍌" and "☁️☁️☁️☁️", the latter of which has an opacity of 0.0.;
/// when the button is clicked, the  opacity if the "☁️☁️☁️☁️" text increase
/// to 1.0, covering the "🍌🍌" text.](with-animation-1.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public func withAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result { }

