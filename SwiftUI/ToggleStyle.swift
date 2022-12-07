/// Structs conforming to the this protocol can customize the styles for ``Toggle`` views.
///
/// ToggleStyle allows for easy customization of a toggle view. In order to customize the style,
/// simply create a new type conforming to this protocol that returns the custom view
/// in the ``ToggleStyle/makeBody(configuration:)`` function. Note that while the `ToggleStyle`
/// protocol takes care of most the implementation, the conforming type must still
/// toggle the `isOn` property.
///
/// To configure the current toggle style for a view hierarchy, use the
/// ``View/toggleStyle(_:)`` modifier.
///
/// For example, to make a custom toggle style which conforms to this protocol:
///
/// ```
/// struct CustomRectangleToggleStyle: ToggleStyle {
///     func makeBody(configuration: Configuration) -> some View {
///         HStack {
///             configuration.label
///             Rectangle()
///                 .frame(width: 75, height: 30)
///                 .overlay(
///                     Circle()
///                         .foregroundColor(configuration.isOn ? Color.green : Color.red)
///                         .padding(.all, 3)
///                         .offset(x: configuration.isOn ? 20 : -20, y: 0)
///                         .animation(Animation.linear(duration: 0.1))
///                 )
///                 .onTapGesture {
///                     configuration.isOn.toggle()
///                 }
///         }
///     }
/// }
/// ```
///
/// You can then apply this ``ToggleStyle`` to a ``Toggle``
/// using ``View/toggleStyle(_:)``:
///
/// ```
/// struct ExampleView: View {
///     @State private var toggleStatus: Bool = false
///
///     var body: some View {
///         Toggle(isOn: $toggleStatus) {
///             Text("Active")
///         }
///         .padding(50)
///         .toggleStyle(CustomRectangleToggleStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a toggle in the center of the screen with a label that
/// reads "Active" and a custom style toggle that renders as a black rectangle
/// with a red dot on its left when switched to off and a green dot on its right
/// when switched to on.](togglestyle-example-1.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ToggleStyle { }
extension ToggleStyle {

    /// A view that represents the appearance and interaction of a toggle.
    associatedtype Body : View

    /// Creates a view that represents the body of a toggle.
    ///
    /// The system calls this method for each ``Toggle`` instance in a view
    /// hierarchy where this style is the current toggle style.
    ///
    /// For example, to make a custom toggle style which returns a ``HStack`` from
    /// `makeBody(configuration:)`:
    ///
    /// ```
    /// struct CustomRectangleToggleStyle: ToggleStyle {
    ///     func makeBody(configuration: Configuration) -> some View {
    ///         HStack {
    ///             configuration.label
    ///             Rectangle()
    ///                 .frame(width: 75, height: 30)
    ///                 .overlay(
    ///                     Circle()
    ///                         .foregroundColor(configuration.isOn ? Color.green : Color.red)
    ///                         .padding(.all, 3)
    ///                         .offset(x: configuration.isOn ? 20 : -20, y: 0)
    ///                         .animation(Animation.linear(duration: 0.1))
    ///                 )
    ///                 .onTapGesture {
    ///                     configuration.isOn.toggle()
    ///                 }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// You can then apply this ``ToggleStyle`` to a ``Toggle``
    /// using ``View/toggleStyle(_:)``:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State private var toggleStatus: Bool = false
    ///
    ///     var body: some View {
    ///         Toggle(isOn: $toggleStatus) {
    ///             Text("Active")
    ///         }
    ///         .padding(50)
    ///         .toggleStyle(CustomRectangleToggleStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a toggle in the center of the screen with a label that
    /// reads "Active" and a custom style toggle that renders as a black rectangle
    /// with a red dot on its left when switched to off and a green dot on its right
    /// when switched to on.](togglestyle-example-1.gif)
    ///
    /// - Parameter configuration: The properties of the toggle, such as its
    ///   label and its “on” state.
    func makeBody(configuration: Self.Configuration) -> Self.Body { }

    /// The properties of a toggle instance.
    ///
    /// See ``ToggleStyleConfiguration`` for more details.
    typealias Configuration = ToggleStyleConfiguration
}


