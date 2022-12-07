/// A convenience property wrapper for observing and automatically unwrapping
/// state bindings from the focused view or one of its ancestors.
///
/// If multiple views publish bindings using the same key, the wrapped property
/// will reflect the value of the binding from the view closest to focus.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@propertyWrapper public struct FocusedBinding<Value> : DynamicProperty {

    /// A new property wrapper for the given key path.
    ///
    /// The value of the property wrapper is updated dynamically as focus
    /// changes and different published bindings go in and out of scope.
    ///
    /// - Parameter keyPath: The key path for the focus value to read.
    public init(_ keyPath: KeyPath<FocusedValues, Binding<Value>?>) { }

    /// The unwrapped value for the focus key given the current scope and state
    /// of the focused view hierarchy.
    @inlinable public var wrappedValue: Value? { get /*nonmutating set*/ }

    /// A binding to the optional value.
    ///
    /// The unwrapped value is `nil` when no focused view hierarchy has
    /// published a corresponding binding.
    public var projectedValue: Binding<Value?> { get }
}

