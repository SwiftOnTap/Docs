@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Creates a drop-zone for drag & drop contents.
    ///
    /// `onDrop` modifies a view such that contents can be dropped there in a
    /// drag-and-drop operation. The dropped contents are handled with a
    /// specified closure.
    ///
    /// ### Basic Usage
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var text: String = "🍌🍌"
    ///
    ///     var body: some View {
    ///         HStack {
    ///             Text(text)
    ///                 .font(.title)
    ///                 .onDrag { NSItemProvider(object: self.text as NSString) }
    ///
    ///             RoundedRectangle(cornerRadius: 10)
    ///                 .frame(width: 150, height: 150)
    ///                 .onDrop(of: ["public.text"], isTargeted: nil, perform: { _ in
    ///                     self.text = "Dropped My Bananas 🍌🍌!"
    ///                     return true
    ///                 })
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![Drop View](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ondrop-example-1.gif)
    ///
    /// ### Using `NSItemProvider` with `onDrop`
    /// `NSItemProvider` is a class that holds data on the dragged contents.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var bananas: String = "🍌🍌"
    ///     @State var apples: String = "🍏🍏"
    ///
    ///     var body: some View {
    ///         HStack {
    ///             Text(bananas)
    ///                 .font(.title)
    ///                 .onDrag { NSItemProvider(object: self.bananas as NSString) }
    ///
    ///             Text(apples)
    ///                 .font(.title)
    ///                 .onDrag { NSItemProvider(object: self.apples as NSString) }
    ///
    ///             RoundedRectangle(cornerRadius: 10)
    ///                 .frame(width: 150, height: 150)
    ///                 .onDrop(of: ["public.text"], isTargeted: nil, perform: { itemProvider in
    ///                     // Load the first item in the NSItemProvider array
    ///                     if let item = itemProvider.first {
    ///                         item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
    ///                             // Cast NSSecureCoding to Ddata
    ///                             if let data = text as? Data {
    ///                                 // Extract string from data
    ///                                 let droppedString = String(decoding: data, as: UTF8.self)
    ///
    ///                                 if droppedString == bananas {
    ///                                     bananas += "🍌"
    ///                                 } else if droppedString == apples {
    ///                                     apples += "🍏"
    ///                                 }
    ///                             }
    ///                         }
    ///                     }
    ///                     return true
    ///                 })
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![Drop View](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ondrop-example-2.gif)
    ///
    /// - Parameters:
    ///   - of: The type you want to drop. Accepts an array of `UTType`,
    ///   which can include "Uniform Resource Identifiers", or URI for short.
    ///   Common URI include `"public.image"`, `"public.text"`, `"public.file-url"`,
    ///   and `"public.url"`.
    ///   - isTargeted: A binding to communicate when a user is dragging over
    ///   this region.
    ///   - perform: The action to perform on drop. `perform` accepts an
    ///   `NSItemProvider` and returns a boolean.
    public func onDrop(of supportedContentTypes: [UTType], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider]) -> Bool) -> some View { }


    /// Creates a drop-zone for drag & drop contents and provides drop location data.
    ///
    /// `onDrop` modifies a view such that contents can be dropped there in a
    /// drag-and-drop operation. The dropped contents are handled with a
    /// specified closure. That closure includes a `CGPoint` of where the
    /// dragged contents were dropped.
    ///
    /// ### Basic Usage
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var text: String = "🍌🍌"
    ///
    ///     var body: some View {
    ///         HStack {
    ///             Text(text)
    ///                 .font(.title)
    ///                 .onDrag { NSItemProvider(object: self.text as NSString) }
    ///
    ///             RoundedRectangle(cornerRadius: 10)
    ///                 .frame(width: 150, height: 150)
    ///                 .onDrop(of: ["public.text"], isTargeted: nil, perform: { _, _ in
    ///                     self.text = "Dropped My Bananas 🍌🍌!"
    ///                     return true
    ///                 })
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![Drop View](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ondrop-example-1.gif)
    ///
    /// ### Using `NSItemProvider` with `onDrop`
    /// `NSItemProvider` is a class that holds data on the dragged contents.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var bananas: String = "🍌🍌"
    ///     @State var apples: String = "🍏🍏"
    ///
    ///     var body: some View {
    ///         HStack {
    ///             Text(bananas)
    ///                 .font(.title)
    ///                 .onDrag { NSItemProvider(object: self.bananas as NSString) }
    ///
    ///             Text(apples)
    ///                 .font(.title)
    ///                 .onDrag { NSItemProvider(object: self.apples as NSString) }
    ///
    ///             RoundedRectangle(cornerRadius: 10)
    ///                 .frame(width: 150, height: 150)
    ///                 .onDrop(of: ["public.text"], isTargeted: nil, perform: { itemProvider, _ in
    ///                     // Load the first item in the NSItemProvider array
    ///                     if let item = itemProvider.first {
    ///                         item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
    ///                             // Cast NSSecureCoding to Ddata
    ///                             if let data = text as? Data {
    ///                                 // Extract string from data
    ///                                 let droppedString = String(decoding: data, as: UTF8.self)
    ///
    ///                                 if droppedString == bananas {
    ///                                     bananas += "🍌"
    ///                                 } else if droppedString == apples {
    ///                                     apples += "🍏"
    ///                                 }
    ///                             }
    ///                         }
    ///                     }
    ///                     return true
    ///                 })
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![Drop View](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ondrop-example-2.gif)
    ///
    /// ### Using `CGPoint` with `onDrop`
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var topBananas: String = "🍌🍌"
    ///     @State var bottomBananas: String = "🍌🍌"
    ///
    ///     var body: some View {
    ///         GeometryReader { geometry in
    ///             VStack {
    ///                 Spacer()
    ///
    ///                 HStack {
    ///                     Text(topBananas)
    ///                         .font(.title)
    ///                         .onDrag { NSItemProvider() }
    ///                 }
    ///
    ///                 RoundedRectangle(cornerRadius: 10)
    ///                     .frame(width: 150, height: 150)
    ///                     .onDrop(of: ["public.text"], isTargeted: nil, perform: { _, location in
    ///
    ///                         // If dropped on the bottom half the rectangle, add to bottom.
    ///                         if location.y > geometry.size.height/2 {
    ///                             bottomBananas += "🍌"
    ///                         } else {
    ///                             // Else, add to top
    ///                             topBananas += "🍌"
    ///                         }
    ///
    ///                         return true
    ///                     })
    ///
    ///                 HStack {
    ///                     Text(bottomBananas)
    ///                         .font(.title)
    ///                         .onDrag { NSItemProvider() }
    ///                 }
    ///
    ///                 Spacer()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![Drop View](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ondrop-example-3.gif)
    ///
    /// - Parameters:
    ///     - of: The type you want to drop. Accepts an array of "Uniform
    ///     Resource Identifiers", or URI for short. Common URI include
    ///     `"public.image"`, `"public.text"`, `"public.file-url"`, and `"public.url"`.
    ///     - isTargeted: A binding to communicate when a user is dragging
    ///     over this region.
    ///     - perform: The action to perform on drop. `perform` accepts an
    ///     `NSItemProvider` and a `CGPoint` which represents the drop location.
    ///     It returns a boolean.
    public func onDrop(of supportedContentTypes: [UTType], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider], CGPoint) -> Bool) -> some View { }


    /// Creates a drop-zone for drag & drop contents and provides drop location data.
    ///
    /// `onDrop` modifies a view such that contents can be dropped there in a
    /// drag-and-drop operation. The dropped contents are handled with a struct
    /// that conforms to the ``DropDelegate`` protocol.
    ///
    /// #### Conform to DropDelegate
    /// Implement ``DropDelegate/performDrop(info:)-386a3`` to create a
    /// structure that conforms to ``DropDelegate``.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State var text: String = "🍌🍌"
    ///
    ///     var body: some View {
    ///         HStack {
    ///             // Text to drag
    ///             Text(text)
    ///                 .font(.title)
    ///                 .onDrag { NSItemProvider(object: self.text as NSString) }
    ///
    ///             // Area to drop
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
    ///     // Drop entered called
    ///     func dropEntered(info: DropInfo) {
    ///         // Change color if color was previously black
    ///         self.color = (self.color == .black) ? .gray : self.color
    ///     }
    ///
    ///     // Drop entered called
    ///     func dropExited(info: DropInfo) {
    ///         self.color = .init(white: 0.40)
    ///     }
    ///
    ///     // Drop has been updated
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
    /// This example uses ``DropDelegate/dropUpdated(info:)-72cd3`` to prevent
    /// fruits from being dropped if the background is yellow.
    ///
    /// The example uses ``DropDelegate/dropEntered(info:)-525fa`` to change
    /// the color the first time a user drags over the drop zone.
    ///
    /// Finally, when a user drags out of the view,
    /// ``DropDelegate/dropExited(info:)-3d540``
    /// changes the background color to a dark gray.
    ///
    /// Note: if the user deselects their dragged object while over the drop
    /// zone, ``DropDelegate/dropExited(info:)-3d540`` will **not** be called.
    /// ``DropDelegate/dropExited(info:)-3d540`` is only called when the user
    /// explicitly drags their dragged object **out** of the drop zone.
    ///
    /// - Parameters:
    ///   - of: The type you want to drop. Accepts an array of `UTType` which
    ///   include "Uniform Resource Identifiers", or URI for short.
    ///   Common URI include "public.image", "public.text",
    ///   "public.file-url", and "public.url".
    ///   - delegate: An object that conforms to  ``DropDelegate``.
    public func onDrop(of supportedContentTypes: [UTType], delegate: DropDelegate) -> some View { }

}

