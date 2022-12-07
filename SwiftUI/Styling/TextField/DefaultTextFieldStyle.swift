/// The default text field style.
///
///
/// ``TextField`` can be styled with the ``View/textFieldStyle(_:)`` modifier.
///
/// The Default TextField Style is Plain on iOS.
///
///     struct ExampleView: View {
///         @State var myFruit: String = ""
///
///         var body: some View {
///             Text(myFruit)
///             TextField("Fruit", text: $myFruit)
///                 .textFieldStyle(DefaultTextFieldStyle())
///                 .padding()
///         }
///     }
///
/// ![A gif showing a view with a VStack containing an iOS default style textfield
/// that once populated displays the corresponding text in a text item.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TextField-example-1.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultTextFieldStyle : TextFieldStyle {

    /// Creates a default text field style.
    ///
    ///     struct ExampleView: View {
    ///         @State var myFruit: String = ""
    ///
    ///         var body: some View {
    ///             Text(myFruit)
    ///             TextField("Fruit", text: $myFruit)
    ///                 .textFieldStyle(DefaultTextFieldStyle())
    ///                 .padding()
    ///         }
    ///     }
    ///
    /// ![A gif showing a view with a VStack containing an iOS default style textfield
    /// that once populated displays the corresponding text in a text item.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TextField-example-1.gif)
    ///
    public init() { }
}

