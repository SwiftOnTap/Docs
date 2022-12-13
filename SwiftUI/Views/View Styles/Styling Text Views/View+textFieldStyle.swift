@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for text fields within this view.
    ///
    /// `TextField` can be styled with the ``View/textFieldStyle(_:)`` modifier.
    /// Pass an instance that conforms to the ``TextFieldStyle`` protocol.
    ///
    ///     struct ExampleView: View {
    ///         @State var myFruit: String = ""
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Text(myFruit)
    ///                 TextField("Fruit", text: $myFruit)
    ///                     .textFieldStyle(RoundedBorderTextFieldStyle())
    ///                     .padding()
    ///             }
    ///         }
    ///     }
    ///
    /// ![TextField Example 2](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TextField-example-2.gif)
    ///
    /// - Parameter style: The ``TextFieldStyle`` to apply to the ``TextField``.
    public func textFieldStyle<S>(_ style: S) -> some View where S : TextFieldStyle { }

}

