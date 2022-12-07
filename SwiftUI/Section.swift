/// A container that groups views.
///
/// Use `Section` inside of ``List`` and ``Form`` to visually
/// separate sections of content.
///
/// Here's a `Section` in a ``List``:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         List {
///             Section {
///                 Text("I'm in the first 🥇 section")
///                 Text("Number 1️⃣")
///             }
///             Section {
///                 Text("Second is the best 🥈")
///                 Text("Indeed✌️")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A white view showing a plain list with two sections, each with two text views.](section-1-clean.png)
///
/// And, for comparison, a ``Form``:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Form {
///             Section {
///                 Text("I'm in the first 🥇 section")
///                 Text("Number 1️⃣")
///             }
///             Section {
///                 Text("Second is the best 🥈")
///                 Text("Indeed✌️")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A white view showing a form with two sections, each with two text views.](section-2-clean.png)
///
/// You can also (optionally) add **header** and **footer** content
/// to a `Section`:
///
/// ```
/// struct ContentView: View {
///     var footer: some View {
///         Text("This is a disclaimer about section number 2. Use at your own risk.")
///     }
///
///     var body: some View {
///         Form {
///             Section(header: Text("Section #1")) {
///                 Text("I'm in the first 🥇 section")
///                 Text("Number 1️⃣")
///             }
///             Section(header: Text("Section #2"), footer: footer) {
///                 Text("Second is the best 🥈")
///                 Text("Indeed✌️")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A white view showing a form with two sections, each with a header
/// reading "Section #_" and two text views, and the second with a footer in small gray lettering
/// reading "This is a disclaimer about section number 2. Use at your own risk."](section-3-clean.png)
///
/// You can style a ``List``, and the `Section`s will automatically
/// get styled accordingly.
///
/// ```
/// struct ContentView: View {
///     var footer: some View {
///         Text("This is a disclaimer about section number 2. Use at your own risk.")
///     }
///
///     var body: some View {
///         List {
///             Section(header: Text("Section #1")) {
///                 Text("I'm in the first 🥇 section")
///                 Text("Number 1️⃣")
///             }
///             Section(header: Text("Section #2"), footer: footer) {
///                 Text("Second is the best 🥈")
///                 Text("Indeed✌️")
///             }
///         }
///         .listStyle(InsetGroupedListStyle()) //Try changing this to SidebarListStyle()
///     }
/// }
/// ```
///
/// ![A white view showing an inset grouped list split into two sections, each with a header
/// reading "Section #_" and two text views, and the second with a footer in small gray lettering
/// eading "This is a disclaimer about section number 2. Use at your own risk."](section-4-clean.png)
///
/// Beyond ``List`` and ``Form``, the four `lazy` layout elements also
/// support `Section`:
/// - ``LazyVStack``
/// - ``LazyHStack``
/// - ``LazyVGrid``
/// - ``LazyHGrid``
///
/// They even enable you to pin the headers and footers as you scroll
/// using ``PinnedScrollableViews``. See those pages for more.
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Section<Parent, Content, Footer> {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section : View where Parent : View, Content : View, Footer : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never

    /// Initialize a ``Section`` with an explicit header, footer, and content.
    ///
    /// Use this initializer to create a ``Section`` with a `header`,
    /// a `footer`, and a ``ViewBuilder`` to create the content.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         List {
    ///             Section(header: Text("Section #1"), footer: Text("Disclaimer #1")) {
    ///                 Text("I'm in the first 🥇 section")
    ///                 Text("Number 1️⃣")
    ///             }
    ///             Section(header: Text("Section #2"), footer: Text("Disclaimer #2")) {
    ///                 Text("Second is the best 🥈")
    ///                 Text("Indeed✌️")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A white view showing a list divided into two sections, each with a
    /// header reading "Section #_" and a footer reading "Dislaimer #_".](section-init-1-clean.png)
    ///
    /// You can actually make the `header` and `footer` any ``View``, though
    /// the initializer doesn't allow much space for it. If you want
    /// something more than just a plain ``Text`` view, try refactoring
    /// the value:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var header: some View {
    ///         HStack {
    ///             Image(systemName: "1.square.fill")
    ///                 .imageScale(.large)
    ///             Text("Section")
    ///                 .font(.largeTitle)
    ///                 .bold()
    ///         }
    ///         .foregroundColor(.white)
    ///     }
    ///     var footer: some View {
    ///         Text("A disclaimer might go here")
    ///             .font(.footnote)
    ///     }
    ///     var body: some View {
    ///         List {
    ///             Section(header: header, footer: footer) {
    ///                 Text("I'm in the first 🥇 section")
    ///                 Text("Number 1️⃣")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A white view with one section containing a header, which displays an
    /// HStack made up of an image and the text "Section", as well as a footer,
    /// which reads "A disclaimer might go here", in footnote text.](section-init-2-clean.png)
    ///
    /// - Parameters:
    ///   - header: A view placed on top
    ///   - footer: A view placed on bottom
    ///   - content: The section contents
    public init(header: Parent, footer: Footer, @ViewBuilder content: () -> Content) { }

    /// The child view displayed in the ``Section``.
    public var internalBody: some View { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section where Parent == EmptyView, Content : View, Footer : View {

    /// Initialize a ``Section`` with an explicit footer and content.
    ///
    /// Use this initializer to create a ``Section`` that has `footer`
    /// content, but no `header` content. See
    /// ``Section/init(header:footer:content:)`` for how to create
    /// a section with both `header` and `footer` content.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let message = "Disclaimer: there is only one section so it's nothing to be proud about."
    ///
    ///     var body: some View {
    ///         List {
    ///             Section(footer: Text(message)) {
    ///                 Text("I'm in the first 🥇 section")
    ///                 Text("Number 1️⃣")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A white view displaying a list with two members and a footer reading
    /// "Disclaimer:..."](section-init-3-clean.png)
    ///
    /// Footer content will look different depending on the ``ListStyle``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     let message = "Disclaimer: there is only one section so it's nothing to be proud about."
    ///
    ///     var body: some View {
    ///         List {
    ///             Section(footer: Text(message)) {
    ///                 Text("I'm in the first 🥇 section")
    ///                 Text("Number 1️⃣")
    ///             }
    ///         }
    ///         .listStyle(InsetGroupedListStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A white view displaying an inset grouped list with two members and a
    /// small footer below the edge of the list that reads "Disclaimer:..."](section-init-4-clean.png)
    ///
    /// - Parameters:
    ///   - footer: A view placed on bottom
    ///   - content: The section contents
    public init(footer: Footer, @ViewBuilder content: () -> Content) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section where Parent : View, Content : View, Footer == EmptyView {

    /// Initialize a ``Section`` with an explicit header and content.
    ///
    /// Use this initializer to create a ``Section`` that has `header`
    /// content, but no `footer` content. See
    /// ``Section/init(header:footer:content:)`` for how to create
    /// a section with both `header` and `footer` content.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         List {
    ///             Section(header: Text("Section #1")) {
    ///                 Text("I'm in the first 🥇 section")
    ///                 Text("Number 1️⃣")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A white view displaying a list with two items and a text header that
    /// reads "Section #1".](section-init-5-clean.png)
    ///
    /// Header content can be any view, so you can style the parameter
    /// however you would like:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var header: some View {
    ///         HStack {
    ///             Image(systemName: "1.square.fill")
    ///                 .imageScale(.large)
    ///             Text("Section #1")
    ///                 .font(.largeTitle)
    ///                 .bold()
    ///         }
    ///         .foregroundColor(.white)
    ///     }
    ///     var body: some View {
    ///         List {
    ///             Section(header: header) {
    ///                 Text("I'm in the first 🥇 section")
    ///                 Text("Number 1️⃣")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A white view displaying a list with two items and a header containing
    /// an HStack made up of a small image and the text "Section #1".](section-init-6-clean.png)
    ///
    /// - Parameters:
    ///   - header: A view placed on top
    ///   - content: The section contents
    public init(header: Parent, @ViewBuilder content: () -> Content) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section where Parent == EmptyView, Content : View, Footer == EmptyView {

    /// Initialize a ``Section`` with specified content.
    ///
    /// Use this initializer to create a ``Section`` that has
    /// no header and no footer. See
    /// ``Section/init(header:footer:content:)`` for how to create
    /// a section with both `header` and `footer` content.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         List {
    ///             Section {
    ///                 Text("I'm in the first 🥇 section")
    ///                 Text("Number 1️⃣")
    ///             }
    ///             Section {
    ///                 Text("Second is the best 🥈")
    ///                 Text("Indeed✌️")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A white view displaying a list with two sections, each without a
    /// header or footer, resulting in no line between.](section-1-clean.png)
    ///
    /// - Parameters
    ///   - content: The section contents
    public init(@ViewBuilder content: () -> Content) { }
}

