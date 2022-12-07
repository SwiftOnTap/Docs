/// The properties of a ``GroupBox`` instance being created.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct GroupBoxStyleConfiguration {

    /// A type-erased label of a ``GroupBox``.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A type-erased content of a ``GroupBox``.
    public struct Content : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A view that describes the ``GroupBox``.
    public let label: GroupBoxStyleConfiguration.Label

    /// A view that represents the content of the ``GroupBox``.
    public let content: GroupBoxStyleConfiguration.Content
}

