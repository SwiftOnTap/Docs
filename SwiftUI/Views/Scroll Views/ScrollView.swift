/// A view that scrolls.
///
/// A view that allows the scrolling of its contained views.
///
/// ### Making a view scrollable
///
/// ``ScrollView`` is a container view that makes its content scrollable.
/// For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         ScrollView {
///             VStack {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍏🍏")
///                 Text("Peaches 🍑🍑")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif that displays a scroll view with a VStack containing three text elements being scrolled up and down.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ScrollView-example-1.gif)
///
/// In this example, the ``VStack`` containing the text is made scrollable by
/// wrapping it in a `ScrollView`.
///
/// Note:
///
/// - The content of a ``ScrollView`` is scrollable regardless of whether all
/// of it fits on screen or not.
/// - It is not possible to selectively disable the scrolling of a
/// ``ScrollView``, while allowing its content to remain interactive. A
/// ``View/disabled(_:)`` attached to a ``ScrollView`` will disable both the
/// scrolling and all the interaction with the content visible.
/// - A ``ScrollView``'s scrollable region is sized to fit the content view
/// passed to the ``ScrollView``.
/// - ``ScrollView`` fits to occupy as much space as possible. It is important
/// to distinguish between the actual bounds of the scroll view, and the
/// bounds of the *content* of the ``ScrollView``.
/// [scrollview-axis ->]
/// ### Setting the direction of scrolling
///
/// The default scrolling direction of a ``ScrollView`` is **vertical**.
/// ``ScrollView`` supports 3 types of scrolling:
/// - vertical
/// - horizontal
/// - both vertical and horizontal
///
/// To set a single allowed direction for a ``ScrollView``, specify the axis
/// of direction in the initializer. For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         ScrollView(.horizontal) {
///             VStack {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍏🍏")
///                 Text("Peaches 🍑🍑")
///             }
///         }
///     }
/// }
/// ```
/// ![A gif that displays a .horizontal scroll view with a VStack containing three text elements being scrolled left and right.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ScrollView-example-2.gif)
///
/// [<-]
/// This example takes the previous example, and modifies it so that the
/// ``ScrollView`` scrolls horizontally. This ``ScrollView`` will **not**
/// scroll vertically, as an explict axis, `.horizontal`, has been specified.
///
/// To allow *both* directions of scrolling, pass the set of axes that you want
/// to permit. For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         ScrollView([.horizontal, .vertical]) {
///             VStack {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍏🍏")
///                 Text("Peaches 🍑🍑")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif that displays a .horizontal and .vertical scroll view with a VStack containing three text elements being scrolled diagonally.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ScrollView-example-3.gif)
///
/// In this example, `ScrollView` can scroll both horizontally *and*
/// vertically, because both axes have been specified explicitly.
/// [scrollview-hide-indicators ->]
/// ### Hiding the scroll view indicator
///
/// By default, a ``ScrollView``'s scroll indicator is visible upon user
/// interaction.
///
/// Pass `false` to ``ScrollView/showsIndicators`` in
/// ``ScrollView/init(_:showsIndicators:content:)`` to hide the scroll
/// indicator(s). For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         ScrollView(.horizontal, showsIndicators: false) {
///             VStack {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍏🍏")
///                 Text("Peaches 🍑🍑")
///             }
///         }
///     }
/// }
/// ```
///
/// ![ScrollView Example 4](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ScrollView-example-4.gif)
///
/// This ``ScrollView`` will never show a scroll indicator.
///
/// You do not need to specify an axis to use
/// ``ScrollView/showsIndicators``. For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         ScrollView(showsIndicators: false) {
///             VStack {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍏🍏")
///                 Text("Peaches 🍑🍑")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif that displays a .horizontal scroll view with a VStack containing three text elements being scrolled left and right wihtout a visible scroll indicator.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ScrollView-example-5.gif)
///
/// This ``ScrollView`` hides its scroll indicator, with a default
/// `.vertical` scroll direction.
/// [<-]
/// [scrollview-proxy ->]
/// ### Scrolling to an item
///
/// To programmatically scroll to a particular item in your ``ScrollView``,
/// use ``ScrollViewProxy/scrollTo(_:anchor:)``. ``ScrollViewProxy`` is a type
/// that allows you to control a ``ScrollView``, and can be obtained using a
/// ``ScrollViewReader``.
///
/// For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         ScrollView {
///             ScrollViewReader { (proxy: ScrollViewProxy) in
///                 Button("Jump to #32") {
///                     proxy.scrollTo(32)
///                 }
///
///                 ForEach(1..<101) { number in
///                     Text("Item #\(number)")
///                         .id(number)
///                 }
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif that displays a scroll view with a VStack containing a button reading
/// "Jump to # 32" directly above text elements reading "Item #_",
/// where _ is filled by the numbers 1-101; when the button is clicked, the view
/// jumps down to the location in the scroll where the text "Item #32" is at the
/// bottom edge of the screen.](scroll-view-proxy-ex1.gif)
///
/// In this example, clicking the button reading "Jump to #32", will cause the
/// ``ScrollView`` to scroll to the item with the ID of the value `32`.
/// To assign an ID to a view, use ``View/id(_:)`` as is done inside the
/// ``ForEach``, for each element.
///
/// The call of `proxy.scrollTo(32)` causes the `ScrollView` to scroll to the
/// text reading "Item #32", with that text centered vertically in the
/// ``ScrollView``'s bounds. To change the anchor of the finalled scrolled-to
/// destination, specify an anchor via
/// ``ScrollViewProxy/scrollTo(_:anchor:)``. For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         ScrollView {
///             ScrollViewReader { (proxy: ScrollViewProxy) in
///                 Button("Jump to #32") {
///                     proxy.scrollTo(32, anchor: .top)
///                 }
///
///                 ForEach(1..<101) { number in
///                     Text("Item #\(number)")
///                         .id(number)
///                 }
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif that displays a scroll view with a VStack containing a button reading
/// "Jump to # 32" directly above text elements reading "Item #_",
/// where _ is filled by the numbers 1-101; when the button is clicked, the view
/// jumps down to the location in the scroll where the text "Item #32" is at the
/// top edge of the screen, as defined by anchor.](scrollviewproxy-ex7.gif)
///
/// In this example, the `ScrollView` still scrolls to "Item #32", but this
/// ``Text`` is seen at the top of the `ScrollView`, rather than it's
/// vertical center. The `anchor` parameter uses a type,
/// ``UnitPoint``, to determine the relative alignment (relative to the
/// scroll view's bounds) of the scrolled-to item.
///
/// [<-]
/// [scrollview-scrollto ->]
///
///  Add a transition to your ``ScrollViewProxy/scrollTo(_:anchor:)``
/// with ``withAnimation(_:_:)``.  For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         ScrollView {
///             ScrollViewReader { (proxy: ScrollViewProxy) in
///                 Button("Jump to #32") {
///                     withAnimation(.easeInOut(duration: 60)) {
///                         proxy.scrollTo(32, anchor: .top)
///                     }
///                 }
///
///                 ForEach(1..<101) { number in
///                     Text("Item #\(number)")
///                         .id(number)
///                 }
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif that displays a scroll view with a VStack containing a button reading
/// "Jump to # 32" directly above text elements reading "Item #_",
/// where _ is filled by the numbers 1-101; when the button is clicked, the view
/// jumps down to the location in the scroll where the text "Item #32" is at the
/// top edge of the screen, as defined by the anchor.](scrollviewproxy-ex7.gif)
///
/// [<-]
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ScrollView<Content> : View where Content : View {

    /// The scroll view's content.
    ///
    /// This is the content displayed in a ``ScrollView``. To specify the
    /// content, pass a trailing ``ViewBuilder`` to the
    /// ``ScrollView/init(_:showsIndicators:content:)`` initializer:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView {
    ///             VStack(spacing: 50) {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///             .font(.title)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif that displays a scroll view with a VStack containing several
    /// fruits paired with emojis. The content displayed in this case is the
    /// fruits; only vertical scroll is enabled since no direction is passed to the
    /// initializer.](scroll-view-content-ex.gif)
    ///
    /// The `content` is usually a ``VStack`` or an ``HStack``, but it
    /// can be any ``View`` that requires scrolling.
    public var content: Content

    /// The scrollable axes of the scroll view.
    ///
    /// The default value is ``Axis/vertical``. Change the ``Axis`` to modify
    /// the scroll direction.
    ///
    /// You can set this value using
    /// ``ScrollView/init(_:showsIndicators:content:)``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView(.horizontal) {
    ///             HStack {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///             .font(.title)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a list of fruits in an HStack, where the axis has been
    /// changed to horizontal to modify the scroll direction. This way, the user
    /// is able to scroll horizontally through the list of fruit in the HStack.](scroll-view-init-shows-indicators-content-ex2.gif)
    ///
    /// You can also allow the the ``ScrollView`` to scroll both horizontally
    /// and vertically:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView([.horizontal, .vertical]) {
    ///             VStack(spacing: 50) {
    ///                 ForEach(0..<10) { _ in
    ///                     HStack {
    ///                         Text("Bananas 🍌🍌")
    ///                         Text("Apples 🍏🍏")
    ///                         Text("Peaches 🍑🍑")
    ///                     }
    ///                     .padding()
    ///                 }
    ///             }
    ///             .font(.title)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a VStack of several HStacks of fruits. Since the axis
    /// has been changed to include both horizontal and vertical to modify scroll direction, the user is able
    /// to scroll up and down and also sideways to see all of the available items.](scroll-view-axes-ex2.gif)
    ///
    public var axes: Axis.Set

    /// A value that indicates whether the scroll view displays the scrollable
    /// component of the content offset, in a way that's suitable for the
    /// platform.
    ///
    /// Use this value to set the display mode of the
    /// indicators on a ``ScrollView``. The default is `true`.
    ///
    /// You can set this value using
    /// ``ScrollView/init(_:showsIndicators:content:)``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView(showsIndicators: false) {
    ///             VStack(spacing: 50) {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///             .font(.title)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif that scrolls through a series of text views of fruits in a VStack
    /// with no indicators visible, as showsIndicators is set to false.](show-indicators-ex.gif)
    ///
    public var showsIndicators: Bool

    /// Creates a new instance that's scrollable in the direction of the given
    /// axis and can show indicators while scrolling.
    ///
    /// Use this initializer to create a ``ScrollView``. The simplest
    /// example looks like this:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView {
    ///             VStack(spacing: 50) {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///             .font(.title)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A scroll view containing a VStack with the default scrollbar along the right edge of text items.](scroll-view-init-shows-indicators-content-ex1.gif)
    ///
    /// You can specify the scroll direction using the ``ScrollView/axes`` parameter:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView(.horizontal) {
    ///             HStack {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///             .font(.title)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A scroll view containing an HStack with a horizontal scrollbar along the bottom edge of the text items.](scroll-view-init-shows-indicators-content-ex2.gif)
    ///
    /// Make the scroll bar invisible using ``ScrollView/showsIndicators``:
    //
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView(.horizontal, showsIndicators: false) {
    ///             HStack {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///             .font(.title)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A scroll view containing an HStack with a hidden horizontal scroll bar along the bottom edge of the text items.](scroll-view-init-shows-indicators-content-ex3.gif)
    ///
    /// Notice how the ``HStack`` doesn't take up the full view, so the
    /// indicators are inset from the side of the screen. We can
    /// fix this with
    /// ``View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)``.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView(.horizontal) {
    ///             HStack {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///             .font(.title)
    ///             .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A scroll view containing an HStack with a horizontal scrollbar along the bottom of the frame.](scroll-view-init-shows-indicators-content-ex4.gif)
    ///
    /// - Parameters:
    ///   - axes: The scroll view's scrollable axis. The default axis is the
    ///     vertical axis.
    ///   - showsIndicators: A Boolean value that indicates whether the scroll
    ///     view displays the scrollable component of the content offset, in a way
    ///     suitable for the platform. The default value for this parameter is
    ///     `true`.
    ///   - content: The view builder that creates the scrollable view.
    public init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true, @ViewBuilder content: () -> Content) { }

    /// The content and behavior of the scroll view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

