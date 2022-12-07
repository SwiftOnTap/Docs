/// Indicates the type of color scheme, such as Dark Mode.
///
/// The color scheme enumerates the user setting options for Light or Dark Mode.
/// It also provides the light or dark options for any particular view when the
/// app wants to override the user setting.
///
/// Color scheme has two cases:
/// - ``ColorScheme/light``
/// - ``ColorScheme/dark``
///
/// These can be applied using either the ``View/colorScheme(_:)`` modifier,
/// which automatically sets the ``ColorScheme`` for the ``View``, or the
/// ``View/preferredColorScheme(_:)`` modifier, which is overridden by
/// declarations of ``View/preferredColorScheme(_:)`` higher up in the ``View``
/// hierarchy.
///
/// A light mode effect, with a light background and darker text, can be achieved
/// using the `.light` case. For example:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Text("Dark🖤 or Light🤍 Mode?")
///             .preferredColorScheme(ColorScheme.light)
///     }
/// }
/// ```
///
/// ![A view containing a VStack with a textview reading "Dark🖤 or Light🤍 Mode?"
/// and the colorscheme is set to light, making the background white and the
/// text black.](color-scheme-light-ex.png)
///
/// A dark mode effect, with a dark background and lighter text, can be achieved
/// using the `.dark` case. For example:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Text("Dark🖤 or Light🤍 Mode?")
///             .preferredColorScheme(ColorScheme.dark)
///     }
/// }
/// ```
///
/// ![A view containing a VStack with a textview reading "Dark🖤 or Light🤍 Mode?"
/// and the colorscheme is set to dark, making the background black and the
/// text white.](color-scheme-dark-ex.png)
///
/// These `ColorScheme`s can also be used in ``EnvironmentValues/colorScheme``.
/// Take this example, where different ``Text`` renders depending on the system's
/// current color scheme setting:
///
/// ```
/// struct ContentView: View {
///     @Environment(\.colorScheme) var scheme
///
///     var body: some View {
///         Text(scheme == ColorScheme.light ? "Light 🤍" : "Dark 🖤")
///     }
/// }
/// ```
///
/// ![A gif displaying a light mode view reading "Light 🤍" that changes to a
/// dark mode view reading "Dark 🖤" when dark mode is turned on in the phone
/// settings; the view uses EnvironmentValues toe nable this reaction.](color-scheme-ex2.gif)
///

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ColorScheme : CaseIterable {

    /// The color scheme referring to light mode in a device.
    ///
    /// This ``ColorScheme`` can be applied using either the ``View/colorScheme(_:)`` modifier,
    /// which automatically sets the ``ColorScheme`` for the ``View``, or the
    /// ``View/preferredColorScheme(_:)`` modifier, which is overridden by
    /// declarations of ``View/preferredColorScheme(_:)`` higher up in the ``View``
    /// hierarchy. For example:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("Dark🖤 or Light🤍 Mode?")
    ///             .colorScheme(.light)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with a textview reading "Dark🖤 or Light🤍 Mode?"
    /// and the colorscheme is set to light, making the background white and the
    /// text black.](color-scheme-light-ex.png)
    ///
    case light

    /// The color scheme referring to dark mode in a device.
    ///
    /// This ``ColorScheme`` can be applied using either the ``View/colorScheme(_:)`` modifier,
    /// which automatically sets the ``ColorScheme`` for the ``View``, or the
    /// ``View/preferredColorScheme(_:)`` modifier, which is overridden by
    /// declarations of ``View/preferredColorScheme(_:)`` higher up in the ``View``
    /// hierarchy. For example:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("Dark🖤 or Light🤍 Mode?")
    ///             .colorScheme(.dark)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with a textview reading "Dark🖤 or Light🤍 Mode?"
    /// and the colorscheme is set to dark, making the background black and the
    /// text white.](color-scheme-dark-ex.png)
    ///
    case dark

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ColorScheme, b: ColorScheme) -> Bool { }

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
    public typealias AllCases = [ColorScheme]

    /// A collection of all values of this type.
    public static var allCases: [ColorScheme] { get }
}

extension ColorScheme {

    /// Create a color scheme from its UIUserInterfaceStyle equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiUserInterfaceStyle: UIUserInterfaceStyle) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorScheme : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorScheme : Hashable {
}

