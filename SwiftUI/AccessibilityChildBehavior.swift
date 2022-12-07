/// Defines the children's behavior of accessibility elements.
///
/// See
/// [Accessibility in SwiftUI](https://swiftwithmajid.com/2019/09/10/accessibility-in-swiftui/)
/// for more information on implementing accessibility functionality.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityChildBehavior : Hashable { }

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AccessibilityChildBehavior {

    /// Child accessibility elements are ignored
    public static let ignore: AccessibilityChildBehavior

    /// Any child accessibility elements become children of the new
    /// accessibility element
    public static let contain: AccessibilityChildBehavior

    /// Combine any child accessibility element's properties for the
    /// new accessibility element
    public static let combine: AccessibilityChildBehavior
}
