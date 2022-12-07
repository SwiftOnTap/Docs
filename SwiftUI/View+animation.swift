@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that applies the given animation to this view when the specified value
    /// changes.
    ///
    /// Use this modifier to when you only want to animate a particular `@State`
    /// property instead of animating all of them.
    ///
    /// To animate all properties associated with a ``View``, use
    /// ``View/animation(_:)`` instead.
    ///
    /// ```
    /// struct MovementView: View {
    ///     @State var moveFlag = false
    ///     @State var transportFlag = false
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Button("Move the banana") { moveFlag.toggle() }
    ///             Button("Transport the banana") { transportFlag.toggle() }
    ///             Text("🍌")
    ///                 .offset(x: moveFlag ? 0 : 50)
    ///                 .offset(x: transportFlag ? 0 : 50)
    ///                 .animation(.easeInOut, value: moveFlag)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying two buttons in a VStack, followed by a banana emoji.
    /// The user has the option to Move the banana or Transport the banana, each
    /// prompting a different animation; when the move banana button is clicked,
    /// the banana slides to its offset, whereas transport moves the banana
    /// without animation.](animation_val.gif)
    ///
    /// - Parameters:
    ///   - animation: The animation to apply. If ``animation`` is `nil`, the view
    ///     doesn't animate.
    ///   - value: A value to monitor for changes.
    ///
    /// - Returns: A view that applies ``animation`` to this view whenever `value`
    ///   changes.
    @inlinable public func animation<V>(_ animation: Animation?, value: V) -> some View where V : Equatable { }

}

