/// The default button style, based on the button's context.
///
/// If you create a button directly on a blank canvas, the style varies by
/// platform. iOS uses the borderless button style by default, whereas macOS,
/// tvOS, and watchOS use the bordered button style.
///
///     struct ExampleView: View {
///         var body: some View {
///             VStack {
///                 Button("PlainBanana🍌🍌") { tap() }
///                     .buttonStyle(PlainButtonStyle())
///
///                 Button("BorderlessBanana🍌🍌") { tap() }
///                     .buttonStyle(BorderlessButtonStyle())
///
///                 Button("DefaultBanana🍌🍌") { tap() }
///                     .buttonStyle(DefaultButtonStyle())
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
/// If you create a button inside a container, like a ``List``, the style
/// resolves to the recommended style for buttons inside that container for that
/// specific platform.
///
/// You can override a button's style. To apply the default style to a button,
/// or to a view that contains buttons, use the ``View/buttonStyle(_:)-d2d0a``
/// modifier.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultButtonStyle : PrimitiveButtonStyle {

    /// Creates a default button style.
    public init() { }

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: DefaultButtonStyle.Configuration) -> some View { }


    /// A view that represents the body of a button.
    public typealias Body = some View
}

