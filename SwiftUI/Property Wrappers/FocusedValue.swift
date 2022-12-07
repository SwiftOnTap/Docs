/// A property wrapper for observing values from the focused view or one of its
/// ancestors.
///
/// If multiple views publish values using the same key, the wrapped property
///  will reflect the value from the view closest to focus.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@propertyWrapper public struct FocusedValue<Value> : DynamicProperty {

    /// A new property wrapper for the given key path.
    ///
    /// The value of the property wrapper is updated dynamically as focus
    /// changes and different published values go in and out of scope.
    ///
    /// - Parameter keyPath: The key path for the focus value to read.
    public init(_ keyPath: KeyPath<FocusedValues, Value?>) { }

    /// The value for the focus key given the current scope and state of the
    /// focused view hierarchy.
    ///
    /// Returns `nil` when nothing in the focused view hierarchy exports a
    /// value.
    @inlinable public var wrappedValue: Value? { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension FocusedValues : Equatable { }
