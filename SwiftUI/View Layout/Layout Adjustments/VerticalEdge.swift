/// An edge on the vertical axis.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public enum VerticalEdge : Int8, CaseIterable, Codable {

    /// The top edge.
    case top

    /// The bottom edge.
    case bottom

    /// An efficient set of `VerticalEdge`s.
    @frozen public struct Set : OptionSet {

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = VerticalEdge.Set

        /// A set containing only the top vertical edge.
        public static let top: VerticalEdge.Set

        /// A set containing only the bottom vertical edge.
        public static let bottom: VerticalEdge.Set

        /// A set containing the top and bottom vertical edges.
        public static let all: VerticalEdge.Set

        /// Creates an instance containing just `e`
        public init(_ e: VerticalEdge) { }

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = VerticalEdge.Set.Element

    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension VerticalEdge : Equatable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension VerticalEdge : Hashable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension VerticalEdge : RawRepresentable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension VerticalEdge : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension VerticalEdge.Set : Sendable {
}

