/// A description of a single grid item, such as a row or a column.
///
/// You use ``GridItem`` instances to configure the layout of items in
/// ``LazyHGrid`` and ``LazyVGrid`` views. Each grid item specifies layout
/// properties like spacing and alignment, which the grid view uses to size and
/// position all items in a given column or row.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct GridItem {

    /// The size in the minor axis of one or more rows or columns in a grid
    /// layout.
    ///
    /// There are three types of sizes:
    /// 1. ``GridItem/Size/fixed``
    /// 2. ``GridItem/Size/flexible``
    /// 3. ``GridItem/Size/adaptive``
    ///
    public enum Size {

        /// A single item with the specified fixed size.
        case fixed(CGFloat)

        /// A single flexible item.
        ///
        /// The size of this item is the size of the grid with spacing and
        /// inflexible items removed, divided by the number of flexible items,
        /// clamped to the provided bounds.
        case flexible(minimum: CGFloat = 10, maximum: CGFloat = .infinity)

        /// Multiple items in the space of a single flexible item.
        ///
        /// This size case places one or more items into the space assigned to
        /// a single `flexible` item, using the provided bounds and
        /// spacing to decide exactly how many items fit. This approach prefers
        /// to insert as many items of the `minimum` size as possible
        /// but lets them increase to the `maximum` size.
        case adaptive(minimum: CGFloat, maximum: CGFloat = .infinity)
    }

    /// The size of the item, which is the width of a column item or the
    /// height of a row item.
    public var size: GridItem.Size

    /// The spacing to the next item.
    ///
    /// If this value is `nil`, the item uses a reasonable default for the
    /// current platform.
    public var spacing: CGFloat?

    /// The alignment to use when placing each view.
    ///
    /// Use this property to anchor the view's relative position to the same
    /// relative position in the view's assigned grid space.
    public var alignment: Alignment?

    /// Creates a grid item with the provided size, spacing, and alignment
    /// properties.
    ///
    /// - Parameters:
    ///   - size: The size of the grid item.
    ///   - spacing: The spacing to use between this and the next item.
    ///   - alignment: The alignment to use for this grid item.
    public init(_ size: GridItem.Size = .flexible(), spacing: CGFloat? = nil, alignment: Alignment? = nil) { }
}

