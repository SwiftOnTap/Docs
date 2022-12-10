/// Defines the implementation of all control groups within a view
/// hierarchy.
///
/// To configure the current `ControlGroupStyle` for a view hierarchy, use the
/// ``View/controlGroupStyle(_:)`` modifier.
@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol ControlGroupStyle {

    /// A view representing the body of a control group.
    associatedtype Body : View

    /// Creates a view representing the body of a control group.
    ///
    /// - Parameter configuration: The properties of the control group instance
    ///   being created.
    ///
    /// This method will be called for each instance of ``ControlGroup`` created
    /// within a view hierarchy where this style is the current
    /// `ControlGroupStyle`.
    @ViewBuilder @MainActor func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a `ControlGroup` instance being created.
    typealias Configuration = ControlGroupStyleConfiguration
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ControlGroupStyle where Self == NavigationControlGroupStyle {

    /// The navigation control group style.
    ///
    /// Use this style to group controls related to navigation, such as
    /// back/forward buttons or timeline navigation controls.
    ///
    /// The navigation control group style can vary by platform. On iOS, it
    /// renders as individual borderless buttons, while on macOS, it displays as
    /// a separated momentary segmented control.
    ///
    /// To apply this style to a control group or to a view that contains a
    /// control group, use the ``View/controlGroupStyle(_:)`` modifier.
    public static var navigation: NavigationControlGroupStyle { get }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ControlGroupStyle where Self == AutomaticControlGroupStyle {

    /// The default control group style.
    ///
    /// The default control group style can vary by platform. By default, both
    /// platforms use a momentary segmented control style that's appropriate for
    /// the environment in which it is rendered.
    ///
    /// You can override a control group's style. To apply the default style to
    /// a control group or to a view that contains a control group, use
    /// the ``View/controlGroupStyle(_:)`` modifier.
    public static var automatic: AutomaticControlGroupStyle { get }
}

