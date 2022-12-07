/// A specification for the appearance and interaction of a text field.
///
/// Use types conforming to this protocol with
/// ``View/textFieldStyle(_:)`` to change the
/// style of ``TextField`` views.
///
/// There are currently 3 system-provided styles available on iOS:
///     - ``DefaultTextFieldStyle``
///     - ``PlainTextFieldStyle``
///     - ``RoundedBorderTextFieldStyle``
///     - ``SquareBorderTextFieldStyle`` (macOS only)
///
/// You can create custom text field styles using the `TextFieldStyle` protocol:
/// ```
/// struct MyTextFieldStyle: TextFieldStyle {
///     public func _body(configuration field: TextField<_Label>) -> some View {
///        field.textFieldStyle(PlainTextFieldStyle())
///        // style here
///     }
/// }
/// ```
///
/// ```
/// struct TextFieldView: View {
///     @State private var input = ""
///
///     var body: some View {
///         TextField("iMessage", text: $input)
///             .textFieldStyle(RoundedBorderTextFieldStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a text field in the center of the screen that reads
/// "iMessage" before any text is input by the user. The RoundedBorderTextFieldStyle
/// renders the text field in a rounded box.](text-field-style.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol TextFieldStyle { }
extension TextFieldStyle {
}

