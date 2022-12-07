/// An alignment in both axes.
///
/// Use this structure to align a view when it has both a vertical and
/// horizontal degree of freedom.
///
/// ### What is an `Alignment`?
///
/// An alignment is made up of 2 properties:
/// 1. The ``Alignment/vertical`` alignment, of type ``VerticalAlignment``
/// 2. The ``Alignment/horizontal`` alignment, of type ``HorizontalAlignment``
///
/// Each of those axes have their own options and initializers. To
/// create an ``Alignment``, you can set both properties directly
/// using the initializer,
/// or choose one of ``Alignment``'s static properties.
///
/// #### The ``Alignment`` initializer
///
/// You can also create your own alignments from the
/// ``Alignment/init(horizontal:vertical:)`` initializer
///
/// - Note: The
/// clear color is added to expand the view to the entire screen,
/// so that the alignment movement can be seen
///
/// ```
/// struct ContentView: View {
///     let alignment = Alignment(horizontal: .center, vertical: .top)
///
///     var body: some View {
///         ZStack(alignment: alignment) {
///             Text("I'm top aligned 🤠")
///             Color.clear
///         }
///     }
/// }
/// ```
///
/// ![A view containing a ZStack with center horizontal alignment and top
/// vertical alignment and the text "I'm top aligned 🤠"; The text
/// is displayed at the top center of the frame.](alignment-initalizer.png)
///
/// #### The ``Alignment`` static properties
///
/// There are 9 out-of-the-box alignments:
/// 1. ``Alignment/topLeading``
/// 2. ``Alignment/top``
/// 3. ``Alignment/topTrailing``
/// 4. ``Alignment/leading``
/// 5. ``Alignment/center``
/// 6. ``Alignment/trailing``
/// 7. ``Alignment/bottomLeading``
/// 8. ``Alignment/bottom``
/// 9. ``Alignment/bottomTrailing``
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ZStack(alignment: Alignment.bottomLeading) { //Try changing this!
///             Text("Move me around 🤠")
///             Color.clear
///         }
///     }
/// }
/// ```
///
/// ![A view containing a ZStack with bottomLeading alignment and the text
/// "Move me around 🤠"; The text is displayed in the bottom left corner of
/// the frame.](alignment-bottom-leading.png)
///
/// ### Using an ``Alignment``
///
/// This structure is used in 4 places:
/// - ``ZStack``, in the initializer
/// - ``View/overlay(_:alignment:)``, in the view modifier
/// - ``View/background(_:alignment:)``, in the view modifier
/// - ``View/frame(width:height:alignment:)``, in the view modifier
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Color.clear
///             .background(
///                 Text("Move me around 🤠"),
///                 alignment: .leading
///             )
///     }
/// }
/// ```
///
/// ![A view containing a clear background with the text view "Move me around
/// 🤠" and text alignment leading; The text is displayed on the
/// leftmost edge halfway down the frame.](alignment-leading.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Alignment : Equatable {

    /// The alignment on the horizontal axis.
    ///
    /// An ``Alignment`` is simply a combination of a vertical alignment
    /// and a horizontal alignment. This is the ``HorizontalAlignment``
    /// component.
    ///
    /// This is usually specified indirectly using one of the pre-defined
    /// alignments or through the ``Alignment/init(horizontal:vertical)``
    /// initializer. However, you can also specify it directly:
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         var alignment = Alignment.topLeading
    ///         alignment.horizontal = .center
    ///
    ///         return ZStack(alignment: alignment) {
    ///             Text("Move me around 🤠")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view that returns a ZStack with the text "Move me around 🤠" with a
    /// topLeading vertical alignment and center horizontal alignment; The text
    /// is displayed at the top center of the frame.](14.11.38.png)
    ///
    public var horizontal: HorizontalAlignment

    /// The alignment on the vertical axis.
    ///
    /// An ``Alignment`` is simply a combination of a vertical alignment
    /// and a horizontal alignment. This is the ``VerticalAlignment``
    /// component.
    ///
    /// This is usually specified indirectly using one of the pre-defined
    /// alignments or through the ``Alignment/init(horizontal:vertical:)``
    /// initializer. However, you can also specify it directly:
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         var alignment = Alignment.topLeading
    ///         alignment.vertical = .center
    ///
    ///         return ZStack(alignment: alignment) {
    ///             Text("Move me around 🤠")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view that returns a ZStack with the text "Move me around 🤠" with a
    /// topLeading horizontal alignment and center vertical alignment; The text
    /// is displayed at the left edge halfway down the frame.](14.14.47.png)
    ///
    public var vertical: VerticalAlignment

    /// Creates an instance with the given horizontal and vertical alignments.
    ///
    /// An ``Alignment`` is simply a combination of a vertical alignment
    /// and a horizontal alignment. Use this initializer to specify
    /// the components directly.
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         let alignment = Alignment(horizontal: .leading, vertical: .top)
    ///
    ///         return ZStack(alignment: alignment) {
    ///             Text("Move me around 🤠")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view that returns a ZStack with the text "Move me around 🤠" with a
    /// leading horizontal alignment and top vertical alignment; The text
    /// is displayed at the top left corner of the frame.](14.18.52.png)
    ///
    /// - Parameters:
    ///   - horizontal: The alignment on the horizontal axis.
    ///   - vertical: The alignment on the vertical axis.
    @inlinable public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment) { }

    /// A guide marking the center of the view.
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .center) {
    ///             Text("🤠")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with the text "🤠" and center alignment;
    /// The text is displayed at the very center of the frame.](14.22.04.png)
    ///
    public static let center: Alignment

    /// A guide marking the leading edge of the view.
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .leading) {
    ///             Text("⬅️")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with the text "⬅️" and leading alignment;
    /// The text is displayed at the leftmost edge halfway down the frame.](14.23.18.png)
    ///
    public static let leading: Alignment

    /// A guide marking the trailing edge of the view.
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .trailing) {
    ///             Text("➡️")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with the text "➡️" and trailing alignment;
    /// The text is displayed at the rightmost edge halfway down the frame.](14.27.25.png)
    ///
    public static let trailing: Alignment

    /// A guide marking the top edge of the view.
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .top) {
    ///             Text("⬆️")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with the text "⬆️" and top alignment;
    /// The text is displayed at the topmost edge halfway across the frame.](14.28.22.png)
    ///
    public static let top: Alignment

    /// A guide marking the bottom edge of the view.
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .bottom) {
    ///             Text("⬇️")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with the text "⬇️" and top alignment;
    /// The text is displayed at the bottommost edge halfway across the frame.](14.29.14.png)
    ///
    public static let bottom: Alignment

    /// A guide marking the top and leading edges of the view.
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .topLeading) {
    ///             Text("↖️")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with the text "↖️" and topLeading alignment;
    /// The text is displayed in the top left corner of the frame.](14.30.26.png)
    ///
    public static let topLeading: Alignment

    /// A guide marking the top and trailing edges of the view.
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .topTrailing) {
    ///             Text("↖️")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with the text "↖️" and topTrailing alignment;
    /// The text is displayed in the top right corner of the frame.](14.31.17.png)
    ///
    public static let topTrailing: Alignment

    /// A guide marking the bottom and leading edges of the view.
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .bottomLeading) {
    ///             Text("↙️")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with the text "↙️" and bottomLeading alignment;
    /// The text is displayed in the bottom left corner of the frame.](14.33.12.png)
    ///
    public static let bottomLeading: Alignment

    /// A guide marking the bottom and trailing edges of the view.
    ///
    /// ```
    /// struct AlignmentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .bottomTrailing) {
    ///             Text("↘️")
    ///             Color.clear
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with the text "↙️" and bottomTrailing alignment;
    /// The text is displayed in the bottom right corner of the frame.](14.35.44.png)
    ///
    public static let bottomTrailing: Alignment

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Alignment, b: Alignment) -> Bool { }
}

