@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Uses the specified preference value from the view to produce another
    /// view as an overlay atop the first view.
    @inlinable public func overlayPreferenceValue<Key, T>(_ key: Key.Type = Key.self, @ViewBuilder _ transform: @escaping (Key.Value) -> T) -> some View where Key : PreferenceKey, T : View { }


    /// Places a new view in the background of the first view, using the values from
    /// the preferences.
    ///
    /// This creates a new view, placed in the background, using the view preferences from the parent.
    /// This will not affect the layout of other views. Using backgroundPreferenceValue
    /// is one of 3 ways for responding to view preferences. For information on
    /// the other ways, see:
    /// - ``View/overlayPreferenceValue(_:_:)``
    /// - ``View/onPreferenceChange(_:_:)``
    ///
    /// For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Text("Bullseye")
    ///             .preference(key: CustomPreferenceKey.self, value: Color.red)
    ///             .backgroundPreferenceValue(CustomPreferenceKey.self) { PreferenceKey in
    ///                 Circle().fill(PreferenceKey)
    ///         }
    ///     }
    /// }
    ///
    /// struct CustomPreferenceKey: PreferenceKey {
    ///     static var defaultValue = Color.clear
    ///
    ///     static func reduce(value: inout Color, nextValue: () -> Color) {
    ///         value = nextValue()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view that reads "Bullseye" with a small
    /// red circle in its background.](backgroundpreference-example-1.png)
    ///
    @inlinable public func backgroundPreferenceValue<Key, T>(_ key: Key.Type = Key.self, @ViewBuilder _ transform: @escaping (Key.Value) -> T) -> some View where Key : PreferenceKey, T : View { }

}

