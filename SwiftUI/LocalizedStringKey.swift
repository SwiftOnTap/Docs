/// The key used to look up a string in a strings file or strings dictionary
/// file.
///
/// To make the text in your app appear as many different languages
/// depending on the user's preference, use this structure in place
/// of [`String`](https://developer.apple.com/documentation/swift/string).
///
/// Essentially the way localization works is that rather than using
/// strings directly throughout your app, you use this structure instead.
/// This lets you look up string keys which are translated to all
/// the app's supported languages in a .strings file.
///
/// To learn about creating this file and the process of setting up
/// your project for localization, check out these sources:
/// - [Swift with Majid](https://swiftwithmajid.com/2019/10/16/localization-in-swiftui/)
/// - [StackOverflow](https://stackoverflow.com/questions/58578341/how-to-implement-localization-in-swift-ui)
///
/// ### Creating a localized string key
///
/// The most straightforward way to create a localized string key is
/// by using its initializer:
///
///     let hello = LocalizedStringKey("Hello")
///
/// You can also create a localized string key from a string literal,
/// but you must specify the type explicitly or else it will be
/// interpreted as a [`String`](https://developer.apple.com/documentation/swift/string):
///
///     let hello1 = "Hello" //Type String
///     let hello2: LocalizedStringKey = "Hello" //Type LocalizedStringKey
///
/// ### Using a localized string key
///
/// Many views in SwiftUI, like ``Button`` and ``Text``
/// accept localized string keys directly through their initializers by default.
///
///     struct UsingLocalizationView: View {
///         let text: LocalizedStringKey = "Hello 🙋‍♀️"
///
///         var body: some View {
///             VStack {
///                 Button(text) { }
///                 Text(text)
///             }
///         }
///     }
///
/// ![A screenshot displaying a button and a text view in a VStack each reading
/// "Hola" followed by a man emoji.](localization-1.png)
///
/// Also, since SwiftUI is localization-first, if you pass a string literal
/// to these initializers, they will be interpreted as localized string keys!
///
///     struct WithStringLiteralView: View {
///         var body: some View {
///             Text("This gets localized! 🌎")
///         }
///     }
///
/// ![A screenshot displaying a single text view that reads "¡Esto se localiza!"
/// the Spanish translation of the text that is passed to the view.](localizedstringkey-2.png)
///
/// However, if your variable is already a string, the initializer will
/// not localize the string:
///
///     struct ContentView: View {
///         let s = "Hello 🙋‍♀️"
///
///         var body: some View {
///             VStack {
///                 Text(s) //Not localized
///                 Text("Hello 🙋‍♀️") //Localized!
///             }
///         }
///     }
///
/// ![A screenshot displaying two text views in a VStack; the first does not use
/// a localized string key and displays as "Hello" followed by a woman emoji, but
/// the second does use a localized string key and instead displays as "Hola"
/// followed by a man emoji.](localization-3.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct LocalizedStringKey : Equatable, ExpressibleByStringInterpolation {

    /// Creates a localized string key from a `String` value.
    ///
    /// See ``LocalizedStringKey`` for more on how to use localization.
    ///
    ///     struct UsingLocalizationView: View {
    ///         let text = LocalizedStringKey("Hello")
    ///
    ///         var body: some View {
    ///             Text(text)
    ///         }
    ///     }
    ///
    /// ![](localized-key-string-init.png)
    ///
    /// - Parameter value: The value for keying a string.
    public init(_ value: String) { }

    /// Creates an instance initialized to the given string value.
    ///
    /// Use this initializer when you would not like localization.
    ///
    ///     struct SameInEveryLanguageView: View {
    ///         let text = LocalizedStringKey(stringLiteral: "Aloha")
    ///         var body: some View {
    ///             Text(text) //"Aloha"
    ///         }
    ///     }
    ///
    /// ![](localized-key-string-aloha.png)
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral value: String) { }

    /// Creates an instance from a string interpolation.
    ///
    /// Most ``LocalizedStringKey/StringInterpolation`` types will store information about the
    /// literals and interpolations appended to them in one or more properties.
    /// `init(stringInterpolation:)` should use these properties to initialize
    /// the instance.
    ///
    ///     struct UsingLocalizationView: View {
    ///         let name = "Majid"
    ///         var body: some View {
    ///             Text("myNameIs \(name)")
    ///         }
    ///     }
    ///
    /// ![](localization-string-key-interpolation.png)
    ///
    /// And in the localization file, we will have:
    ///
    ///     "myNameIs %@" = "My name is %@.";
    ///
    /// - Parameter stringInterpolation: An instance of `StringInterpolation`
    ///             which has had each segment of the string literal appended
    ///             to it.
    public init(stringInterpolation: LocalizedStringKey.StringInterpolation) { }

    /// The type each segment of a string literal containing interpolations
    /// should be appended to.
    ///
    /// The `StringLiteralType` of an interpolation type must match the
    /// `StringLiteralType` of the conforming type.
    public struct StringInterpolation : StringInterpolationProtocol {

        /// Creates an empty instance ready to be filled with string literal content.
        ///
        /// Don't call this initializer directly. Instead, initialize a variable or
        /// constant using a string literal with interpolated expressions.
        ///
        /// Swift passes this initializer a pair of arguments specifying the size of
        /// the literal segments and the number of interpolated segments. Use this
        /// information to estimate the amount of storage you will need.
        ///
        /// - Parameter literalCapacity: The approximate size of all literal segments
        ///   combined. This is meant to be passed to `String.reserveCapacity(_:)`;
        ///   it may be slightly larger or smaller than the sum of the counts of each
        ///   literal segment.
        /// - Parameter interpolationCount: The number of interpolations which will be
        ///   appended. Use this value to estimate how much additional capacity will
        ///   be needed for the interpolated segments.
        public init(literalCapacity: Int, interpolationCount: Int) { }

        /// Appends a literal segment to the interpolation.
        ///
        /// Don't call this method directly. Instead, initialize a variable or
        /// constant using a string literal with interpolated expressions.
        ///
        /// Interpolated expressions don't pass through this method; instead, Swift
        /// selects an overload of `appendInterpolation`. For more information, see
        /// the top-level `StringInterpolationProtocol` documentation.
        ///
        /// - Parameter literal: A string literal containing the characters
        ///   that appear next in the string literal.
        public mutating func appendLiteral(_ literal: String) { }

        /// Interpolates the given value’s textual representation into the
        /// string literal being created.
        ///
        /// Do not call this method directly. It is used by the compiler when
        /// interpreting string interpolations. Instead, use string
        /// interpolation to create a new string by including values, literals,
        /// variables, or expressions enclosed in parentheses, prefixed by a
        /// backslash (\(…)).
        ///
        ///     let price = 2
        ///        let number = 3
        ///        let message = """
        ///                   If one cookie costs \(price) dollars, \
        ///                   \(number) cookies cost \(price * number) dollars.
        ///                      """
        ///        print(message)
        ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
        public mutating func appendInterpolation(_ string: String) { }

        /// Interpolates the given value’s textual representation into the
        /// string literal being created.
        ///
        /// Do not call this method directly. It is used by the compiler when
        /// interpreting string interpolations. Instead, use string
        /// interpolation to create a new string by including values, literals,
        /// variables, or expressions enclosed in parentheses, prefixed by a
        /// backslash (\(…)).
        ///
        ///     let price = 2
        ///        let number = 3
        ///        let message = """
        ///                   If one cookie costs \(price) dollars, \
        ///                   \(number) cookies cost \(price * number) dollars.
        ///                      """
        ///        print(message)
        ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
        public mutating func appendInterpolation<Subject>(_ subject: Subject, formatter: Formatter? = nil) where Subject : ReferenceConvertible { }

        /// Interpolates the given value’s textual representation into the
        /// string literal being created.
        ///
        /// Do not call this method directly. It is used by the compiler when
        /// interpreting string interpolations. Instead, use string
        /// interpolation to create a new string by including values, literals,
        /// variables, or expressions enclosed in parentheses, prefixed by a
        /// backslash (\(…)).
        ///
        ///     let price = 2
        ///        let number = 3
        ///        let message = """
        ///                   If one cookie costs \(price) dollars, \
        ///                   \(number) cookies cost \(price * number) dollars.
        ///                      """
        ///        print(message)
        ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
        public mutating func appendInterpolation<Subject>(_ subject: Subject, formatter: Formatter? = nil) where Subject : NSObject { }

        /// Interpolates the given value’s textual representation into the
        /// string literal being created.
        ///
        /// Do not call this method directly. It is used by the compiler when
        /// interpreting string interpolations. Instead, use string
        /// interpolation to create a new string by including values, literals,
        /// variables, or expressions enclosed in parentheses, prefixed by a
        /// backslash (\(…)).
        ///
        ///     let price = 2
        ///        let number = 3
        ///        let message = """
        ///                   If one cookie costs \(price) dollars, \
        ///                   \(number) cookies cost \(price * number) dollars.
        ///                      """
        ///        print(message)
        ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
        public mutating func appendInterpolation<T>(_ value: T) where T : _FormatSpecifiable { }

        /// Interpolates the given value’s textual representation into the
        /// string literal being created.
        ///
        /// Do not call this method directly. It is used by the compiler when
        /// interpreting string interpolations. Instead, use string
        /// interpolation to create a new string by including values, literals,
        /// variables, or expressions enclosed in parentheses, prefixed by a
        /// backslash (\(…)).
        ///
        ///     let price = 2
        ///        let number = 3
        ///        let message = """
        ///                   If one cookie costs \(price) dollars, \
        ///                   \(number) cookies cost \(price * number) dollars.
        ///                      """
        ///        print(message)
        ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
        public mutating func appendInterpolation<T>(_ value: T, specifier: String) where T : _FormatSpecifiable { }

        /// Interpolates the given value’s textual representation into the
        /// string literal being created.
        ///
        /// Do not call this method directly. It is used by the compiler when
        /// interpreting string interpolations. Instead, use string
        /// interpolation to create a new string by including values, literals,
        /// variables, or expressions enclosed in parentheses, prefixed by a
        /// backslash (\(…)).
        ///
        ///     let price = 2
        ///        let number = 3
        ///        let message = """
        ///                   If one cookie costs \(price) dollars, \
        ///                   \(number) cookies cost \(price * number) dollars.
        ///                      """
        ///        print(message)
        ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        public mutating func appendInterpolation(_ text: Text) { }

        /// The type that should be used for literal segments.
        public typealias StringLiteralType = String
    }

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

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: LocalizedStringKey, b: LocalizedStringKey) -> Bool { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LocalizedStringKey.StringInterpolation {

        /// Interpolates the given value’s textual representation into the
        /// string literal being created.
        ///
        /// Do not call this method directly. It is used by the compiler when
        /// interpreting string interpolations. Instead, use string
        /// interpolation to create a new string by including values, literals,
        /// variables, or expressions enclosed in parentheses, prefixed by a
        /// backslash (\(…)).
        ///
        ///     let price = 2
        ///        let number = 3
        ///        let message = """
        ///                   If one cookie costs \(price) dollars, \
        ///                   \(number) cookies cost \(price * number) dollars.
        ///                      """
        ///        print(message)
        ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
    public mutating func appendInterpolation(_ image: Image) { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LocalizedStringKey.StringInterpolation {

    /// Interpolates the given value’s textual representation into the
    /// string literal being created.
    ///
    /// Do not call this method directly. It is used by the compiler when
    /// interpreting string interpolations. Instead, use string
    /// interpolation to create a new string by including values, literals,
    /// variables, or expressions enclosed in parentheses, prefixed by a
    /// backslash (\(…)).
    ///
    ///     let price = 2
    ///        let number = 3
    ///        let message = """
    ///                   If one cookie costs \(price) dollars, \
    ///                   \(number) cookies cost \(price * number) dollars.
    ///                      """
    ///        print(message)
    ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
    public mutating func appendInterpolation(_ date: Date, style: Text.DateStyle) { }

    /// Interpolates the given value’s textual representation into the
    /// string literal being created.
    ///
    /// Do not call this method directly. It is used by the compiler when
    /// interpreting string interpolations. Instead, use string
    /// interpolation to create a new string by including values, literals,
    /// variables, or expressions enclosed in parentheses, prefixed by a
    /// backslash (\(…)).
    ///
    ///     let price = 2
    ///        let number = 3
    ///        let message = """
    ///                   If one cookie costs \(price) dollars, \
    ///                   \(number) cookies cost \(price * number) dollars.
    ///                      """
    ///        print(message)
    ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
    public mutating func appendInterpolation(_ dates: ClosedRange<Date>) { }

    /// Interpolates the given value’s textual representation into the
    /// string literal being created.
    ///
    /// Do not call this method directly. It is used by the compiler when
    /// interpreting string interpolations. Instead, use string
    /// interpolation to create a new string by including values, literals,
    /// variables, or expressions enclosed in parentheses, prefixed by a
    /// backslash (\(…)).
    ///
    ///     let price = 2
    ///        let number = 3
    ///        let message = """
    ///                   If one cookie costs \(price) dollars, \
    ///                   \(number) cookies cost \(price * number) dollars.
    ///                      """
    ///        print(message)
    ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
    public mutating func appendInterpolation(_ interval: DateInterval) { }
}

