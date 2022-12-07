/// A parent view for tab-style navigation.
///
/// ``TabView`` is a container view that provides tab-style navigation for its
/// child views.
///
/// [tabview-tabitem ->]
/// ### Tab-bar based navigation
///
/// Place child views in a ``TabView`` and apply ``View/tabItem(_:)`` to each child
/// for tab-bar style navigation.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         TabView {
///             Text("Bananas 🍌🍌")
///                 .tabItem {
///                     Image(systemName: "1.circle.fill")
///                     Text("🍌🍌")
///                 }
///             Text("Apples 🍏🍏")
///                 .tabItem {
///                     Image(systemName: "2.square.fill")
///                     Text("🍏🍏")
///                 }
///             Text("Peaches 🍑🍑")
///                 .tabItem {
///                     Image(systemName: "3.square.fill")
///                     Text("🍑🍑")
///                 }
///         }
///         .font(.headline)
///     }
/// }
/// ```
///
/// ![A gif that jumps between the three text views, "Bananas 🍌🍌",
/// "Apples 🍏🍏", and "Peaches 🍑🍑", within a TabView by clicking the
/// corresponding symbols on the tab-bar: each tab bar item is a filled circle
/// with the page number above the two matching emojis corresponding to the
/// those in the text views.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TabView-example-1.gif)
///
/// [<-]
/// [tabview-style ->]
/// ### Page-style navigation
///
/// **In iOS 14+ only**, you can place child views in a ``TabView`` with a
/// `View.tabViewStyle(.page)` attached to the ``TabView``
/// for a page-style style navigation.
///
/// The following example creates a paginated view with the three ``Text`` child
/// views as individual pages.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         TabView {
///             Text("Bananas 🍌🍌")
///             Text("Apples 🍏🍏")
///             Text("Peaches 🍑🍑")
///         }
///         .foregroundColor(Color.white)
///         .background(Color.yellow)
///         .tabViewStyle(.page)
///     }
/// }
/// ```
///
/// ![A gif that flips between the three pages, each containing a text item, in a tabview whilst displaying the page indicators at the bottom of the view.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TabView-example-2.gif)
///
/// ``TabView`` also supports dynamically loading pages. The example above can be
/// re-expressed as the following:
///
/// ```
/// struct ContentView: View {
///     @State var items = ["Bananas 🍌🍌", "Apples 🍏🍏", "Peaches 🍑🍑"]
///
///     var body: some View {
///         TabView {
///             ForEach(items, id: \.self) {
///                 Text($0)
///                     .foregroundColor(Color.white)
///             }
///         }
///         .tabViewStyle(.page)
///         .background(Color.black)
///     }
/// }
/// ```
///
/// ![A gif that flips between the three dynamically loading pages, each containing a text item, in a tabview whilst displaying the page indicators at the bottom of the view.](tab-view-dynam.gif)
///
/// This example supports loading a dynamic list of pages from `items`.
///
/// A page-styled ``TabView`` will add a row of page indicator(s) at the bottom
/// of the container by default. If ``View/tabItem(_:)`` is used, these indicators
/// each take the form of the corresponding tab item's primary image. If not -
/// these page indicators resort to system defaults.
///
/// To disable page indicators altogether, apply a ``PageTabViewStyle`` using
/// ``View/tabViewStyle(_:)``, like so:
///
/// ```
/// struct ContentView: View {
///     @State var items = ["Bananas 🍌🍌", "Apples 🍏🍏", "Peaches 🍑🍑"]
///
///     var body: some View {
///         TabView {
///             ForEach(items, id: \.self) { item in
///                 Text(item)
///             }
///         }
///         .background(Color.yellow)
///         .tabViewStyle(.page(indexDisplayMode: .never))
///     }
/// }
/// ```
///
/// ![A gif that flips between the three dynamically loading pages, each containing a text item, in a tabview without displaying page indicators.](tab-view-ex4.gif)
/// [<-]
/// [tabview-tag ->]
///
/// ### Handling tab-selection
///
/// ``TabView`` provides the ability to observe and/or set the active tab
/// selection via its initializer ``TabView/init(selection:content:)``, and the
/// modifier ``View/tag(_:)``.
///
/// Here is an example that writes tab selection to a state variable:
///
/// ```
/// struct ContentView: View {
///     enum TabItem {
///         case bananas, apples, peaches
///     }
///     @State var selectedItem = TabItem.bananas
///
///     var body: some View {
///         TabView(selection: $selectedItem) {
///             Text("Bananas 🍌🍌")
///                 .tabItem {
///                     Image(systemName: "1.circle.fill")
///                     Text("🍌🍌")
///                 }
///                 .tag(TabItem.bananas)
///
///             Text("Apples 🍏🍏")
///                 .tabItem {
///                     Image(systemName: "2.square.fill")
///                     Text("🍏🍏")
///                 }
///                 .tag(TabItem.apples)
///
///             Text("Peaches 🍑🍑")
///                 .tabItem {
///                     Image(systemName: "3.square.fill")
///                     Text("🍑🍑")
///                 }
///                 .tag(TabItem.peaches)
///         }
///     }
/// }
/// ```
///
/// ![A gif that jumps between the three children in a TabView by clicking the
/// various symbols on the tab-bar; the tab selection is written to a state
/// variable.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TabView-example-5.gif)
///
/// In this example, each tab item is assigned a unique tag using the
/// ``View/tag(_:)`` view modifier. ``TabView`` in turn takes a binding to
/// the tab selection, `$selectedItem`, and updates it whenever a new tab is
/// selected. `$selectedItem` in turn can also be used to programmatically
/// control tab-selection, as bindings work bidirectionally.
///
/// Note that ``View/tag(_:)`` accepts any `Hashable` value. An enum was used in
/// the previous example, but it could've just as easily been a `String` or an
/// `Int`.
///
/// For example, the following uses a traditional 0-based tab indexing:
///
/// ```
/// struct ContentView: View {
///     @State var selectedItem = 0
///
///     var body: some View {
///         TabView(selection: $selectedItem) {
///             Text("Bananas 🍌🍌")
///                 .tag(0)
///
///             Text("Apples 🍏🍏")
///                 .tag(1)
///
///             Text("Peaches 🍑🍑")
///                 .tag(2)
///         }
///     }
/// }
/// ```
///
/// ![A gif that jumps between the three children in a TabView without icons in
/// the tab-bar.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TabView-example-6.gif)
/// [<-]
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
public struct TabView<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {

