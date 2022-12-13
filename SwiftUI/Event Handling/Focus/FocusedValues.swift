/// A collection of state exported by the focused view and its ancestors.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct FocusedValues {

    /// Reads and writes values associated with a given environment key.
    ///
    /// Setting has no effect if the current focus scope already contains a
    /// value for the key.
    public subscript<Key>(key: Key.Type) -> Key.Value? where Key : FocusedValueKey
}

