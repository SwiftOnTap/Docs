/// This protocol is used to define custom button styles.
///
/// Use this protocol to define custom styling and
/// interaction behavior for buttons.
///
/// - Note: This protocol gives you a way trigger the button programmatically. If
/// you would like to detect when the button is being pressed, use
/// ``ButtonStyle`` instead.
///
/// ### Creating a `PrimitiveButtonStyle`
///
/// There are two ways to make a `PrimitiveButtonStyle`:
/// - Use one of SwiftUI's out-of-the-box options
/// - Create your own style by making a structure that implements
/// the ``PrimitiveButtonStyle/makeBody(configuration:)`` function.
///
/// #### Out-Of-The-Box `PrimitiveButtonStyle`
///
/// There are 3 primitive button styles that ship with SwiftUI:
/// - ``DefaultButtonStyle``
/// - ``PlainButtonStyle``
/// - ``BorderlessButtonStyle``
///
/// #### Create Your Own `PrimitiveButtonStyle`
///
/// To conform to `PrimitiveButtonStyle`, your structure only needs to
/// implement one method: ``PrimitiveButtonStyle/makeBody(configuration:)``.
///
/// ``PrimitiveButtonStyle/makeBody(configuration:)`` accepts a
/// ``PrimitiveButtonStyleConfiguration``, which passes the original ``PrimitiveButtonStyleConfiguration/label``
/// to display the button view and a ``PrimitiveButtonStyleConfiguration/trigger()``
/// to execute its action. A gesture is commonly added to the label in order to trigger the button action.
///
/// ```
/// struct MyPrimitiveButtonStyle: PrimitiveButtonStyle {
///     func makeBody(configuration: Configuration) -> some View {
///         configuration.label
///             .foregroundColor(.yellow)
///             .onTapGesture { configuration.trigger() }
///     }
/// }
/// ```
///
/// ### Using `PrimitiveButtonStyle`
///
/// Use ``View/buttonStyle(_:)-d2d0a`` to apply a primitive button style.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Button("Banana 🍌🍌", action: tap)
///             .buttonStyle(MyPrimitiveButtonStyle())
///     }
///
///     func tap() { /* implement here */  }
/// }
/// ```
///
/// ![A view displaying a primitive style button reading "Banana 🍌🍌".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/PrimitiveButtonStyle-example-1.png)
///
/// ``PrimitiveButtonStyle`` applies to all buttons within a view hierarchy.
/// For example, you could apply `BananaButtonStyle` to a ``VStack``.
///
/// ```
/// struct BananaView: View {
///     var body: some View {
///         VStack {
///             Button("Banana 🍌🍌", action: { tap() })
///             Button("Apple 🍏🍏", action: { tap() })
///             Button("Peach 🍑🍑", action: { tap() })
///         }
///         .buttonStyle(BananaButtonStyle(color: .yellow))
///     }
///
///     func tap() { /* implement here */ }
/// }
///
/// struct BananaButtonStyle: PrimitiveButtonStyle {
///     let color: Color
///
///     func makeBody(configuration: Configuration) -> some View {
///         configuration.label
///             .padding()
///             .background(RoundedRectangle(cornerRadius: 10).fill(color))
///             .onTapGesture { configuration.trigger() }
///     }
/// }
/// ```
///
/// ![A view displaying a VStack with three "banana style" buttons that enlarge slightly when tapped.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/PrimitiveButtonStyle-example-2.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PrimitiveButtonStyle { }
extension PrimitiveButtonStyle {

    /// A view that represents the body of a button.
    associatedtype Body : View

    /// Creates a view that represents the body of a button.
    ///
    /// Implement this function in your structure to conform to the
    /// ``PrimitiveButtonStyle`` protocol. The ``PrimitiveButtonStyle``
    /// protocol gives you an easy way to reuse button styles across your app.
    ///
    /// `makeBody(configuration:)` passes in a
    /// `configuration` parameter of type ``PrimitiveButtonStyleConfiguration``.
    /// Use the properties of this parameter to create your custom button
    /// style.
    ///
    /// ```
    /// struct BananaView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Button("Banana 🍌🍌", action: tap)
    ///             Button("Apple 🍏🍏", action: tap)
    ///             Button("Peach 🍑🍑", action: tap)
    ///         }
    ///         .buttonStyle(BananaButtonStyle(color: .yellow))
    ///     }
    ///
    ///     func tap() { /* implement here */ }
    /// }
    ///
    /// struct BananaButtonStyle: PrimitiveButtonStyle {
    ///     let color: Color
    ///
    ///     func makeBody(configuration: Configuration) -> some View {
    ///         configuration.label
    ///             .padding()
    ///             .background(RoundedRectangle(cornerRadius: 10).fill(color))
    ///             .onTapGesture { configuration.trigger() }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with three rounded yellow buttons,
    /// "Banana 🍌🍌", "Apple 🍏🍏", "Peach 🍑🍑", all of which have padding
    /// as defined by the custom PrimitiveButtonStyle configuration.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/PrimitiveButtonStyle-example-2.png)
    ///
    /// - Parameter configuration : The properties of the button.
    func makeBody(configuration: Self.Configuration) -> Self.Body { }

    /// The properties of a button.
    ///
    /// See ``PrimitiveButtonStyleConfiguration`` for more.
    typealias Configuration = PrimitiveButtonStyleConfiguration
}
