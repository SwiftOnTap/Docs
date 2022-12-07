/// A view that arranges children horizontally.
///
/// ``HStack`` is a horizontal stack of views. Unlike ``LazyHStack``, which only
/// renders the views when your app needs to display them onscreen, an `HStack`
/// renders the views all at once, regardless of whether they are on or offscreen.
/// Use the regular `HStack` when you have a small number of child views or don't
/// want the delayed rendering behavior of the "lazy" version.
///
///
///     struct ExampleView: View {
///         var body: some View {
///             HStack {
///                 Text("🍌🍌")
///                 Text("🍏🍏")
///                 Text("🍑🍑")
///             }
///         }
///     }
///
/// ![A view displaying an HStack composed of three text components, "🍌🍌", "🍏🍏", and "🍑🍑".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/hstack-example-1.png)
///
/// Modify your stack's alignment or spacing with the built in initializer.
///
///     struct ExampleView: View {
///         var body: some View {
///             HStack(alignment: .top, spacing: 32) {
///                 Text("🍌🍌")
///                 Text("🍏🍏")
///                 Text("🍑🍑")
///             }
///         }
///     }
///
///
/// ![A view displaying an HStack composed of three text components, "🍌🍌", "🍏🍏", and "🍑🍑", with spacing between them and top alignment.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/hstack-example-2.png)
///
/// Learn more about the properties of each alignment choice via the ``VerticalAlignment`` struct.
///
/// `HStack` uses a ``ViewBuilder`` to construct the content.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct HStack<Content> : View where Content : View {

    /// Creates a horizontal stack with the given spacing and vertical alignment.
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             HStack(alignment: .top, spacing: 32) {
    ///                 Text("🍌🍌")
    ///                 Text("🍏🍏")
    ///                 Text("🍑🍑")
    ///             }
    ///         }
    ///     }
    ///
    /// ![A view containing an HStack with top alignment, 32 point spacing, and
    /// the three text views "🍌🍌", "🍏🍏", and "🍑🍑".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/hstack-example-2.png)
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. This guide has
    ///     the same vertical screen coordinate for every child view.
    ///   - spacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - content: A view builder that creates the content of this stack.
    @inlinable public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

