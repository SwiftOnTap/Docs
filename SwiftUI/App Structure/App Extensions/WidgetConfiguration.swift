/// A type that describes a widget's content.
@available(iOS 14.0, macOS 11.0, watchOS 9.0, *)
@available(tvOS, unavailable)
public protocol WidgetConfiguration {

    /// The type of widget configuration representing the body of
    /// this configuration.
    ///
    /// When you create a custom widget, Swift infers this type from your
    /// implementation of the required `body` property.
    associatedtype Body : WidgetConfiguration

    /// The content and behavior of this widget.
    var body: Self.Body { get }
}

@available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
@available(tvOS, unavailable)
extension WidgetConfiguration {

    /// Runs the given action when the system provides a background task.
    ///
    /// When the system wakes your app or extension for one or more background
    /// tasks, it will call any actions associated with matching tasks. When your
    /// async actions return, the system will put your app back into a suspended
    /// state. In Widget Extensions, this modifier can be used to handle URL Session
    /// background tasks with ``BackgroundTask/urlSession``.
    ///
    /// - Parameters:
    ///    - task: The type of task the action responds to.
    ///    - action: The closure that is called when the system provides
    ///      a task matching the provided task.
    public func backgroundTask<D, R>(_ task: BackgroundTask<D, R>, action: @escaping @Sendable (D) async -> R) -> some WidgetConfiguration where D : Sendable, R : Sendable

}
