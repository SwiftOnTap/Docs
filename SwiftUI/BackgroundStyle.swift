/// A style that looks solid white in light mode and solid black in dark mode.
///
/// Use this ``ShapeStyle`` to intelligently stroke and fill shapes based
/// on what color will look good against the current background.
///
/// In light mode, this will fill as solid white. In dark mode, it will fill
/// as solid black.
///
/// In the following example, the top circle is always invisible, since
/// it is filled the same color as the background.
///
/// ```
/// struct CircleOnButtomView: View {
///     var body: some View {
///         Circle()
///             .fill(BackgroundStyle())
///         Circle()
///     }
/// }
/// ```
///
/// ![A view containing two circles, one filled background style, making it
/// invisible, and the other with default black fill.](5D82A564-E230-45DB-8E6F-5D977044ACFC.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct BackgroundStyle {

    /// Creates a new background style.
    ///
    /// Use this to fill or stroke a shape. It will appear as solid white
    /// in light mode and solid black in dark mode.
    ///
    /// In the following example, the top circle is always invisible, since
    /// it is filled the same color as the background.
    ///
    /// ```
    /// struct CircleOnButtomView: View {
    ///     var body: some View {
    ///         Circle()
    ///             .fill(BackgroundStyle())
    ///         Circle()
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing two circles, one filled background style, making it
    /// invisible, and the other with default black fill.](5D82A564-E230-45DB-8E6F-5D977044ACFC.png)
    ///
    @inlinable public init() { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension BackgroundStyle : ShapeStyle {
}

