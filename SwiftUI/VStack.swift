/// A view that arranges children vertically.
///
/// `VStack` is a vertical stack of views. Unlike ``LazyVStack``, which only
/// renders the views when your app needs to display them onscreen, a `VStack`
/// renders the views all at once, regardless of whether they are on or offscreen.
/// Use the regular `VStack` when you have a small number of child views or don't
/// want the delayed rendering behavior of the "lazy" version.
///
///     struct ExampleView: View {
///         var body: some View {
///             VStack {
///                 Text("🍌🍌")
///                 Text("🍏🍏")
///                 Text("🍑🍑")
///             }
///         }
///     }
///
/// ![A view containing a vertical stack of text views.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/vstack-example-1.png)
///
/// Modify your stack's alignment or spacing with the built in initializer.
///
///     struct ExampleView: View {
///         var body: some View {
///             VStack(spacing: 32) {
///                 Text("🍌🍌")
///                 Text("🍏🍏")
///                 Text("🍑🍑")
///             }
///         }
///     }
///
/// ![A view containing a vertical stack of text views with spacing between them.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/vstack-example-2.png)
///
/// Learn more about the properties of each alignment choice via the ``HorizontalAlignment`` struct.
///
/// ``VStack`` uses a ``ViewBuilder`` to construct the content.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct VStack<Content> : View where Content : View {

    /// Creates an instance with the given spacing and horizontal alignment.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. It has
    ///     the same horizontal screen coordinate for all children.
    ///   - spacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - content: A view builder that creates the content of this stack.
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

