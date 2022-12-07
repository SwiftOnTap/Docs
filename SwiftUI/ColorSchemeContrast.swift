/// Options indicating whether the system uses standard or increased contrast
/// between the app's foreground and background colors.
///
/// The user sets the Increase Contrast option using the Settings app. Your app
/// cannot override the user's choice.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ColorSchemeContrast : CaseIterable, Equatable, Hashable {

    /// An option indicating that the system is using standard contrast between
    /// the app's foreground and background colors.
    case standard

    /// An option indicating that the system is using increased contrast between
    /// the app's foreground and background colors.
    case increased

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ColorSchemeContrast]

    /// A collection of all values of this type.
    public static var allCases: [ColorSchemeContrast] { get }
}

extension ColorSchemeContrast {

    /// Create a contrast from its UIAccessibilityContrast equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiAccessibilityContrast: UIAccessibilityContrast) { }
}
