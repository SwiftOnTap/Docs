/// An animated loading bar or "spinner" shown when an ongoing task has started but is not yet complete
///
/// A progress view is a combination of
/// [`UIProgressView`](https://developer.apple.com/documentation/uikit/uiprogressview)
/// and
/// [`UIActivityIndicatorView`](https://developer.apple.com/documentation/uikit/uiactivityindicatorview)
/// from
/// [UIKit](https://developer.apple.com/documentation/uikit).
/// When initialized without
/// arguments, it resembles a “spinner”.
///
///     struct ContentView: View {
///         var body: some View {
///             ProgressView()
///         }
///     }
///
/// ![A gif displaying a default gray circular style progress view spinning.](progress-spinner-gray.gif)
///
/// When initialized with a value `ProgressView` looks like a
/// loading bar that fills up from left to right.
///
///     struct ContentView: View {
///         var body: some View {
///             ProgressView(value: 0.5)
///         }
///     }
///
/// ![A ProgressView displaying a gray loading bar filled halfway left to right
/// by blue, as defined by the ProgressView value being 0.5.](progressview.png)
///
/// `ProgressView` has many custom initializers, differing in the **label**
/// type and whether it is a **spinner** or a **linear** progress bar. Explore
/// them in the sidebar.
///
/// ### Styling Progress Views
///
/// You can customize the appearance and interaction of progress views
/// by creating styles that conform to the ``ProgressViewStyle``
/// protocol. To set a specific style for all progress view instances
/// within a view, use the ``View/progressViewStyle(_:)`` modifier.
/// In the following example, a custom style adds a dark blue shadow
/// to all progress views within the enclosing ``VStack``:
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
///
/// ![A gif showing a view with a VStack containing a ProgressView with a
/// custom style; a circular gray progress spinner sits above a progress bar filled
/// 75% by a dark blue bar with a dramatic shadow.](dark-blue-custom-progress-view-spinner-ex.gif)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ProgressView<Label, CurrentValueLabel> : View where Label : View, CurrentValueLabel : View {

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressView where CurrentValueLabel == EmptyView {

    /// Creates a progress spinner.
    ///
    /// Use this initializer to create a ``ProgressView`` with
    /// a loading spinner.
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
    public init() where Label == EmptyView { }

    /// Creates a progress spinner from a custom label.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView {
    ///             Text("We're working on it 🏃‍♀️")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a gray progress spinner with a custom label underneath it
    /// that reads "We're working on it" as rendered by passing the label to the intializer.](progress-spinner-runner.gif)
    ///
    ///
    /// ```
    /// struct CounterView: View {
    ///     var body: some View {
    ///         VStack(spacing: 70) {
    ///             ProgressView {
    ///                 Text("We're working on it 🏃‍♀️")
    ///             }
    ///
    ///             ProgressView("waiting…")
    ///                 .font(.system(size: 30))
    ///
    ///             ProgressView("Uploading…")
    ///                 .font(.title)
    ///                 .foregroundColor(.red)
    ///
    ///             ProgressView("Downloading…")
    ///                 .tint(.orange)
    ///                 .scaleEffect(2)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    ///
    /// ![A gif displaying a gray progress spinner with a custom label underneath it that reads "We're working on it" as rendered by passing the label to the
    ///  intializer.](progress-spinner-runner-custom.gif)
    ///
    ///
    /// - Parameters:
    ///     - label: A view builder that creates a view that describes the task
    ///       in progress.
    public init(@ViewBuilder label: () -> Label) { }

    /// Creates a progress spinner from a localized string key title.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:tableName:bundle:comment:)``. See
    /// ``Text`` for more information about localizing strings. To initialize a
    /// indeterminate progress view with a string variable, use
    /// the corresponding initializer that takes a `StringProtocol` instance.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let title = LocalizedStringKey("We're working on it 🏃‍♀️")
    ///
    ///     var body: some View {
    ///         ProgressView(title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a gray progress spinner with a custom label underneath it
    /// that reads "We're working on it" as rendered by passing the localized
    /// string key label to the initializer.](progress-spinner-runner.gif)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the progress view's localized title that
    ///       describes the task in progress.
    public init(_ titleKey: LocalizedStringKey) where Label == Text { }

    /// Creates a progress spinner from a string title.
    ///
    /// - Parameters:
    ///     - title: A string that describes the task in progress.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// title similar to ``Text/init(verbatim:)``. See ``Text`` for more
    /// information about localizing strings. To initialize a progress view with
    /// a localized string key, use the corresponding initializer that takes a
    /// ``LocalizedStringKey`` instance.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let title = "We're working on it 🏃‍♀️"
    ///
    ///     var body: some View {
    ///         ProgressView(title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a gray progress spinner with a custom label underneath it
    /// that reads "We're working on it" as rendered by passing the
    /// string label to the initializer.](progress-spinner-runner.gif)
    ///
    public init<S>(_ title: S) where Label == Text, S : StringProtocol { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressView {

    /// Creates a progress bar from a value and a total.
    ///
    /// If the value is non-`nil`, but outside the range of `0.0` through
    /// `total`, the progress view pins the value to those limits, rounding to
    /// the nearest possible bound. A value of `nil` represents indeterminate
    /// progress, in which case the progress view ignores `total`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView(value: 1.0, total: 2.0)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blue progress bar across the center of the
    /// screen which shows 50% fill, as rendered by passing a value of 1 out of a
    /// total 2 to the ProgressView initializer.](progressview-init.png)
    ///
    /// - Parameters:
    ///     - value: The completed amount of the task to this point, in a range
    ///       of `0.0` to `total`, or `nil` if the progress is indeterminate.
    ///     - total: The full amount representing the complete scope of the
    ///       task, meaning the task is complete if `value` equals `total`. The
    ///       default value is `1.0`.
    public init<V>(value: V?, total: V = 1.0) where Label == EmptyView, CurrentValueLabel == EmptyView, V : BinaryFloatingPoint { }

    /// Creates a progress bar from a value, a total, and a custom label.
    ///
    /// If the value is non-`nil`, but outside the range of `0.0` through
    /// `total`, the progress view pins the value to those limits, rounding to
    /// the nearest possible bound. A value of `nil` represents indeterminate
    /// progress, in which case the progress view ignores `total`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView(value: 1.0, total: 2.0) {
    ///             Text("We are halfway done 🌗")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blue progress bar across the center of the
    /// screen which shows 50% fill, as rendered by passing a value of 1 out of a
    /// total 2 to the ProgressView initializer. The custom label above it reads
    /// "We are halfway done."](200-tasks-fixed.png)
    ///
    /// - Parameters:
    ///     - value: The completed amount of the task to this point, in a range
    ///       of `0.0` to `total`, or `nil` if the progress is indeterminate.
    ///     - total: The full amount representing the complete scope of the
    ///       task, meaning the task is complete if `value` equals `total`. The
    ///       default value is `1.0`.
    ///     - label: A view builder that creates a view that describes the task
    ///       in progress.
    public init<V>(value: V?, total: V = 1.0, @ViewBuilder label: () -> Label) where CurrentValueLabel == EmptyView, V : BinaryFloatingPoint { }

    /// Creates a progress bar from a value, a total, a custom label, and
    /// a custom label for the current value.
    ///
    /// If the value is non-`nil`, but outside the range of `0.0` through
    /// `total`, the progress view pins the value to those limits, rounding to
    /// the nearest possible bound. A value of `nil` represents indeterminate
    /// progress, in which case the progress view ignores `total`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView(value: 1.0, total: 2.0) {
    ///             Text("We are halfway done 🌗")
    ///                 .font(.title2)
    ///         } currentValueLabel: {
    ///             Text("100 of 200 tasks")
    ///                 .font(.title2)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blue progress bar across the center of the
    /// screen which shows 50% fill, as rendered by passing a value of 1 out of a
    /// total 2 to the ProgressView initializer. The custom label above it reads
    /// "We are halfway done" while the current value label below it reads
    /// "100 of 200 tasks" in light gray text.](progressview-init-3-fixed.png)
    ///
    /// - Parameters:
    ///     - value: The completed amount of the task to this point, in a range
    ///       of `0.0` to `total`, or `nil` if the progress is indeterminate.
    ///     - total: The full amount representing the complete scope of the
    ///       task, meaning the task is complete if `value` equals `total`. The
    ///       default value is `1.0`.
    ///     - label: A view builder that creates a view that describes the task
    ///       in progress.
    ///     - currentValueLabel: A view builder that creates a view that
    ///       describes the level of completed progress of the task.
    public init<V>(value: V?, total: V = 1.0, @ViewBuilder label: () -> Label, @ViewBuilder currentValueLabel: () -> CurrentValueLabel) where V : BinaryFloatingPoint { }

    /// Creates a progress bar from a value, a total, and a localized string
    /// key.
    ///
    /// If the value is non-`nil`, but outside the range of `0.0` through
    /// `total`, the progress view pins the value to those limits, rounding to
    /// the nearest possible bound. A value of `nil` represents indeterminate
    /// progress, in which case the progress view ignores `total`.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:tableName:bundle:comment:)``. See
    /// ``Text`` for more information about localizing strings. To initialize a
    ///  determinate progress view with a string variable, use
    ///  the corresponding initializer that takes a `StringProtocol` instance.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ProgressView("We are halfway done 🌗", value: 1.0, total: 2.0)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blue progress bar across the center of the
    /// screen which shows 50% fill, as rendered by passing a value of 1 out of a
    /// total 2 to the ProgressView initializer. The custom label above it reads
    /// "We are halfway done" based on the localized string key passed to the initializer.](progressview-init-2.png)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the progress view's localized title that
    ///       describes the task in progress.
    ///     - value: The completed amount of the task to this point, in a range
    ///       of `0.0` to `total`, or `nil` if the progress is
    ///       indeterminate.
    ///     - total: The full amount representing the complete scope of the
    ///       task, meaning the task is complete if `value` equals `total`. The
    ///       default value is `1.0`.
    public init<V>(_ titleKey: LocalizedStringKey, value: V?, total: V = 1.0) where Label == Text, CurrentValueLabel == EmptyView, V : BinaryFloatingPoint { }

    /// Creates a progress bar from a value, a total, and a title string.
    ///
    /// If the value is non-`nil`, but outside the range of `0.0` through
    /// `total`, the progress view pins the value to those limits, rounding to
    /// the nearest possible bound. A value of `nil` represents indeterminate
    /// progress, in which case the progress view ignores `total`.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// title similar to ``Text/init(verbatim:)``. See ``Text`` for more
    /// information about localizing strings. To initialize a determinate
    /// progress view with a localized string key, use the corresponding
    /// initializer that takes a ``LocalizedStringKey`` instance.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let title = "We are halfway done 🌗"
    ///
    ///     var body: some View {
    ///         ProgressView(title, value: 1.0, total: 2.0)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blue progress bar across the center of the
    /// screen which shows 50% fill, as rendered by passing a value of 1 out of a
    /// total 2 to the ProgressView initializer. The custom label above it reads
    /// "We are halfway done" based on the title string passed to the initializer.](progressview-init-2.png)
    ///
    /// - Parameters:
    ///     - title: The string that describes the task in progress.
    ///     - value: The completed amount of the task to this point, in a range
    ///       of `0.0` to `total`, or `nil` if the progress is
    ///       indeterminate.
    ///     - total: The full amount representing the complete scope of the
    ///       task, meaning the task is complete if `value` equals `total`. The
    ///       default value is `1.0`.
    public init<S, V>(_ title: S, value: V?, total: V = 1.0) where Label == Text, CurrentValueLabel == EmptyView, S : StringProtocol, V : BinaryFloatingPoint { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressView {

    /// Creates a progress bar from a Progress object.
    ///
    /// The progress view synthesizes a default label using the
    /// `localizedDescription` of the given progress instance.
    ///
    /// The parameter of this initializer is type
    /// [`Progress`](https://developer.apple.com/documentation/foundation/progress).
    /// See the Apple developer docs for more on how to create and modify
    /// one of these objects.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let progress = Progress(totalUnitCount: 4)
    ///
    ///     var body: some View {
    ///         ProgressView(progress)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a light gray progress bar spanning the center
    /// of the screen with text above it which reads "0% completed" and below
    /// which reads "0 of 4" in smaller gray text. In this case the bar is rendered
    /// by the passing 4 units to a Progress object.](progressview-init-4.png)
    ///
    /// - Parameter progress: The `Progress` object for displaying the bar.
    public init(_ progress: Progress) where Label == EmptyView, CurrentValueLabel == EmptyView { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressView {

    /// Creates a progress view based on a style configuration.
    ///
    /// You can use this initializer within the
    /// ``ProgressViewStyle/makeBody(configuration:)`` method of a
    /// ``ProgressViewStyle`` to create an instance of the styled progress view.
    /// This is useful for custom progress view styles that only modify the
    /// current progress view style, as opposed to implementing a brand new
    /// style.
    ///
    /// For example, the following style adds a dark blue shadow to the progress
    /// view, but otherwise preserves the progress view's current style:
    ///
    ///     struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             ProgressView(configuration)
    ///                 .shadow(color: Color(red: 0, green: 0, blue: 0.6),
    ///                         radius: 4.0, x: 1.0, y: 2.0)
    ///         }
    ///     }
    ///
    /// You can then apply the style to a ``ProgressView`` using the
    /// ``View/progressViewStyle(_:)`` modifier:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack(spacing: 30) {
    ///             ProgressView()
    ///             ProgressView(value: 1, total: 2)
    ///         }
    ///         .progressViewStyle(DarkBlueShadowProgressViewStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a light gray spinner and a blue progress bar
    /// in a VStack. A custom progress view style passed to the progressViewStyle
    /// modifier renders both the spinner and bar with shadows.](progress-view-init-1a15a.png)
    ///
    public init(_ configuration: ProgressViewStyleConfiguration) where Label == ProgressViewStyleConfiguration.Label, CurrentValueLabel == ProgressViewStyleConfiguration.CurrentValueLabel { }
}
