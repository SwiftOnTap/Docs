/// The properties of a button.
///
/// This property represents the view state of the `Button` that ``ButtonStyle`` modifies.
/// `ButtonStyleConfiguration` consists of a label representing the button view,
/// and ``ButtonStyleConfiguration/isPressed``, which indicates whether or not the button is currently
/// being pressed.
///
/// Here, we create a custom `MyButtonStyle`, which has a
/// ``RoundedRectangle`` background as well as a ``View/scaleEffect(_:anchor:)-1dc80``
/// view modifier applied to the label which acts on the ``ButtonStyleConfiguration/isPressed``
/// property.
///
/// ```
/// struct MyButtonStyle: ButtonStyle {
///     var background: some View {
///         RoundedRectangle(cornerRadius: 10, style: .continuous)
///             .fill(Color.orange)
///             .opacity(0.3)
///     }
///
///     func makeBody(configuration: ButtonStyleConfiguration) -> some View {
///         configuration.label
///             .padding(20)
///             .background(background)
///             .scaleEffect(configuration.isPressed ? 0.95 : 1)
///     }
/// }
/// ```
///
/// This new ``ButtonStyle`` could then be applied to a ``Button`` within a ``View``:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Button("Press me!", action: { })
///             .buttonStyle(MyButtonStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a gray button reading "Press Me!" that turns blue once
/// pressed; the button is of a custom buttonstyle, which specifies the
/// color change using .isPressed within the .background modifier.](button-style-config-ex.gif)
///
/// `ButtonStyle` defines an internal typealias called `Configuration`, which
/// is just set to `ButtonStyleConfiguration`. So, in general, your
/// `makeBody` function can just be type annotated with `Configuration`.
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ButtonStyleConfiguration {

    /// A type-erased label of a button.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }
    
    /// An optional semantic role that describes the button's purpose.
    ///
    /// A value of `nil` means that the Button doesn't have an assigned role. If
    /// the button does have a role, use it to make adjustments to the button's
    /// appearance. The following example shows a custom style that uses
    /// bold text when the role is ``ButtonRole/cancel``,
    /// ``ShapeStyle/red`` text when the role is ``ButtonRole/destructive``,
    /// and adds no special styling otherwise:
    ///
    ///     struct MyButtonStyle: ButtonStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             configuration.label
    ///                 .font(
    ///                     configuration.role == .cancel ? .title2.bold() : .title2)
    ///                 .foregroundColor(
    ///                     configuration.role == .destructive ? Color.red : nil)
    ///         }
    ///     }
    ///
    /// You can create one of each button using this style to see the effect:
    ///
    ///     VStack(spacing: 20) {
    ///         Button("Cancel", role: .cancel) {}
    ///         Button("Delete", role: .destructive) {}
    ///         Button("Continue") {}
    ///     }
    ///     .buttonStyle(MyButtonStyle())
    ///
    /// ![A screenshot of three buttons stacked vertically. The first says
    /// Cancel in black, bold letters. The second says Delete in red, regular
    /// weight letters. The third says Continue in black, regular weight
    /// letters.](ButtonStyleConfiguration-role-1)
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public let role: ButtonRole?

    /// A view that describes the effect of pressing the button.
    public let label: ButtonStyleConfiguration.Label

    /// A Boolean that indicates whether the user is currently pressing the
    /// button.
    public let isPressed: Bool
}

