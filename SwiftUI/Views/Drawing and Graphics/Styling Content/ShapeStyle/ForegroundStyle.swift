/// A ShapeStyle that shows the correct fill for the foreground based on the current
/// context.
///
/// For example, to create a square view with a `ForegroundStyle`:
///
/// ```
/// struct ForegroundStyleRectangle: View {
///     var body: some View {
///         Rectangle()
///             .fill(ForegroundStyle())
///             .frame(width: 150, height: 150)
///             .foregroundColor(Color.pink)
///     }
/// }
/// ```
///
/// ![ForegroundStyle Example 1](92E0E472-F416-4E15-A196-D4B90EFDF978.png)
///
/// Note:
/// - `ForegroundStyle` is typically the default ShapeStyle, so it is rare to explicitly need it.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ForegroundStyle {

    /// Creates a foreground style.
    ///
    /// For example, to create a square view with a `ForegroundStyle`:
    ///
    /// ```
    /// struct ForegroundStyleRectangle: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .fill(ForegroundStyle())
    ///             .frame(width: 150, height: 150)
    ///             .foregroundColor(Color.pink)
    ///     }
    /// }
    /// ```
    ///
    /// ![ForegroundStyle Example 1](92E0E472-F416-4E15-A196-D4B90EFDF978.png)
    ///
    @inlinable public init() { }
}

