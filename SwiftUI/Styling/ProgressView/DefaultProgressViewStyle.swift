/// The default progress view style in the current context of the view being
/// styled.
///
/// Use this style to specify the default style for a ``ProgressView``.
/// The style depends on the type of progress view that is being
/// initialized. For example:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ProgressView()
///             .progressViewStyle(DefaultProgressViewStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a default gray circular style progress view spinning.](progress-spinner-gray.gif)
///
/// In this instance, the style displays a spinner. However, if we initialize
/// the ``ProgressView`` using ``ProgressView/init(value:total:)`` instead,
/// we get a different look:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ProgressView(value: 5, total: 10)
///             .progressViewStyle(DefaultProgressViewStyle())
///     }
/// }
/// ```
///
/// ![A screenshot of a view displaying a gray progress bar in the center of
/// the screen, spanning the width of the screen with empty space on either side.
/// The progress bar is at half capacity, denoted by a blue fill from the left
/// side to the center.](default-progress-view-style-ex2.png)
///
/// - Note: This style does not need to be specified explicitly unless
/// you would like to override a style from higher up in the view hierarchy.
/// This style is used if no others are specified.
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct DefaultProgressViewStyle : ProgressViewStyle {

    /// Creates a default progress view style.
    ///
    /// Use this initializer to create a ``DefaultProgressViewStyle``.
    /// It is the only initializer of the structure, and takes no parameters:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView()
    ///             .progressViewStyle(DefaultProgressViewStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a default gray circular style progress view spinning.](progress-spinner-gray.gif)
    ///
    public init() { }

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
    public func makeBody(configuration: DefaultProgressViewStyle.Configuration) -> some View { }


    /// A view representing the body of a progress view.
    public typealias Body = some View
}

