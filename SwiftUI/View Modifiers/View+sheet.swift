@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that presents a sheet when a given value is not nil.
    ///
    /// Use this modifier to present a sheet over the current view when you need to pass the sheet a value.
    /// The sheet will be presented only when the binding value you pass it is not nil.
    ///
    /// If your sheet doesn't need an `item` parameter, use
    /// ``View/sheet(isPresented:onDismiss:content)`` instead.
    ///
    ///
    /// For a sheet-like view that takes up the full screen, use
    /// ``View/fullScreenCover(item:onDismiss:content)`` instead.
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
    ///                 Button("🍌 Sheet") {
    ///                     item = Item(text: "🍌🍌")
    ///                 }
    ///                 Button("🍑 Sheet") {
    ///                     item = Item(text: "🍑🍑")
    ///                 }
    ///             }
    ///             .sheet(item: $item,
    ///                    onDismiss: { print("dismissed!") },
    ///                    content: { ExampleSheet(item: $0) })
    ///         }
    ///     }
    ///
    ///     struct ExampleSheet: View {
    ///         let item: Item
    ///         @Environment (\.presentationMode) var presentationMode
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Text(item.text)
    ///                 Button("Tap to Dismiss") {
    ///                     presentationMode.wrappedValue.dismiss()
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a view containing a VStack with two buttons,
    /// "🍌 Sheet" and "🍑 Sheet", which trigger the appearance of a sheets
    /// reading "🍌🍌" and "🍑🍑" respectively, each with a "Tap to Dismiss"
    /// button beneath the emojis; upon dismissal of either sheet, the console
    /// prints "dismissed!" and the sheet slides back down until hidden.](sheet-i-od-c-ex.gif)
    ///
    /// - Parameters:
    ///   - item: A binding value passed to `content` to build the sheet. The sheet will show
    ///   when this value is not `nil`.
    ///   - onDismiss: A function that runs when the sheet disappears.
    ///   - content: A view builder closure that takes in the `item` and returns the sheet.
    public func sheet<Item, Content>(item: Binding<Item?>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item : Identifiable, Content : View { }


    /// A view modifier that presents a sheet when a given condition is true.
    ///
    ///     struct ExampleView: View {
    ///         @State private var showSheet = false
    ///
    ///         var body: some View {
    ///             Button("Open sesame 📬") {
    ///                 showSheet = true
    ///             }
    ///             .sheet(isPresented: $showSheet,
    ///                    onDismiss: { print("dismissed!") },
    ///                    content: { ExampleSheet() })
    ///         }
    ///     }
    ///
    ///     struct ExampleSheet: View {
    ///         @Environment(\.presentationMode) var presentationMode
    ///
    ///         var body: some View {
    ///             Button("CLOSE 📪") {
    ///                 presentationMode.wrappedValue.dismiss()
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a view with a button reading "Open sesame 📬" which
    /// triggers the presentation of a sheet with a button reading "CLOSE 📪";
    /// upon dismissal of the sheet with the close button, the console prints
    /// "dismissed!" and the sheet slides back down until hidden.](sheet-ip-od-c-ex.gif)
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the sheet is presented.
    ///   - onDismiss: A closure executed when the sheet dismisses.
    ///   - content: A closure returning the content of the sheet.
    public func sheet<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View { }

}

