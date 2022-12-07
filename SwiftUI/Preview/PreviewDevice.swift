/// The simulator device that runs a preview.
///
/// Refer to a preview device by its name as shown Xcode's run destination menu,
/// like "iPhone X", or using a model number, like "iPad8,1".
///
/// The full list of device names is here:
/// - iPhone 4s
/// - iPhone 5
/// - iPhone 5s
/// - iPhone 6 Plus
/// - iPhone 6
/// - iPhone 6s
/// - iPhone 6s Plus
/// - iPhone SE (1st generation)
/// - iPhone 7
/// - iPhone 7 Plus
/// - iPhone 8
/// - iPhone 8 Plus
/// - iPhone X
/// - iPhone Xs
/// - iPhone Xs Max
/// - iPhone Xʀ
/// - iPhone 11
/// - iPhone 11 Pro
/// - iPhone 11 Pro Max
/// - iPhone SE (2nd generation)
/// - iPhone 12 mini
/// - iPhone 12
/// - iPhone 12 Pro
/// - iPhone 12 Pro Max
/// - iPod touch (7th generation)
/// - iPad 2
/// - iPad Retina
/// - iPad Air
/// - iPad mini 2
/// - iPad mini 3
/// - iPad mini 4
/// - iPad Air 2
/// - iPad Pro (9.7-inch)
/// - iPad Pro (12.9-inch) (1st generation)
/// - iPad (5th generation)
/// - iPad Pro (12.9-inch) (2nd generation)
/// - iPad Pro (10.5-inch)
/// - iPad (6th generation)
/// - iPad (7th generation)
/// - iPad Pro (11-inch) (1st generation)
/// - iPad Pro (12.9-inch) (3rd generation)
/// - iPad Pro (11-inch) (2nd generation)
/// - iPad Pro (12.9-inch) (4th generation)
/// - iPad mini (5th generation)
/// - iPad Air (3rd generation)
/// - iPad (8th generation)
/// - iPad Air (4th generation)
/// - Apple TV
/// - Apple TV 4K
/// - Apple TV 4K (at 1080p)
/// - Apple Watch - 38mm
/// - Apple Watch - 42mm
/// - Apple Watch Series 2 - 38mm
/// - Apple Watch Series 2 - 42mm
/// - Apple Watch Series 3 - 38mm
/// - Apple Watch Series 3 - 42mm
/// - Apple Watch Series 4 - 40mm
/// - Apple Watch Series 4 - 44mm
/// - Apple Watch Series 5 - 40mm
/// - Apple Watch Series 5 - 44mm
/// - Apple Watch SE - 40mm
/// - Apple Watch SE - 44mm
/// - Apple Watch Series 6 - 40mm
/// - Apple Watch Series 6 - 44mm
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PreviewDevice : RawRepresentable, ExpressibleByStringLiteral {

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
    public let rawValue: String

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
    public init(rawValue: String) { }

    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral: String) { }

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = String

    /// A type that represents a string literal.
    ///
    /// Valid types for `StringLiteralType` are `String` and `StaticString`.
    public typealias StringLiteralType = String

    /// A type that represents an extended grapheme cluster literal.
    ///
    /// Valid types for `ExtendedGraphemeClusterLiteralType` are `Character`,
    /// `String`, and `StaticString`.
    public typealias ExtendedGraphemeClusterLiteralType = String

    /// A type that represents a Unicode scalar literal.
    ///
    /// Valid types for `UnicodeScalarLiteralType` are `Unicode.Scalar`,
    /// `Character`, `String`, and `StaticString`.
    public typealias UnicodeScalarLiteralType = String
}
