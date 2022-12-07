/// The navigation control group style.
///
/// You can also use ``ControlGroupStyle/navigation`` to construct this style.
@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct NavigationControlGroupStyle : ControlGroupStyle {

    /// Creates a navigation control group style.
    public init() { }

    /// Creates a view representing the body of a control group.
    ///
    /// - Parameter configuration: The properties of the control group instance
    ///   being created.
    ///
    /// This method will be called for each instance of ``ControlGroup`` created
    /// within a view hierarchy where this style is the current
    /// `ControlGroupStyle`.
    @MainActor public func makeBody(configuration: NavigationControlGroupStyle.Configuration) -> some View { }


    /// A view representing the body of a control group.
    public typealias Body = some View
}
