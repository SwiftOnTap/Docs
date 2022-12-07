/// A progress view that visually indicates its progress using a circular gauge.
///
/// Use this style to specify a circular "spinner" loading progress view. This
/// is usually best for indeterminant amounts of load time.
///
/// To illustrate, look at a ``ProgressView`` that uses the
/// ``ProgressView/init(value:total:)`` initializer. By default, it
/// is a linear load bar.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ProgressView(value: 0.75)
///     }
/// }
/// ```
///
/// ![A view containing a default progress view that displays as a gray loading
/// filled three quarters of the way with blue, as defined by the ProgressView
/// value being 0.75.](circularprogressview-1.png)
///
/// But when you apply `CircularProgressViewStyle`
/// with ``View/progressViewStyle(_:)``, it becomes a spinner:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ProgressView(value: 0.75)
///             .progressViewStyle(CircularProgressViewStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a default gray circular style progress view spinning.](progress-spinner-gray.gif)
///
/// You can also apply a tint to the spinner using
/// `CircularProgressViewStyle`'s ``CircularProgressViewStyle/init(tint:)``:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ProgressView(value: 0.75)
///             .progressViewStyle(CircularProgressViewStyle(tint: .orange))
///     }
/// }
/// ```
///
/// ![A gif displaying an orange circular style progress view spinning.](progress-spinner-orange-ex.gif)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct CircularProgressViewStyle : ProgressViewStyle {

    /// Creates a circular progress view style.
    ///
    /// Use this intitializer to create a ``CircularProgressViewStyle``.
    /// This allows you to style a ``ProgressView`` like a spinner,
    /// overriding any default styles:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView(value: 0.75)
    ///             .progressViewStyle(CircularProgressViewStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a gray circular style progress view spinning.](circularprogressviewstyle-example-1.gif)
    ///
    /// - Note: To give the spinner a tint color, use ``CircularProgressViewStyle/init(tint:)``
    /// instead.
    ///
    public init() { }

    /// Creates a circular progress view style with a tint color.
    ///
    /// Use this initializer to create a ``CircularProgressViewStyle``
    /// with a `tint` color:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView()
    ///             .progressViewStyle(CircularProgressViewStyle(tint: .orange))
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying an orange circular style progress view spinning.](progress-spinner-orange-ex.gif)
    ///
    public init(tint: Color) { }

    /// Creates a view representing the body of a progress view.
    ///
    /// - Parameter configuration: The properties of the progress view, such as
    ///  its preferred progress type.
    public func makeBody(configuration: CircularProgressViewStyle.Configuration) -> some View { }


    /// A view representing the body of a progress view.
    public typealias Body = some View
}

