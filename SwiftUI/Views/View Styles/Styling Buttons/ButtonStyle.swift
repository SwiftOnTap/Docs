/// This protocol is used to create a custom button style.
///
/// The `ButtonStyle` protocol provides a template to create a reusable style
/// for your buttons. It also provides data about the button and its
/// interaction state.
///
/// - Note: This protocol gives you a way to detect when the button is being pressed. If
/// you would like to trigger the button programmatically, use
/// ``PrimitiveButtonStyle`` instead.
///
/// To make a custom style, create a new structure that conforms to
/// `ButtonStyle`. This new style can be easily reused across your
/// application. The style adapts to the user's current interaction state
/// (i.e. on press, on release).
///
/// Your structure only needs to implement one method:
/// ``ButtonStyle/makeBody(configuration:)``.
/// ``ButtonStyle/makeBody(configuration:)`` accepts a
/// ``ButtonStyleConfiguration``, which passes the original label to
/// display the button view and a ``ButtonStyleConfiguration/trigger()``
/// to execute its action.
///
/// ```
/// struct BananaButtonStyle: ButtonStyle {
///     var color: Color
///
///     func makeBody(configuration: Self.Configuration) -> some View {
///         BananaButton(configuration: configuration, color: color)
///     }
///
///     struct BananaButton: View {
///         let configuration: BananaButtonStyle.Configuration
///         let color: Color
///
///         var body: some View {
///             configuration.label
///                 .padding()
///                 .background(RoundedRectangle(cornerRadius: 10).fill(color))
///                 .scaleEffect(configuration.isPressed ? 0.8: 1)
///                 .animation(.spring())
///         }
///     }
/// }
/// ```
///
/// To change the style of your ``Button``, use the
/// ``View/buttonStyle(_:)-ea21b`` method. This method accepts a `ButtonStyle`.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Button("Banana🍌🍌", action: { tap() })
///             .buttonStyle(BananaButtonStyle(color: .yellow))
///     }
///
///     func tap() { /* implement here */ }
/// }
/// ```
///
/// ![A gif showing a styled yellow button reading "Banana🍌🍌" that enlarges slightly when tapped.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ButtonStyle-example-1.gif)
///
/// Button style applies to all buttons within a view hierarchy. For example,
/// you could apply `ButtonStyle` to a ``VStack``.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         VStack {
///             Button("🍌🍌", action: tap)
///             Button("🍎🍎", action: tap)
///             Button("🍑🍑", action: tap )
///         }
///         .buttonStyle(BananaButtonStyle(color: .yellow))
///     }
///
///     func tap() { /* implement here */ }
/// }
/// ```
///
/// ![A gif showing a view containg a VStacj with three fruit emoji buttons; each button enlarges slightly whe tapped.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ButtonStyle-example-2.gif)
///
/// For more on how to customize your button style body, check out
/// ``ButtonStyle/makeBody(configuration:)``. To provide greater control over
/// when and how a button triggers it's action use
/// ``PrimitiveButtonStyle``. While this property requires more work to setup,
/// it provides more customization.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ButtonStyle { }

extension ButtonStyle {

    /// A view that represents the body of a button.
    associatedtype Body : View

    /// Creates a view that represents the body of a button.
    ///
    /// This is the only required property of ``ButtonStyle``. See
    /// ``ButtonStyle`` for more.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Button("🍌🍌", action: { tap() })
    ///             Button("🍎🍎", action: { tap() })
    ///             Button("🍑🍑", action: { tap() })
    ///         }
    ///         .buttonStyle(BananaButtonStyle(color: .yellow))
    ///     }
    ///
    ///     func tap() { /* implement here */ }
    /// }
    ///
    /// struct BananaButtonStyle: ButtonStyle {
    ///     var color: Color
    ///     func makeBody(configuration: Self.Configuration) -> some View {
    ///         BananaButton(configuration: configuration, color: color)
    ///     }
    ///
    ///     struct BananaButton: View {
    ///         let configuration: BananaButtonStyle.Configuration
    ///         let color: Color
    ///
    ///         var body: some View {
    ///             return configuration.label
    ///                 .padding()
    ///                 .background(RoundedRectangle(cornerRadius: 10).fill(color))
    ///                 .scaleEffect(configuration.isPressed ? 0.8: 1)
    ///                 .animation(.spring())
    ///         }
    ///     }
    /// }
    /// ```
    ///
    ///
    /// ![A view containing a VStack with three rounded yellow buttons, "🍌🍌", "🍎🍎",
    /// "🍑🍑", all of which have padding and contract before springing
    /// back once pressed as defined by the custom ButtonStyle configuration.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ButtonStyle-example-2.gif)
    ///
    /// - Parameter configuration : The properties of the button.
    func makeBody(configuration: Self.Configuration) -> Self.Body { }

    /// The properties of a button.
    typealias Configuration = ButtonStyleConfiguration
}

