/// A button effect that only modifies the label on interaction.
///
/// A button style that doesn't style or decorate its content while idle, but
/// may apply a visual effect to indicate the pressed, focused, or enabled
/// state of the button.
///
///     struct ExampleView: View {
///         var body: some View {
///             VStack {
///                 Button("Plain Banana🍌🍌") { tap() }
///                     .buttonStyle(PlainButtonStyle())
///                 Button("Borderless Banana 🍌🍌") { tap() }
///                     .buttonStyle(BorderlessButtonStyle())
///                 Button("Default Banana🍌🍌") { tap() }
///                     .buttonStyle(PlainButtonStyle())
///             }
///             .font(.title2)
///         }
///
///         func tap() { /* implement here */ }
///     }
///
/// ![A view containing a VStack with three buttons; the first button is plain,
/// the second is borderless, and the last is the default style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/buttonstyle-plain-border-default-example-1.png)
///
/// To apply this style to a button, or to a view that contains buttons, use the
/// ``View/buttonStyle(_:)-d2d0a`` modifier.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlainButtonStyle : PrimitiveButtonStyle {

    /// Creates a plain button style.
    public init() { }

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: PlainButtonStyle.Configuration) -> some View { }


    /// A view that represents the body of a button.
    public typealias Body = some View
}

