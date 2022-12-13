@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Use this to transform the value of an existing anchor preference.
    ///
    /// - Parameters:
    ///   - key: The key type of the preference key.
    ///   - value: The anchor you provide to the transform closure.
    ///   - transform: A closure that takes an existing preference value and anchor value,
    ///   and can update the existing preference with the given value.
    @inlinable public func transformAnchorPreference<A, K>(key _: K.Type = K.self, value: Anchor<A>.Source, transform: @escaping (inout K.Value, Anchor<A>) -> Void) -> some View where K : PreferenceKey { }

}

