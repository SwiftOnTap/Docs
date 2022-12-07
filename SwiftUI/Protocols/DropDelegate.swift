/// An interface to easily perform drag & drop operations.
///
/// The ``DropDelegate`` protocol offers functionality to customize drag and
/// drop behaviors. It is preffered over ``View/onDrop(of:isTargeted:perform:)-ae20f``
/// view modifier when your drop behavior requires non-standard implementations.
///
/// ``DropDelegate`` heavily utilizes `NSItemProvider`, which provides
/// information about the dragged data.
///
/// ### Setup
/// ``DropDelegate`` has one required implementation and four optional
/// implementations.
///
/// Required:
/// - ``DropDelegate/performDrop(info:)-2a687`` specifies the behavior for your drop.
///
/// Optional:
/// - ``DropDelegate/validateDrop(info:)-ff0e6`` validates if a drop can be made.
/// - ``DropDelegate/dropEntered(info:)-4bfcb`` provides custom behavior when
/// an object is dragged over the `onDrop` view.
/// - ``DropDelegate/dropExited(info:)-096d2`` provides custom behavior when an
/// object is dragged off of the `onDrop` view.
/// - ``DropDelegate/dropUpdated(info:)-686f2`` provides custom behavior when
/// the drop is updated.
///
/// ### Creating a simple Drag & Drop
///
/// #### Create a draggable ``View``
///
/// Make a view draggable with the `.onDrag(_:)` modifier.
///
/// Use `NSItemProvider` to define the specific data dragged from that view.
///
/// ```
/// Text(text)
///     .font(.title)
///     .onDrag { NSItemProvider(object: "🍌🍌" as NSString) }
/// ```
///
/// #### Creating a drop ``View``
/// Use `onDrop` to create a view that accepts "drops" from dragged data. There
/// are three versions of the `onDrop` modifier:
///
/// - ``View/onDrop(of:isTargeted:perform:)-ae20f`` is the simplest
/// implementation. Specify a closure to execute when content is dropped.
/// - ``View/onDrop(of:isTargeted:perform:)-b7eed`` is similar to the former,
/// but the closure also provides information about the drop location.
/// - ``View/onDrop(of:delegate:)-884b8`` requires a ``DropDelegate`` and is
/// the most versatile.
///
/// ```
/// struct ExampleView: View {
///     @State var text: String = "🍌🍌"
///
///     var body: some View {
///         HStack {
///             //  Text to drag
///             Text(text)
///                 .font(.title)
///                 .onDrag { NSItemProvider(object: self.text as NSItemProviderWriting) }
///
///             //  Area to drop
///             RoundedRectangle(cornerRadius: 10)
///                 .frame(width: 150, height: 150)
///                 .onDrop(of: ["text"], isTargeted: nil, perform: { _ in
///                     self.text = "Dropped My Bananas 🍌🍌!"
///                     return true
///                 })
///         }
///     }
/// }
/// ```
///
/// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-1.gif)
///
/// #### Conforming to DropDelegate
///
/// Implement ``DropDelegate/performDrop(info:)-2a687`` to create a structure that conforms to ``DropDelegate``.
///
/// ```
/// struct ExampleView: View {
///     @State var text: String = "🍌🍌"
///
///     var body: some View {
///         HStack {
///             //  Text to drag
///             Text(text)
///                 .font(.title)
///                 .onDrag { NSItemProvider(object: self.text as NSString) }
///
///             //  Area to drop
///             RoundedRectangle(cornerRadius: 10)
///                 .frame(width: 150, height: 150)
///                 .onDrop(of: ["text"], delegate: MyDropDelegate(text: $text))
///         }
///     }
/// }
///
/// struct MyDropDelegate: DropDelegate {
///     @Binding var text: String
///
///     func performDrop(info: DropInfo) -> Bool {
///         self.text = "Dropped My Bananas 🍌🍌!"
///         return true
///     }
/// }
/// ```
///
/// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-1.gif)
///
/// ### Using ``DropInfo`` for custom logic
/// ``DropInfo`` provides information about the drop and is used to create
/// custom drop behaviors.
///
/// For example, say your user drags & drops `NSString` data. Use the
/// ``DropInfo/itemProviders(for:)-7f580`` to get an array of `NSItemProvider`
/// data (recall all dragged data arrives in this format).
///
/// Next, use `NSItemProvider`'s property `loadItem` to extract an
/// `NSSecureCoding` from your dragged data.
///
/// Finally, cast your `NSSecureCoding` data to the more Swift-friendly
/// `Data` object. From here your program can decode that data into a string
/// and run any custom behaviors from that string.
///
/// The view in the example below is conditionally colored depending on the
/// dragged string.
///
/// ```
/// struct ExampleView: View {
///     @State var backgroundColor: Color = .black
///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
///
///     var body: some View {
///         VStack {
///             HStack {
///                 ForEach(self.fruits, id: \.self, content: { fruit in
///                     Text(fruit)
///                         .font(.title)
///                         .onDrag { NSItemProvider(object: fruit as NSString) }
///                 })
///             }
///
///             HStack {
///                 RoundedRectangle(cornerRadius: 10)
///                     .fill(backgroundColor)
///                     .frame(width: 150, height: 150)
///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
///             }
///         }
///
///     }
/// }
///
/// struct MyDropDelegate: DropDelegate {
///     @Binding var color: Color
///
///     //  This function is executed when the user "drops" their object
///     func performDrop(info: DropInfo) -> Bool {
///         //  Check if there's an array of items with the URI "public.text" in the DropInfo
///         if let item = info.itemProviders(for: ["public.text"]).first {
///             //  Load the item
///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
///                 //  Cast NSSecureCoding to Ddata
///                 if let data = text as? Data {
///                     //  Extract string from data
///                     let inputStr = String(decoding: data, as: UTF8.self)
///
///                     //  Conditionally change color given text string
///                     if inputStr == "🍌🍌" {
///                         self.color = .yellow
///                     } else if inputStr == "🍏🍏" {
///                         self.color = .green
///                     } else if inputStr == "🍑🍑" {
///                         self.color = .pink
///                     } else {
///                         self.color = .gray
///                     }
///                 }
///             }
///         } else {
///             //  If no text was received in our drop, return false
///             return false
///         }
///
///         return true
///     }
/// }
/// ```
///
/// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-2.gif)
///
/// ### Fully Featured ``DropDelegate``
/// Utilize ``DropDelegate``s optional functions to provide additional behavior.
///
/// ```
/// struct ExampleView: View {
///     @State var backgroundColor: Color = .black
///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
///
///     var body: some View {
///         VStack {
///             HStack {
///                 ForEach(self.fruits, id: \.self, content: { fruit in
///                     Text(fruit)
///                         .font(.title)
///                         .onDrag { NSItemProvider(object: fruit as NSString) }
///                 })
///             }
///
///             HStack {
///                 RoundedRectangle(cornerRadius: 10)
///                     .fill(backgroundColor)
///                     .frame(width: 150, height: 150)
///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
///             }
///         }
///
///     }
/// }
///
/// struct MyDropDelegate: DropDelegate {
///     @Binding var color: Color
///
///     //  Drop entered called
///     func dropEntered(info: DropInfo) {
///         ///  Change color if color was previously black
///         self.color = (self.color == .black) ? .gray : self.color
///     }
///
///     //  Drop entered called
///     func dropExited(info: DropInfo) {
///         self.color = .init(white: 0.40)
///     }
///
///     //  Drop has been updated
///     func dropUpdated(info: DropInfo) -> DropProposal? {
///         ///  Don't allow more items to be dropped if a Banana was dropped
///         if self.color == .yellow {
///             return DropProposal(operation: .forbidden)
///         } else {
///             return nil
///         }
///     }
///
///     //  This function is executed when the user "drops" their object
///     func performDrop(info: DropInfo) -> Bool {
///         //  Check if there's an array of items with the URI "public.text" in the DropInfo
///         if let item = info.itemProviders(for: ["public.text"]).first {
///             //  Load the item
///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
///                 //  Cast NSSecureCoding to Ddata
///                 if let data = text as? Data {
///                     //  Extract string from data
///                     let inputStr = String(decoding: data, as: UTF8.self)
///
///                     //  Conditionally change color given text string
///                     if inputStr == "🍌🍌" {
///                         self.color = .yellow
///                     } else if inputStr == "🍏🍏" {
///                         self.color = .green
///                     } else if inputStr == "🍑🍑" {
///                         self.color = .pink
///                     } else {
///                         self.color = .gray
///                     }
///                 }
///             }
///         } else {
///             //  If no text was received in our drop, return false
///             return false
///         }
///
///         return true
///     }
/// }
/// ```
///
/// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-3.gif)
///
/// This example uses ``DropDelegate/dropUpdated(info:)-686f2`` to prevent
/// fruits from being dropped if the background is yellow.
///
/// The example uses ``DropDelegate/dropEntered(info:)-4bfcb`` to change the
/// color the first time a user drags over the drop zone.
///
/// Finally, when a user drags out of the view,
/// ``DropDelegate/dropExited(info:)-fa04d`` changes the background color
/// to a dark gray.
///
/// Note: if the user deselects their dragged object while over the drop zone,
/// ``DropDelegate/dropExited(info:)-fa04d`` will **not** be called.
/// ``DropDelegate/dropExited(info:)-fa04d`` is only called when the user
/// explicitly drags their dragged object **out** of the drop zone.
///
/// *Bug*: On iOS ``DropInfo`` provides its location in global coordinates.
/// It should provide location in local coordinates.
@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol DropDelegate { }

