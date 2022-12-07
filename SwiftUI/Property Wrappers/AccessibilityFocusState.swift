/// A property wrapper type that can read and write a value that SwiftUI updates
/// as the focus of any active accessibility technology, such as VoiceOver,
/// changes.
///
/// Use this capability to request that VoiceOver or other accessibility
/// technologies programmatically focus on a specific element, or to determine
/// whether VoiceOver or other accessibility technologies are focused on
/// particular elements. Use ``View/accessibilityFocused(_:equals:)`` or
/// ``View/accessibilityFocused(_:)`` in conjunction with this property
/// wrapper to identify accessibility elements for which you want to get
/// or set accessibility focus. When accessibility focus enters the modified accessibility element,
/// the framework updates the wrapped value of this property to match a given
/// prototype value. When accessibility focus leaves, SwiftUI resets the wrapped value
/// of an optional property to `nil` or the wrapped value of a Boolean property to `false`.
/// Setting the property's value programmatically has the reverse effect, causing
/// accessibility focus to move to whichever accessibility element is associated with the updated value.
///
///  In the example below, when `notification` changes, and its  `isPriority` property
///  is `true`, the accessibility focus moves to the notification `Text` element above the rest of the
///  view's content:
///
///     struct CustomNotification: Equatable {
///         var text: String
///         var isPriority: Bool
///     }
///
///     struct ContentView: View {
///         @Binding var notification: CustomNotification?
///         @AccessibilityFocusState var isNotificationFocused: Bool
///
///         var body: some View {
///             VStack {
///                 if let notification = self.notification {
///                     Text(notification.text)
///                         .accessibilityFocused($isNotificationFocused)
///                 }
///                 Text("The main content for this view.")
///             }
///             .onChange(of: notification) { notification in
///                 if (notification?.isPriority == true)  {
///                     isNotificationFocused = true
///                 }
///             }
///
///         }
///     }
///
/// To allow for cases where accessibility focus is completely absent from the
/// tree of accessibility elements, or accessibility technologies are not
/// active, the wrapped value must be either optional or Boolean.
///
/// Some initializers of `AccessibilityFocusState` also allow specifying
/// accessibility technologies, determining to which types of accessibility
/// focus this binding applies. If you specify no accessibility technologies,
/// SwiftUI uses an aggregate of any and all active accessibility technologies.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@propertyWrapper @frozen public struct AccessibilityFocusState<Value> : DynamicProperty where Value : Hashable {

    @propertyWrapper @frozen public struct Binding {

        /// The underlying value referenced by the bound property.
        public var wrappedValue: Value { get nonmutating set }

        /// The currently focused element.
        public var projectedValue: AccessibilityFocusState<Value>.Binding { get }
    }

    /// The current state value, taking into account whatever bindings might be
    /// in effect due to the current location of focus.
    ///
    /// When focus is not in any view that is bound to this state, the wrapped
    /// value will be `nil` (for optional-typed state) or `false` (for `Bool`-
    /// typed state).
    public var wrappedValue: Value { get nonmutating set }

    /// A projection of the state value that can be used to establish bindings between view content
    /// and accessibility focus placement.
    ///
    /// Use `projectedValue` in conjunction with
    /// ``SwiftUI/View/accessibilityFocused(_:equals:)`` to establish
    /// bindings between view content and accessibility focus placement.
    public var projectedValue: AccessibilityFocusState<Value>.Binding { get }

    /// Creates a new accessibility focus state for a Boolean value.
    public init() where Value == Bool { }

    /// Creates a new accessibility focus state for a Boolean value, using the accessibility
    /// technologies you specify.
    ///
    /// - Parameters:
    ///   - technologies: One of the available ``AccessibilityTechnologies``.
    public init(for technologies: AccessibilityTechnologies) where Value == Bool { }

    /// Creates a new accessibility focus state of the type you provide.
    public init<T>() where Value == T?, T : Hashable { }

    /// Creates a new accessibility focus state of the type and
    /// using the accessibility technologies you specify.
    ///
    /// - Parameter technologies: One or more of the available
    ///  ``AccessibilityTechnologies``.
    public init<T>(for technologies: AccessibilityTechnologies) where Value == T?, T : Hashable { }
}
