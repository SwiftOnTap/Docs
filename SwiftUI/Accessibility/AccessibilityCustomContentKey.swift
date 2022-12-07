/// Key used to specify the identifier and label associated with
/// an entry of additional accessibility information.
///
/// Use `AccessibilityCustomContentKey` and the associated modifiers taking
/// this value as a parameter in order to simplify clearing or replacing
/// entries of additional information that are manipulated from multiple places
/// in your code.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct AccessibilityCustomContentKey {

    /// Create an `AccessibilityCustomContentKey` with the specified label and
    /// identifier.
    ///
    /// - Parameter label: Localized text describing to the user what
    ///   is contained in this additional information entry. For example:
    ///   "orientation".
    /// - Parameter id: String used to identify the additional information entry
    ///   to SwiftUI. Adding an entry will replace any previous value with the
    ///   same identifier.
    public init(_ label: Text, id: String) { }

    /// Create an `AccessibilityCustomContentKey` with the specified label and
    /// identifier.
    ///
    /// - Parameter labelKey: Localized text describing to the user what
    ///   is contained in this additional information entry. For example:
    ///   "orientation".
    /// - Parameter id: String used to identify the additional
    ///   information entry to SwiftUI. Adding an entry will replace any previous
    ///   value with the same identifier.
    public init(_ labelKey: LocalizedStringKey, id: String) { }

    /// Create an `AccessibilityCustomContentKey` with the specified label.
    ///
    /// - Parameter labelKey: Localized text describing to the user what
    ///   is contained in this additional information entry. For example:
    ///   "orientation". This will also be used as the identifier.
    public init(_ labelKey: LocalizedStringKey) { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension AccessibilityCustomContentKey : Equatable { }
