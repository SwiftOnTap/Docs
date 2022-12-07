/// A scrollable list of data.
///
/// ``List`` is a view that represents a scrollable list of data.
///
/// ### Creating a ``List`` with a fixed number of elements
///
/// The following creates a ``List`` with three rows of text:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         List {
///             Text("Bananas 🍌🍌")
///             Text("Apples 🍏🍏")
///             Text("Peaches 🍑🍑")
///         }
///     }
/// }
/// ```
///
/// ![A view displaying a list containing three text members, "Bananas 🍌🍌", "Apples 🍏🍏", and "Peaches 🍑🍑".](7EF39BE9-B27B-4BA3-A4AD-CA3FCD274F9F.png)
///
/// ### Creating a `List` with a variable number of elements
///
/// In the following example, ``List/init(_:id:rowContent:)`` is used to
/// dynamically create a ``List`` over an array of strings, `fruits`.
///
/// ```
/// struct ExampleView: View {
///     @State var fruits: [String] = ["Bananas 🍌🍌", "Apples 🍏🍏", "Peaches 🍑🍑"]
///
///     var body: some View {
///         List.init(fruits, id: \.self) { (fruit: String) in
///             Text(fruit)
///         }
///     }
/// }
/// ```
///
/// ![A view displaying a dynamic list containing an array with three string members, "Bananas 🍌🍌", "Apples 🍏🍏", and "Peaches 🍑🍑," each displayed as a separate list item.](5A921B5A-4B90-457C-A65F-8AE616E0E932.png)
///
/// This is different from the previous example, because this initializer
/// accepts a `rowContent` parameter that allows the `List` to generate SwiftUI
/// views for the list's rows on-demand.
///
/// The `id` parameter requires a key-path to the *identifier* for each row of
/// the ``List``. This is required so that ``List`` can efficiently process
/// changes in the data source (in this example, the array `fruits`). These
/// changes to the data source are animated as insertions, removals and
/// reorders - reflecting the changes in the source.
///
/// It is up to the programmer to decide what property best represents the
/// 'identiifer' of a particular type. In this example, the [`String`](https://developer.apple.com/documentation/swift/string) itself
/// is a valid identifier for the data, therefore `\\.self` is passed along to
/// the `id` parameter.
///
/// ### Creating a ``List`` with both fixed and dynamic elements
///
/// `List` allows you to mix both fixed and dynamic elements using ``ForEach``.
///
/// The following example displays a ``List`` of a fixed element
/// (`"Hello, World!"`) followed by dynamic elements from the previous
/// example (using the `fruits` array):
///
/// ```
/// struct ExampleView: View {
///     @State var fruits: [String] = ["Bananas 🍌🍌", "Apples 🍏🍏", "Peaches 🍑🍑"]
///
///     var body: some View {
///         List {
///             Text("Hello, World!")
///
///             ForEach(fruits, id: \.self) { (fruit: String) in
///                 Text(fruit)
///             }
///         }
///     }
/// }
/// ```
///
/// ![A view displaying a list containing a fixed element "Hello, World!" and three dynamic elements, "Bananas 🍌🍌", "Apples 🍏🍏", and "Peaches 🍑🍑".](2D10DFE0-3A9D-4AD6-B7C3-A350EC37D0C4.png)
///
/// As seen in the above example, ``ForEach`` also accepts an `id` parameter
/// along with a `rowContent`.
/// [list-sections ->]
/// ### Adding sections to a ``List``
///
/// The following example demonstrates the usage of ``Section``.
///
/// ```
/// struct ExampleView: View {
///     @State var fruits: [String] = ["Bananas 🍌🍌", "Apples 🍏🍏", "Peaches 🍑🍑"]
///
///     var body: some View {
///         List {
///             Section(header: Text("Not a fruit")) {
///                 Text("Hello, World!")
///             }
///
///             Section(header: Text("Fruit")) {
///                 ForEach(fruits, id: \.self) { (fruit: String) in
///                     Text(fruit)
///                 }
///             }
///         }
///     }
/// }
/// ```
///
/// ![A view displaying a list separated into two sections, one with the header "NOT A FRUIT" above the element "Hello, World!" and another with the header "FRUIT" above three dynamic elements, "Bananas 🍌🍌", "Apples 🍏🍏", and "Peaches 🍑🍑".](0CAA80FC-BDA9-405A-8AB1-5ED8B0ECF92C.png)
///
/// A ``Section`` used within a `List` will render as a table-section containing
/// the elements wrapped by that section. Just as for unsectioned elements,
/// sections can hold both fixed and dynamic elements.
/// [<-]
/// [list-style ->]
/// ### Styling a ``List``
///
/// A ``List`` can be styled using the ``View/listStyle(_:)`` modifier.
///
/// The following example demonstrates how to style a `List` using the
/// grouped-inset style:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         List {
///             Text("Bananas 🍌🍌")
///             Text("Apples 🍏🍏")
///             Text("Peaches 🍑🍑")
///         }
///         .listStyle(InsetGroupedListStyle())
///     }
/// }
/// ```
///
/// ![A view displaying a grouped-inset list containing three text members,
/// "Bananas 🍌🍌", "Apples 🍏🍏", and "Peaches 🍑🍑".](7FC84606-BB3F-41C2-BEC1-40346A413676.png)
///
/// SwiftUI offers various list styles:
///
/// - ``DefaultListStyle``
/// - ``GroupedListStyle``
/// - ``InsetGroupedListStyle``
/// - ``InsetListStyle``
/// - ``PlainListStyle``
/// - ``SidebarListStyle``
///
/// - Note: List styles only modify the appearance of a ``List``. They do not
/// affect the order or positioning of rows within the ``List``.
/// [<-]
/// [list-row-background ->]
/// ### Setting the background view for a list row
///
/// Use ``View/listRowBackground(_:)`` to set the background view for a given
/// row.
///
/// The following example demonstrates how ``View/listRowBackground(_:)`` can
/// be used to provide specific background colors for a list's rows:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         List {
///             Text("Bananas 🍌🍌")
///                 .listRowBackground(Color.yellow)
///             Text("Apples 🍏🍏")
///                 .listRowBackground(Color.green)
///             Text("Peaches 🍑🍑")
///                 .listRowBackground(Color.orange)
///         }
///     }
/// }
/// ```
///
/// ![A view displaying a list containing three text members, "Bananas 🍌🍌",
/// "Apples 🍏🍏", and "Peaches 🍑🍑", each with a different list row
/// background color.](A6394785-F064-497F-A48B-7ED9DAA55452.png)
///
/// A background can be provided for multiple list rows at a time, by applying
/// the ``View/listRowBackground(_:)`` modifier to ``ForEach``.
///
/// In the following example, all the rows of the ``List`` have the background
/// view `Color.yellow`.
///
/// ```
/// struct ExampleView: View {
///     @State var fruits: [String] = ["Bananas 🍌🍌", "Apples 🍏🍏", "Peaches 🍑🍑"]
///
///     var body: some View {
///         List {
///             ForEach(fruits, id: \.self) { (fruit: String) in
///                 Text(fruit)
///             }
///             .listRowBackground(Color.yellow)
///         }
///     }
/// }
/// ```
///
/// ![A view displaying a dynamic list containing an array with three string
/// members, "Bananas 🍌🍌", "Apples 🍏🍏", and "Peaches 🍑🍑," each displayed
/// as a separate list item with a yellow list row background.](9236312D-0F88-47FE-A2C8-B5BE665FBBE3.png)
///
/// [<-]
///
/// [list-deletable ->]
/// ### Making list rows deletable
///
/// Apply the ``DynamicViewContent/onDelete(perform:)`` modifier on a
/// ``ForEach`` within a ``List`` to allow the list rows to become deletable.
///
/// ```
/// struct ExampleView: View {
///     @State var fruits = ["🍌", "🍏", "🍑"]
///
///     var body: some View {
///         NavigationView {
///             List {
///                 ForEach(fruits, id: \.self) { fruit in
///                     Text(fruit)
///                 }
///                 .onDelete { offsets in
///                     fruits.remove(atOffsets: offsets)
///                 }
///             }
///             .toolbar {
///                 EditButton()
///             }
///         }
///     }
/// }
/// ```
///
///![A view displaying a list containing an array with three string members,
/// "🍌", "🍏", and "🍑," each displayed as a separate deletable list item.
/// The gif shows the "🍏" being deleted by sliding the row to the right and
/// clicking the red "Delete" button that appears.](list-items-deletable.gif)
///
/// [<-]
///
/// [list-edit-button ->]
/// ### Editing a `List` using ``EditButton``
///
/// An `EditButton` placed in the navigation bar of a `NavigationView` with a
/// ``List`` in it can be used to provide an edit button for the ``List``.
///
/// ```
/// struct ExampleView: View {
///     @State var fruits = ["🍌", "🍏", "🍑"]
///
///     var body: some View {
///         NavigationView {
///             List {
///                 ForEach(fruits, id: \.self) { fruit in
///                     Text(fruit)
///                 }
///                 .onDelete { offets in
///                     fruits.remove(atOffsets: offets)
///                 }
///             }
///             .toolbar {
///                 EditButton()
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif showing a view with an "Edit" button right aligned above a list
/// containg three fruit emojis as members; when clicked, the word "Edit" is
/// replaced by "Done" and red "Delete" button appears in line with any list
/// item when it is slid to the left.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/List-example-8.gif)
///
/// [<-]
/// ### Further notes
///
/// Although ``List`` is very powerful, it currently has some limitations:
///
/// - The separator of a ``List`` cannot be removed.
/// - ``SidebarListStyle`` is broken on macCatalyst.
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct List<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {

    /// Creates a list with the given content that supports selecting multiple
    /// rows.
    ///
    /// On iOS and tvOS, you must explicitly put the list into edit mode for
    /// the selection to apply.
    ///
    /// - Parameters:
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - content: The content of the list.
    @available(watchOS, unavailable)
    public init(selection: Binding<Set<SelectionValue>>?, @ViewBuilder content: () -> Content) { }

    /// Creates a list with the given content that supports selecting a single
    /// row.
    ///
    /// On iOS and tvOS, you must explicitly put the list into edit mode for
    /// the selection to apply.
    ///
    /// - Parameters:
    ///   - selection: A binding to a selected row.
    ///   - content: The content of the list.
    @available(watchOS, unavailable)
    public init(selection: Binding<SelectionValue?>?, @ViewBuilder content: () -> Content) { }

    /// The content of the list.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension List {

    /// Creates a list that computes its rows on demand from an underlying
    /// collection of identifiable data, optionally allowing users to select
    /// multiple rows.
    ///
    /// - Parameters:
    ///   - data: The identifiable data for computing the list.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable { }

    /// Creates a hierarchical list that computes its rows on demand from an
    /// underlying collection of identifiable data, optionally allowing users to
    /// select multiple rows.
    ///
    /// - Parameters:
    ///   - data: The identifiable data for computing the list.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, children: KeyPath<Data.Element, Data?>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable { }

    /// Creates a list that identifies its rows based on a key path to the
    /// identifier of the underlying data, optionally allowing users to select
    /// multiple rows.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View { }

    /// Creates a hierarchical list that identifies its rows based on a key path
    /// to the identifier of the underlying data, optionally allowing users to
    /// select multiple rows.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, children: KeyPath<Data.Element, Data?>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View { }

    /// Creates a list that computes its views on demand over a constant range.
    ///
    /// This instance only reads the initial value of `data` and doesn't need to
    /// identify views across updates. To compute views on demand over a dynamic
    /// range, use `List/init(_:id:selection:rowContent:)-8ef64`.
    ///
    /// - Parameters:
    ///   - data: A *constant* range of data to populate the list.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<RowContent>(_ data: Range<Int>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View { }

    /// Creates a list that computes its rows on demand from an underlying
    /// collection of identifiable data, optionally allowing users to select a
    /// single row.
    ///
    /// - Parameters:
    ///   - data: The identifiable data for computing the list.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable { }

    /// Creates a hierarchical list that computes its rows on demand from an
    /// underlying collection of identifiable data, optionally allowing users to
    /// select a single row.
    ///
    /// - Parameters:
    ///   - data: The identifiable data for computing the list.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, children: KeyPath<Data.Element, Data?>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable { }

    /// Creates a list that identifies its rows based on a key path to the
    /// identifier of the underlying data, optionally allowing users to select a
    /// single row.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View { }

    /// Creates a hierarchical list that identifies its rows based on a key path
    /// to the identifier of the underlying data, optionally allowing users to
    /// select a single row.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, children: KeyPath<Data.Element, Data?>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View { }

    /// Creates a list that computes its views on demand over a constant range.
    ///
    /// This instance only reads the initial value of `data` and doesn't need to
    /// identify views across updates. To compute views on demand over a dynamic
    /// range, use `List/init(_:id:selection:rowContent:)-9r2hz`.
    ///
    /// - Parameters:
    ///   - data: A *constant* range of data to populate the list.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<RowContent>(_ data: Range<Int>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension List where SelectionValue == Never {

    /// Creates a list with the given content.
    ///
    /// - Parameter content: The content of the list.
    public init(@ViewBuilder content: () -> Content) { }

    /// Creates a list that computes its rows on demand from an underlying
    /// collection of identifiable data.
    ///
    /// - Parameters:
    ///   - data: A collection of identifiable data for computing the list.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    public init<Data, RowContent>(_ data: Data, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable { }

    /// Creates a hierarchical list that computes its rows on demand from an
    /// underlying collection of identifiable data.
    ///
    /// - Parameters:
    ///   - data: A collection of identifiable data for computing the list.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, children: KeyPath<Data.Element, Data?>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable { }

    /// Creates a list that identifies its rows based on a key path to the
    /// identifier of the underlying data.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View { }

    /// Creates a hierarchical list that identifies its rows based on a key path
    /// to the identifier of the underlying data.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, children: KeyPath<Data.Element, Data?>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View { }

    /// Creates a list that computes its views on demand over a constant range.
    ///
    /// This instance only reads the initial value of `data` and doesn't need to
    /// identify views across updates. To compute views on demand over a dynamic
    /// range, use ``List/init(_:id:rowContent:)``.
    ///
    /// - Parameters:
    ///   - data: A *constant* range of data to populate the list.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    public init<RowContent>(_ data: Range<Int>, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View { }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension List {

    /// Creates a hierarchical list that computes its rows on demand from a
    /// binding to an underlying collection of identifiable data, optionally
    /// allowing users to select multiple rows.
    ///
    /// - Parameters:
    ///   - data: The identifiable data for computing the list.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes an element
    ///     capable of having children that's currently childless, such as an
    ///     empty directory in a file system. On the other hand, if the property
    ///     at the key path is `nil`, then the outline group treats `data` as a
    ///     leaf in the tree, like a regular file in a file system.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @MainActor public init<Data, RowContent>(_ data: Binding<Data>, children: WritableKeyPath<Data.Element, Data?>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable { }

    /// Creates a hierarchical list that identifies its rows based on a key path
    /// to the identifier of the underlying data, optionally allowing users to
    /// select multiple rows.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @MainActor public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, children: WritableKeyPath<Data.Element, Data?>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View { }

    /// Creates a hierarchical list that computes its rows on demand from a
    /// binding to an underlying collection of identifiable data, optionally
    /// allowing users to select a single row.
    ///
    /// - Parameters:
    ///   - data: The identifiable data for computing the list.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @MainActor public init<Data, RowContent>(_ data: Binding<Data>, children: WritableKeyPath<Data.Element, Data?>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable { }

    /// Creates a hierarchical list that identifies its rows based on a key path
    /// to the identifier of the underlying data, optionally allowing users to
    /// select a single row.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @MainActor public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, children: WritableKeyPath<Data.Element, Data?>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View { }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension List where SelectionValue == Never {

    /// Creates a hierarchical list that computes its rows on demand from a
    /// binding to an underlying collection of identifiable data.
    ///
    /// - Parameters:
    ///   - data: A collection of identifiable data for computing the list.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @MainActor public init<Data, RowContent>(_ data: Binding<Data>, children: WritableKeyPath<Data.Element, Data?>, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable { }

    /// Creates a hierarchical list that identifies its rows based on a key path
    /// to the identifier of the underlying data.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @MainActor public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, children: WritableKeyPath<Data.Element, Data?>, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View { }
}
