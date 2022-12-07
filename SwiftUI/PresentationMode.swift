/// An indication whether a view is currently presented by another view.
///
/// This is the type of the environment value used to programmatically
/// interact with the view currently presented.
///
/// This is useful for 4 types of views:
/// 1. ``NavigationView``
/// 2. ``View/sheet(isPresented:onDismiss:content:)``
/// 3. ``View/popover(isPresented:attachmentAnchor:arrowEdge:content:)``
/// 4. ``View/fullScreenCover(isPresented:onDismiss:content:)``
///
/// See ``Environment`` for more on environment values and how to use
/// the property wrapper.
///
/// While this is a ``Binding`` environment value, most often
/// the wrapped value will be accessed. The wrapped value
/// is of type `PresentationMode`. See that structure for more info
/// on its properties.
///
/// Below is a simple example of programmatically dismissing a
/// sheet using this environment value.
///
///     struct ExampleView: View {
///         @State private var showSheet = false
///
///         var body: some View {
///             Button("Open sesame 📬") {
///                 showSheet = true
///             }
///             .sheet(isPresented: $showCover,
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
/// ![A gif displaying a single button that reads "Open sesame" which prompts a new
/// view when pressed with a button that reads "Close." When that button is pressed,
/// the presentationMode environment value programatically dismisses the sheet.](presentation-mode-dismiss-ex.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PresentationMode {

    /// Indicates whether a view is currently presented.
    ///
    /// Use this property of the presentation mode environment value to
    /// programmatically read the presentation status of the current view.
    ///
    /// This is useful for 4 types of views:
    /// 1. ``NavigationView``
    /// 2. ``View/sheet(isPresented:onDismiss:content:)``
    /// 3. ``View/popover(isPresented:attachmentAnchor:arrowEdge:content:)``
    /// 4. ``View/fullScreenCover(isPresented:onDismiss:content:)``
    ///
    /// See ``Environment`` for more on environment values and how to use
    /// the property wrapper.
    ///
    /// Below is a simple example of programmatically dismissing a
    /// sheet using this environment value.
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
    ///             Text("hello!")
    ///                 .onAppear {
    ///                     print(presentationMode.wrappedValue.isPresented) //true
    ///                 }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a single button that reads "Open sesame" which prompts a new
    /// view when pressed with a text view that reads "hello!"](presentation-mode-is-presented-ex.gif)
    ///
    public var isPresented: Bool { get }

    /// Dismisses the view if it is currently presented.
    ///
    /// Use this function on the presentation mode environment value to
    /// programmatically dismiss the view currently presented.
    ///
    /// This is useful for 4 types of views:
    /// 1. ``NavigationView``
    /// 2. ``View/sheet(isPresented:onDismiss:content:)``
    /// 3. ``View/popover(isPresented:attachmentAnchor:arrowEdge:content:)``
    /// 4. ``View/fullScreenCover(isPresented:onDismiss:content:)``
    ///
    /// Below is a simple example of programmatically dismissing a
    /// sheet using this environment value.
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
    /// ![A gif displaying a single button that reads "Open sesame" which prompts a new
    /// view when pressed with a button that reads "Close." When that button is pressed,
    /// the presentationMode environment value programatically dismisses the sheet.](presentation-mode-dismiss-ex.gif)
    ///
    public mutating func dismiss() { }
}
