/// The horizontal or vertical dimension in a 2D coordinate system.
///
/// Use this enumeration with ``ScrollView`` to specify whether the
/// view can be scrolled vertically, horizontally, or both.
///
/// There are two possible axes:
/// 1. ``Axis/horizontal``
/// 2. ``Axis/vertical``
///
/// See ``ScrollView/init(_:showsIndicators:content:)`` for more details
/// on using this enumeration in the initializer.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ScrollView(Axis.Set.horizontal, showsIndicators: false) {
///             VStack {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍏🍏")
///                 Text("Peaches 🍑🍑")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif of a text view displaying three strings stacked on top of each other on the left side of the screen, scrolling side to side.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ScrollView-example-2.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public enum Axis : Int8, CaseIterable {

    /// The horizontal dimension.
    ///
    /// Use this enumeration case with ``ScrollView`` to specify a
    /// scrollable view in the horizontal direction.
    ///
    /// See ``ScrollView/init(_:showsIndicators:content:)`` for more details
    /// on using this enumeration in the initializer.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView(.horizontal, showsIndicators: false) {
    ///             VStack {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif of a text view displaying three strings stacked on top of each other on the left side of the screen, scrolling side to side.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ScrollView-example-2.gif)
    ///
    case horizontal

    /// The vertical dimension.
    ///
    /// Use this enumeration case with ``ScrollView`` to specify a
    /// scrollable view in the horizontal direction.
    ///
    /// See ``ScrollView/init(_:showsIndicators:content:)`` for more details
    /// on using this enumeration in the initializer.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView(.vertical, showsIndicators: false) {
    ///             VStack {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif of a text view displaying three strings stacked on top of each other at the top of the screen, scrolling up and down.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ScrollView-example-1.gif)
    case vertical

    /// An efficient set of axes.
    ///
    /// Use this option set with ``ScrollView`` to specify whether the
    /// view can be scrolled vertically, horizontally, or both.
    ///
    /// This `OptionSet` allows you to easily just pass one option - `.horizontal` -
    /// or an array of options - `[.horizontal, .vertical]` - into the
    /// same parameter without worrying about the type. See
    /// the Apple docs on [OptionSet](https://developer.apple.com/documentation/swift/optionset)
    /// for more on the protocol.
    ///
    /// See ``ScrollView/init(_:showsIndicators:content:)`` for more details
    /// on using this option set in the initializer.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView([.horizontal, .vertical]) {
    ///             VStack {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍏🍏")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif of a text view displaying three strings stacked on top of each other in the center of the screen, scrolling both up and down and side to side.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ScrollView-example-3.gif)
    ///
    @frozen public struct Set : OptionSet {

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = Axis.Set

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

        /// The option set corresponding to the horizontal axis.
        ///
        /// Use this property with ``ScrollView`` to specify a
        /// scrollable view in the horizontal direction.
        ///
        /// See ``ScrollView/init(_:showsIndicators:content:)`` for more details
        /// on using this in the initializer.
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         ScrollView(.horizontal, showsIndicators: false) {
        ///             VStack {
        ///                 Text("Bananas 🍌🍌")
        ///                 Text("Apples 🍏🍏")
        ///                 Text("Peaches 🍑🍑")
        ///             }
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A gif of a text view displaying three strings stacked on top of each other on the left side of the screen, scrolling side to side.](horizontal-axis.gif)
        ///
        public static let horizontal: Axis.Set

        /// The option set corresponding to the vertical axis.
        ///
        /// Use this property with ``ScrollView`` to specify a
        /// scrollable view in the horizontal direction.
        ///
        /// See ``ScrollView/init(_:showsIndicators:content:)`` for more details
        /// on using this in the initializer.
        ///
        /// ```
        /// struct ExampleView: View {
        ///     var body: some View {
        ///         ScrollView(.vertical, showsIndicators: false) {
        ///             VStack {
        ///                 Text("Bananas 🍌🍌")
        ///                 Text("Apples 🍏🍏")
        ///                 Text("Peaches 🍑🍑")
        ///             }
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A gif of a text view displaying three strings stacked on top of each other at the top of the screen, scrolling up and down.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/ScrollView-example-1.gif)
        ///
        public static let vertical: Axis.Set

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = Axis.Set.Element

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

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [Axis]

    /// A collection of all values of this type.
    public static var allCases: [Axis] { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : CustomStringConvertible {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `description` property for types that conform to
    /// `CustomStringConvertible`:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    public var description: String { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : Hashable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : RawRepresentable {
}

