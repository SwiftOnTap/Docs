@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// A view modifier that presents a popover using the given item as a data source for the
    /// popover's content.
    ///
    /// If your popover doesn't require a passed-in parameter, use
    /// ``View/popover(isPresented:attachmentAnchor:arrowEdge:content:)``
    /// instead.
    ///
    /// On iPhone, this modifier is very similar to
    /// ``View/sheet(item:onDismiss:content:)``.
    /// However, on iPad, these two modifiers are different.
    ///
    /// ```
    /// struct Item: Identifiable {
    ///     let id = UUID()
    ///     let text: String
    /// }
    ///
    /// struct BaseView: View {
    ///     @State private var item: Item? = nil
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Button("🍌 Popover") {
    ///                 item = Item(text: "🍌🍌")
    ///             }
    ///             Button("🍑 Popover") {
    ///                 item = Item(text: "🍑🍑")
    ///             }
    ///         }
    ///         .popover(item: $item,
    ///                  attachmentAnchor: .rect(.bounds),
    ///                  arrowEdge: .leading,
    ///                  content: { ExamplePopover(item: $0) })
    ///     }
    /// }
    ///
    /// struct ExamplePopover: View {
    ///     let item: Item
    ///     @Environment(\.presentationMode) var presentationMode
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(item.text)
    ///             Button("Tap to dismiss") {
    ///                 presentationMode.wrappedValue.dismiss()
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying two buttons in a VStack that each read "Popover,"
    /// paired with a banana and peach emoji, respectively. When clicked, each
    /// prompts a popover which is applied to the VStack, distinguished by
    /// a binding passed to the popover. The popover displays two emojis of the
    /// selected fruit and an option to "Tap to dismiss" below.](popover-item-ex.gif)
    ///
    /// - Parameters:
    ///   - item: A binding to an optional source of truth for the popover.
    ///     When representing a non-`nil` item, the system uses `content` to
    ///     create a popover representation of the item.
    ///     If the identity changes, the system dismisses a
    ///     currently-presented popover and replace it by a new popover.
    ///   - attachmentAnchor: The positioning anchor which defines where the
    ///     popover is attached.
    ///   - arrowEdge: The edge of the `attachmentAnchor` where the popover's
    ///     arrow is located.
    ///   - content: A closure returning the content of the popover.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func popover<Item, Content>(item: Binding<Item?>, attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge = .top, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item : Identifiable, Content : View { }


    /// Presents a popover when a given condition is true.
    ///
    /// If your popover requires a passed-in parameter, use
    /// ``View/popover(item:attachmentAnchor:arrowEdge:content:)``
    /// instead.
    ///
    /// On iPhone, this modifier is very similar to
    /// ``View/sheet(isPresented:onDismiss:content:)``.
    /// However, on iPad, these two modifiers are different.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State private var showPopover = false
    ///
    ///     var body: some View {
    ///         Button("Open sesame 📬") { showPopover = true }
    ///             .popover(isPresented: $showPopover,
    ///                      attachmentAnchor: .rect(.bounds),
    ///                      arrowEdge: .leading,
    ///                      content: { ExamplePopover() })
    ///     }
    /// }
    ///
    /// struct ExamplePopover: View {
    ///     @Environment(\.presentationMode) var presentationMode
    ///
    ///     var body: some View {
    ///         Button("CLOSE 📪") {
    ///             presentationMode.wrappedValue.dismiss()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a single button in the center which reads "Open sesame,"
    /// which prompts a popover when clicked with a button to Close. When the
    /// initial button is pressed, it toggles the value of showPopover to trigger
    /// the modifier.](popover-is-presented-ex.gif)
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the popover is presented.
    ///   - attachmentAnchor: The positioning anchor which defines where the
    ///     popover is attached.
    ///   - arrowEdge: The edge of the `attachmentAnchor` where the popover's
    ///     arrow is located.
    ///   - content: A closure returning the content of the popover.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func popover<Content>(isPresented: Binding<Bool>, attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge = .top, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View { }

}

