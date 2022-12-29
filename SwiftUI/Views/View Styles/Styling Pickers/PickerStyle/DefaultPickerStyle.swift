/// The default picker style, based on the picker's context.
///
/// How a picker using the default picker style appears largely depends on the
/// platform and the view type in which it appears. For example, in a standard
/// view, the default picker styles by platform are:
///
/// * A wheel on iOS and watchOS
/// * A pop-up button on macOS
/// * A segmented control on tvOS
///
/// The default picker style may also take into account other factors — like
/// whether the picker appears in a container view — when setting the appearance
/// of a picker.
///
/// ```
/// struct ExampleView: View {
///     var fruits = ["Banana🍌🍌","Apple🍎🍎", "Peach🍑🍑" ]
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
///         .pickerStyle(DefaultPickerStyle())
///     }
/// }
/// ```
///
/// ![Gif displays a view with a VStack that contains a default wheel picker rolling
/// through each of three options, "Banana🍌🍌","Apple🍎🍎", and "Peach🍑🍑",
/// and a corresponding text view which reads "Your Favorite Fruit: _".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/pickerstyle-wheel-example-1.gif)
///
/// [pickerstyle-default ->]
/// Your app can also use explicit tags to identify picker content.
///
/// ```
/// enum MyFruit {
///     case banana, apple, peach
/// }
///
/// struct ExampleView: View {
///     @State var favoriteFruit: MyFruit = .banana
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
///         .pickerStyle(DefaultPickerStyle())
///     }
/// }
/// ```
///
/// ![Gif displays a view with a VStack that contains a default wheel picker rolling
/// through each of three options, "Banana🍌🍌","Apple🍎🍎", and "Peach🍑🍑",
/// and a corresponding text view which reads "Your Favorite Fruit: _" using explicit
/// tags.](picker-style-1.gif)
///
/// [<-]
/// You can override a picker’s style. To apply the default style to a picker,
/// or to a view that contains pickers, use the ``View/pickerStyle(_:)`` modifier.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultPickerStyle : PickerStyle {

    /// Creates a default picker style.
    public init() { }
}

