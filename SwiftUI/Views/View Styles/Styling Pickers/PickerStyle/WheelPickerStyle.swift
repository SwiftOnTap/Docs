/// A picker style that presents the options in a scrollable wheel that shows
/// the selected option and a few neighboring options.
///
/// ```
/// struct ExampleView: View {
///     var fruits = ["Banana🍌🍌","Apple🍎🍎", "Peach🍑🍑"]
///     @State private var selectedFruit = 0
///
///     var body: some View {
///         VStack {
///             Picker(selection: $selectedFruit, label: Text("Select Favorite Fruit")) {
///                 ForEach(0..<fruits.count) {
///                     Text(self.fruits[$0])
///                 }
///             }
///             Text("Your Favorite Fruit: \(self.fruits[selectedFruit])")
///         }
///         .pickerStyle(WheelPickerStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying view with a VStack containing a wheel style picker, in
/// which three options, "Banana🍌🍌","Apple🍎🍎", or "Peach🍑🍑", are shown
/// being scrolled throughfollowed by a text view reading "Your Favorite Fruit:
/// _" which is populated by the currently selected picker option; a light gray box highlights
/// the current selection.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/pickerstyle-wheel-example-1.gif)
///
/// Because most options aren't visible, organize them in a predictable order,
/// such as alphabetically.
///
/// [pickerstyle-wheel ->]
/// Your app can also use explicit tags to identify picker content.
///
/// ```
/// enum MyFruit {
///     case banana, apple, peach
/// }
///
/// struct ExampleView: View {
///     @State var favoriteFruit: MyFruit = MyFruit.banana
///
///     var fruitName: String {
///         switch favoriteFruit {
///         case .banana:
///             return "Banana 🍌🍌"
///         case .apple:
///             return "Apple 🍎🍎"
///         case .peach:
///             return "Peach 🍑🍑"
///         }
///     }
///
///     var body: some View {
///         Text("My Favorite Fruit: \(fruitName)")
///
///         Picker("My Picker", selection: $favoriteFruit) {
///             Text("Banana 🍌🍌")
///                 .tag(MyFruit.banana)
///             Text("Apple 🍎🍎")
///                 .tag(MyFruit.apple)
///             Text("Peach 🍑🍑")
///                 .tag(MyFruit.peach)
///         }
///         .pickerStyle(WheelPickerStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a view with a VStack containing a text view reading "My Favorite Fruit:
/// _", which is populated by a wheel style picker below with the options "Banana🍌🍌","Apple🍎🍎",
/// or "Peach🍑🍑"; the three options are tagged through the state variabke favoriteFruit.](picker-style-7.gif)
///
/// [<-]
///
/// To apply this style to a picker, or to a view that contains pickers, use the
/// ``View/pickerStyle(_:)`` modifier.
@available(iOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
public struct WheelPickerStyle : PickerStyle {

    /// Sets the picker style to display an item wheel from which the user makes
    /// a selection.
    public init() { }
}

