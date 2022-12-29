@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for buttons within this view to a button style with a
    /// custom appearance and custom interaction behavior.
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             VStack {
    ///                 Button("Plain Banana🍌🍌") { tap() }
    ///                     .buttonStyle(PlainButtonStyle())
    ///
    ///                 Button("Borderless Banana🍌🍌") { tap() }
    ///                     .buttonStyle(BorderlessButtonStyle())
    ///
    ///                 Button("Default Banana🍌🍌") { tap() }
    ///                     .buttonStyle(DefaultButtonStyle())
    ///             }
    ///             .font(.title2)
    ///         }
    ///
    ///         func tap() { /* implement here */ }
    ///     }
    ///
    /// ![A view containing a VStack with three buttons; the first button is
    /// plain, the second is borderless, and the last is the default style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/buttonstyle-plain-border-default-example-1.png)
    ///
    public func buttonStyle<S>(_ style: S) -> some View where S : PrimitiveButtonStyle { }

}