extension DropDelegate {

    /// Validates a drop.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var backgroundColor: Color = .black
    ///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
    ///
    ///     var body: some View {
    ///         VStack {
    ///             HStack {
    ///                 ForEach(self.fruits, id: \.self, content: { fruit in
    ///                     Text(fruit)
    ///                         .font(.title)
    ///                         .onDrag { NSItemProvider(object: fruit as NSString) }
    ///                 })
    ///             }
    ///
    ///             HStack {
    ///                 RoundedRectangle(cornerRadius: 10)
    ///                     .fill(backgroundColor)
    ///                     .frame(width: 150, height: 150)
    ///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
    ///             }
    ///         }
    ///
    ///     }
    /// }
    ///
    /// struct MyDropDelegate: DropDelegate {
    ///     @Binding var color: Color
    ///
    ///     //  Validates the drop
    ///     func validateDrop(info: DropInfo) -> Bool {
    ///         //  This function will fail, because the URI is "public.text" not "public.file-url"
    ///         if info.hasItemsConforming(to: ["public.image"]) {
    ///             return true
    ///         } else {
    ///             self.color = .red
    ///             return false
    ///         }
    ///     }
    ///
    ///     //  This function is executed when the user "drops" their object
    ///     func performDrop(info: DropInfo) -> Bool {
    ///         //  Check if there's an array of items with the URI "public.text" in the DropInfo
    ///         if let item = info.itemProviders(for: ["public.text"]).first {
    ///             //  Load the item
    ///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
    ///                 //  Cast NSSecureCoding to Ddata
    ///                 if let data = text as? Data {
    ///                     //  Extract string from data
    ///                     let inputStr = String(decoding: data, as: UTF8.self)
    ///
    ///                     //  Conditionally change color given text string
    ///                     if inputStr == "🍌🍌" {
    ///                         self.color = .yellow
    ///                     } else if inputStr == "🍏🍏" {
    ///                         self.color = .green
    ///                     } else if inputStr == "🍑🍑" {
    ///                         self.color = .pink
    ///                     } else {
    ///                         self.color = .gray
    ///                     }
    ///                 }
    ///             }
    ///         } else {
    ///             //  If no text was received in our drop, return false
    ///             return false
    ///         }
    ///
    ///         return true
    ///     }
    /// }
    /// ```
    func validateDrop(info: DropInfo) -> Bool { }

