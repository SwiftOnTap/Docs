/// A progress view that visually indicates its progress using a horizontal bar.
///
/// When initializing a ``ProgressView`` with ``ProgressView/init(value:total:)``, the
/// ``DefaultProgressViewStyle`` will typically display a linear progress view style:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ProgressView(value: 0.5)
///     }
/// }
/// ```
///
/// ![A ProgressView displaying a gray loading bar filled halfway left to right
/// by blue, as defined by the ProgressView value being 0.5.](progressview.png)
///
/// A ``ProgressView`` initialized with ``ProgressView/init()``, on the
/// other hand, defaults to a "spinner" style:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ProgressView()
///     }
/// }
/// ```
///
/// ![A gif displaying a default gray circular style progress view spinning.](progress-spinner-gray.gif)
///
/// To turn it into a linear progress view, apply this style
/// with the ``View/progressViewStyle(_:)`` modifier:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ProgressView()
///             .progressViewStyle(LinearProgressViewStyle())
///     }
/// }
/// ```
///
/// ![A linear style progress view, displayed as a gray loading bar.](04B8FA7C-F4B6-4661-ADA4-16EA1E340EBD.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LinearProgressViewStyle : ProgressViewStyle {

    /// Creates a linear progress view style.
    ///
    /// Use this initializer to create a linear progress view style.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView()
    ///             .progressViewStyle(LinearProgressViewStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A linear style progress view, displayed as a gray loading bar.](linearprogressview-example-1.png)
    ///
    /// - Note: This style will use a default blue color for the loaded
    /// portion of the bar, and gray for the unload portion. To change
    /// the tint color, use ``LinearProgressViewStyle/init(tint:)``
    /// instead.
    ///
    public init() { }

    /// Creates a linear progress view style with a tint color.
    ///
    /// For example, to create a new ``ProgressView`` with this style:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView(value: 5, total: 10)
    ///             .progressViewStyle(LinearProgressViewStyle(tint: .orange))
    ///     }
    /// }
    /// ```
    ///
    /// ![A linear style ProgressView displaying a gray loading bar filled halfway left to right
    /// by orange, as defined by the ProgressView value being 5 and the total being 10.](linearprogress.png)
    ///
    @available(iOS, introduced: 14.0, deprecated: 100000.0, message: "Use ``View/tint(_)`` instead.")
    @available(macOS, introduced: 11.0, deprecated: 100000.0, message: "Use ``View/tint(_)`` instead.")
    @available(tvOS, introduced: 14.0, deprecated: 100000.0, message: "Use ``View/tint(_)`` instead.")
    @available(watchOS, introduced: 7.0, deprecated: 100000.0, message: "Use ``View/tint(_)`` instead.")
    public init(tint: Color) { }

    /// Creates a view representing the body of a progress view.
    ///
    /// - Parameter configuration: The properties of the progress view being
    ///   created.
    ///
    /// The view hierarchy calls this method for each progress view where this
    /// style is the current progress view style.
    ///
    /// - Parameter configuration: The properties of the progress view, such as
    ///  its preferred progress type.
    public func makeBody(configuration: LinearProgressViewStyle.Configuration) -> some View { }


    /// A view representing the body of a progress view.
    public typealias Body = some View
}

