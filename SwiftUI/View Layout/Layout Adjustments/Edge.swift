/// An enumeration to indicate one edge of a rectangle.
///
/// ``Edge`` is most frequently used to specify padding with ``View/padding(_:)-97aab``,
/// but it can also be returned from instance methods. For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         VStack {
///             Text("Example view where Edge is returned as a value")
///                 .accessibilityScrollAction { edge in
///                     switch edge {
///                     case Edge.top:
///                         print("Swiped down from top edge")
///                     case Edge.leading:
///                         print("Swiped left from leading edge")
///                     case Edge.trailing:
///                         print("Swiped right from trailing edge")
///                     case Edge.bottom:
///                         print("Swiped up from bottom edge")
///                     }
///                 }
///         }
///     }
/// }
/// ```
///
/// ![F7952934-0389-4525-97DD-80CD08BD51B8](F7952934-0389-4525-97DD-80CD08BD51B8.png)
///
/// Note that for illustrative purposes, the enum values were expanded in this example.
/// It would also be valid to use the shorthand, just specifying the values:
/// `.top`, `.leading`, `.trailing`, and `.bottom`.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public enum Edge : Int8, CaseIterable {

    /// The rectangle's top edge.
    case top

    /// The rectangle's leading edge.
    case leading

    /// The rectangle's bottom edge.
    case bottom

    /// The rectangle's trailing edge.
    case trailing

    /// An efficient set of ``Edge``s.
    ///
    /// Used when multiple edges need to be specified. For example, when setting padding
    /// on a view with ``View/padding(_:)-9f6b7``:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Text padded on the top and bottom edge.")
    ///                 .padding([Edge.Set.top, Edge.Set.bottom])
    ///                 .border(Color.gray)
    ///             Text("Unpadded text")
    ///                 .border(Color.yellow)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// Note that for illustrative purposes, the enum values were expanded in this example.
    /// It would also be valid to use the shorthand, just specifying the values:
    /// `.padding([.top, .bottom])`
    @frozen public struct Set : OptionSet {

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = Edge.Set

        /// The corresponding value of the raw type.
        ///
        /// A new instance initialized with `rawValue` will be equivalent to this
        /// instance. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     let selectedSize = PaperSize.Letter
        ///     print(selectedSize.rawValue)
        ///     // Prints "Letter"
        ///
        ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
        ///     // Prints "true"
        public let rawValue: Int8

        /// Creates a new option set from the given raw value.
        ///
        /// This initializer always succeeds, even if the value passed as `rawValue`
        /// exceeds the static properties declared as part of the option set. This
        /// example creates an instance of `ShippingOptions` with a raw value beyond
        /// the highest element, with a bit mask that effectively contains all the
        /// declared static members.
        ///
        ///     let extraOptions = ShippingOptions(rawValue: 255)
        ///     print(extraOptions.isStrictSuperset(of: .all))
        ///     // Prints "true"
        ///
        /// - Parameter rawValue: The raw value of the option set to create. Each bit
        ///   of `rawValue` potentially represents an element of the option set,
        ///   though raw values may include bits that are not defined as distinct
        ///   values of the `OptionSet` type.
        public init(rawValue: Int8) { }

        /// The edge set's top edge.
        public static let top: Edge.Set

        /// The edge set's leading edge.
        public static let leading: Edge.Set

        /// The edge set's bottom edge.
        public static let bottom: Edge.Set

        /// The edge set's trailing edge.
        public static let trailing: Edge.Set

        /// An edge set containing all 4 edges.
        public static let all: Edge.Set

        /// An edge set containing the leading and trailing edges.
        public static let horizontal: Edge.Set

        /// An edge set containing the top and bottom edges.
        public static let vertical: Edge.Set

        /// Creates an instance containing just `e`
        public init(_ e: Edge) { }

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = Edge.Set.Element

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        public typealias RawValue = Int8
    }

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int8

    /// Creates a new instance with the specified raw value.
    ///
    /// If there is no value of the type that corresponds with the specified raw
    /// value, this initializer returns `nil`. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     print(PaperSize(rawValue: "Legal"))
    ///     // Prints "Optional("PaperSize.Legal")"
    ///
    ///     print(PaperSize(rawValue: "Tabloid"))
    ///     // Prints "nil"
    ///
    /// - Parameter rawValue: The raw value to use for the new instance.
    public init?(rawValue: Int8) { }

    /// The corresponding value of the raw type.
    ///
    /// A new instance initialized with `rawValue` will be equivalent to this
    /// instance. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     let selectedSize = PaperSize.Letter
    ///     print(selectedSize.rawValue)
    ///     // Prints "Letter"
    ///
    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
    ///     // Prints "true"
    public var rawValue: Int8 { get }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Edge : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Edge : Hashable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Edge : RawRepresentable {
}

