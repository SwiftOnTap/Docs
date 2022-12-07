/// A container view that arranges its child views in a grid that
/// grows horizontally, creating items only as needed.
///
/// The grid is "lazy," in that the grid view does not create items until
/// they are needed.
///
/// In the following example, a `ScrollView` contains a ``LazyHGrid`` that
/// consists of a horizontally-arranged grid of ``Text`` views, aligned to
/// the top of the scroll view. For each column in the grid, the top row shows
/// a Unicode code point from the "Smileys" group, and the bottom shows its
/// corresponding emoji.
///
/// ```
/// struct HorizontalEmojiView: View {
///     var rows: [GridItem] = Array(repeating: .init(.fixed(20)), count: 2)
///
///     var body: some View {
///         ScrollView(.horizontal) {
///             LazyHGrid(rows: rows, alignment: .top) {
///                 ForEach((0...79), id: \.self) {
///                     let codepoint = $0 + 0x1f600
///                     let codepointString = String(format: "%02X", codepoint)
///                     Text("\(codepointString)")
///                         .font(.footnote)
///                     let emoji = String(Character(UnicodeScalar(codepoint)!))
///                     Text("\(emoji)")
///                      .font(.largeTitle)
///                 }
///             }
///         }
///     }
/// }
/// ```
///
/// ![50E77E82-CB96-4841-B769-8B9D59F9DBE8](50E77E82-CB96-4841-B769-8B9D59F9DBE8.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LazyHGrid<Content> : View where Content : View {

    /// Creates a grid that grows horizontally, given the provided properties.
    ///
    /// The first parameter, rows, takes an array of ``GridItem``s.
    /// For more info on the types of grid items, check out that page.
    ///
    /// See ``PinnedScrollableViews`` for more on how to pin views in a lazy
    /// stack or grid.
    ///
    /// ```
    /// struct HorizontalEmojiView: View {
    ///     var rows: [GridItem] =
    ///             Array(repeating: .init(.fixed(20)), count: 2)
    ///
    ///     var body: some View {
    ///         ScrollView(.horizontal) {
    ///             LazyHGrid(rows: rows, alignment: .top) {
    ///                 ForEach((0...79), id: \.self) {
    ///                     let codepoint = $0 + 0x1f600
    ///                     let codepointString = String(format: "%02X", codepoint)
    ///                     Text("\(codepointString)")
    ///                         .font(.footnote)
    ///                     let emoji = String(Character(UnicodeScalar(codepoint)!))
    ///                     Text("\(emoji)")
    ///                      .font(.largeTitle)
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - rows: An array of grid items to size and position each column of
    ///    the grid.
    ///   - alignment: The alignment of the grid within its parent view.
    ///   - spacing: The spacing beween the grid and the next item in its
    ///   parent view.
    ///   - pinnedViews: Views to pin to the bounds of a parent scroll view.
    ///   - content: The content of the grid.
    public init(rows: [GridItem], alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

