/// A set of key modifiers that you can add to a gesture.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EventModifiers : OptionSet {

    /// The raw value.
    public let rawValue: Int

    /// Creates a new set from a raw value.
    ///
    /// - Parameter rawValue: The raw value with which to create the key
    ///   modifier.
    public init(rawValue: Int) { }

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
    public static let function: EventModifiers

    /// All possible modifier keys.
    public static let all: EventModifiers

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = EventModifiers

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = EventModifiers
}

