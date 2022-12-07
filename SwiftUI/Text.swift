/// A view that displays read-only text.
///
/// `Text` draws a [`String`](https://developer.apple.com/documentation/swift/string)
/// in your app and comes equipped with modifiers to customize your text.
/// This view sizes itself to fit the provided content, styling and containing
/// view.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Text("🍌🍌")
///     }
/// }
/// ```
///
/// ![A view displaying the text "🍌🍌".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-example-1.png)
///
/// `Text` is most commonly initialized with a
/// [`String`](https://developer.apple.com/documentation/swift/string),
/// however, it has 9 different initializers.
///
/// For example, use ``Text/init(_:style:)`` to display a date in a `Text` view.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Text(Date(), style: .date)
///     }
/// }
/// ```
///
/// ![A text view displaying the date.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-example-2.png)
///
/// `Text` also accepts 10 unique modifiers to customize your string.
/// - ``Text/foregroundColor(_:)``
/// - ``Text/font(_:)``
/// - ``Text/fontWeight(_:)``
/// - ``Text/bold()``
/// - ``Text/italic()``
/// - ``Text/strikethrough(_:color:)``
/// - ``Text/underline(_:color:)``
/// - ``Text/kerning(_:)``
/// - ``Text/tracking(_:)``
/// - ``Text/baselineOffset(_:)``
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Text(Date(), style: .date)
///             .underline(true, color: .orange)
///             .font(.system(size: 20, weight: .bold, design: .rounded))
///     }
/// }
/// ```
///
/// ![A text view displaying the date with an orange underline and a bolded, rounded text font.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-example-3.png)
///
/// `Text` conforms to the ``View`` protocol. Therefore, any modifiers that
/// return `some View`, such as ``View/foregroundColor(_:)``, are compatible with
/// `Text`.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Text(Date(), style: .date)
///             .font(.system(size: 20, weight: .bold, design: .rounded))
///             .foregroundColor(.orange)
///     }
/// }
/// ```
///
/// ![A text view displaying the date in an orange, bolded, rounded text font.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-example-4.png)
///
/// **Remember**, any modifier that returns `some View` must be used after
/// modifiers that return `Text`.
///
/// If your app is localized, you can display localized text by passing the key
/// to the initializer. For example, if you used the localization key of
/// `"banana"` and mapped it to `"🍌🍌"` for your current location, the
/// localized string could be displayed with this line:
///
///     struct ExampleView: View {
///         var body: some View {
///             Text("banana")
///         }
///     }
///
/// See ``Text/init(_:tableName:bundle:comment:)`` for more information on how
/// to initialize `Text` with localized strings. This initializer can
/// be used to display localized keys coming from a non-standard bundle or
/// string table.
///
/// Images can be displayed in a text view. This enables your app to
/// optionally include them inside a text string, where they will resize
/// based on your view's font. See ``Text/init(_:)-b90ab`` for more on
/// initializing `Text` with images.
///
/// Use the ``View`` modifiers ``View/lineLimit(_:)``,
/// ``View/allowsTightening(_:)``,
/// ``View/minimumScaleFactor(_:)``,
/// and ``View/truncationMode(_:)`` to configure how ``Text`` handles
/// space constraints.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Text : Equatable {

    /// Creates a text view that displays a string literal without localization.
    ///
    /// Use this initializer to create a text view with a string literal without
    /// performing localization:
    ///
    /// ```
    /// struct VerbatimTextView: View {
    ///     var body: some View {
    ///         Text(verbatim: "pencil") // Displays the string "pencil" in any locale.
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a plain view that reads "pencil" in the center
    /// of the screen which is passed as a string literal.](text-init-verbatim.png)
    ///
    /// If you want to localize a string literal before displaying it, use the
    /// ``Text/init(_:tableName:bundle:comment:)`` initializer instead. If you
    /// want to display a string variable, use the ``Text/init(_:)-40ffd``
    /// initializer, which also bypasses localization.
    ///
    /// - Parameter content: A string to display without localization.
    @inlinable public init(verbatim content: String) { }

    /// Creates a text view that displays a stored string without localization.
    ///
    /// Use this initializer to create a text view that displays — without
    /// localization — the text in a string variable.
    ///
    /// ```
    /// struct VerbatimTextView: View {
    ///     var someString = "Don't localize me"
    ///     var body: some View {
    ///         Text(someString) // Displays the contents of `someString` without localization.
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a plain view that reads "Don't localize me" in the center
    /// of the screen which is passed as a string variable.](text-verbatim.png)
    ///
    /// SwiftUI doesn't call the `init(_:)` method when you initialize a text
    /// view with a string literal as the input. Instead, a string literal
    /// triggers the ``Text/init(_:tableName:bundle:comment:)`` method — which
    /// treats the input as a ``LocalizedStringKey`` instance — and attempts to
    /// perform localization.
    ///
    /// By default, SwiftUI assumes that you don't want to localize stored
    /// strings, but if you do, you can first create a localized string key from
    /// the value, and initialize the text view with that. Using a key as input
    /// triggers the ``Text/init(_:tableName:bundle:comment:)`` method instead.
    ///
    /// - Parameter content: The string value to display without localization.
    public init<S>(_ content: S) where S : StringProtocol { }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Text, b: Text) -> Bool { }
}