    /// Specifies the behavior of a drop.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State var backgroundColor: Color = .black
    ///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
    ///
    ///     var body: some View {
    ///         VStack {
    ///             HStack {
    ///                 ForEach(self.fruits, id: \.self, content: { fruit in
    ///                     Text(fruit)
    ///                         .font(.title)
    ///                         .onDrag { NSItemProvider(object: fruit as NSString) }
    ///                 })
    ///             }
    ///
    ///             HStack {
    ///                 RoundedRectangle(cornerRadius: 10)
    ///                     .fill(backgroundColor)
    ///                     .frame(width: 150, height: 150)
    ///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
    ///             }
    ///         }
    ///
    ///     }
    /// }
    ///
    /// struct MyDropDelegate: DropDelegate {
    ///     @Binding var color: Color
    ///
    ///     //  This function is executed when the user "drops" their object
    ///     func performDrop(info: DropInfo) -> Bool {
    ///         //  Check if there's an array of items with the URI "public.text" in the DropInfo
    ///         if let item = info.itemProviders(for: ["public.text"]).first {
    ///             //  Load the item
    ///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
    ///                 //  Cast NSSecureCoding to Ddata
    ///                 if let data = text as? Data {
    ///                     //  Extract string from data
    ///                     let inputStr = String(decoding: data, as: UTF8.self)
    ///
    ///                     //  Conditionally change color given text string
    ///                     if inputStr == "🍌🍌" {
    ///                         self.color = .yellow
    ///                     } else if inputStr == "🍏🍏" {
    ///                         self.color = .green
    ///                     } else if inputStr == "🍑🍑" {
    ///                         self.color = .pink
    ///                     } else {
    ///                         self.color = .gray
    ///                     }
    ///                 }
    ///             }
    ///         } else {
    ///             //  If no text was received in our drop, return false
    ///             return false
    ///         }
    ///
    ///         return true
    ///     }
    /// }
    /// ```
    ///
    /// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-2.gif)
    ///
    func performDrop(info: DropInfo) -> Bool { }

