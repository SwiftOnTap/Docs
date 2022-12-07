@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Modifies this view by binding its accessibility element's focus state to
    /// the given state value.
    ///
    /// - Parameters:
    ///   - binding: The state binding to register. When accessibility focus moves to the
    ///     accessibility element of the modified view, SwiftUI sets the bound value to the corresponding
    ///     match value. If you set the state value programmatically to the matching value, then
    ///     accessibility focus moves to the accessibility element of the modified view. SwiftUI sets
    ///     the value to `nil` if accessibility focus leaves the accessibility element associated with the
    ///     modified view, and programmatically setting the value to `nil` dismisses focus automatically.
    ///   - value: The value to match against when determining whether the
    ///     binding should change.
    /// - Returns: The modified view.
    public func accessibilityFocused<Value>(_ binding: AccessibilityFocusState<Value>.Binding, equals value: Value) -> some View where Value : Hashable { }


    /// Modifies this view by binding its accessibility element's focus state
    /// to the given boolean state value.
    ///
    /// - Parameter condition: The accessibility focus state to bind. When
    ///     accessibility focus moves to the accessibility element of the
    ///     modified view, the focus value is set to `true`.
    ///     If the value is set to `true` programmatically, then accessibility
    ///     focus will move to accessibility element of the modified view.
    ///     The value will be set to `false` if accessibility focus leaves
    ///     the accessibility element of the modified view,
    ///     and accessibility focus will be dismissed automatically if the
    ///     value is set to `false` programmatically.
    ///
    /// - Returns: The modified view.
    public func accessibilityFocused(_ condition: AccessibilityFocusState<Bool>.Binding) -> some View { }

}