    /// Creates a TabView from a selection and a view builder of pages.
    ///
    /// Use this initialzer to create a ``TabView`` when you need programmatic
    /// access to the ``Binding`` value representing the currently selected
    /// page. If you don't need access to this ``Binding``, use
    /// ``TabView/init(content:)`` instead.
    ///
    /// The following example writes the tab selection to a `@State` variable:
    ///
    /// ```
    /// struct ContentView: View {
    ///     enum TabItem {
    ///         case bananas, apples, peaches
    ///     }
    ///     @State var selectedItem = TabItem.bananas
    ///
    ///     var body: some View {
    ///         TabView(selection: $selectedItem) {
    ///             Text("Bananas 🍌🍌")
    ///                 .tabItem { Text("🍌") }
    ///                 .tag(TabItem.bananas)
    ///
    ///             Text("Apples 🍏🍏")
    ///                 .tabItem { Text("🍏") }
    ///                 .tag(TabItem.apples)
    ///
    ///             Text("Peaches 🍑🍑")
    ///                 .tabItem { Text("🍑") }
    ///                 .tag(TabItem.peaches)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif that jumps between the three children in a TabView,
    /// "Bananas 🍌🍌", "Apples 🍏🍏", and "Peaches 🍑🍑", by clicking the
    /// corresponding symbols "🍌", "🍏", and "🍑", on the tab-bar, which
    /// appear as grayed out sillouettes when not selected.](tab-view-init-selection-content-ex1.gif)
    ///
    /// In this example, each tab item is assigned a unique tag using the
    /// ``View/tag(_:)`` view modifier. ``TabView`` in turn takes a binding to
    /// the tab selection, `$selectedItem`, and updates it whenever a new tab is
    /// selected. `$selectedItem` in turn can also be used to programmatically
    /// control tab-selection, as bindings work bidirectionally.
    ///
    /// Note that ``View/tag(_:)`` accepts any `Hashable` value. An enum was used in
    /// the previous example, but it could've just as easily been a `String` or an
    /// `Int`.
    ///
    /// For example, the following uses a traditional 0-based tab indexing:
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var selectedItem = 0
    ///
    ///     var body: some View {
    ///         VStack {
    ///             TabView(selection: $selectedItem) {
    ///                 Text("Bananas 🍌🍌")
    ///                     .tag(0)
    ///
    ///                 Text("Apples 🍏🍏")
    ///                     .tag(1)
    ///
    ///                 Text("Peaches 🍑🍑")
    ///                     .tag(2)
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif that jumps between the three children in a TabView,
    /// "Bananas 🍌🍌", "Apples 🍏🍏", and "Peaches 🍑🍑", using traditional
    /// 0-based tab indexing.](tab-view-init-selection-content-ex1.gif))
    ///
    /// For more ways to use tab-style views, see ``TabView``.
    public init(selection: Binding<SelectionValue>?, @ViewBuilder content: () -> Content) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
extension TabView where SelectionValue == Int {

    /// Creates a TabView from only a view builder of pages.
    ///
    /// This is useful if you don't want to have to pass in your own binding
    /// selection index, and just want the view to default at the first page.
    /// You will still be able to move tabs, but you won't be able to programmatically
    /// change tabs from outside the view.
    ///
    /// To create a tab-bar based navigation page, simply stack child
    /// views into a ``TabView``, and apply ``View/tabItem(_:)``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         TabView {
    ///             Text("Bananas 🍌🍌")
    ///                 .tabItem { Text("🍌") }
    ///             Text("Apples 🍏🍏")
    ///                 .tabItem { Text("🍏") }
    ///             Text("Peaches 🍑🍑")
    ///                 .tabItem { Text("🍑") }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying three text views stacked in a tabview, with tabitem
    /// applied to each childview. At the bottom of the screen is a small grey
    /// bar with three emojis, each representing a tab item. When tapped, each tab
    /// takes the user to the appropriate text view.](tab-view-init-selection-content-ex1.gif)
    ///
    /// For more ways to use tab-style views, see ``TabView``.
    public init(@ViewBuilder content: () -> Content) { }
}

