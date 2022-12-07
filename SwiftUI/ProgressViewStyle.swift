/// A type that applies standard interaction behavior to all progress views
/// within a view hierarchy.
///
/// Use this protocol to create custom and reusable styles for your
/// ``ProgressView``s.
///
/// You can either use a **predefined** style or **create your own** style
///
/// ### Predefined Styles
///
/// There are 3 predefined ``ProgressView`` styles in SwiftUI:
/// - ``CircularProgressViewStyle`` - A "spinner" style.
/// - ``LinearProgressViewStyle`` - A loading bar style.
/// - ``DefaultProgressViewStyle`` - The default style based on the context.
///
/// To use one of these styles, pass an instance to ``View/progressViewStyle(_:)``:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ProgressView()
///             .progressViewStyle(CircularProgressViewStyle())
///     }
/// }
/// ```
///
///![A gif displaying a default gray circular style progress view spinning.](progress-spinner-gray.gif)
///
/// ### Custom Styles
///
/// To create a custom `ProgressViewStyle`, create a structure that
/// implements the ``ProgressViewStyle/makeBody(configuration:)``:
///
///     struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
///         func makeBody(configuration: Configuration) -> some View {
///             ProgressView(configuration)
///                 .shadow(color: Color(red: 0, green: 0, blue: 0.6),
///                         radius: 4.0, x: 1.0, y: 2.0)
///         }
///     }
///
/// Then apply it to a ``ProgressView`` using ``View/progressViewStyle(_:)``:
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
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol ProgressViewStyle { }
extension ProgressViewStyle {

    /// A view representing the body of a progress view.
    associatedtype Body : View

    /// Creates a view representing the body of a progress view.
    ///
    /// Implement this function to create a custom ``ProgressViewStyle``.
    /// This is the one requirement of conforming to the protocol.
    ///
    /// The function passes in a `configuration` of type
    /// ``ProgressViewStyleConfiguration``. This structure contains:
    /// - ``ProgressViewStyleConfiguration/fractionCompleted`` - How much
    /// of the progress view has been completed.
    /// - ``ProgressViewStyleConfiguration/label`` - The label ``View``
    /// of a ``ProgressView``.
    /// - ``ProgressViewStyleConfiguration/currentValueLabel`` - The "current value"
    /// label of a ``ProgressView``.
    ///
    /// See ``ProgressViewStyleConfiguration`` for more on the parameter.
    ///
    /// Here is a simple example:
    ///
    ///     struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             ProgressView(configuration)
    ///                 .shadow(color: Color(red: 0, green: 0, blue: 0.6),
    ///                         radius: 4.0, x: 1.0, y: 2.0)
    ///         }
    ///     }
    ///
    /// To apply the style, use ``View/progressViewStyle(_:)``:
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
    /// - Parameter configuration: The properties of the progress view, such as
    ///  its preferred progress type.
    func makeBody(configuration: Self.Configuration) -> Self.Body { }

    /// A type alias for the properties of a progress view instance.
    ///
    /// See ``ProgressViewStyleConfiguration`` for more on what a progress
    /// view's configuration properties provides.
    typealias Configuration = ProgressViewStyleConfiguration
}