extension Text {

    /// Creates an instance that wraps an ``Image``, suitable for concatenating
    /// with other ``Text``
    ///
    /// In the example below, we're able to turn an ``Image`` into a text
    /// view so that we can add them together and return a side-by-side
    /// view:
    ///
    /// ```
    /// struct ContentView: View {
    ///     let image = Image(systemName: "book")
    ///
    ///     var body: some View {
    ///         Text(image) + Text("The Art of War")
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single text view that is the product of
    /// concatenating two text views; an image of a book is followed by text
    /// that reads "The Art of War."](text-init-image.png)
    ///
    /// We can take this a step further by concatenating the views in parentheses
    /// and applying modifiers to the joined text:
    ///
    /// ```
    /// struct ContentView: View {
    ///     let image = Image(systemName: "book")
    ///
    ///     var body: some View {
    ///         (Text(image) + Text("The Art of War"))
    ///             .foregroundColor(.blue)
    ///             .font(.largeTitle)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view in blue with large title font; an
    /// image of a book is followed by text that reads "The Art of War."](text-init-image-mod.png)
    ///
    /// - Parameter image: The Image view to turn into a view of type ``Text``
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public init(_ image: Image) { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text {

    /// Creates a text view that displays the formatted representation of a value.
    ///
    /// Use this initializer to create a text view that will format `subject`
    /// using `formatter`.
    ///
    /// The first parameter to this initializer must either of type
    /// [**`NSObject`**](https://developer.apple.com/documentation/objectivec/nsobject),
    /// like [`NSNumber`](https://developer.apple.com/documentation/foundation/nsnumber),
    /// or [**`ReferenceConvertible`**](https://developer.apple.com/documentation/foundation/referenceconvertible),
    /// like [`Date`](https://developer.apple.com/documentation/foundation/date).
    /// The type will depend on the `formatter`.
    ///
    /// See [`Formatter`](https://developer.apple.com/documentation/foundation/formatter)
    /// for more info on creating a formatter.
    ///
    /// ```
    /// struct ByteCountView: View {
    ///     let number = NSNumber(value: 19728)
    ///     let formatter = ByteCountFormatter()
    ///
    ///     var body: some View {
    ///         Text(number, formatter: formatter)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a plain text view that reads "20 KB." The text
    /// is formatted using ByteCountFormatter, which displays the byte count rather
    /// than the actual text passed to the view.](text-nsobject.png)
    ///
    /// - Paramters:
    ///   - subject: The item to be formatted and then displayed by the ``Text`` view.
    ///   - formatter: The `Formatter` to use in formatting the subject.
    public init<Subject>(_ subject: Subject, formatter: Formatter) where Subject : ReferenceConvertible { }

    /// Creates a text view that displays the formatted representation of a value.
    ///
    /// Use this initializer to create a text view that will format `subject`
    /// using `formatter`.
    ///
    /// The first parameter to this initializer must either of type
    /// [`NSObject`](https://developer.apple.com/documentation/objectivec/nsobject),
    /// like [`NSNumber`](https://developer.apple.com/documentation/foundation/nsnumber),
    /// or [`ReferenceConvertible`](https://developer.apple.com/documentation/foundation/referenceconvertible),
    /// like [`Date`](https://developer.apple.com/documentation/foundation/date).
    /// The type will depend on the `formatter`.
    ///
    /// See [`Formatter`](https://developer.apple.com/documentation/foundation/formatter)
    /// for more info on creating a formatter.
    ///
    /// ```
    /// struct ByteCountView: View {
    ///     let number = NSNumber(value: 19728)
    ///     let formatter = ByteCountFormatter()
    ///
    ///     var body: some View {
    ///         Text(number, formatter: formatter)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a plain text view that reads "20 KB." The text
    /// is formatted using ByteCountFormatter, which displays the byte count rather
    /// than the actual text passed to the view.](text-nsobject.png)
    ///
    /// - Paramters:
    ///   - subject: The item to be formatted and then displayed by the ``Text`` view.
    ///   - formatter: The `Formatter` to use in formatting the subject.
    public init<Subject>(_ subject: Subject, formatter: Formatter) where Subject : NSObject { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text {

    /// A predefined style used to display a Date.
    ///
    /// Use this structure along with the ``Text/init(_:style:)``
    /// initializer to easily style a
    /// [`Date`](https://developer.apple.com/documentation/foundation/date).
    ///
    /// Options include:
    /// - ``Text/DateStyle/time``: The time component only.
    /// - ``Text/DateStyle/date``: The date component only.
    /// - ``Text/DateStyle/relative``: The amount of time between the date
    /// and now. (Updated in real time)
    /// - ``Text/DateStyle/offset``: The positive or negative amount of
    /// time between the date and now. (Updates in real time)
    /// - ``Text/DateStyle/time``: A timer that starts at the date. (Updates
    /// in real time)
    ///
    /// ```
    /// struct LotsOfTimesView: View {
    ///     let time = Date() //Sets time from when the view appears
    ///
    ///     var body: some View {
    ///         VStack(alignment: .leading) {
    ///             Text("1. ") + Text(time, style: .time)
    ///             Text("2. ") + Text(time, style: .date)
    ///             Text("3. ") + Text(time, style: .relative)
    ///             Text("4. ") + Text(time, style: .offset)
    ///             Text("6. ") + Text(time, style: .timer)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying 5 different date styles in a VStack. From top to bottom,
    /// these read "4:57 PM," "March 29, 2021," "_ sec," "+_ seconds," "0:02."](text-date-style-ex.gif)
    ///
    public struct DateStyle {

        /// A style displaying only the time component for a date.
        ///
        /// Use this structure along with the ``Text/init(_:style:)``
        /// initializer to easily style a
        /// [`Date`](https://developer.apple.com/documentation/foundation/date).
        ///
        /// ```
        /// struct TimeView: View {
        ///     let time = Date() //Sets time from when the view appears
        ///
        ///     var body: some View {
        ///         Text(time, style: .time)
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with a text view that reads "3:31 PM." The date style
        /// used is .time so the text renders as only a time.](datestyle-time.png)
        public static let time: Text.DateStyle

        /// A style displaying a date.
        ///
        /// Use this structure along with the ``Text/init(_:style:)``
        /// initializer to easily style a
        /// [`Date`](https://developer.apple.com/documentation/foundation/date).
        ///
        /// ```
        /// struct DateView: View {
        ///     let time = Date() //Sets time from when the view appears
        ///
        ///     var body: some View {
        ///         Text(time, style: .date)
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with a text view that reads "March 25, 2021." The date style
        /// used is .date so the text renders as only a date.](datestyle-date.png)
        public static let date: Text.DateStyle

        /// A style displaying a date as relative to now.
        ///
        /// Use this structure along with the ``Text/init(_:style:)``
        /// initializer to easily style a
        /// [`Date`](https://developer.apple.com/documentation/foundation/date).
        ///
        /// ```
        /// struct RelativeView: View {
        ///     let time = Date() //Sets time from when the view appears
        ///
        ///     var body: some View {
        ///         Text(time, style: .relative)
        ///     }
        /// }
        /// ```
        ///
        /// ![A gif displaying a single text view in the center of the screen that
        /// reads "_ sec" and counts up. Since the relative date style is used, the
        /// text renders as a count in seconds from when the view appears.](text-date-style-relative-ex.gif)
        ///
        public static let relative: Text.DateStyle

        /// A style displaying a date as offset from now.
        ///
        /// Use this structure along with the ``Text/init(_:style:)``
        /// initializer to easily style a
        /// [`Date`](https://developer.apple.com/documentation/foundation/date).
        ///
        /// ```
        /// struct OffsetView: View {
        ///     let time = Date() //Sets time from when the view appears
        ///
        ///     var body: some View {
        ///         Text(time, style: .offset)
        ///     }
        /// }
        /// ```
        ///
        /// ![A gif displaying a single text view in the center of the screen that
        /// reads "+_ seconds" and counts up. Since the offset date style is used, the
        /// text renders as a count in seconds from when the view appears.](text-date-style-offset-ex.gif)
        ///
        public static let offset: Text.DateStyle

        /// A style displaying a date as timer counting from now.
        ///
        /// Use this structure along with the ``Text/init(_:style:)``
        /// initializer to easily style a
        /// [`Date`](https://developer.apple.com/documentation/foundation/date).
        ///
        /// ```
        /// struct TimerView: View {
        ///     let time = Date() //Sets time from when the view appears
        ///
        ///     var body: some View {
        ///         Text(time, style: .timer)
        ///     }
        /// }
        /// ```
        ///
        /// ![A gif displaying a single text view in the center of the screen that
        /// reads "0:0_" and counts up. Since the timer date style is used, the
        /// text renders as a count in seconds from when the view appears.](text-date-style-timer-ex.gif)
        ///
        public static let timer: Text.DateStyle
    }

    /// Creates an instance that displays localized dates and times using a specific style.
    ///
    /// Use this initializer along with ``Text/DateStyle`` to style the
    /// date. See ``Text/DateStyle`` for the options of the style parameter.
    ///
    /// See
    /// [`Date`](https://developer.apple.com/documentation/foundation/date)
    /// for more on how to make and use a date.
    ///
    /// ```
    /// struct TimerView: View {
    ///     let time = Date() //Sets time from when the view appears
    ///
    ///     var body: some View {
    ///         Text(time, style: .timer)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a timer style text view in which a 3 digit timer
    /// count up from 1 to 4 seconds.](text-init-style-ex.gif)
    ///
    /// - Parameters:
    ///     - date: The target date to display.
    ///     - style: The style used when displaying a date.
    public init(_ date: Date, style: Text.DateStyle) { }

    /// Creates an instance that displays a localized range between two dates.
    ///
    /// Use this initializer to automatically format a range of dates
    /// based on the user's locale.
    ///
    /// See
    /// [`Date`](https://developer.apple.com/documentation/foundation/date)
    /// for more on how to create and manage a date.
    ///
    /// ```
    /// struct TimerView: View {
    ///     let time = Date() //Sets time from when the view appears
    ///
    ///     var body: some View {
    ///         Text(time...time.addingTimeInterval(600))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view that reads "3:20-3:30 PM," a localized
    /// range between two dates, each styled as a time.](text-closedrange.png)
    ///
    /// - Parameters:
    ///     - dates: The range of dates to display
    public init(_ dates: ClosedRange<Date>) { }

    /// Creates an instance that displays a localized time interval.
    ///
    /// ```
    /// struct TimerView: View {
    ///     let time = Date() //Sets time from when the view appears
    ///     let end = time.addingTimeInterval(600)
    ///     let interval = DateInterval(start: time, end: end)
    ///
    ///     var body: some View {
    ///         Text(interval)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view that reads "3:20-3:30 PM," a localized
    /// range between two dates, each styled as a time, that is passed directly
    /// to the text view using DateInterval.](text-dateinterval.png)
    ///
    /// - Parameters:
    ///     - interval: The date interval to display
    public init(_ interval: DateInterval) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {

    /// Creates a text view that displays localized content identified by a key.
    ///
    /// Use this initializer to look for the `key` parameter in a localization
    /// table and display the associated string value in the initialized text
    /// view. If the initializer can't find the key in the table, or if no table
    /// exists, the text view displays the string representation of the key
    /// instead.
    ///
    /// ```
    /// struct PencilView: View {
    ///     var body: some View {
    ///         Text("pencil") // Localizes the key if possible, or displays "pencil" if not.
    ///     }
    /// }
    /// ```
    ///
    /// When you initialize a text view with a string literal, the view triggers
    /// this initializer because it assumes you want the string localized, even
    /// when you don't explicitly specify a table, as in the above example. If
    /// you haven't provided localization for a particular string, you still get
    /// reasonable behavior, because the initializer displays the key, which
    /// typically contains the unlocalized string.
    ///
    /// If you initialize a text view with a string variable rather than a
    /// string literal, the view triggers the ``Text/init(_:)-40ffd``
    /// initializer instead, because it assumes that you don't want localization
    /// in that case. If you do want to localize the value stored in a string
    /// variable, you can choose to call the `init(_:tableName:bundle:comment:)`
    /// initializer by first creating a ``LocalizedStringKey`` instance from the
    /// string variable:
    ///
    /// ```
    /// struct PencilView: View {
    ///     let someString = "pencil"
    ///     var body: some View {
    ///         Text(LocalizedStringKey(someString)) // Localizes the contents of `someString`.
    ///     }
    /// }
    /// ```
    ///
    /// If you have a string literal that you don't want to localize, use the
    /// ``Text/init(verbatim:)`` initializer instead.
    ///
    /// - Parameters:
    ///   - key: The key for a string in the table identified by `tableName`.
    ///   - tableName: The name of the string table to search. If `nil`, use the
    ///     table in the `Localizable.strings` file.
    ///   - bundle: The bundle containing the strings file. If `nil`, use the
    ///     main bundle.
    ///   - comment: Contextual information about this key-value pair.
    public init(_ key: LocalizedStringKey, tableName: String? = nil, bundle: Bundle? = nil, comment: StaticString? = nil) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {
    /// Concatenates two text views into one new text view.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("Banana🍌🍌") + Text("Apple🍎🍎")
    ///         }
    ///         .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single text view that reads "Banana" followed by
    /// two banana emojis, no space, and "Apple" followed by two apple emojis.
    /// The text views are concatenated into one view, which has no space.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-plus-example-1.png)
    ///
    /// - Parameters:
    ///   - lhs: The first text view with text to combine.
    ///   - rhs: The second text view with text to combine.
    ///
    /// - Returns: A new text view containing the combined contents of the two
    ///   input text views.
    public static func + (lhs: Text, rhs: Text) -> Text { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {

    /// The type of truncation to apply to a line of text when it's too long to
    /// fit in the available space.
    ///
    /// When a text view contains more text than it's able to display, the view
    /// might truncate the text and place an ellipsis (...) at the truncation
    /// point. Use the ``View/truncationMode(_:)`` modifier with one of the
    /// `TruncationMode` values to indicate which part of the text to
    /// truncate, either at the beginning, in the middle, or at the end.
    ///
    /// ```
    /// struct TruncatedTextView: View {
    ///     var body: some View {
    ///         Text("abcdefghijklmnopqrstuvwxyz")
    ///             .frame(width: 55, height: 20)
    ///             .truncationMode(.middle)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view that reads "ab...yz" in the center
    /// of the screen. The truncation mode applied is middle, so the middle of
    /// the long string is cut out and replaced by an ellipsis.](text-truncationmode.png)
    public enum TruncationMode {

        /// Truncate at the beginning of the line.
        ///
        /// Use this kind of truncation to omit characters from the beginning of
        /// the string. For example, you could truncate the English alphabet as
        /// "...wxyz".
        ///
        /// Use this case along with ``View/truncationMode(_:)`` to truncate
        /// the beginning of the text.
        ///
        /// ```
        /// struct HeadTextView: View {
        ///     var body: some View {
        ///         Text("abcdefghijklmnopqrstuvwxyz")
        ///             .frame(width: 55, height: 20)
        ///             .truncationMode(.head)
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a text view that reads "...wxyz" in the center
        /// of the screen. The truncation mode applied is head, so the front end of
        /// the long string is cut out and replaced by an ellipsis.](truncationmode-head.png)
        case head

        /// Truncate at the end of the line.
        ///
        /// Use this kind of truncation to omit characters from the end of the
        /// string. For example, you could truncate the English alphabet as
        /// "abcd...".
        ///
        /// ```
        /// struct HeadTextView: View {
        ///     var body: some View {
        ///         Text("abcdefghijklmnopqrstuvwxyz")
        ///             .frame(width: 55, height: 20)
        ///             .truncationMode(.tail)
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a text view that reads "abcd..." in the center
        /// of the screen. The truncation mode applied is tail, so the tail end of
        /// the long string is cut out and replaced by an ellipsis.](truncationmode-tail.png)
        case tail

        /// Truncate in the middle of the line.
        ///
        /// Use this kind of truncation to omit characters from the middle of
        /// the string. For example, you could truncate the English alphabet as
        /// "ab...yz".
        ///
        /// ```
        /// struct HeadTextView: View {
        ///     var body: some View {
        ///         Text("abcdefghijklmnopqrstuvwxyz")
        ///             .frame(width: 55, height: 20)
        ///             .truncationMode(.middle) //"ab...yz"
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a text view that reads "ab...yz" in the center
        /// of the screen. The truncation mode applied is middle, so the middle of
        /// the long string is cut out and replaced by an ellipsis.](truncationmode-middle.png)
        case middle

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Text.TruncationMode, b: Text.TruncationMode) -> Bool { }

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher) { }
    }

    /// A scheme for transforming the capitalization of characters within text.
    ///
    /// Use this enumeration with the ``View/textCase(_:)`` modifier
    /// to transform the case of text.
    ///
    /// ```
    /// struct FriendlyTextView: View {
    ///     var body: some View {
    ///         Text("Hello")
    ///             .textCase(Text.Case.uppercase)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single text view in the center of the screen
    /// that reads "HELLO." The text case modifier is applied with uppercase, which
    /// renders the text in all uppercase letters.](text-case.png)
    ///
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public enum Case {

        /// Displays text in all uppercase characters.
        ///
        /// Use this with the ``View/textCase(_:)`` modifier
        /// to capitalize text.
        ///
        /// For example, "Hello" would be displayed as "HELLO".
        ///
        /// ```
        /// struct FriendlyTextView: View {
        ///     var body: some View {
        ///         Text("Hello")
        ///             .textCase(.uppercase)
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a single text view in the center of the screen
        /// that reads "HELLO." The text case modifier is applied with uppercase, which
        /// renders the text in all uppercase letters.](text-case.png)
        ///
        /// See the similar modifier for [`String`](https://developer.apple.com/documentation/swift/string):
        /// [`uppercased()`](https://developer.apple.com/documentation/swift/stringprotocol/2908613-uppercased).
        case uppercase

        /// Displays text in all lowercase characters.
        ///
        /// Use this with the ``View/textCase(_:)`` modifier
        /// to lowercase text.
        ///
        /// For example, "Hello" would be displayed as "hello".
        ///
        /// ```
        /// struct FriendlyTextView: View {
        ///     var body: some View {
        ///         Text("Hello")
        ///             .textCase(.lowercase) //"hello"
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying a single text view in the center of the screen
        /// that reads "hello." The text case modifier is applied with lowercase, which
        /// renders the text in all lowercase letters.](text-case-lowercase.png)
        ///
        /// See the similar modifier for [`String`](https://developer.apple.com/documentation/swift/string):
        /// [`lowercased()`](https://developer.apple.com/documentation/swift/stringprotocol/2906197-lowercased).
        case lowercase

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Text.Case, b: Text.Case) -> Bool { }

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher) { }
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {

    /// Sets the color of the text displayed by this view.
    ///
    /// Use this method to change the color of the text rendered by a text view.
    ///
    /// For example, you can change the colors of Banana🍌🍌 to yellow, Apple🍎🍎 to red, and Peach🍑🍑 to orange.
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             VStack {
    ///                 Text("Banana🍌🍌")
    ///                     .foregroundColor(.yellow)
    ///                 Text("Apple 🍎🍎")
    ///                     .foregroundColor(.red)
    ///                 Text("Peach 🍑🍑")
    ///                     .foregroundColor(.orange)
    ///             }
    ///             .font(.largeTitle)
    ///         }
    ///     }
    ///
    /// ![A view containing a VStack with three text items, each with a
    /// different foreground color; "Banana🍌🍌" is yellow, "Apple🍎🍎" is red,
    /// and "Peach🍑🍑" is orange.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-foregroundColor-example-1.png)
    ///
    /// - Parameter color: The color to use when displaying this text.
    /// - Returns: A text view that uses the color value you supply.
    public func foregroundColor(_ color: Color?) -> Text { }

    /// Sets the default font for text in the view.
    ///
    /// Use ``Text/font(_:)`` to apply a specific font to an individual
    /// Text View, or all of the text views in a container.
    ///
    /// In the example below, the first text field has a font set directly,
    /// while the font applied to the following container applies to all of the
    /// text views inside that container:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Font applied to a text view.")
    ///                 .font(.largeTitle)
    ///
    ///             VStack {
    ///                 Text("These two text views have the same font")
    ///                 Text("applied to their parent view.")
    ///             }
    ///             .font(.system(size: 16, weight: .light, design: .default))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with a text view reading "Font applied to
    /// a text view" in largeTitle font style followed by a child VStack
    /// containing two text views, "These two text views have the same font"
    /// and "applied to their parent view which have been styled as size 15,
    /// light weight, and default design through application to the view
    /// container by way of the system modifier.](textfont-ex.png)
    ///
    /// - Parameter font: The font to use when displaying this text.
    /// - Returns: Text that uses the font you specify.
    public func font(_ font: Font?) -> Text { }

    /// Sets the font weight of the text.
    ///
    /// Use this font modifier to set the weight of your ``Font``.
    ///
    /// This modifier takes a ``Font/Weight`` object. There are 9 font
    /// weight.
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             VStack {
    ///                 Text("ultraLight 🍌")
    ///                     .fontWeight(.ultraLight)
    ///                 Text("thin🍌")
    ///                     .fontWeight(.thin)
    ///                 Text("light🍌")
    ///                     .fontWeight(.light)
    ///                 Text("regular🍌")
    ///                     .fontWeight(.regular)
    ///                 Text("medium🍌")
    ///                     .fontWeight(.medium)
    ///                 Text("semibold🍌")
    ///                     .fontWeight(.semibold)
    ///                 Text("bold🍌")
    ///                     .fontWeight(.bold)
    ///                 Text("heavy🍌")
    ///                     .fontWeight(.heavy)
    ///                 Text("black🍌")
    ///                     .fontWeight(.black)
    ///             }
    ///             .font(.title)
    ///         }
    ///     }
    ///
    /// ![A view with a VStack containing 9 text items, each with a different
    /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
    /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
    /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
    ///
    /// - Note: The example above uses [type inference](https://www.swiftbysundell.com/basics/type-inference/)
    /// to shorten the code. The full version of using the modifier would
    /// look like this:
    ///
    /// ```
    /// Text("ultraLight 🍌")
    ///     .fontWeight(Font.Weight.ultraLight)
    /// ```
    ///
    /// - Parameter weight: One of the available font weights.
    ///
    /// - Returns: Text that uses the font weight you specify.
    public func fontWeight(_ weight: Font.Weight?) -> Text { }

    /// Applies a bold font weight to the text.
    ///
    /// Use this modifier to add **bold** styling to a ``Text`` view.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("I'm italicized text")
    ///                 .font(Font.system(size: 36))
    ///                 .italic()
    ///             Text("And I'm bold")
    ///                 .font(Font.system(size: 36))
    ///                 .bold()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying two text lines in a VStack: "I'm italicized text"
    /// in italic text font and "And I'm bold" in bold text font.](font-bold-italic.png)
    ///
    /// This is slightly different than using the ``Font`` modifier ``Font/weight(_:)``
    /// and passing the ``Font/Weight/bold`` property. See the difference:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("I use the `.bold()` modifier")
    ///                 .font(Font.system(size: 24))
    ///                 .bold()
    ///             Text("I use the `.bold` property")
    ///                 .font(Font.system(size: 24).weight(.bold))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying two text lines in a VStack: "I use the `.bold()`
    /// modifier", bolded using the .bold() modifier, and "I use the `.bold`
    /// property" bolded using the .bold property.](font-bold-comparison.png)
    ///
    /// There is a related ``Font`` modifier called ``Font/bold()`` that
    /// gets applied directly to the text view:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("We are the same 👯‍")
    ///                 .font(Font.system(size: 24).bold())
    ///             Text("We are the same 👯‍")
    ///                 .font(Font.system(size: 24))
    ///                 .bold()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying two bolded text lines in a VStack both reading
    /// "We are the same 👯‍," one using the bold property and one using the
    /// Font modifier called bold().](font-bold-twins.png)
    ///
    /// - Note: Since this modifier returns a ``Text``, you can apply other
    /// text-only modifiers after this one.
    ///
    /// - Returns: Bold text.
    public func bold() -> Text { }

    /// Applies italics to the text.
    ///
    /// Use this modifier to add *italic* styling to a ``Text`` view.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("I'm italicized text")
    ///                 .font(Font.system(size: 36))
    ///                 .italic()
    ///             Text("And I'm bold")
    ///                 .font(Font.system(size: 36))
    ///                 .bold()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying two text lines in a VStack: "I'm italicized text"
    /// in italic text font and "And I'm bold" in bold text font.](font-bold-italic.png)
    ///
    /// There is a related ``Font`` modifier called ``Font/italic()`` that
    /// gets applied to the ``Font``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("We are the same 👯‍")
    ///                 .font(Font.system(size: 24).italic())
    ///             Text("We are the same 👯‍")
    ///                 .font(Font.system(size: 24))
    ///                 .italic()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying two bolded text lines in a VStack both reading
    /// "We are the same 👯‍," one using the italic property and one using the
    /// Font modifier called italic().](font-text-italic.png)
    ///
    /// - Note: Since this modifier returns another ``Text``, you can
    /// apply more text-specific modifiers after this one.
    ///
    /// - Returns: Italic text.
    public func italic() -> Text { }

    /// Applies a strikethrough to the text.
    ///
    /// Use this modifier to apply a strikethrough to a ``Text`` view.
    /// Pass two parameters: a boolean of whether to strike through the
    /// text (defaults to `true`) and the ``Color`` of the strikethrough.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Banana 🍌🍌")
    ///                 .strikethrough(false)
    ///             Text("Banana 🍌🍌")
    ///                 .strikethrough()
    ///             Text("Banana 🍌🍌")
    ///                 .strikethrough(true, color: .yellow)
    ///         }
    ///         .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying three text items in a VStack, "Banana 🍌🍌" with no
    /// strikethrough, "Banana 🍌🍌" with a strikethrough, and "Banana 🍌🍌"
    /// with a yellow strikethrough; all three text views use the strikthrough
    /// modifier.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-strikethrough-example-1.png)
    ///
    /// - Parameters:
    ///   - active: A Boolean value that indicates whether the text has a
    ///     strikethrough applied.
    ///   - color: The color of the strikethrough. If ``color`` is `nil`, the
    ///     strikethrough uses the default foreground color.
    ///
    /// - Returns: Text with a line through its center.
    public func strikethrough(_ active: Bool = true, color: Color? = nil) -> Text { }

    /// Applies an underline to the text.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Text("Banana 🍌🍌 ")
    ///             .underline(false)
   ///             .font(.title)
    ///
    ///         Text("Banana 🍌🍌 ")
    ///             .underline()
    ///             .font(.title)
    ///
    ///         Text("Banana 🍌🍌 ")
    ///             .underline(true, color: .yellow)
    ///             .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying three title font text items in a VStack, "Banana 🍌🍌" with no
    /// underline, "Banana 🍌🍌" with an underline, and "Banana 🍌🍌"
    /// with a yellow underline; all three text views use the underline
    /// modifier.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-underline-example-1.png)
    ///
    /// - Parameters:
    ///   - active: A Boolean value that indicates whether the text has an
    ///     underline.
    ///   - color: The color of the underline. If ``color`` is `nil`, the
    ///     underline uses the default foreground color.
    ///
    /// - Returns: Text with a line running along its baseline.
    public func underline(_ active: Bool = true, color: Color? = nil) -> Text { }

    /// Sets the spacing, or kerning, between characters.
    ///
    /// Kerning defines the offset, in points, that a text view should shift
    /// characters from the default spacing. Use positive kerning to widen the
    /// spacing between characters. Use negative kerning to tighten the spacing
    /// between characters.
    ///
    /// ```
    /// struct KerningView: View {
    ///     var body: some View {
    ///         VStack(alignment: .leading) {
    ///             Text("ABCDEF")
    ///                 .kerning(-3)
    ///             Text("ABCDEF")
    ///             Text("ABCDEF")
    ///                 .kerning(3)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying three text views in a VStack, each reading
    /// "ABCDEF." The first applies negative kerning, the second applies no kerning,
    /// and the third applies positive kerning. The result is that the first
    /// renders incredibly tight spacing between letters, and the third has excess
    /// space between letters.](kearning.png)
    ///
    /// The last character in the first case, which uses negative kerning,
    /// experiences cropping because the kerning affects the trailing edge of
    /// the text view as well.
    ///
    /// Kerning attempts to maintain ligatures. For example, the Hoefler Text
    /// font uses a ligature for the letter combination _ffl_, as in the word
    /// _raffle_.
    ///
    /// The *ffl* letter combination keeps a constant shape as the other letters
    /// move together or apart. Beyond a certain point in either direction,
    /// however, kerning does disable nonessential ligatures.
    ///
    /// - Important: If you add both the ``Text/tracking(_:)`` and
    ///   `kerning(_:)` modifiers to a view, the view applies the
    ///   tracking and ignores the kerning.
    ///
    /// - Parameter kerning: The spacing to use between individual characters in
    ///   this text.
    ///
    /// - Returns: Text with the specified amount of kerning.
    public func kerning(_ kerning: CGFloat) -> Text { }

    /// Sets the tracking for the text.
    ///
    /// Tracking adds space, measured in points, between the characters in the
    /// text view. A positive value increases the spacing between characters,
    /// while a negative value brings the characters closer together.
    ///
    /// ```
    /// struct TrackingView: View {
    ///     var body: some View {
    ///         VStack(alignment: .leading) {
    ///             Text("ABCDEF")
    ///                 .tracking(-3)
    ///             Text("ABCDEF")
    ///             Text("ABCDEF")
    ///                 .tracking(3)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying three text views in a VStack, each reading
    /// "ABCDEF." The first applies negative tracking, the second applies no tracking,
    /// and the third applies positive tracking. The result is that the first
    /// renders incredibly tight spacing between letters, and the third has excess
    /// space between letters.](tracking.png)
    ///
    /// The code above uses an unusually large amount of tracking to make it
    /// easy to see the effect.
    ///
    /// The effect of tracking resembles that of the ``Text/kerning(_:)``
    /// modifier, but adds or removes trailing whitespace, rather than changing
    /// character offsets. Also, using any nonzero amount of tracking disables
    /// nonessential ligatures, whereas kerning attempts to maintain ligatures.
    ///
    /// - Important: If you add both the `tracking(_:)` and
    ///   ``Text/kerning(_:)`` modifiers to a view, the view applies the
    ///   tracking and ignores the kerning.
    ///
    /// - Parameter tracking: The amount of additional space, in points, that
    ///   the view should add to each character cluster after layout.
    ///
    /// - Returns: Text with the specified amount of tracking.
    public func tracking(_ tracking: CGFloat) -> Text { }

    /// Sets the vertical offset for the text relative to its baseline.
    ///
    /// Change the baseline offset to move the text in the view (in points) up
    /// or down relative to its baseline. The bounds of the view expand to
    /// contain the moved text.
    ///
    /// ```
    /// struct BaselineOffsetView: View {
    ///     var body: some View {
    ///         HStack(alignment: .center) {
    ///             Text("Hello")
    ///                 .baselineOffset(-10)
    ///                 .border(Color.red)
    ///             Text("Hello")
    ///                 .border(Color.green)
    ///             Text("Hello")
    ///                 .baselineOffset(10)
    ///                 .border(Color.blue)
    ///         }
    ///         .background(Color(white: 0.9))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying three text views in an HStack, each reading
    /// "Hello" with a grey background behind the whole stack. The first text
    /// has a negative offset applied, rendering it at the bottom of the grey
    /// background. The second has no offset applied, so it sits in the middle of the
    /// background. The third has a positive offset applied, rendering it at the top of
    /// the background.](baselineoffset-fixed.png)
    ///
    /// By drawing a border around each text view, you can see how the text
    /// moves, and how that affects the view.
    ///
    /// The first view, with a negative offset, grows downward to handle the
    /// lowered text. The last view, with a positive offset, grows upward. The
    /// enclosing ``HStack`` instance, shown in gray, ensures all the text views
    /// remain aligned at their top edge, regardless of the offset.
    ///
    /// - Parameter baselineOffset: The amount to shift the text vertically (up
    ///   or down) relative to its baseline.
    ///
    /// - Returns: Text that's above or below its baseline.
    public func baselineOffset(_ baselineOffset: CGFloat) -> Text { }
}

extension Text.DateStyle : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Text.DateStyle, b: Text.DateStyle) -> Bool { }
}

extension Text.DateStyle : Codable {

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws { }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text.TruncationMode : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text.TruncationMode : Hashable {
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text.Case : Equatable {
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text.Case : Hashable {
}

