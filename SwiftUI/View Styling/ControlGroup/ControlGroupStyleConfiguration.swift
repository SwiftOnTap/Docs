/// The properties of a control group.
@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ControlGroupStyleConfiguration {

    /// A type-erased content of a `ControlGroup`.
    public struct Content : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required ``View/body-swift.property`` property.
        public typealias Body = Never
    }

    /// A view that represents the content of the `ControlGroup`.
    public let content: ControlGroupStyleConfiguration.Content

    /// A type-erased label of a ``ControlGroup``.
    @available(iOS 16.0, macOS 13.0, *)
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required ``View/body-swift.property`` property.
        public typealias Body = Never
    }

    /// A view that provides the optional label of the ``ControlGroup``.
    @available(iOS 16.0, macOS 13.0, *)
    public let label: ControlGroupStyleConfiguration.Label
}
