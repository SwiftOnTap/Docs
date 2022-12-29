/// A control that lets you select an item.
///
/// You create a picker by providing 3 things:
/// 1. A **selection binding**
/// 2. A **label**
/// 3. **Content** for the picker to display.
///
/// Set the `selection` parameter to a "current selection" binding.
///
/// Set the label to a view that describes the purpose of selecting content
/// in the picker.
///
/// The content is what the picker displays.
///
/// For example, consider the following enumeration of ice cream flavors:
///
///     enum Flavor: String, CaseIterable, Identifiable {
///         case chocolate
///         case vanilla
///         case strawberry
///
///         var id: String { self.rawValue }
///     }
///
/// You can create a picker to select among these values by providing ``Text``
/// views in the picker initializer's content:
///
/// ```
/// struct IceCreamView: View {
///     @State private var selectedFlavor = Flavor.chocolate
///
///     var body: some View {
///         Picker("Flavor", selection: $selectedFlavor) {
///             Text("Chocolate 🍫")
///                 .tag(Flavor.chocolate)
///             Text("Vanilla 🍦")
///                 .tag(Flavor.vanilla)
///             Text("Strawberry 🍓")
///                 .tag(Flavor.strawberry)
///         }
///         Text("Selected flavor: \(selectedFlavor.rawValue)")
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a default wheel style picker with three
/// options, "Chocolate 🍫", "Vanilla 🍦", and "Strawberry 🍓", and a textview
/// that reads "Selected flavor: \(selectedFlavor.rawValue)"; each picker option
/// is tagged to the a Flavor enum within the state variable selectedFlavor,
/// which is used to populate the textview with the chosen flavor.](picker-ex1.gif)
///
/// You append a tag to each text view so that the type of each selection
/// matches the type of the bound state variable.
///
/// ### Iterating Over a Picker’s Options
///
/// To provide selection values for the `Picker` without explicitly listing
/// each option, you can create the picker with a ``ForEach`` construct, like
/// this:
///
/// ```
/// struct IceCreamView: View {
///     @State private var selectedFlavor = Flavor.chocolate
///
///     var body: some View {
///         Picker("Flavor", selection: $selectedFlavor) {
///             ForEach(Flavor.allCases) { flavor in
///                 Text(flavor.rawValue.capitalized)
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a default wheel style picker with three
/// options, "Chocolate", "Vanilla", and "Strawberry"; the picker uses a ForEach
/// construct to populate its options.](picker-ex2.gif)
///
/// In this case, ``ForEach`` automatically assigns a tag to the selection
/// views, using each option's `id`, which it can do because `Flavor` conforms
/// to the [`Identifiable`](https://developer.apple.com/documentation/swift/identifiable)
/// protocol.
///
/// However, if the selection type doesn't match the input to the
/// ``ForEach``, you need to provide an explicit tag. The following example
/// shows a picker that has a binding to a `Topping` type, even though the options
/// are all `Flavor` instances. Each option uses ``View/tag(_:)`` to associate
/// a topping with the flavor it displays.
///
/// ```
/// enum Flavor: String, CaseIterable, Identifiable {
///     case chocolate
///     case vanilla
///     case strawberry
///
///     var id: String { self.rawValue }
///     var suggestedTopping: Topping {
///         switch self {
///         case .chocolate:
///             return .nuts
///         case .vanilla:
///             return .cookies
///         case .strawberry:
///             return .blueberries
///         }
///     }
/// }
/// enum Topping: String, CaseIterable, Identifiable {
///     case nuts
///     case cookies
///     case blueberries
///
///     var id: String { self.rawValue }
/// }
///
/// struct ContentView: View {
///     @State private var suggestedTopping: Topping = .cookies
///     var body: some View {
///         Picker("Suggest a topping for:", selection: $suggestedTopping) {
///             ForEach(Flavor.allCases) { flavor in
///                 Text(flavor.rawValue.capitalized)
///                     .tag(flavor.suggestedTopping)
///             }
///         }
///         Text("suggestedTopping: \(suggestedTopping.rawValue)")
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a default wheel style picker with three
/// options, "Chocolate", "Vanilla", and "Strawberry", and a textview
/// that reads "suggestedTopping: \(suggestedTopping.rawValue)"; a ForEach
/// construct containing the  Flavor enum populates the options and returns a
/// suggested topping for each, which is used to populate the textview.](picker-ex3.gif)
///
/// ### Styling Pickers
///
/// You can customize the appearance and interaction of pickers by creating
/// styles that conform to the ``PickerStyle`` protocol. You create your own style
/// or use one of the styles provided by SwiftUI, like ``SegmentedPickerStyle``
/// or `PopUpButtonPickerStyle`.
///
/// To set a specific style for all picker instances within a view, use the
/// ``View/pickerStyle(_:)`` modifier.
///
/// ```
/// struct ContentView: View {
///     @State private var selectedFlavor = Flavor.chocolate
///     var body: some View {
///         Picker("Flavor", selection: $selectedFlavor) {
///             Text("chocolate")
///                 .tag(Flavor.chocolate)
///             Text("vanilla")
///                 .tag(Flavor.vanilla)
///         }
///         .pickerStyle(SegmentedPickerStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a segmented style picker with two
/// options, "chocolate" and "vanilla".](picker-ex4.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Picker<Label, SelectionValue, Content> : View where Label : View, SelectionValue : Hashable, Content : View {

    /// Creates a picker with a custom label.
    ///
    /// ```
    /// struct PickerView: View {
    ///     @State private var selection: Int = 0
    ///
    ///     var body: some View {
    ///         Picker(selection: $selection, label: Label("Pick emoji", systemImage: "face.smiling")) {
    ///             Text("🍌").tag(1)
    ///             Text("🍎").tag(2)
    ///             Text("🍑").tag(3)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a picker with three options represented by three
    /// different emojis, with the current selection first highlighted in gray.
    /// The picker has a custom label which does not appear in this view.](picker-init-slc-ex.gif)
    ///
    /// - Parameters:
    ///     - selection: A binding to the currently selected option.
    ///     - label: A view used for the picker's label.
    ///     - content: A closure that returns the picker's options.
    ///
    @available(iOS, deprecated: 100000.0, renamed: "Picker(selection:content:label:)")
    @available(macOS, deprecated: 100000.0, renamed: "Picker(selection:content:label:)")
    @available(tvOS, deprecated: 100000.0, renamed: "Picker(selection:content:label:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Picker(selection:content:label:)")
    public init(selection: Binding<SelectionValue>, label: Label, @ViewBuilder content: () -> Content) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Picker where Label == Text {

    /// Creates a picker with a localized string key label.
    ///
    /// ```
    /// struct PickerView: View {
    ///     @State private var selection: Int = 0
    ///
    ///     var body: some View {
    ///         Picker(LocalizedStringKey("Pick emoji"), selection: $selection) {
    ///             Text("🍌").tag(1)
    ///             Text("🍎").tag(2)
    ///             Text("🍑").tag(3)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a picker with three options represented by three
    /// different emojis, with the current selection first highlighted in gray.
    /// The picker has a localized string label which does not appear in this view.](picker-init-slc-ex.gif)
    ///
    /// - Parameters:
    ///     - titleKey: A localized string key used for the picker's label.
    ///     - selection: A binding to the currently selected option.
    ///     - content: A closure that returns the picker's options.
    public init(_ titleKey: LocalizedStringKey, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) { }

    /// Creates a picker with a string label.
    ///
    /// ```
    /// struct PickerView: View {
    ///     @State private var selection: Int = 0
    ///
    ///     var body: some View {
    ///         Picker("Pick emoji 🤑", selection: $selection) {
    ///             Text("🍌").tag(1)
    ///             Text("🍎").tag(2)
    ///             Text("🍑").tag(3)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a picker with three options represented by three
    /// different emojis, with the current selection first highlighted in gray.
    /// The picker has a string label which does not appear in this view.](picker-init.png)
    ///
    /// - Parameters:
    ///     - title: A string used for the pikcer's label.
    ///     - selection: A binding to the currently selected option.
    ///     - content: A closure that returns the picker's options.
    public init<S>(_ title: S, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) where S : StringProtocol { }
}

