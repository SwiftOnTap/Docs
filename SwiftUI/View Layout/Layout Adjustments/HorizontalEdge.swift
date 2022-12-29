/// An edge on the horizontal axis.
///
/// Use a horizontal edge for tasks like setting a swipe action with the
/// ``View/swipeActions(edge:allowsFullSwipe:content:)``
/// view modifier. The positions of the leading and trailing edges
/// depend on the locale chosen by the user.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public enum HorizontalEdge : Int8, CaseIterable, Codable {

    /// The leading edge.
    case leading

    /// The trailing edge.
    case trailing

    /// An efficient set of `HorizontalEdge`s.
    @frozen public struct Set : OptionSet {

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = HorizontalEdge.Set

        /// A set containing only the leading horizontal edge.
        public static let leading: HorizontalEdge.Set

        /// A set containing only the trailing horizontal edge.
        public static let trailing: HorizontalEdge.Set

        /// A set containing the leading and trailing horizontal edges.
        public static let all: HorizontalEdge.Set

        /// Creates an instance containing just `e`.
        public init(_ edge: HorizontalEdge) { }

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = HorizontalEdge.Set.Element

    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension HorizontalEdge : Equatable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension HorizontalEdge : Hashable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension HorizontalEdge : RawRepresentable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension HorizontalEdge : Sendable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension HorizontalEdge.Set : Sendable { }

