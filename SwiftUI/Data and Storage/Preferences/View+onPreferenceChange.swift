@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an action to perform when the specified preference key's value
    /// changes.
    ///
    /// - Parameters:
    ///   - key: The key to monitor for value changes.
    ///   - action: The action to perform when the value for `key` changes. The
    ///     `action` closure passes the new value as its parameter.
    ///
    /// - Returns: A view that triggers `action` when the value for `key`
    ///   changes.
    @inlinable public func onPreferenceChange<K>(_ key: K.Type = K.self, perform action: @escaping (K.Value) -> Void) -> some View where K : PreferenceKey, K.Value : Equatable { }

}

