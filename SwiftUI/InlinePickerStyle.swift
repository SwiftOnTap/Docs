/// A ``PickerStyle`` where each option is displayed inline with
/// other views in the current container.
///
/// [pickerstyle-inline ->]
/// Your app can use explicit tags to identify picker content.
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
///         .pickerStyle(InlinePickerStyle())
///     }
/// }
/// ```
///
/// ![A view containing a state variable that links to an enum, a variable called
/// fruitName with a switch statement for three fuit cases, a text view reading
/// "My Favorite Fruit: \(fruitName)", and an inline style picker titled
/// "My Picker" with the text items "Banana 🍌🍌", "Apple 🍎🍎", and "Peach 🍑🍑",
/// each of which have been tagged to the state variable; the gif scrolls through
/// the picker options, showing that the text view chnages accordingly.](picker-style-2.gif)
///
/// [<-]
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct InlinePickerStyle : PickerStyle {

    /// Creates an inline picker style.
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
    ///         /.pickerStyle(InlinePickerStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a state variable that links to an enum, a variable called
    /// fruitName with a switch statement for three fuit cases, a text view reading
    /// "My Favorite Fruit: \(fruitName)", and an inline style picker titled
    /// "My Picker" with the text items "Banana 🍌🍌", "Apple 🍎🍎", and "Peach 🍑🍑",
    /// each of which have been tagged to the state variable; the gif scrolls through
    /// the picker options, showing that the text view chnages accordingly.](picker-style-2.gif)
    ///
    public init() { }
}