    /// Provide custom behavior when an object is dragged over the `onDrop` view.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var backgroundColor: Color = .black
    ///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
    ///
    ///     var body: some View {
    ///         VStack {
    ///             HStack {
    ///                 ForEach(self.fruits, id: \.self, content: { fruit in
    ///                     Text(fruit)
    ///                         .font(.title)
    ///                         .onDrag { NSItemProvider(object: fruit as NSString) }
    ///                 })
    ///             }
    ///
    ///             HStack {
    ///                 RoundedRectangle(cornerRadius: 10)
    ///                     .fill(backgroundColor)
    ///                     .frame(width: 150, height: 150)
    ///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
    ///             }
    ///         }
    ///
    ///     }
    /// }
    ///
    /// struct MyDropDelegate: DropDelegate {
    ///     @Binding var color: Color
    ///
    ///     //  Drop entered called
    ///     func dropEntered(info: DropInfo) {
    ///         //  Change color if color was previously black
    ///         self.color = (self.color == .black) ? .gray : self.color
    ///     }
    ///
    ///     //  This function is executed when the user "drops" their object
    ///     func performDrop(info: DropInfo) -> Bool {
    ///         //  Check if there's an array of items with the URI "public.text" in the DropInfo
    ///         if let item = info.itemProviders(for: ["public.text"]).first {
    ///             //  Load the item
    ///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
    ///                 //  Cast NSSecureCoding to Ddata
    ///                 if let data = text as? Data {
    ///                     //  Extract string from data
    ///                     let inputStr = String(decoding: data, as: UTF8.self)
    ///
    ///                     //  Conditionally change color given text string
    ///                     if inputStr == "🍌🍌" {
    ///                         self.color = .yellow
    ///                     } else if inputStr == "🍏🍏" {
    ///                         self.color = .green
    ///                     } else if inputStr == "🍑🍑" {
    ///                         self.color = .pink
    ///                     } else {
    ///                         self.color = .gray
    ///                     }
    ///                 }
    ///             }
    ///         } else {
    ///             //  If no text was received in our drop, return false
    ///             return false
    ///         }
    ///
    ///         return true
    ///     }
    /// }
    /// ```
    ///
    /// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-4.gif)
    ///
    func dropEntered(info: DropInfo) { }

