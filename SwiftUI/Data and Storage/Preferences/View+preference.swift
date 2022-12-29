@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets a value for the given preference.
    ///
    /// This ``View`` modifier is used to set the value for a particular preference.
    /// `preference(key:value:)` takes two parameters, `key`, which states the relevant
    /// ``PreferenceKey`` type and `value`, the new value for the given preference.
    ///
    ///
    /// - Parameters:
    ///   - key: The type of ``PreferenceKey`` being set.
    ///   - value: The new content of the key.
    @inlinable public func preference<K>(key: K.Type = K.self, value: K.Value) -> some View where K : PreferenceKey { }

}

