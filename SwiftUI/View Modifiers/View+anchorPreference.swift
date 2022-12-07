@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the value of a preference for a specified anchor.
    ///
    /// Anchor preferences are a type of view preference. Anchor
    /// preferences primarily pass layout data to the parent view, things
    /// like bounds and coordinates.
    ///
    /// If you are not familiar with view preferences, see
    /// [this article](https://swiftwithmajid.com/2020/01/15/the-magic-of-view-preferences-in-swiftui/)
    /// for more.
    ///
    /// For more info on anchor preferences specifically, see
    /// [this article](https://swiftwithmajid.com/2020/03/18/anchor-preferences-in-swiftui/).
    ///
    /// ```
    /// struct BoundsPreferenceKey: PreferenceKey {
    ///     typealias Value = Anchor<CGRect>?
    ///
    ///     static var defaultValue: Value = nil
    ///
    ///     static func reduce(value: inout Value, nextValue: () -> Value) {
    ///         value = nextValue()
    ///     }
    /// }
    ///
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("I have a box 📦 around me")
    ///             .anchorPreference(key: BoundsPreferenceKey.self, value: .bounds) { $0 }
    ///         .overlayPreferenceValue(BoundsPreferenceKey.self) { preferences in
    ///             GeometryReader { geometry in
    ///                 preferences.map {
    ///                     Rectangle()
    ///                         .stroke()
    ///                         .frame(
    ///                             width: geometry[$0].width,
    ///                             height: geometry[$0].height
    ///                         )
    ///                         .offset(
    ///                             x: geometry[$0].minX,
    ///                             y: geometry[$0].minY
    ///                         )
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a black rectangular border in the center of
    /// the screen with text reading "I have a box around me."](anchorpreference.png)
    ///
    /// - Parameters:
    ///   - key: The key type of the preference key.
    ///   - value: The anchor you provide to transform closure.
    ///   - transform: A closure that takes an existing preference value and anchor value,
    ///   and can update the existing preference with the given value.
    @inlinable public func anchorPreference<A, K>(key _: K.Type = K.self, value: Anchor<A>.Source, transform: @escaping (Anchor<A>) -> K.Value) -> some View where K : PreferenceKey { }

}

