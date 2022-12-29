/// An efficient option set for the components of a date picker.
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DatePickerComponents : OptionSet {

    /// Displays hour and minute components based on the locale
    public static let hourAndMinute: DatePickerComponents

    /// Displays day, month, and year based on the locale
    public static let date: DatePickerComponents

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = DatePickerComponents

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = DatePickerComponents
}

