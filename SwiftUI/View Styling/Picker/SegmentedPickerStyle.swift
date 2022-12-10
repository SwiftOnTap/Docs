/// A picker style that presents the options in a segmented control.
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
///         .pickerStyle(SegmentedPickerStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a view with a VStack containing a segmented picker with
/// 5 options,"Banana🍌🍌","Apple🍎🍎", "Peach🍑🍑", "Watermelon🍉🍉", "Grapes🍇🍇",
// followed by the text "Your Favorite Fruit: _"; the gif shows the user looping
/// through all of the picker options, which then populate the blank in the text.](segmented-picker-ex1.gif)
///
/// [pickerstyle-segmented ->]
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
///         VStack {
///             Text("My Favorite Fruit: \(fruitName)")
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
/// ![A gif displaying a view with a VStack containing the text "My Favorite Fruit: _",
/// which is populated by the following stack element, a segmented picker with
/// 3 options,"Banana🍌🍌","Apple🍎🍎", and "Peach🍑🍑"; The picker uses tags
/// from the state variable favoriteFruit.](picker-style-6.gif)
///
/// [<-]
///
///
/// To apply this style to a picker, or to a view that contains pickers, use the
/// ``View/pickerStyle(_:)`` modifier.
///
/// Note: The segmented picker style supports ``Text`` and ``Image`` segments only.
/// Any other view results in a visible, but empty, segment.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct SegmentedPickerStyle : PickerStyle {

    /// Creates a segmented picker style.
    public init() { }
}

