/// An empty widget configuration.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@frozen public struct EmptyWidgetConfiguration : WidgetConfiguration {

    /// Creates an empty widget configuration.
    @inlinable public init() { }

    /// The type of widget configuration representing the body of
    /// this configuration.
    ///
    /// When you create a custom widget, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

