/// An enum indicating available alignments for text that spans multiple-lines.
///
/// This is used in conjuction with ``View/multilineTextAlignment(_:)``, for example:
///
/// ![A screenshot of a text view displaying a multi-line string in the center of the screen in black text, aligned in the center of the frame.](B81ADC86-835C-4FED-BC53-B7E0F647CA60.png)
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Text("Gregor's eyes then turned to the window, and the overcast weather--he could hear raindrops hitting against the metal window ledge--completely depressed him.")
///             .padding(20)
///             .font(.system(size: 10))
///             .multilineTextAlignment(TextAlignment.center)
///     }
/// }
/// ```
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public enum TextAlignment : Hashable, CaseIterable {

      /// Aligns each line of the text to the leading edge, left in left-to-right languages,
      /// and right in right-to-left languages.
    ///
    /// For example:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("Gregor's eyes then turned to the window, and the overcast weather--he could hear raindrops hitting against the metal window ledge--completely depressed him.")
    ///             .padding(20)
    ///             .font(.system(size: 10))
    ///             .multilineTextAlignment(.leading)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a text view displaying a string in the center of the screen in black text, aligned on the left side of the frame.](textalignment-leading.png)
    ///
    case leading

    /// Aligns each line of the text with the center of the view.
    ///
    /// For example:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("Gregor's eyes then turned to the window, and the overcast weather--he could hear raindrops hitting against the metal window ledge--completely depressed him.")
    ///             .padding(20)
    ///             .font(.system(size: 10))
    ///             .multilineTextAlignment(.center)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a text view displaying a string in the center of the screen in black text, aligned in the center of the frame.](textalignment-center.png)
    ///
    case center

    /// Aligns each line of the text to the trailing edge, right in left-to-right languages,
    /// and left in right-to-left languages.
    ///
    /// For example:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("Gregor's eyes then turned to the window, and the overcast weather--he could hear raindrops hitting against the metal window ledge--completely depressed him.")
    ///             .padding(20)
    ///             .font(.system(size: 10))
    ///             .multilineTextAlignment(.trailing)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a text view displaying a string in the center of the screen in black text, aligned on the right side of the frame.](textalignment-trailing.png)
    ///
    case trailing

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: TextAlignment, b: TextAlignment) -> Bool { }

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) { }

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [TextAlignment]

    /// A collection of all values of this type.
    ///
    /// This will return an array of all available TextAlignment values:
    /// `.leading`, `.center`, and `.trailing`
    public static var allCases: [TextAlignment] { get }
}

