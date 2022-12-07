/// AccessibilityActionKind denotes the type of action for an Accessibility Action to support.
///
/// This struct is almost always found as an input to the
/// ``View/accessibilityAction(_:_:)`` View modifier.
/// To learn more about delivering exceptional accessibility experiences,
/// see
/// [Delivering an Exceptional Accessibility Experience](https://developer.apple.com/documentation/uikit/accessibility_for_ios_and_tvos/delivering_an_exceptional_accessibility_experience)
/// or
/// [iOS Accessibility Tutorial](https://www.raywenderlich.com/4720178-ios-accessibility-tutorial-making-custom-controls-accessible).
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityActionKind : Equatable {

    /// The inferred accessibility action inherited from the view type.
    ///
    /// This constant will default to the accessibility action associated with the modified object.
    /// For example, a button, label, or text would all default to their unique accessibility behaviors.
    public static let `default`: AccessibilityActionKind

    /// A two finger scrub gesture performed while VoiceOver focus is on or inside the component.
    public static let escape: AccessibilityActionKind

    /// A double tap with two fingers while VoiceOver focus is on or inside the component.
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    @available(macOS, unavailable)
    public static let magicTap: AccessibilityActionKind

    /// Initialize an ``AccessibilityActionKind`` with the name of the action type.
    ///
    /// An example of an accessibility action name could be "Open address in Maps" or
    /// "Call Fred" where "Fred" is a string variable. When VoiceOver is on the iPhone
    /// will read this name to the user.
    public init(named name: Text) { }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AccessibilityActionKind, b: AccessibilityActionKind) -> Bool { }
}

/// A directional indicator you use when making an accessibility adjustment.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum AccessibilityAdjustmentDirection {

    /// Increment an adjustable component.
    ///
    /// VoiceOver generates this action when the component has a role of
    /// `adjustable` and the user places focus on it and swipes upward.
    case increment

    /// Decrement an adjustable component.
    ///
    /// VoiceOver generates this action when the component has a role of
    /// `adjustable` and the user places focus on it and swipes downward.
    case decrement

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AccessibilityAdjustmentDirection, b: AccessibilityAdjustmentDirection) -> Bool { }

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program; do not save hash values to use during a future execution.
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
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AccessibilityAdjustmentDirection : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AccessibilityAdjustmentDirection : Hashable {
}

/// A ``ViewModifier`` used to provide accessibility content.
///
/// The ``AccessibilityAttachmentModifier`` is most commonly found as the
/// modified content in an accessibility modifiers attached to a View.
/// See ``View/accessibilityAction(_:_:)`` for example usage. See
/// [Creating Accessible Views](https://developer.apple.com/documentation/swiftui/view/accessibility/creating_accessible_views?changes=_8)
/// for an example accessibility project.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityAttachmentModifier : ViewModifier {

    /// The type of view representing the body.
    public typealias Body = Never
}
