/// A selectability type that enables text selection by the person using your app.
///
/// Don't use this type directly. Instead, use ``TextSelectability/enabled``.
@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct EnabledTextSelectability : TextSelectability {

    /// A Boolean value that indicates whether the selectability type allows
    /// selection.
    ///
    /// Conforming types, such as ``EnabledTextSelectability`` and
    /// ``DisabledTextSelectability``, return `true` or `false` for this
    /// property as appropriate. SwiftUI expects this value for a given
    /// selectability type to be constant, unaffected by global state.
    public static let allowsSelection: Bool
}
