@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Sets the style for progress views in this view.
    ///
    /// Use this modifier to change the style of a progress view.
    /// To use it, you must pass a value of type ``ProgressViewStyle``.
    ///
    /// There are three default ``ProgressViewStyle``s:
    /// - ``DefaultProgressViewStyle`` - Uses the default style of the current
    /// progress view.
    /// - ``CircularProgressViewStyle`` - A "spinner" progress view style.
    /// - ``LinearProgressViewStyle`` -  A linear loading bar that fills
    /// from right to left.
    ///
    /// Create an instance of one of these styles and use `progressViewStyle(_:)`
    /// to apply it to a ``ProgressView``.
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             ProgressView(value: 0.25)
    ///                 .progressViewStyle(CircularProgressViewStyle(tint: .orange))
    ///         }
    ///     }
    ///
    /// [A gif displaying an orange circular style progress view spinning.](progress-spinner-orange-ex.gif)
    ///
    /// You can also create your own ``ProgressViewStyle``:
    ///
    ///     struct ShadowedProgressViews: View {
    ///         var body: some View {
    ///             VStack(spacing: 50) {
    ///                 ProgressView()
    ///                 ProgressView(value: 0.75)
    ///             }
    ///             .progressViewStyle(DarkBlueShadowProgressViewStyle())
    ///         }
    ///     }
    ///
    ///     struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             ProgressView(configuration)
    ///                 .shadow(color: Color(red: 0, green: 0, blue: 0.6),
    ///                         radius: 4.0, x: 1.0, y: 2.0)
    ///         }
    ///     }
    ///
    /// ![A gif showing a view with a VStack containing a ProgressView with a
    /// custom style; a circular gray progress spinner sits above a progress bar filled
    /// 75% by a dark blue bar with a dramatic shadow.](dark-blue-custom-progress-view-spinner-ex.gif)
    ///
    /// - Parameter style: The progress view style to use for this view.
    public func progressViewStyle<S>(_ style: S) -> some View where S : ProgressViewStyle { }

}

