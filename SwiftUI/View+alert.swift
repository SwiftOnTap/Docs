@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that presents an alert when a given value is not nil.
    ///
    /// Use this modifier to present an alert over the current view when you
    /// need to pass the alert a value.
    /// The alert will be presented only when the binding value you pass it is
    /// not nil.
    ///
    /// If your alert doesn't need an `item` parameter, use
    /// ``View/alert(isPresented:content)`` instead.
    ///
    /// Use the modifier like this:
    ///
    ///     struct Item: Identifiable {
    ///         let id = UUID()
    ///         let text: String
    ///     }
    ///
    ///     struct ExampleView: View {
    ///         @State private var item: Item? = nil
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Button("🍌 Alert") {
    ///                     item = Item(text: "🍌🍌")
    ///                 }
    ///                 Button("🍑 Alert") {
    ///                     item = Item(text: "🍑🍑")
    ///                 }
    ///             }
    ///             .alert(item: $item, content: alertBuilder)
    ///         }
    ///
    ///         func alertBuilder(item: Item) -> Alert {
    ///             let confirm = Alert.Button.default(Text("Confirm \(item.text)")) { print(item.text) }
    ///             let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
    ///
    ///             return Alert(title: Text("Confirm fruit"),
    ///                         message: Text("Please confirm your fruit"),
    ///                         primaryButton: confirm,
    ///                         secondaryButton: cancel)
    ///         }
    ///     }
    ///
    /// ![A gif displaying two buttons in a VStack, denoted by a banana and
    /// peach emoji, respectively. When pressed, each prompts an alert to
    /// confirm the fruit, with the option to either confirm or cancel. The
    /// alert is implemented as a modifier to the VStack, which determines the
    /// prompted alert based on the binding value passed to its item parameter.](alert-item-content.gif)
    ///
    /// - Parameters:
    ///   - item: A binding value passed to `content` to build the sheet. The sheet will show
    ///   when this value is not `nil`.
    ///   - content: A view builder closure that takes in the `item` and returns the alert.
    public func alert<Item>(item: Binding<Item?>, content: (Item) -> Alert) -> some View where Item : Identifiable { }


    /// A view modifier that presents an alert when a given condition is true.
    ///
    /// Use this modifier to present an alert over the current view.
    /// The alert will be presented only when the binding value you pass it is true.
    ///
    /// If your alert needs an `item` parameter, use
    /// ``View/alert(item:content)`` instead.
    ///
    /// Use the modifier like this:
    ///
    ///     struct ExampleView: View {
    ///         @State private var showAlert = false
    ///
    ///         var body: some View {
    ///             Button("Open sesame 🚨") {
    ///                 showAlert = true
    ///             }
    ///             .alert(isPresented: $showAlert) {
    ///                 let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.") }
    ///                 let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
    ///
    ///                 return Alert(title: Text("Confirm alert"),
    ///                             message: Text("Please confirm your alert!"),
    ///                             primaryButton: confirm,
    ///                             secondaryButton: cancel)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif with a blue button that reads "Open sesame"—when pressed,
    /// an alert pops up that asks the user to confirm the alert, with the
    /// option to either confirm or cancel.](alert-is-presented.gif)
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the alert is presented.
    ///   - content: A closure returning the ``Alert``.
    public func alert(isPresented: Binding<Bool>, content: () -> Alert) -> some View { }

}

