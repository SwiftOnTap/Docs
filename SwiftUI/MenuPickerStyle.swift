/// A menu-formatted picker style.
///
/// ``MenuPickerStyle`` is picker style that presents the options as a menu when
/// the user presses a button, or as a submenu when nested within a larger menu.
///
/// Use this style when there are more than five options. Consider using
/// ``InlinePickerStyle`` when there are fewer than five options.
///
/// ```
/// struct ExampleView: View {
///     var fruits = ["Banana🍌🍌","Apple🍎🍎", "Peach🍑🍑", "Watermelon🍉🍉", "Grapes🍇🍇" ]
///     @State private var selectedFruit = 0
///
///     var body: some View {
///         VStack {
///             Picker(selection: $selectedFruit, label: Text("Select Favorite Fruit")) {
///                 ForEach(0..<fruits.count) {
///                     Text(self.fruits[$0])
///                 }
///             }
///
///             Text("Your Favorite Fruit: \(self.fruits[selectedFruit])")
///         }
///         .pickerStyle(MenuPickerStyle())
///     }
/// }
/// ```
///
/// ![A gif that displays a view containing a VStack with a menu picker style
/// labeled as "Select Favorite Fruit" that once clicked displays the five menu
/// options, "Banana🍌🍌","Apple🍎🍎", "Peach🍑🍑", "Watermelon🍉🍉", and
/// "Grapes🍇🍇", followed by text reading "Your Favorite Fruit: _", which is
/// populated once a menu item is selected.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/pickerstyle-menu-example-1.gif)
///
/// [pickerstyle-menu ->]
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
///         .pickerStyle(MenuPickerStyle())
///     }
/// }
/// ```
///
/// ![A gif that displays a view containing a VStack with the text "My Favorite Fruit: _",
/// which is populated by the following menu picker stylemenu picker style
/// labeled as "My Picker"; once clicked, "My Picker" displays three menu
/// items, "Peach🍑🍑", "Apple🍎🍎", and "Banana🍌🍌", originated from tags connected to the state vairabe "MyFruit".](picker-style-3.gif)
///
/// [<-]
///
/// The button itself indicates the selected option. You can include additional controls in the set of options, such as a button to customize the list of options.
///
/// To apply this style to a picker, or to a view that contains pickers, use the ``View/pickerStyle(_:)`` modifier.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct MenuPickerStyle : PickerStyle {

    /// Creates a menu picker style.
    public init() { }
}

