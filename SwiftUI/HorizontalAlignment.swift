/// An alignment position along the horizontal axis.
///
/// Use this structure in the initializers of 3 structures:
/// - ``VStack``
/// - ``LazyVStack``
/// - ``LazyVGrid``
///
/// See those pages for more on how to construct them.
///
/// This structure is also used in the ``View/alignmentGuide(_:computeValue:)-4e1d1``
/// view modifier. See that page for more on adding alignment
/// guides to views.
///
/// There are 3 possible horizontal alignments:
/// 1. ``HorizontalAlignment/leading``
/// 2. ``HorizontalAlignment/center``
/// 3. ``HorizontalAlignment/trailing``
///
/// See the example below for all three.
///
/// ### Leading
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack(alignment: HorizontalAlignment.leading) { //Try changing this
///             Text("⬅️")
///
///             HStack {
///                 Text("Leading")
///                 Text("Center")
///                 Text("Trailing")
///             }
///         }
///         .font(.largeTitle)
///     }
/// }
/// ```
///
/// ![](horizontalalignment-leading.png)
///
/// ### Center
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack(alignment: HorizontalAlignment.center) { //Try changing this
///             Text("🤠")
///
///             HStack {
///                 Text("Leading")
///                 Text("Center")
///                 Text("Trailing")
///             }
///         }
///         .font(.largeTitle)
///     }
/// }
/// ```
///
/// ![](horizontalalignment-center.png)
///
/// ### Trailing
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack(alignment: HorizontalAlignment.trailing) { //Try changing this
///             Text("➡️")
///
///             HStack {
///                 Text("Leading")
///                 Text("Center")
///                 Text("Trailing")
///             }
///         }
///         .font(.largeTitle)
///     }
/// }
/// ```
///
/// ![](horizontalalignment-trailing.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct HorizontalAlignment : Equatable {

    /// Creates an instance with the given identifier.
    ///
    /// In addition to the 3 out-of-the-box horizontal alignments,
    /// leading, center, and trailing, you can also create your own
    /// custom horizontal alignment. Do this by passing this initializer
    /// a ``AlignmentID.Type`` from an ``AlignmentID``.
    ///
    /// Use this in the initializers of 3 structures:
    /// - ``VStack``
    /// - ``LazyVStack``
    /// - ``LazyVGrid``
    ///
    /// See those pages for more on how to construct them.
    ///
    /// This structure is also used in the ``View/alignmentGuide(_:computeValue:)``
    /// view modifier. See that page for more on adding alignment
    /// guides to views.
    ///
    /// ```
    /// extension HorizontalAlignment {
    ///     private enum HeightBasedAlignment: AlignmentID {
    ///         static func defaultValue(in d: ViewDimensions) -> CGFloat {
    ///             return d.height
    ///         }
    ///     }
    ///     static let height = HorizontalAlignment(HeightBasedAlignment.self)
    /// }
    /// ```
    ///
    /// See [this article](https://swiftui-lab.com/alignment-guides/) for help with alignment guides.
    ///
    /// - Parameter id: An identifier that uniquely identifies the horizontal
    ///   alignment.
    public init(_ id: AlignmentID.Type) { }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension HorizontalAlignment {

    /// A guide marking the leading edge of the view.
    ///
    /// Use this in the initializers of 3 structures:
    /// - ``VStack``
    /// - ``LazyVStack``
    /// - ``LazyVGrid``
    ///
    /// See those pages for more on how to construct them.
    ///
    /// This structure is also used in the ``View/alignmentGuide(_:computeValue:)``
    /// view modifier. See that page for more on adding alignment
    /// guides to views.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack(alignment: HorizontalAlignment.leading) { //Try changing this
    ///             Text("⬅️")
    ///
    ///             HStack {
    ///                 Text("Leading")
    ///                 Text("Center")
    ///                 Text("Trailing")
    ///             }
    ///         }
    ///         .font(.largeTitle)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with leading horizontal alignment and four
    /// text views, "⬅️", "Leading", "Center", "Trailing", the last three of which
    /// are combined in an HStack.](horizontalalignment-leading.png)
    ///
    public static let leading: HorizontalAlignment

    /// A guide marking the horizontal center of the view.
    ///
    /// Use this in the initializers of 3 structures:
    /// - ``VStack``
    /// - ``LazyVStack``
    /// - ``LazyVGrid``
    ///
    /// See those pages for more on how to construct them.
    ///
    /// This structure is also used in the ``View/alignmentGuide(_:computeValue:)``
    /// view modifier. See that page for more on adding alignment
    /// guides to views.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack(alignment: HorizontalAlignment.center) { //Try changing this
    ///             Text("🤠")
    ///
    ///             HStack {
    ///                 Text("Leading")
    ///                 Text("Center")
    ///                 Text("Trailing")
    ///             }
    ///         }
    ///         .font(.largeTitle)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with center horizontal alignment and four
    /// text views, "🤠", "Leading", "Center", "Trailing", the last three of which
    /// are combined in an HStack.](horizontalalignment-center.png)
    ///
    public static let center: HorizontalAlignment

    /// A guide marking the trailing edge of the view.
    ///
    /// Use this in the initializers of 3 structures:
    /// - ``VStack``
    /// - ``LazyVStack``
    /// - ``LazyVGrid``
    ///
    /// See those pages for more on how to construct them.
    ///
    /// This structure is also used in the ``View/alignmentGuide(_:computeValue:)``
    /// view modifier. See that page for more on adding alignment
    /// guides to views.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack(alignment: HorizontalAlignment.trailing) { //Try changing this
    ///             Text("➡️")
    ///
    ///             HStack {
    ///                 Text("Leading")
    ///                 Text("Center")
    ///                 Text("Trailing")
    ///             }
    ///         }
    ///         .font(.largeTitle)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with trailing horizontal alignment and four
    /// text views, "➡️", "Leading", "Center", "Trailing", the last three of which
    /// are combined in an HStack.](horizontalalignment-trailing.png)
    ///
    public static let trailing: HorizontalAlignment
}