    /// Provide custom behavior when the drop is updated.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var backgroundColor: Color = .black
    ///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
    ///
    ///     var body: some View {
    ///         VStack {
    ///             HStack {
    ///                 ForEach(self.fruits, id: \.self, content: { fruit in
    ///                     Text(fruit)
    ///                         .font(.title)
    ///                         .onDrag { NSItemProvider(object: fruit as NSString) }
    ///                 })
    ///             }
    ///
    ///             HStack {
    ///                 RoundedRectangle(cornerRadius: 10)
    ///                     .fill(backgroundColor)
    ///                     .frame(width: 150, height: 150)
    ///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
    ///             }
    ///         }
    ///
    ///     }
    /// }
    ///
    /// struct MyDropDelegate: DropDelegate {
    ///     @Binding var color: Color
    ///
    ///     //  Drop has been updated
    ///     func dropUpdated(info: DropInfo) -> DropProposal? {
    ///         //  Don't allow more items to be dropped if a Banana was dropped
    ///         if self.color == .yellow {
    ///             return DropProposal(operation: .forbidden)
    ///         } else {
    ///             return nil
    ///         }
    ///     }
    ///
    ///     //  This function is executed when the user "drops" their object
    ///     func performDrop(info: DropInfo) -> Bool {
    ///         //  Check if there's an array of items with the URI "public.text" in the DropInfo
    ///         if let item = info.itemProviders(for: ["public.text"]).first {
    ///             //  Load the item
    ///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
    ///                 //  Cast NSSecureCoding to Ddata
    ///                 if let data = text as? Data {
    ///                     //  Extract string from data
    ///                     let inputStr = String(decoding: data, as: UTF8.self)
    ///
    ///                     //  Conditionally change color given text string
    ///                     if inputStr == "🍌🍌" {
    ///                         self.color = .yellow
    ///                     } else if inputStr == "🍏🍏" {
    ///                         self.color = .green
    ///                     } else if inputStr == "🍑🍑" {
    ///                         self.color = .pink
    ///                     } else {
    ///                         self.color = .gray
    ///                     }
    ///                 }
    ///             }
    ///         } else {
    ///             //  If no text was received in our drop, return false
    ///             return false
    ///         }
    ///
    ///         return true
    ///     }
    /// }
    /// ```
    ///
    /// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-5.gif)
    ///
    func dropUpdated(info: DropInfo) -> DropProposal? { }

    /// Provide custom behavior when an object is dragged off of the `onDrop` view.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var backgroundColor: Color = .black
    ///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
    ///
    ///     var body: some View {
    ///         VStack {
    ///             HStack {
    ///                 ForEach(self.fruits, id: \.self, content: { fruit in
    ///                     Text(fruit)
    ///                         .font(.title)
    ///                         .onDrag { NSItemProvider(object: fruit as NSString) }
    ///                 })
    ///             }
    ///
    ///             HStack {
    ///                 RoundedRectangle(cornerRadius: 10)
    ///                     .fill(backgroundColor)
    ///                     .frame(width: 150, height: 150)
    ///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
    ///             }
    ///         }
    ///
    ///     }
    /// }
    ///
    /// struct MyDropDelegate: DropDelegate {
    ///     @Binding var color: Color
    ///
    ///     // Drop entered called
    ///     func dropExited(info: DropInfo) {
    ///         self.color = .init(white: 0.40)
    ///     }
    ///
    ///     // This function is executed when the user "drops" their object
    ///     func performDrop(info: DropInfo) -> Bool {
    ///         // Check if there's an array of items with the URI "public.text" in the DropInfo
    ///         if let item = info.itemProviders(for: ["public.text"]).first {
    ///             // Load the item
    ///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
    ///                 // Cast NSSecureCoding to Ddata
    ///                 if let data = text as? Data {
    ///                     // Extract string from data
    ///                     let inputStr = String(decoding: data, as: UTF8.self)
    ///
    ///                     //  Conditionally change color given text string
    ///                     if inputStr == "🍌🍌" {
    ///                         self.color = .yellow
    ///                     } else if inputStr == "🍏🍏" {
    ///                         self.color = .green
    ///                     } else if inputStr == "🍑🍑" {
    ///                         self.color = .pink
    ///                     } else {
    ///                         self.color = .gray
    ///                     }
    ///                 }
    ///             }
    ///         } else {
    ///             // If no text was received in our drop, return false
    ///             return false
    ///         }
    ///
    ///         return true
    ///     }
    /// }
    /// ```
    ///
    /// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-6.gif)
    ///
    func dropExited(info: DropInfo) { }
}

