/// A view that lets the user choose a color.
///
/// The color picker provides a color well that shows the currently selected
/// color, and displays the larger system color picker that allows users to
/// select a new color.
///
/// By default color picker supports colors with opacity; to disable opacity
/// support, set the `supportsOpacity` parameter to `false`.
/// In this mode the color picker won't show controls for adjusting the opacity
/// of the selected color, and strips out opacity from any color set
/// programmatically or selected from the user's system favorites.
///
/// In general, there are 3 types of color picker titles, and 2 binding types,
/// for 6 initializers total.
///
/// Title types:
///
/// 1. [`String`](https://developer.apple.com/documentation/swift/string)
/// 2. ``LocalizedStringKey``
/// 3. ``View``
///
/// Binding types:
///
/// 1. ``CGColor``
/// 2. ``Color``
///
/// You use ``ColorPicker`` by embedding it inside a view hierarchy and
/// initializing it with a title string and a `Binding` to a ``Color``:
///
///     struct ColorView: View {
///         @State private var color = Color.red
///
///         var body: some View {
///             RoundedRectangle(cornerRadius: 10)
///                 .fill(color)
///                 .frame(width: 100, height: 100)
///
///             ColorPicker("Choose a color! 🎨", selection: $color)
///         }
///     }
///
/// ![A gif displaying a view with a 100 x 100 rounded rectangle with a fill
/// derived from the state variable "color" and a ColorPicker titled
/// "Choose a color! 🎨", whose selection input is bound to the state variable;
/// the gif shows "Choose a color! 🎨" being clicked and the color picker menu
/// sliding up where various colors are chosen and reflected in the rectangle.](color-picker-vid.gif)
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ColorPicker<Label> : View where Label : View {

    /// Creates a color picker with a view title and Color binding.
    ///
    /// ```
    /// struct ColorView: View {
    ///     @State private var color = Color.orange
    ///
    ///     var body: some View {
    ///         ColorPicker(selection: $color, supportsOpacity: false) {
    ///             Image(systemName: "eyedropper")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![](19.43.21.png)
    ///
    /// - Parameters:
    ///     - selection: A ``Binding`` to the variable that displays the
    ///       selected ``Color``.
    ///     - supportsOpacity: A Boolean value that indicates whether the color
    ///       picker allows adjusting the selected color's opacity; the default
    ///       is `true`.
    ///     - label: A view that describes the use of the selected color.
    ///        The system color picker UI sets it's title using the text from
    ///        this view.
    ///
    public init(selection: Binding<Color>, supportsOpacity: Bool = true, @ViewBuilder label: () -> Label) { }

    /// Creates a color picker with a view title and CGColor binding.
    ///
    /// ```
    /// struct ColorView: View {
    ///     @State private var color = CGColor(gray: 1.0, alpha: 0.5)
    ///
    ///     var body: some View {
    ///         ColorPicker(selection: $color, supportsOpacity: false) {
    ///             Image(systemName: "eyedropper")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![](19.44.20.png)
    ///
    /// - Parameters:
    ///     - selection: A ``Binding`` to the variable that displays the
    ///       selected `CGColor`.
    ///     - supportsOpacity: A Boolean value that indicates whether the color
    ///       picker allows adjusting the selected color's opacity; the default
    ///       is `true`.
    ///     - label: A view that describes the use of the selected color.
    ///        The system color picker UI sets it's title using the text from
    ///        this view.
    ///
    public init(selection: Binding<CGColor>, supportsOpacity: Bool = true, @ViewBuilder label: () -> Label) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ColorPicker where Label == Text {

    /// Creates a color picker with a localized string key title and Color binding.
    ///
    /// Use ``ColorPicker`` to create a color well that your app uses to allow
    /// the selection of a ``Color``. The example below creates a color well
    /// using a ``Binding`` to a property stored in a settings object and title
    /// you provide:
    ///
    /// ```
    /// struct ColorView: View {
    ///     @State private var color = Color.orange
    ///
    ///     var body: some View {
    ///         ColorPicker(LocalizedStringKey("Choose a color"),
    ///                     selection: $color,
    ///                     supportsOpacity: false)
    ///     }
    /// }
    /// ```
    ///
    /// ![](19.40.28.png)
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the picker.
    ///   - selection: A ``Binding`` to the variable that displays the
    ///     selected ``Color``.
    ///   - supportsOpacity: A Boolean value that indicates whether the color
    ///     picker allows adjustments to the selected color's opacity; the
    ///     default is `true`.
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Color>, supportsOpacity: Bool = true) { }

    /// Creates a color picker with a string title and Color binding.
    ///
    /// Use ``ColorPicker`` to create a color well that your app uses to allow
    /// the selection of a ``Color``. The example below creates a color well
    /// using a ``Binding`` and title you provide:
    ///
    /// ```
    /// struct ColorView: View {
    ///     @State private var color = Color.orange
    ///
    ///     var body: some View {
    ///         ColorPicker("Choose a color 🎨",
    ///                     selection: $color,
    ///                     supportsOpacity: false)
    ///     }
    /// }
    /// ```
    ///
    /// ![](19.41.34.png)
    ///
    /// - Parameters:
    ///   - title: The title displayed by the color picker.
    ///   - selection: A `Binding` to the variable containing a ``Color``.
    ///   - supportsOpacity: A Boolean value that indicates whether the color
    ///     picker allows adjustments to the selected color's opacity; the
    ///     default is `true`.
    public init<S>(_ title: S, selection: Binding<Color>, supportsOpacity: Bool = true) where S : StringProtocol { }

    /// Creates a color picker with a localized string key title and a CGColor binding.
    ///
    /// ```
    /// struct ColorView: View {
    ///     @State private var color = CGColor(gray: 1.0, alpha: 0.5)
    ///
    ///     var body: some View {
    ///         ColorPicker(LocalizedStringKey("Choose a color"),
    ///                     selection: $color,
    ///                     supportsOpacity: false)
    ///     }
    /// }
    /// ```
    ///
    /// ![](19.34.58.png)
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the picker.
    ///   - selection: A ``Binding`` to the variable that displays the
    ///     selected `CGColor`.
    ///   - supportsOpacity: A Boolean value that indicates whether the color
    ///     picker allows adjustments to the selected color's opacity; the
    ///     default is `true`.
    public init(_ titleKey: LocalizedStringKey, selection: Binding<CGColor>, supportsOpacity: Bool = true) { }

    /// Creates a color picker with a string title and a CGColor binding.
    ///
    /// ```
    /// struct ColorView: View {
    ///     @State private var color = CGColor(gray: 1.0, alpha: 0.5)
    ///
    ///     var body: some View {
    ///         ColorPicker("Choose a color 🎨",
    ///                     selection: $color,
    ///                     supportsOpacity: false)
    ///     }
    /// }
    /// ```
    ///
    /// ![](19.37.17.png)
    ///
    /// - Parameters:
    ///   - title: The title displayed by the color picker.
    ///   - selection: A ``Binding`` to the variable containing a `CGColor`.
    ///   - supportsOpacity: A Boolean value that indicates whether the color
    ///     picker allows adjustments to the selected color's opacity; the
    ///     default is `true`.
    public init<S>(_ title: S, selection: Binding<CGColor>, supportsOpacity: Bool = true) where S : StringProtocol { }
}

