/// The properties of a button.
///
/// The ``PrimitiveButtonStyle`` definition is very similar to that of
/// ``ButtonStyle``, except that in the case of the former, we pass a
/// `PrimitiveButtonStyleConfiguration` to the ``PrimitiveButtonStyle/makeBody(configuration:)``.
/// function. `PrimitiveButtonStyleConfiguration` comes with the button
/// `label` as a property, but replaces the ``buttonStyleConfiguration/isPressed``
/// property with a ``PrimitiveButtonStyleConfiguration/trigger()`` function.
///
/// Here, we create a custom `TripleTapOnlyStyle`, which has a
/// ``View/onTapGesture(count:perform:)`` added to the label to trigger the
/// button action with three consecutive taps.
///
/// ```
/// struct TripleTapOnlyStyle: PrimitiveButtonStyle {
///     func makeBody(configuration: Configuration) -> some View {
///         configuration.label
///             .onTapGesture(count: 3) { configuration.trigger }
///     }
/// }
/// ```
///
/// We can then apply the custom style to a button using the
/// ``View/buttonStyle(_:)-d2d0a`` view modifier:
///
/// ```
/// struct ContentView: View {
///     @State private var showBananas = false
///
///     var body: some View {
///         VStack(alignment: .center) {
///             Button("Triple tap to toggle bananas") {
///                 showBananas.toggle()
///             }
///             .buttonStyle(TripleTapOnlyStyle())
///
///             if showBananas {
///                 Text("🍌🍌")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif that reads "Triple tap to toggle bananas" in the center of the
/// screen. When tripple tapped, two banana emojis appear beneath the text
/// view.](prim-button-style.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PrimitiveButtonStyleConfiguration {

    /// A type-erased label of a button.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A view that describes the effect of calling the button's action.
    public let label: PrimitiveButtonStyleConfiguration.Label

    /// Performs the button's action.
    public func trigger() { }
}