@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DropDelegate {

      /// Validates a drop.
      ///
      /// ```
      /// struct ContentView: View {
      ///     @State var backgroundColor: Color = .black
      ///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
      ///
      ///     var body: some View {
      ///         VStack {
      ///             HStack {
      ///                 ForEach(self.fruits, id: \.self, content: { fruit in
      ///                     Text(fruit)
      ///                         .font(.title)
      ///                         .onDrag { NSItemProvider(object: fruit as NSString) }
      ///                 })
      ///             }
      ///
      ///             HStack {
      ///                 RoundedRectangle(cornerRadius: 10)
      ///                     .fill(backgroundColor)
      ///                     .frame(width: 150, height: 150)
      ///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
      ///             }
      ///         }
      ///
      ///     }
      /// }
      ///
      /// struct MyDropDelegate: DropDelegate {
      ///     @Binding var color: Color
      ///
      ///     // Validates the drop
      ///     func validateDrop(info: DropInfo) -> Bool {
      ///         // This function will fail, because the URI is "public.text" not "public.file-url"
      ///         if info.hasItemsConforming(to: ["public.image"]) {
      ///             return true
      ///         } else {
      ///             self.color = .red
      ///             return false
      ///         }
      ///     }
      ///
      ///     // This function is executed when the user "drops" their object
      ///     func performDrop(info: DropInfo) -> Bool {
      ///         // Check if there's an array of items with the URI "public.text" in the DropInfo
      ///         if let item = info.itemProviders(for: ["public.text"]).first {
      ///             // Load the item
      ///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
      ///                 // Cast NSSecureCoding to Ddata
      ///                 if let data = text as? Data {
      ///                     // Extract string from data
      ///                     let inputStr = String(decoding: data, as: UTF8.self)
      ///
      ///                     // Conditionally change color given text string
      ///                     if inputStr == "🍌🍌" {
      ///                         self.color = .yellow
      ///                     } else if inputStr == "🍏🍏" {
      ///                         self.color = .green
      ///                     } else if inputStr == "🍑🍑" {
      ///                         self.color = .pink
      ///                     } else {
      ///                         self.color = .gray
      ///                     }
      ///                 }
      ///             }
      ///         } else {
      ///             // If no text was received in our drop, return false
      ///             return false
      ///         }
      ///
      ///         return true
      ///     }
      /// }
      /// ```
      public func validateDrop(info: DropInfo) -> Bool { }

      /// Specifies the behavior of a drop.
      ///
      /// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-2.gif)
      ///
      /// ```
      /// struct ExampleView: View {
      ///     @State var backgroundColor: Color = .black
      ///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
      ///
      ///     var body: some View {
      ///         VStack {
      ///             HStack {
      ///                 ForEach(self.fruits, id: \.self, content: { fruit in
      ///                     Text(fruit)
      ///                         .font(.title)
      ///                         .onDrag { NSItemProvider(object: fruit as NSString) }
      ///                 })
      ///             }
      ///
      ///             HStack {
      ///                 RoundedRectangle(cornerRadius: 10)
      ///                     .fill(backgroundColor)
      ///                     .frame(width: 150, height: 150)
      ///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
      ///             }
      ///         }
      ///
      ///     }
      /// }
      ///
      /// struct MyDropDelegate: DropDelegate {
      ///     @Binding var color: Color
      ///
      ///     // This function is executed when the user "drops" their object
      ///     func performDrop(info: DropInfo) -> Bool {
      ///         // Check if there's an array of items with the URI "public.text" in the DropInfo
      ///         if let item = info.itemProviders(for: ["public.text"]).first {
      ///             // Load the item
      ///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
      ///                 // Cast NSSecureCoding to Ddata
      ///                 if let data = text as? Data {
      ///                     // Extract string from data
      ///                     let inputStr = String(decoding: data, as: UTF8.self)
      ///
      ///                     // Conditionally change color given text string
      ///                     if inputStr == "🍌🍌" {
      ///                         self.color = .yellow
      ///                     } else if inputStr == "🍏🍏" {
      ///                         self.color = .green
      ///                     } else if inputStr == "🍑🍑" {
      ///                         self.color = .pink
      ///                     } else {
      ///                         self.color = .gray
      ///                     }
      ///                 }
      ///             }
      ///         } else {
      ///             // If no text was received in our drop, return false
      ///             return false
      ///         }
      ///
      ///         return true
      ///     }
      /// }
      /// ```
      public func performDrop(info: DropInfo) -> Bool { }

      /// Provide custom behavior when an object is dragged over the `onDrop` view.
      ///
      /// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-4.gif)
      ///
      /// ```
      /// struct ContentView: View {
      ///     @State var backgroundColor: Color = .black
      ///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
      ///
      ///     var body: some View {
      ///         VStack {
      ///             HStack {
      ///                 ForEach(self.fruits, id: \.self, content: { fruit in
      ///                     Text(fruit)
      ///                         .font(.title)
      ///                         .onDrag { NSItemProvider(object: fruit as NSString) }
      ///                 })
      ///             }
      ///
      ///             HStack {
      ///                 RoundedRectangle(cornerRadius: 10)
      ///                     .fill(backgroundColor)
      ///                     .frame(width: 150, height: 150)
      ///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
      ///             }
      ///         }
      ///
      ///     }
      /// }
      ///
      /// struct MyDropDelegate: DropDelegate {
      ///     @Binding var color: Color
      ///
      ///     // Drop entered called
      ///     func dropEntered(info: DropInfo) {
      ///         // Change color if color was previously black
      ///         self.color = (self.color == .black) ? .gray : self.color
      ///     }
      ///
      ///     // This function is executed when the user "drops" their object
      ///     func performDrop(info: DropInfo) -> Bool {
      ///         // Check if there's an array of items with the URI "public.text" in the DropInfo
      ///         if let item = info.itemProviders(for: ["public.text"]).first {
      ///             // Load the item
      ///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
      ///                 // Cast NSSecureCoding to Ddata
      ///                 if let data = text as? Data {
      ///                     //  Extract string from data
      ///                     let inputStr = String(decoding: data, as: UTF8.self)
      ///
      ///                     // Conditionally change color given text string
      ///                     if inputStr == "🍌🍌" {
      ///                         self.color = .yellow
      ///                     } else if inputStr == "🍏🍏" {
      ///                         self.color = .green
      ///                     } else if inputStr == "🍑🍑" {
      ///                         self.color = .pink
      ///                     } else {
      ///                         self.color = .gray
      ///                     }
      ///                 }
      ///             }
      ///         } else {
      ///             // If no text was received in our drop, return false
      ///             return false
      ///         }
      ///
      ///         return true
      ///     }
      /// }
      /// ```
      public func dropEntered(info: DropInfo) { }

      /// Provide custom behavior when the drop is updated.
      ///
      /// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-5.gif)
      ///
      /// ```
      /// struct ContentView: View {
      ///     @State var backgroundColor: Color = .black
      ///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
      ///
      ///     var body: some View {
      ///         VStack {
      ///             HStack {
      ///                 ForEach(self.fruits, id: \.self, content: { fruit in
      ///                     Text(fruit)
      ///                         .font(.title)
      ///                         .onDrag { NSItemProvider(object: fruit as NSString) }
      ///                 })
      ///             }
      ///
      ///             HStack {
      ///                 RoundedRectangle(cornerRadius: 10)
      ///                     .fill(backgroundColor)
      ///                     .frame(width: 150, height: 150)
      ///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
      ///             }
      ///         }
      ///
      ///     }
      /// }
      ///
      /// struct MyDropDelegate: DropDelegate {
      ///     @Binding var color: Color
      ///
      ///     //  Drop has been updated
      ///     func dropUpdated(info: DropInfo) -> DropProposal? {
      ///         // Don't allow more items to be dropped if a Banana was dropped
      ///         if self.color == .yellow {
      ///             return DropProposal(operation: .forbidden)
      ///         } else {
      ///             return nil
      ///         }
      ///     }
      ///
      ///     // This function is executed when the user "drops" their object
      ///     func performDrop(info: DropInfo) -> Bool {
      ///         // Check if there's an array of items with the URI "public.text" in the DropInfo
      ///         if let item = info.itemProviders(for: ["public.text"]).first {
      ///             //  Load the item
      ///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
      ///                 //  Cast NSSecureCoding to Ddata
      ///                 if let data = text as? Data {
      ///                     //  Extract string from data
      ///                     let inputStr = String(decoding: data, as: UTF8.self)
      ///
      ///                     // Conditionally change color given text string
      ///                     if inputStr == "🍌🍌" {
      ///                         self.color = .yellow
      ///                     } else if inputStr == "🍏🍏" {
      ///                         self.color = .green
      ///                     } else if inputStr == "🍑🍑" {
      ///                         self.color = .pink
      ///                     } else {
      ///                         self.color = .gray
      ///                     }
      ///                 }
      ///             }
      ///         } else {
      ///             //  If no text was received in our drop, return false
      ///             return false
      ///         }
      ///
      ///         return true
      ///     }
      /// }
      /// ```
      public func dropUpdated(info: DropInfo) -> DropProposal? { }

      /// Provide custom behavior when an object is dragged off of the `onDrop` view.
      ///
      /// ![Simple Drop](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-6.gif)
      ///
      /// ```
      /// struct ContentView: View {
      ///     @State var backgroundColor: Color = .black
      ///     let fruits: [String] = ["🍌🍌", "🍏🍏", "🍑🍑"]
      ///
      ///     var body: some View {
      ///         VStack {
      ///             HStack {
      ///                 ForEach(self.fruits, id: \.self, content: { fruit in
      ///                     Text(fruit)
      ///                         .font(.title)
      ///                         .onDrag { NSItemProvider(object: fruit as NSString) }
      ///                 })
      ///             }
      ///
      ///             HStack {
      ///                 RoundedRectangle(cornerRadius: 10)
      ///                     .fill(backgroundColor)
      ///                     .frame(width: 150, height: 150)
      ///                     .onDrop(of: ["public.text"], delegate: MyDropDelegate(color: $backgroundColor))
      ///             }
      ///         }
      ///
      ///     }
      /// }
      ///
      /// struct MyDropDelegate: DropDelegate {
      ///     @Binding var color: Color
      ///
      ///     //  Drop entered called
      ///     func dropExited(info: DropInfo) {
      ///         self.color = .init(white: 0.40)
      ///     }
      ///
      ///     //  This function is executed when the user "drops" their object
      ///     func performDrop(info: DropInfo) -> Bool {
      ///         //  Check if there's an array of items with the URI "public.text" in the DropInfo
      ///         if let item = info.itemProviders(for: ["public.text"]).first {
      ///             //  Load the item
      ///             item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
      ///                 //  Cast NSSecureCoding to Ddata
      ///                 if let data = text as? Data {
      ///                     //  Extract string from data
      ///                     let inputStr = String(decoding: data, as: UTF8.self)
      ///
      ///                     //  Conditionally change color given text string
      ///                     if inputStr == "🍌🍌" {
      ///                         self.color = .yellow
      ///                     } else if inputStr == "🍏🍏" {
      ///                         self.color = .green
      ///                     } else if inputStr == "🍑🍑" {
      ///                         self.color = .pink
      ///                     } else {
      ///                         self.color = .gray
      ///                     }
      ///                 }
      ///             }
      ///         } else {
      ///             //  If no text was received in our drop, return false
      ///             return false
      ///         }
      ///
      ///         return true
      ///     }
      /// }
      /// ```
      public func dropExited(info: DropInfo) { }
}

