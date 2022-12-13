/// A set of key modifiers that you can add to a gesture.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EventModifiers : OptionSet {

    /// The Caps Lock key.
    public static let capsLock: EventModifiers

    /// The Shift key.
    public static let shift: EventModifiers

    /// The Control key.
    public static let control: EventModifiers

    /// The Option key.
    public static let option: EventModifiers

    /// The Command key.
    public static let command: EventModifiers

    /// Any key on the numeric keypad.
    public static let numericPad: EventModifiers

    /// The Function key.
    @available(iOS, deprecated: 15.0, message: "Function modifier is reserved for system applications")
    @available(macOS, deprecated: 12.0, message: "Function modifier is reserved for system applications")
    @available(tvOS, deprecated: 15.0, message: "Function modifier is reserved for system applications")
    @available(watchOS, deprecated: 8.0, message: "Function modifier is reserved for system applications")
    public static let function: EventModifiers

    /// All possible modifier keys.
    public static let all: EventModifiers

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = EventModifiers

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = EventModifiers
}

