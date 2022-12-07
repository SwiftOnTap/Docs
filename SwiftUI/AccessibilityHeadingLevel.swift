/// The hierarchy of a heading in relation other headings.
///
/// Assistive technologies can use this to improve a users navigation
/// through multiple headings. When users navigate through top level
/// headings they expect the content for each heading to be unrelated.
///
/// For example, you can categorize a list of available products into sections,
/// like Fruits and Vegetables. With only top level headings, this list requires no
/// heading hierarchy, and you use the ``unspecified`` heading level. On the other hand, if sections
/// contain subsections, like if the Fruits section has subsections for varieties of Apples,
/// Pears, and so on, you apply the ``h1`` level to Fruits and Vegetables, and the ``h2``
/// level to Apples and Pears.
///
/// Except for ``h1``, be sure to precede all leveled headings by another heading with a level
/// that's one less.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public enum AccessibilityHeadingLevel : UInt {

    /// A heading without a hierarchy.
    case unspecified

    /// Level 1 heading.
    case h1

    /// Level 2 heading.
    case h2

    /// Level 3 heading.
    case h3

    /// Level 4 heading.
    case h4

    /// Level 5 heading.
    case h5

    /// Level 6 heading.
    case h6

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
    public init?(rawValue: UInt) { }

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = UInt

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
    public var rawValue: UInt { get }
}
