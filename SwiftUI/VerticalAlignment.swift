/// An alignment position along the horizontal axis.
///
/// Use this structure in the initializers of 3 structures:
/// - ``HStack``
/// - ``LazyHStack``
/// - ``LazyHGrid``
///
/// See those pages for more on how to construct them.
///
/// This structure is also used in the ``View/alignmentGuide(_:computeValue:)-72c7c``
/// view modifier. See that page for more on adding alignment
/// guides to views.
///
/// There are 5 possible vertical alignments:
///
/// 1. ``VerticalAlignment/top``
/// 2. ``VerticalAlignment/center``
/// 3. ``VerticalAlignment/bottom``
/// 4. ``VerticalAlignment/firstTextBaseline``
/// 5. ``VerticalAlignment/lastTextBaseline``
///
/// See the example below.
///
/// ```
/// struct VerticallyAlignedView: View {
///     var body: some View {
///         HStack(alignment: VerticalAlignment.top) { //Try changing this value
///             Rectangle()
///                 .fill(Color.red)
///                 .frame(width: 50, height: 2)
///
///             VStack {
///                 Text("Align 1")
///                 Text("Align 2")
///             }
///             .font(.largeTitle)
///         }
///     }
/// }
/// ```
///
/// ![A view containing an HStack with a thin red rectangle with top vertical
/// alignment and a VStack with two largeTitle font text views aligned directly
/// below and to the right of the red rectangle.](68519915-B4B5-4531-9D49-B9DF5172967B.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct VerticalAlignment : Equatable {
    
    /// Creates an instance with the given identifier.
    ///
    /// In addition to the 5 out-of-the-box vertical alignments,
    /// top, center, and bottom, firstTextBaseline, and lastTextBaseline,
    ///  you can also create your own
    /// custom vertical alignment. Do this by passing this initializer
    /// a ``AlignmentID.Type`` from an ``AlignmentID``.
    ///
    /// Use this in the initializers of 3 structures:
    /// - ``HStack``
    /// - ``LazyHStack``
    /// - ``LazyHGrid``
    ///
    /// See those pages for more on how to construct them.
    ///
    /// This structure is also used in the ``View/alignmentGuide(_:computeValue:)``
    /// view modifier. See that page for more on adding alignment
    /// guides to views.
    ///
    /// ```
    /// extension VerticalAlignment {
    ///     private enum WidthBasedAlignment: AlignmentID {
    ///         static func defaultValue(in d: ViewDimensions) -> CGFloat {
    ///             return d.width
    ///         }
    ///     }
    ///     static let width = VerticalAlignment(WidthBasedAlignment.self)
    /// }
    /// ```
    ///
    /// See [this article](https://swiftui-lab.com/alignment-guides/) for help with alignment guides.
    ///
    /// - Parameter id: An identifier that uniquely identifies the vertical
    ///   alignment.
    public init(_ id: AlignmentID.Type) { }
    
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension VerticalAlignment {

    /// A guide marking the top edge of the view.
    ///
    /// Use this in the initializers of 3 structures:
    /// - ``HStack``
    /// - ``LazyHStack``
    /// - ``LazyHGrid``
    ///
    /// See those pages for more on how to construct them.
    ///
    /// This structure is also used in the ``View/alignmentGuide(_:computeValue:)-72c7c``
    /// view modifier. See that page for more on adding alignment
    /// guides to views.
    ///
    /// ```
    /// struct VerticallyAlignedView: View {
    ///     var body: some View {
    ///         HStack(alignment: .top) {
    ///             Rectangle()
    ///                 .fill(Color.red)
    ///                 .frame(width: 50, height: 2)
    ///
    ///             VStack {
    ///                 Text("Align 1")
    ///                 Text("Align 2")
    ///             }
    ///             .font(.largeTitle)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two text views in a VStack that read "Align 1"
    /// and "Align 2" respectively. The VStack is arranged to the right of a
    /// rectangle in an HStack, with the alignment of the HStack set as top, which
    /// renders both the red rectangle and the text views at the top of the container.](top.png)
    public static let top: VerticalAlignment

    /// A guide marking the vertical center of the view.
    ///
    /// Use this in the initializers of 3 structures:
    /// - ``HStack``
    /// - ``LazyHStack``
    /// - ``LazyHGrid``
    ///
    /// See those pages for more on how to construct them.
    ///
    /// This structure is also used in the ``View/alignmentGuide(_:computeValue:)-72c7c``
    /// view modifier. See that page for more on adding alignment
    /// guides to views.
    ///
    /// ```
    /// struct VerticallyAlignedView: View {
    ///     var body: some View {
    ///         HStack(alignment: .center) {
    ///             Rectangle()
    ///                 .fill(Color.red)
    ///                 .frame(width: 50, height: 2)
    ///
    ///             VStack {
    ///                 Text("Align 1")
    ///                 Text("Align 2")
    ///             }
    ///             .font(.largeTitle)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two text views in a VStack that read "Align 1"
    /// and "Align 2" respectively. The VStack is arranged to the right of a
    /// rectangle in an HStack, with the alignment of the HStack set as center, which
    /// renders both the red rectangle and the text views in the center of the container.
    /// since the rectangle height is set very low, it appears as a line between the
    /// text views.](center.png)
    public static let center: VerticalAlignment

    /// A guide marking the bottom edge of the view.
    ///
    /// Use this in the initializers of 3 structures:
    /// - ``HStack``
    /// - ``LazyHStack``
    /// - ``LazyHGrid``
    ///
    /// See those pages for more on how to construct them.
    ///
    /// This structure is also used in the ``View/alignmentGuide(_:computeValue:)-72c7c``
    /// view modifier. See that page for more on adding alignment
    /// guides to views.
    ///
    /// ```
    /// struct VerticallyAlignedView: View {
    ///     var body: some View {
    ///         HStack(alignment: .bottom) {
    ///             Rectangle()
    ///                 .fill(Color.red)
    ///                 .frame(width: 50, height: 2)
    ///
    ///             VStack {
    ///                 Text("Align 1")
    ///                 Text("Align 2")
    ///             }
    ///             .font(.largeTitle)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two text views in a VStack that read "Align 1"
    /// and "Align 2" respectively. The VStack is arranged to the right of a
    /// rectangle in an HStack, with the alignment of the HStack set as bottom, which
    /// renders both the red rectangle and the text views at the bottom of the container.
    /// Since the rectangle height is set very low, it appears as a line below the
    /// text views.](bottom.png)
    public static let bottom: VerticalAlignment

    /// A guide marking the topmost text baseline view.
    ///
    /// Use this in the initializers of 3 structures:
    /// - ``HStack``
    /// - ``LazyHStack``
    /// - ``LazyHGrid``
    ///
    /// See those pages for more on how to construct them.
    ///
    /// This structure is also used in the ``View/alignmentGuide(_:computeValue:)-72c7c``
    /// view modifier. See that page for more on adding alignment
    /// guides to views.
    ///
    /// ```
    /// struct VerticallyAlignedView: View {
    ///     var body: some View {
    ///         HStack(alignment: .firstTextBaseline) {
    ///             Rectangle()
    ///                 .fill(Color.red)
    ///                 .frame(width: 50, height: 2)
    ///
    ///             VStack {
    ///                 Text("Align 1")
    ///                 Text("Align 2")
    ///             }
    ///             .font(.largeTitle)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two text views in a VStack that read "Align 1"
    /// and "Align 2" respectively. The VStack is arranged to the right of a
    /// rectangle in an HStack, with the alignment of the HStack set as firstTextBaseline, which
    /// renders the red rectangle in line with the bottom of the first text view.](firsttextbaseline.png)
    public static let firstTextBaseline: VerticalAlignment

    /// A guide marking the bottom-most text baseline in a view.
    ///
    /// Use this in the initializers of 3 structures:
    /// - ``HStack``
    /// - ``LazyHStack``
    /// - ``LazyHGrid``
    ///
    /// See those pages for more on how to construct them.
    ///
    /// This structure is also used in the ``View/alignmentGuide(_:computeValue:)-72c7c``
    /// view modifier. See that page for more on adding alignment
    /// guides to views.
    ///
    /// ```
    /// struct VerticallyAlignedView: View {
    ///     var body: some View {
    ///         HStack(alignment: .lastTextBaseline) {
    ///             Rectangle()
    ///                 .fill(Color.red)
    ///                 .frame(width: 50, height: 2)
    ///
    ///             VStack {
    ///                 Text("Align 1")
    ///                 Text("Align 2")
    ///             }
    ///             .font(.largeTitle)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two text views in a VStack that read "Align 1"
    /// and "Align 2" respectively. The VStack is arranged to the right of a
    /// rectangle in an HStack, with the alignment of the HStack set as lastTextBaseline, which
    /// renders the red rectangle in line with the bottom of the second text view.](lasttextbaseline.png)
    public static let lastTextBaseline: VerticalAlignment
}

