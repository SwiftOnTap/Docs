/// A text field style with a system-defined rounded border.
///
/// ``TextField`` can be styled with the ``View/textFieldStyle(_:)`` modifier.
///
///     struct ExampleView: View {
///         @State var myFruit: String = ""
///
///         var body: some View {
///             Text(myFruit)
///             TextField("Fruit", text: $myFruit)
///                 .textFieldStyle(RoundedBorderTextFieldStyle())
///                 .padding()
///         }
///     }
///
/// ![A gif displaying a view with a rounded border TextField with the
/// placeholder "Fruit" and padding; as the text field is populated by text,
/// the text is stored in a state variable that is simultaneously displayed in
/// the text line above the input box.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TextField-example-2.gif)
///
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct RoundedBorderTextFieldStyle : TextFieldStyle {

    /// Creates a rounded border text field style.
    public init() { }
}

