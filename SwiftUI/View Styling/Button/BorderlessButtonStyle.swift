/// A button style that doesn't apply a border.
///
///     struct ContentView: View {
///         var body: some View {
///             VStack {
///                 Button("Plain Banana🍌🍌", action: tap)
///                     .buttonStyle(PlainButtonStyle())
///                 Button("Borderless Banana🍌🍌", action: tap)
///                     .buttonStyle(BorderlessButtonStyle())
///                 Button("Default Banana🍌🍌", action: tap)
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
/// To apply this style to a button, or to a view that contains buttons, use the
/// ``View/buttonStyle(_:)-ea21b`` modifier.
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct BorderlessButtonStyle : PrimitiveButtonStyle {

    /// Creates a borderless button style.
    public init() { }

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: BorderlessButtonStyle.Configuration) -> some View { }


    /// A view that represents the body of a button.
    public typealias Body = some View
}

