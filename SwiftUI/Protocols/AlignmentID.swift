/// Types used to identify alignment guides.
///
/// Use this protocol to create custom alignment guides. Custom
/// alignment guides are needed to align views which are not
/// in the same container.
///
/// To conform to this protocol, there is only one requirement:
/// ``AlignmentID/defaultValue(in:)``.
///
/// The most convenient way to create a custom alignment is with an
/// extension.
///
/// A custom vertical alignment:
///
/// ```
/// extension VerticalAlignment {
///     enum CustomAlignment: AlignmentID {
///        static func defaultVAlue(in d: ViewDimensions) -> CGFloat {
///             d[VerticalAlignment.center]
///         }
///     }
///     static let custom = VerticalAlignment(CustomAlignment.self)
/// }
/// ```
///
/// To create a custom alignment for a ``ZStack``, extend both
/// ``VerticalAlignment`` and ``HorizontalAlignment``:
///
/// ```
/// extension VerticalAlignment {
///     enum CustomAlignment: AlignmentID {
///        static func defaultVAlue(in d: ViewDimensions) -> CGFloat {
///             d[.top]
///         }
///     }
///     static let vertical = VerticalAlignment(CustomAlignment.self)
/// }
///
/// extension HorizontalAlignment {
///     enum CustomAlignment: AlignmentID {
///        static func defaultVAlue(in d: ViewDimensions) -> CGFloat {
///             d[.leading]
///         }
///     }
///     static let horizontal = HorizontalAlignment(CustomAlignment.self)
/// }
///
/// extension Alignment {
///     static let custom = Alignment(horizontal: .horizontal, vertical: .vertical)
/// }
/// ```
///
/// For more on creating your own alignments, check out
/// [this article](https://swiftui-lab.com/alignment-guides/).
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol AlignmentID { }

extension AlignmentID {

    /// The value of the corresponding guide in the given context when not
    /// otherwise set in that context.
    ///
    /// This is the only requirement of conforming to the ``AlignmentID``
    /// protocol.
    ///
    /// See ``ViewDimensions`` for information on the parameter of this
    /// function.
    ///
    /// For more on creating your own alignments, check out
    /// [this article](https://swiftui-lab.com/alignment-guides/).
    ///
    /// Here is a simple example of implementing this function:
    ///
    /// ```
    /// extension VerticalAlignment {
    ///     enum CustomAlignment: AlignmentID {
    ///        static func defaultVAlue(in d: ViewDimensions) -> CGFloat {
    ///             d[VerticalAlignment.center]
    ///         }
    ///     }
    ///     static let custom = VerticalAlignment(CustomAlignment.self)
    /// }
    /// ```
    ///
    /// - Parameter context: The view dimensions for aligning the view.
    ///
    /// - Returns: A default alignment value for the custom alignment.
    static func defaultValue(in context: ViewDimensions) -> CGFloat { }
}

