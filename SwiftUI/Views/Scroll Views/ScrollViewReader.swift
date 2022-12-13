/// Creates programatic scrolling by ascribing a child defined as a function of a ``ScrollViewProxy``.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct ScrollViewReader<Content> : View where Content : View {

    /// A ViewBuilder closure that receives the ScrollViewProxy as a parameter
    public var content: (ScrollViewProxy) -> Content

    /// Initializes with the closure `content`. The proxy passed to the
    /// closure may NOT be messaged while `content` is executing (this
    /// will cause a runtime error) but only from actions created
    /// within `content` such as gesture handlers or the `onChange()`
    /// function.
    @inlinable public init(@ViewBuilder content: @escaping (ScrollViewProxy) -> Content) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

