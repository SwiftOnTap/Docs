/// A view that arranges its children in a line that grows vertically,
/// creating items only as needed.
///
/// The stack is "lazy," in that the stack view doesn't create items until
/// it needs to render them onscreen.
///
/// In the following example, a ``ScrollView`` contains a ``LazyVStack`` that
/// consists of a vertical row of text views. The stack aligns to the
/// leading edge of the scroll view, and uses default spacing between the
/// text views.
///
/// ```
/// struct RowNumbersView: View {
///     var body: some View {
///         ScrollView {
///             LazyVStack(alignment: .leading) {
///                 ForEach(1...100, id: \.self) { number in
///                     Text("Row \(number)")
///                 }
///             }
///         }
///     }
/// }
/// ```
///
/// ![0DBD3AFE-572F-4451-92F1-10BFB3126933](0DBD3AFE-572F-4451-92F1-10BFB3126933.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LazyVStack<Content> : View where Content : View {

    /// Creates a lazy vertical stack view with the given spacing,
    /// vertical alignment, pinning behavior, and content.
    ///
    /// See ``PinnedScrollableViews`` for more on how to pin views in a lazy
    /// stack or grid.
    ///
    /// ```
    /// struct RowNumbersView: View {
    ///     var body: some View {
    ///         ScrollView {
    ///             LazyVStack(alignment: .leading) {
    ///                 ForEach(1...100, id: \.self) { number in
    ///                     Text("Row \(number)")
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![0DBD3AFE-572F-4451-92F1-10BFB3126933](0DBD3AFE-572F-4451-92F1-10BFB3126933.png)
    ///
    /// - Parameters:
    ///     - alignment: The guide for aligning the subviews in this stack. All
    ///     child views have the same horizontal screen coordinate.
    ///     - spacing: The distance between adjacent subviews, or `nil` if you
    ///       want the stack to choose a default distance for each pair of
    ///       subviews.
    ///     - pinnedViews: The kinds of child views that will be pinned.
    ///     - content: A view builder that creates the content of this stack.
    public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

