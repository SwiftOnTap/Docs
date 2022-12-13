/// The properties of a progress view instance.
///
/// This is the type of the parameter in ``ProgressViewStyle``'s
/// one required function: ``ProgressViewStyle/makeBody(configuration:)``.
///
/// This structure comes with several properties for you to read
/// in that function:
/// - ``ProgressViewStyleConfiguration/fractionCompleted``
/// - ``ProgressViewStyleConfiguration/label``
/// - ``ProgressViewStyleConfiguration/currentValueLabel``
///
/// Here is an example of a custom style created by reading these values:
///
/// ```
/// struct ArcProgressViewStyle: ProgressViewStyle {
///     var color = Color.orange
///     var style = StrokeStyle(lineWidth: CGFloat(30), lineCap: .round)
///
///     func makeBody(configuration: ProgressViewStyleConfiguration) -> some View {
///         let frac = CGFloat(configuration.fractionCompleted ?? 0)
///
///         return ZStack {
///             VStack {
///                 configuration.label
///                 configuration.currentValueLabel
///             }
///             Circle()
///                 .trim(from: 0, to: frac)
///                 .stroke(color, style: style)
///                 .rotationEffect(.degrees(-90))
///         }
///     }
/// }
/// ```
///
/// You can then use the style on a ``ProgressView``:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ProgressView(value: 5, total: 10) {
///             Text("Progress is happening !🎡")
///         } currentValueLabel: {
///             Text("50% done")
///                 .font(.caption)
///         }
///         .progressViewStyle(ArcProgressViewStyle())
///     }
/// }
/// ```
///
/// ![A screenshot of a custom progress view that renders as an orange semicircle
/// occupying the right hand side of the screen with two text views at its center,
/// reading "Progress is happening!" and "50% done".](custom-progressview.png)
///
/// You can also just pass this property wholesale to ``ProgressView``'s
/// ``ProgressView/init(_:)-1a15a``:
///
///     struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
///         func makeBody(configuration: Configuration) -> some View {
///             ProgressView(configuration)
///                 .shadow(color: Color(red: 0, green: 0, blue: 0.6),
///                         radius: 4.0, x: 1.0, y: 2.0)
///         }
///     }
///
/// Then apply it to a ``ProgressView``:
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
/// ![A gif showing a view with a VStack containing a ProgressView with a
/// custom style; a circular gray progress spinner sits above a progress bar filled
/// 75% by a dark blue bar with a dramatic shadow.](dark-blue-custom-progress-view-spinner-ex.gif)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ProgressViewStyleConfiguration {

    /// A type-erased label describing the task represented by the progress
    /// view.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A type-erased label that describes the current value of a progress view.
    public struct CurrentValueLabel : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// The completed fraction of the task represented by the progress view,
    /// from `0.0` (not yet started) to `1.0` (fully complete), or `nil` if the
    /// progress is indeterminate.
    ///
    /// Use this property with ``ProgressViewStyle/makeBody(configuration:)``
    /// to read the completed fraction of the ``ProgressView``
    /// when creating a custom ``ProgressViewStyle``.
    ///
    /// ```
    /// struct ArcProgressViewStyle: ProgressViewStyle {
    ///     var color = Color.orange
    ///     var style = StrokeStyle(lineWidth: CGFloat(30), lineCap: .round)
    ///
    ///     func makeBody(configuration: ProgressViewStyleConfiguration) -> some View {
    ///         let frac = CGFloat(configuration.fractionCompleted ?? 0)
    ///
    ///         return Circle()
    ///             .trim(from: 0, to: frac)
    ///             .stroke(color, style: style)
    ///             .rotationEffect(.degrees(-90))
    ///     }
    /// }
    /// ```
    ///
    /// You can then use the style on a ``ProgressView``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView(value: 5, total: 10)
    ///             .progressViewStyle(ArcProgressViewStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a custom progress view that renders as an orange semicircle
    /// occupying the right hand side of the screen.](progressviestyle-fractioncompleted.png)
    ///
    public let fractionCompleted: Double?

    /// A view that describes the task represented by the progress view.
    ///
    /// If `nil`, then the task is self-evident from the surrounding context,
    /// and the style does not need to provide any additional description.
    ///
    /// If the progress view is defined using a `Progress` instance, then this
    /// label is equivalent to its `localizedDescription`.
    ///
    /// Use this property with ``ProgressViewStyle/makeBody(configuration:)``
    /// to read the `label` of the ``ProgressView``
    /// when creating a custom ``ProgressViewStyle``.
    ///
    /// ```
    /// struct BigTitleViewStyle: ProgressViewStyle {
    ///     func makebody(configuration: ProgressViewStyleConfiguration) -> some View {
    ///         VStack {
    ///             configuration.label
    ///                 .font(.title)
    ///             ProgressView(value: configuration.fractionCompleted)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// You can then use the style on a ``ProgressView``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView(value: 5, total: 10) {
    ///             Text("Progress is happening !🎡")
    ///         }
    ///         .progressViewStyle(BigTitleViewStyle)
    ///     }
    /// }
    /// ```
    ///
    /// ![](bigtitlelabelstyle.png)
    public var label: ProgressViewStyleConfiguration.Label?

    /// A view that describes the current value of a progress view.
    ///
    /// If `nil`, then the value of the progress view is either self-evident
    /// from the surrounding context or unknown, and the style does not need to
    /// provide any additional description.
    ///
    /// If the progress view is defined using a `Progress` instance, then this
    /// label is equivalent to its `localizedAdditionalDescription`.
    ///
    /// Use this property with ``ProgressViewStyle/makeBody(configuration:)``
    /// to read the completed fraction of the ``ProgressView``
    /// when creating a custom ``ProgressViewStyle``.
    ///
    /// ```
    /// struct ArcProgressViewStyle: ProgressViewStyle {
    ///     var color = Color.orange
    ///     var style = StrokeStyle(lineWidth: CGFloat(30), lineCap: .round)
    ///
    ///     func makeBody(configuration: ProgressViewStyleConfiguration) -> some View {
    ///         let frac = CGFloat(configuration.fractionCompleted ?? 0)
    ///
    ///         return ZStack {
    ///             VStack {
    ///                 configuration.label
    ///                 configuration.currentValueLabel
    ///             }
    ///             Circle()
    ///                 .trim(from: 0, to: frac)
    ///                 .stroke(color, style: style)
    ///                 .rotationEffect(.degrees(-90))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// You can then use the style on a ``ProgressView``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView(value: 5, total: 10) {
    ///             Text("Progress is happening !🎡")
    ///         } currentValueLabel: {
    ///             Text("50% done")
    ///                 .font(.caption)
    ///         }
    ///         .progressViewStyle(ArcProgressViewStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a custom progress view that renders as an orange semicircle
    /// occupying the right hand side of the screen with two text views at its center,
    /// reading "Progress is happening!" and "50% done".](custom-progressview.png)
    ///
    public var currentValueLabel: ProgressViewStyleConfiguration.CurrentValueLabel?
}
