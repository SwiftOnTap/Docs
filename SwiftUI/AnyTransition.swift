/// A transition to use for animating a view on and off the screen.
///
/// Use this structure along with the ``View/transition(_:)``
/// view modifier to animate the way a ``View`` comes onto and leaves the
/// screen.
///
/// Examples of transitions include:
/// - ``AnyTransition/scale``
/// - ``AnyTransition/opacity`` (default)
/// - ``AnyTransition/slide``
/// - etc.
///
/// A transition is only one half of animating a view. You also must specify
/// a timing curve, (somewhat confusingly) called an "animation."
/// See ``Animation`` for more info on creating one of these timing curves.
///
/// ### Creating a transition
///
/// The easiest way to creat a transition is using one of
/// the many pre-made static members available in `AnyTransition`.
/// See the sliding banana example at the bottom of this page.
///
/// You can also create your own static members by extending this
/// struct.
///
/// ```
/// extension AnyTransition {
///     static var slideAndFade: AnyTransition {
///         return AnyTransition.slide.combined(with: .opacity)
///     }
/// }
/// ```
///
/// ### Using a transition
///
/// Transitions are most often used by attaching them to views that have
/// "if" statements on them.
///
/// As long as a timing curve (``Animation``) is specified, whenever the
/// view is added to or removed from the screen, it will do so with
/// the specified transition.
///
/// There are many ways to add an animation to the transition:
/// - Using ``withAnimation(_:_:)``
/// - Using `AnyTransition`'s own ``AnyTransition/animation(_:)`` modifier.
/// - Using ``View``'s ``View/animation(_:)`` modifier.
///
/// The following example applies the ``AnyTransition/slide`` transition:
///
/// ```
/// struct TransitioningBananaView: View {
///     @State var showBanana = true
///
///     var body: some View {
///         Button("Slide the banana ➡️") {
///             withAnimation { showBanana.toggle() }
///         }
///         if showBanana {
///             Text("🍌")
///                 .transition(.slide)
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a button that reads "Slide the banana
/// ➡️" that triggers the slide transition of the text view "🍌" when pressed;
/// the "🍌" slides down from beneath the button, displacing it until it slides
/// up again on the other side.](any-transition-using-ex.gif)
///
/// - Note: By default, views transition using ``AnyTransition/opacity``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct AnyTransition {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition that moves a view from its current place on screen to another place using a CGSize.
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    ///
    /// ```
    /// struct TransitioningBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Offset the banana ↘️") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.offset(CGSize(width: 100, height: 100)))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "Offset the banana ↘️"
    /// that triggers the offset transition of the text view "🍌" when pressed;
    /// the "🍌" moves from its current place under the banana to the outside of the
    /// frame down and to the right, as defined by a CGSize.](any-transition-offset-ex.gif)
    ///
    /// - Parameter offset: The amount you want to move the view during the transition.
    public static func offset(_ offset: CGSize) -> AnyTransition { }

    /// A transition that moves a view from its current place on screen to another place using x and y offsets.
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    ///
    /// ```
    /// struct TransitioningBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Offset the banana ↘️") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.offset(x: 100, y: 100))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "Offset the banana ↘️"
    /// that triggers the offset transition of the text view "🍌" when pressed;
    /// the "🍌" moves from its current place under the banana to the outside of the
    /// frame down and to the right, as defined by the x and y offsets.](any-transition-offset-xy-ex.gif)
    ///
    /// - Parameters:
    ///   - x: The number of points you want to move the view to the right. Negative means move left. Defaults to 0.
    ///   - y: The number of points you want to move the view down. Negative means move up. Defaults to 0.
    public static func offset(x: CGFloat = 0, y: CGFloat = 0) -> AnyTransition { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition that scales a view from its current size down to zero size.
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    ///
    /// ```
    /// struct TransitioningBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Scale the banana ⤵️") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.scale)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "Scale the banana ⤵️"
    /// that triggers the scale down of the text view "🍌" when pressed;
    /// the "🍌" shrinks to nothing, disappearing under the button.](any-transition-scale-ex.gif)
    ///
    public static var scale: AnyTransition { get }

    /// A transition that scales a view from its current size to a new size.
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    ///
    /// ```
    /// struct TransitioningBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("SCALE THE BANANA ⤴️") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.scale(scale: 100, anchor: .center))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "SCALE THE BANANA ⤴️"
    /// that triggers the scale up of the text view "🍌" when pressed; the "🍌",
    /// anchored at the center, becomes so big that it can't fit in the frame.](any-transition-scale-anchor-ex.gif)
    ///
    /// - Parameters:
    ///   - scale: The amount you want to scale the view.
    ///   - anchor: The unit point to have the view scale from.
    public static func scale(scale: CGFloat, anchor: UnitPoint = .center) -> AnyTransition { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition from transparent to opaque on insertion, and from opaque to
    /// transparent on removal.
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    ///
    /// - Note: This is the default transition when a view's transition isn't
    /// specified.
    ///
    /// ```
    /// struct TransitioningBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Fade the banana 🎚") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.opacity)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "Fade the banana 🎚"
    /// that triggers a transition of the text view "🍌" from transparent to
    /// opaque on first click, and from opaque to transparent on second click; the "🍌",
    /// appears from under the button and then fades back into oblivion.](any-transition-opacity-ex.gif)
    ///
    public static let opacity: AnyTransition
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition that inserts by moving in from the leading edge, and
    /// removes by moving out towards the trailing edge.
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    ///
    /// ```
    /// struct TransitioningBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Slide the banana ➡️") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.slide)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "Slide the banana
    /// ➡️" that triggers the slide transition of the text view "🍌" when pressed;
    /// the "🍌" slides down from beneath the button, displacing it until it slides
    /// up again on the other side.](any-transition-slide-ex.gif)
    ///
    /// - SeeAlso: ``AnyTransition/move(edge:)``
    public static var slide: AnyTransition { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Combines this transition with another, returning a new transition that
    /// is the result of both transitions being applied.
    ///
    /// Use this transition to combine multiple transitions at once.
    ///
    /// For example, below we combine ``AnyTransition/opacity`` with
    /// ``AnyTransition/slide`` for a new transition that both
    /// slides and fades.
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    ///
    /// ```
    /// struct TransitioningBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Slide AND fade the banana ➡️🎚") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(AnyTransition.opacity.combined(with: .slide))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "Slide AND fade
    /// the banana ➡️🎚" that triggers both the slide and fade transitions of
    /// the text view "🍌" when pressed; the "🍌" appears and slides down from
    /// beneath the button, displacing it until it slides up again on the other
    /// side while fading into oblivion.](any-transition-combined-ex.gif)
    ///
    public func combined(with other: AnyTransition) -> AnyTransition { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Returns a transition defined between an active modifier and an identity
    /// modifier.
    ///
    /// Use this transition for maximum customization. It allows you to
    /// pass in any two ``ViewModifier``s and create your own custom
    /// transition from them.
    ///
    /// The first view modifier, `active`, is what you want to apply to the
    /// view at the very moment it is removed from the screne. The second
    /// view modifier, `identity`, is what you want to apply right as the
    /// transition has finished.
    ///
    /// See ``ViewModifier`` for more on how to create your own modifiers.
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    ///
    /// The following simple example just recreates the
    /// ``AnyTransition/opacity`` transition.
    ///
    /// ```
    /// struct OpacityModifier: ViewModifier {
    ///     let opacity: Double
    ///
    ///     func body(content: Content) -> some View {
    ///         content.opacity(opacity)
    ///     }
    /// }
    ///
    /// extension AnyTransition {
    ///     static var opOpacity: AnyTransition {
    ///         .modifier(active: OpacityModifier(opacity: 0),
    ///                   identity: OpacityModifier(opacity: 1))
    ///     }
    /// }
    ///
    /// struct TransitioningBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("OP fade the banana 🎚❗️") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.opOpacity)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "OP fade the
    /// banana 🎚❗️" that triggers the transition of the text view "🍌" when
    /// pressed; the custom transition acts the same as the opacity transition,
    /// as defined by and an active OpacityModifier of value 0 and identity
    /// OpacityModifier of value 1.](any-transition-modifier-ex.gif)
    ///
    public static func modifier<E>(active: E, identity: E) -> AnyTransition where E : ViewModifier { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Attaches an animation to this transition.
    ///
    /// Use this modifier to control the timing curve
    /// directly on the transition itself.
    ///
    /// For some reason, this method only works on some of the transitions.
    ///
    /// Transitions where this works:
    /// - ``AnyTransition/scale``
    /// - ``AnyTransition/opacity``
    ///
    /// Transition where this doesn't work:
    /// - ``AnyTransition/offset(x:y:)``
    /// - ``AnyTransition/slide``
    /// - ``AnyTransition/move(edge:)``
    ///
    /// Compare the following two examples that do the same thing.
    /// The second one uses this modifier; the first one does not.
    ///
    /// ```
    /// struct FirstBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Scale the banana ⤴️") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(AnyTransition.scale)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ```
    /// struct SecondBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Scale the banana ⤴️") {
    ///             showBanana.toggle()
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(AnyTransition.scale.animation(.easeInOut))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "Scale the banana ⤴️"
    /// that triggers the scale up of the text view "🍌" when pressed; the examples
    /// show that the same result occurs using the animation modifier or not.](any-transition-anim-ex.gif)
    ///
    public func animation(_ animation: Animation?) -> AnyTransition { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition that does nothing.
    ///
    /// Since the default transition is ``AnyTransition/opacity``,
    /// use this modifier to specify a transition that does nothing.
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    ///
    /// ```
    /// struct IdentityBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Apparate the banana.") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.identity)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "Apparate the banana."
    /// that triggers the transitioning of the text view "🍌" with no effects when pressed;
    /// the view simply disappears behind the button.](any-transition-identity-ex.gif)
    ///
    public static let identity: AnyTransition
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Returns a transition that moves the view away, towards the specified
    /// edge of the view.
    ///
    /// ```
    /// struct TransitioningBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Move the banana ➡️") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.move(edge: .trailing))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "Move the banana ➡️"
    /// that triggers the moving transition of the text view "🍌" when pressed;
    /// the view slides up the the trailing edge of the button and disappears, as
    /// defined by the edge parameter.](any-transition-move-edge-ex.gif)
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    public static func move(edge: Edge) -> AnyTransition { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Provides a composite transition that uses a different transition for
    /// insertion versus removal.
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    ///
    /// ```
    /// struct TransitioningBananaView: View {
    ///     @State var showBanana = true
    ///
    ///     var body: some View {
    ///         Button("Slide the banana in ➡️, fade banana out 🎚") {
    ///             withAnimation { showBanana.toggle() }
    ///         }
    ///         if showBanana {
    ///             Text("🍌")
    ///                 .transition(.asymmetric(insertion: .slide, removal: .opacity))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a button that reads "Slide the banana in ➡️,
    /// fade banana out 🎚" that triggers composite transition of the text view "🍌"
    /// when pressed; the "🍌" slides into view from the left and then fades out
    /// of view in the center, as defined by the insertion anf removal parameters
    /// of the asymmetrical transition.](any-transition-asymmetric-ex.gif)
    ///
    /// See ``AnyTransition`` for more on how to use this transition.
    public static func asymmetric(insertion: AnyTransition, removal: AnyTransition) -> AnyTransition { }
}

