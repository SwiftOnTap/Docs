@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
@available(macOS, unavailable)
extension View {

    /// A view modifier that presents a sheet overlaid over the full screen.
    ///
    /// Use this modifier to present a full screen view over the current view. The "full screen cover" enters
    /// and exits the screen from the bottom.
    ///
    /// If your full screen cover does not need a parameter, use
    /// ``View/fullScreenCover(isPresented:onDismiss:content:)`` instead.
    ///
    /// For a cover view that does not take up the full screen, use
    /// ``View/sheet(item:onDismiss:content:)`` instead.
    ///
    /// Use the modifier like this:
    ///
    ///     struct Item: Identifiable {
    ///         let id = UUID()
    ///         let text: String
    ///     }
    ///
    ///     struct ContentView: View {
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
    ///             .fullScreenCover(item: $item,
    ///                              onDismiss: { print("dismissed!") },
    ///                              content: { ExampleSheet(item: $0) })
    ///         }
    ///     }
    ///
    ///     struct ExampleSheet: View {
    ///         let item: Item
    ///         @Environment (\.presentationMode) var presentationMode
    ///
    ///         var body: some View {
    ///             ZStack {
    ///                 Color.yellow
    ///                 VStack {
    ///                     Text(item.text)
    ///                     Button("Tap to Dismiss") {
    ///                         presentationMode.wrappedValue.dismiss()
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a view containing a VStack with two buttons,
    /// "🍌 Sheet" and "🍑 Sheet", which trigger the appearance of yellow
    /// full screen covers reading "🍌🍌" and "🍑🍑" respectively, each  with a
    /// "Tap to Dismiss" button beneath the emojis; upon dismissal of either
    /// sheet, the console prints "dismissed!" and the sheet slides back down
    /// until hidden.](full-screen-cover-i-od-c-ex.gif)
    ///
    /// - Parameters:
    ///   - item: A binding value passed to `content` to build the full screen cover. The full screen
    ///   cover will show when the value is not `nil`.
    ///   - onDismiss: A function that runs when the sheet disappears.
    ///   - content: A view builder closure that takes in the `item` and returns the full screen cover.
    public func fullScreenCover<Item, Content>(item: Binding<Item?>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item : Identifiable, Content : View { }


    /// A view modifier that presents a sheet overlaid over the full screen without a custom parameter.
    ///
    /// Use this modifier to present a full screen view over the current view. The "full screen cover" enters
    /// and exits the screen from the bottom.
    ///
    /// If your full screen cover needs a custom parameter, use
    /// ``View/fullScreenCover(item:onDismiss:content:)`` instead.
    ///
    /// For a cover view that does not take up the full screen, use
    /// ``View/sheet(item:onDismiss:content:)`` instead.
    ///
    /// Use the modifier like this:
    ///
    ///     struct ExampleView: View {
    ///         @State private var showCover: Bool = false
    ///
    ///         var body: some View {
    ///             Button("Open sesame 📬") {
    ///                 showCover = true
    ///             }
    ///             .fullScreenCover(isPresented: $showCover,
    ///                 onDismiss: { print("dismissed!") },
    ///                 content: { ExampleSheet() })
    ///         }
    ///     }
    ///
    ///     struct ExampleSheet: View {
    ///         @Environment(\.presentationMode) var presentationMode
    ///
    ///         var body: some View {
    ///             ZStack {
    ///                 Button("CLOSE 📪") {
    ///                     presentationMode.wrappedValue.dismiss()
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a view with a button reading "Open sesame 📬" which
    /// triggers the presentation of a full screen cover with a button reading
    /// "CLOSE 📪"; upon dismissal of the sheet with the close button, the
    /// console prints "dismissed!" and the sheet slides back down until hidden.](full-screen-cover-ip-od-c-ex.gif)
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the modal view is presented.
    ///   - onDismiss: A closure executed when the modal view dismisses.
    ///   - content: A closure returning the content of the modal view.
    public func fullScreenCover<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View { }

}

