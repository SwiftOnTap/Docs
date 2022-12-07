/// A text field style with no decoration.
///
///     struct ExampleView: View {
///         @State var myFruit: String = ""
///
///         var body: some View {
///             Text(myFruit)
///             TextField("Fruit", text: $myFruit)
///                 .textFieldStyle(PlainTextFieldStyle())
///                 .padding()
///         }
///     }
///
/// ![A gif displaying a text view in the center of the screen with a text field
/// left aligned underneath it. The text field reads "Fruit" when no text is entered,
/// and when the user types "Bananas" into the field, it appears in the text view above.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TextField-example-1.gif)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlainTextFieldStyle : TextFieldStyle {

    /// Creates a plain text field style.
    ///
    /// ![A gif displaying a text view in the center of the screen with a text field
    /// left aligned underneath it. The text field reads "Fruit" when no text is entered,
    /// and when the user types "Bananas" into the field, it appears in the text view above.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TextField-example-1.gif)
    ///
    ///     struct ExampleView: View {
    ///         @State var myFruit: String = ""
    ///
    ///         var body: some View {
    ///             Text(myFruit)
    ///             TextField("Fruit", text: $myFruit)
    ///                 .textFieldStyle(PlainTextFieldStyle())
    ///                 .padding()
    ///         }
    ///     }
    public init() { }
}
