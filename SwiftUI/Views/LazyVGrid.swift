/// A container view that arranges its child views in a grid that
/// grows vertically, creating items only as needed.
///
/// The grid is "lazy," in that the grid view does not create items until
/// they are needed.
///
/// In the following example, a ``ScrollView`` contains a
/// `LazyVGrid` consisting of a two-column grid of ``Text`` views, showing
/// Unicode code points from the "Smileys" group and their corresponding emoji:
///
/// ```
/// struct EmojiGridView: View {
///     var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
///
///     var body: some View {
///         ScrollView {
///             LazyVGrid(columns: columns) {
///                 ForEach((0...79), id: \.self) {
///                     let codepoint = $0 + 0x1f600
///                     let codepointString = String(format: "%02X", codepoint)
///                     Text("\(codepointString)")
///                     let emoji = String(Character(UnicodeScalar(codepoint)!))
///                     Text("\(emoji)")
///                 }
///             }.font(.largeTitle)
///         }
///     }
/// }
/// ```
///
/// ![D3F809F0-9891-47DC-8E95-99160DC1B7F5](D3F809F0-9891-47DC-8E95-99160DC1B7F5.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LazyVGrid<Content> : View where Content : View {

    /// Creates a grid that grows vertically, given the provided properties.
    ///
    /// See ``PinnedScrollableViews`` for more on how to pin views in a lazy
    /// stack or grid.
    ///
    /// ```
    /// struct EmojiGridView: View {
    ///     var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    ///
    ///     var body: some View {
    ///         ScrollView {
    ///             LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
    ///                 ForEach((0...79), id: \.self) {
    ///                     let codepoint = $0 + 0x1f600
    ///                     let codepointString = String(format: "%02X", codepoint)
    ///                     Text("\(codepointString)")
    ///                     let emoji = String(Character(UnicodeScalar(codepoint)!))
    ///                     Text("\(emoji)")
    ///                 }
    ///             }
    ///             .font(.largeTitle)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![D3F809F0-9891-47DC-8E95-99160DC1B7F5](D3F809F0-9891-47DC-8E95-99160DC1B7F5.png)
    ///
    /// - Parameters:
    ///   - columns: An array of grid items to size and position each row of
    ///    the grid.
    ///   - alignment: The alignment of the grid within its parent view.
    ///   - spacing: The spacing beween the grid and the next item in its
    ///   parent view.
    ///   - pinnedViews: Views to pin to the bounds of a parent scroll view.
    ///   - content: The content of the grid.
    public init(columns: [GridItem], alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

