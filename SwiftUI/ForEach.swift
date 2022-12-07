/// Creates views from a collection of identified data.
///
/// ForEach supports three identifiers:
/// * ``ForEach/init(_:content:)-90399``, for iterating over a range
/// * ``ForEach/init(_:content:)-cde2b``, for iterating over data that conforms to identifiable
/// * ``ForEach/init(_:id:content:)`` for iterating over that can be identified, but does not conform to identifiable
///
/// ### Iterating over a range
/// [[foreach-fixed-range]]
///
/// ### Iterating over `Identifiable` data
/// [[foreach-identifiable-content]]
///
/// ### Explicitly identifying data
/// [[foreach-dynamic-content]]
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ForEach<Data, ID, Content> where Data : RandomAccessCollection, ID : Hashable {

    /// The collection of underlying identified data that SwiftUI uses to create
    /// views dynamically.
    ///
    /// Reading from or writing too this property directly is rarely done.
    /// See ``ForEach`` for more on using this view.
    public var data: Data

    /// A function you can use to create content on demand using the underlying
    /// data
    ///
    /// Reading from or writing too this property directly is rarely done.
    /// See ``ForEach`` for more on using this view.
    public var content: (Data.Element) -> Content
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach where ID == Data.Element.ID, Content : View, Data.Element : Identifiable {

    /// Creates a view from data that conforms to `Identifiable`.
    /// [foreach-identifiable-content ->]
    /// If your data does not conform to identifiable, use
    /// ``ForEach/init(_:id:content:)``.
    ///
    /// Note: if your data does not conform to identifiable you will receive
    /// the following error:
    ///
    /// `Initializer 'init(_:rowContent:)' requires that ‘SomeType’ conform
    /// to 'Identifiable'`
    ///
    /// An array of primitive types, such as strings & ints, will throw this
    /// error. Identify these items with `id: \.self` – because they themselves
    /// can be used as the identifiable object. See more in
    /// ``ForEach/init(_:id:content:)``.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     let myFruits: [Fruit] = [
    ///         Fruit(emoji: "🍌🍌", name: "Banana"),
    ///         Fruit(emoji: "🍑🍑", name: "Peach"),
    ///         Fruit(emoji: "🍎🍎", name: "Apple")
    ///     ]
    ///
    ///     var body: some View {
    ///         VStack {
    ///             ForEach(myFruits) { fruit in
    ///                 Text(fruit.name + fruit.emoji)
    ///             }
    ///         }
    ///     }
    /// }
    ///
    /// struct Fruit: Identifiable {
    ///     var emoji: String
    ///     var name: String
    ///     //  Create a unique ID for our object
    ///     //  This idea allows Fruit to conform to Identifiable
    ///     let id = UUID()
    /// }
    /// ```
    ///
    /// ![A view containing a ForEach statement that houses a VStack with a
    /// text view populated by a Fruit array called myFruits that the enveloping
    /// ForEach statement loops through; each Fruit item has both an emoji
    /// string and a name and the text view concatenates them in reverse order,
    /// resulting in a VStack with "Banana🍌🍌", "Peach🍑🍑", "Apple🍎🍎".](for-each-content.png)
    ///
    /// [<-]
    /// Note:  It's important that the `id` of a data element doesn't change unless you
    /// replace the data element with a new data element that has a new
    /// identity. If the `id` of a data element changes, the content view
    /// generated from that data element loses any current state and animations.
    ///
    /// - Parameters:
    ///   - data: The identified data that the ``ForEach`` instance uses to
    ///     create views dynamically.
    ///   - content: The view builder that creates views dynamically.
    public init(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach where Content : View {

    /// Creates an instance that uniquely identifies and computes views.
    /// [foreach-dynamic-content ->]
    /// For data that does not conform to `Identifiable`, use this initializer.
    ///
    /// A very common use case for this initialier is iterating over primitive
    /// data, such as strings or ints. In the following example, the fruit
    /// string is used as the identifiable unit.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     let myFruits: [String] = ["🍌🍌", "🍑🍑", "🍎🍎"]
    ///
    ///     var body: some View {
    ///         ForEach(myFruits, id:\.self) { fruit in
    ///             HStack {
    ///                 Text(fruit)
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ForEach statement that houses a VStack with a
    /// text view populated by a string array, "🍌🍌", "🍑🍑", "🍎🍎", called
    /// myFruits that the enveloping ForEach statement iterates through as
    /// identifiable units.](16.59.20.png)
    ///
    /// This initializer can also be used with objects that don't conform to
    /// `Identifiable`, but have identifiable properties. For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     let myFruits: [Fruit] = [
    ///         Fruit(emoji: "🍌🍌", name: "Banana"),
    ///         Fruit(emoji: "🍑🍑", name: "Peach"),
    ///         Fruit(emoji: "🍎🍎", name: "Apple")
    ///     ]
    ///
    ///     var body: some View {
    ///         ForEach(myFruits, id: \.emoji) { fruit in
    ///             HStack {
    ///                 Text(fruit.name + fruit.emoji)
    ///             }
    ///         }
    ///     }
    /// }
    ///
    /// struct Fruit {
    ///     var emoji: String
    ///     var name: String
    /// }
    /// ```
    ///
    /// ![A view containing a ForEach statement that houses a VStack with a
    /// text view populated by a Fruit array called myFruits that the enveloping
    /// ForEach statement iterates through as identifiable objects; each Fruit
    /// item has both an emoji string and a name and the text view concatenates
    /// them in reverse order, resulting in a VStack with "Banana🍌🍌", "Peach🍑🍑", "Apple🍎🍎".](17.00.04.png)
    ///
    /// Notice, this initializer can be used for data that can change. For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State var myFruits: [String] = ["🍌🍌", "🍑🍑", "🍎🍎"]
    ///
    ///     var body: some View {
    ///         Button("New Fruit") {
    ///             newFruit()
    ///         }
    ///
    ///         ForEach(myFruits, id: \.self) { fruit in
    ///             HStack {
    ///                 Text(fruit)
    ///             }
    ///         }
    ///     }
    ///
    ///     func newFruit() {
    ///         let allFruit: [String] = ["🍏🍏", "🍒🍒", "🍓🍓", "🥝🥝", "🥭🥭", "🍊🍊", "🍍🍍"]
    ///
    ///         myFruits.append(allFruit.randomElement()!)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing buttn reading "NewFruit" and a ForEach statement
    /// that houses a VStack with a text view populated by a string array,
    /// "🍌🍌", "🍑🍑", "🍎🍎", called myFruits that the enveloping ForEach
    /// statement loops through as identifiable objects; the button calls a
    /// function that appends a new fruit to the string array, printing it to
    /// the VStack.](foreach.gif)
    ///
    /// - Note: This initializer works well for externally loaded data. It
    /// enables your app's frontend to automatically reflect data as it arrives.
    /// [<-]
    /// - Note: It's important that the `id` of a data element doesn't change, unless
    /// SwiftUI considers the data element to have been replaced with a new data
    /// element that has a new identity. If the `id` of a data element changes,
    /// then the content view generated from that data element will lose any
    /// current state and animations.
    ///
    /// - Parameters:
    ///   - data: The data that the ``ForEach`` instance uses to create views
    ///     dynamically.
    ///   - id: The key path to the provided data's identifier.
    ///   - content: The view builder that creates views dynamically.
    public init(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder content: @escaping (Data.Element) -> Content) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach where Data == Range<Int>, ID == Int, Content : View {

    /// Computes views over a given constant range.
    /// [foreach-fixed-range ->]
    /// This initializer is ForEach's most trivial. It is analogous to a common
    /// for loop.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     let myFruits: [String] = ["🍌🍌", "🍑🍑", "🍎🍎"]
    ///
    ///     var body: some View {
    ///         VStack {
    ///             ForEach(0..<myFruits.count) { index in
    ///                 Text(myFruits[index])
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ForEach statement that houses a VStack with a
    /// text view populated by a string array, "🍌🍌", "🍑🍑", "🍎🍎", called
    /// myFruits that the enveloping ForEach statement indexes through.](16.44.37.png)
    ///
    /// Notice however, that this view is only rendered once. Therefore, if
    /// `myFruits.count` changes, the view will **not update**. For example,
    /// clicking `New Fruit` in the following code returns the error:
    ///
    /// `ForEach(_:content:)` should only be used for *constant* data.
    ///
    /// ```
    /// struct ErrorView: View {
    ///     @State var myFruits: [String] = ["🍌🍌", "🍑🍑", "🍎🍎"]
    ///
    ///     var body: some View {
    ///         Button("New Fruit") {
    ///             newFruit()
    ///         }
    ///         VStack {
    ///             ForEach(0..<myFruits.count) { index in
    ///                 Text(myFruits[index])
    ///             }
    ///         }
    ///     }
    ///
    ///     func newFruit() {
    ///         let allFruit: [String] = ["🍏🍏", "🍒🍒", "🍓🍓", "🥝🥝", "🥭🥭", "🍊🍊", "🍍🍍"]
    ///
    ///         myFruits.append(allFruit.randomElement()!)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing buttn reading "NewFruit" and a ForEach statement
    /// that houses a VStack with a text view populated by a string array,
    /// "🍌🍌", "🍑🍑", "🍎🍎", called myFruits that the enveloping ForEach
    /// statement loops through; the button calls a function that appends a new
    /// fruit to the string array, resulting in an error because
    /// ForEach(_:content:) should only be used with constant data.](foreach-ex2.gif)
    ///
    /// The instance only reads the initial value of the provided `data` and
    /// doesn't need to identify views across updates. To compute views on
    /// demand over a dynamic range, use ``ForEach/init(_:id:content:)``.
    /// [<-]
    ///
    /// - Parameters:
    ///   - data: A constant range.
    ///   - content: The view builder that creates views dynamically.
    public init(_ data: Range<Int>, @ViewBuilder content: @escaping (Int) -> Content) { }
}

