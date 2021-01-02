/// Custom and system button styles use this protocol.
///
/// Specialize a button's appearance and response to a finger or mouse press with a reusable `ButtonStyle` .
///
/// To apply a style in your app, append the `View/buttonStyle(_:)` modifier to a `Button`. Pass in a ButtonStyle by you or Apple. Appending the modifier to a stack will apply the style to all child buttons, until another modifier sets another style.
///
/// In the snippet below, the banana and apple buttons will use the subtle `PlainButtonStyle`. The peach button will adopt the more dramatic  `DefaultButtonStyle`. Default styling differs between platforms.
///
/// ```
///     struct ExampleView: View {
///         var body: some View {
///             VStack {
///                 Button("🍌🍌") { tap() }
///                 Button("🍏🍏") { tap() }
///                 Button("🍑🍑") { tap() }
///                     .buttonStyle(DefaultButtonStyle())
///             }
///             .buttonStyle(PlainButtonStyle())
///         }
///
///         func tap() { }
///     }
/// ```
///
/// To make a custom style, create a struct conforming to ButtonStyle. Conformance requires one method, `ButtonStyle/makeBody(configuration:)`. While you can style your button in makeBody by adding modifiers, our recommendation is to define an inner struct as shown below. This approach enables response to the `EnvironmentValues/.isFocused` property on tvOS, for example, to customize your button's animated behaviors based on both press and focus states.
///
/// ```
///     struct ExampleView: View {
///         var body: some View {
///              Button("🍌🍌") { }
///                  .buttonStyle(ExampleButtonStyle(color: Color(.systemOrange)))
///         }
///     }
///
///     struct ExampleButtonStyle: ButtonStyle {
///
///         var color: Color
///
///         func makeBody(configuration: Self.Configuration) -> some View {
///             Button(config: configuration, color: color)
///         }
///
///         private struct Button: View {
///             let config: ButtonStyle.Configuration
///             let color: Color
///
///             var body: some View {
///                 config.label
///                     .padding()
///                     .background(color.cornerRadius(10))
///                     .scaleEffect(config.isPressed ? 0.94 : 1)
///                     .animation(.spring(), value: config.isPressed)
///             }
///         }
///     }
/// ```
///
/// For how to customize your button style body, read `ButtonStyle/makeBody(configuration:)`.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ButtonStyle {

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    func makeBody(configuration: Self.Configuration) -> Self.Body { }

    /// The properties of a button.
    typealias Configuration = ButtonStyleConfiguration
    
    /// A view that represents the body of a button, which can be inferred from the makeBody method's return type.
    associatedtype Body : View
}
