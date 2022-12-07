@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for pickers within this view.
    ///
    /// Use this view modifier to change the style of all ``Picker``s in
    /// a view hierarchy.
    ///
    /// Pass the function a structure that conforms to the
    /// ``PickerStyle`` protocol. There is no way to create a custom
    /// style, but there are 7 styles available. See ``PickerStyle`` for more.
    ///
    /// ```
    /// enum MyFruit: String {
    ///     case banana = "Banana 🍌🍌"
    ///     case apple = "Apple 🍎🍎"
    ///     case peach = "Peach 🍑🍑"
    /// }
    ///
    /// struct ExampleView: View {
    ///     @State var favoriteFruit = MyFruit.banana
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text("My Favorite Fruit: \(favoriteFruit.rawValue)")
    ///
    ///             Picker("My Picker", selection: $favoriteFruit) {
    ///                 Text("Banana 🍌🍌")
    ///                     .tag(MyFruit.banana)
    ///                 Text("Apple 🍎🍎")
    ///                     .tag(MyFruit.apple)
    ///                 Text("Peach 🍑🍑")
    ///                     .tag(MyFruit.peach)
    ///             }
    ///             .pickerStyle(SegmentedPickerStyle())
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a VStack with the text view
    /// "My Favorite Fruit: \(favoriteFruit.rawValue)" and a picker titled
    /// "My Picker", with thre text items, "Banana 🍌🍌", "Apple 🍎🍎", and
    /// "Peach 🍑🍑", each tagged to the enum MyFruit.](picker-style-6.gif)
    ///
    public func pickerStyle<S>(_ style: S) -> some View where S : PickerStyle { }

}

