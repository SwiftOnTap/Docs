/// An on-off switch.
///
/// Create a toggle by providing an `isOn` binding and a label.
///
/// ```
/// struct SwitchView: View {
///     @State private var vibrateOnRing = false
///
///     var body: some View {
///         Toggle(isOn: $vibrateOnRing) {
///             Text("Vibrate on Ring")
///         }
///     }
/// }
/// ```
///
/// ![A screenshot displaying a toggle reading "Vibrate on Ring" which is
/// switched to off.](BF5FBFF1-E2E6-4B8D-A00F-528D2D61561C.png)
///
/// For the common case of text-only labels, you can use the convenience
/// initializer that takes a title string (or localized string key) as its first
/// parameter, instead of a trailing closure:
///
/// ```
/// struct SwitchView: View {
///     @State private var vibrateOnRing = true
///
///     var body: some View {
///         Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
///     }
/// }
/// ```
///
/// ![A screenshot displaying a toggle reading "Vibrate on Ring" which is
/// switched to on.](75A3C8E1-A542-4D7D-8370-91C70DE6C502.png)
///
/// ### Styling Toggles
///
/// You can customize the appearance of toggles by using a ``ToggleStyle``, or creating your own
/// styles that conform to the ``ToggleStyle`` protocol. Available styles include:
/// - ``DefaultToggleStyle``
/// - ``SwitchToggleStyle``
/// - `CheckboxToggleStyle` on macOS
///
/// To set the style, use the ``View/toggleStyle(_:)`` modifier:
///
/// ```
/// struct RingerView: View {
///     @State private var vibrateOnRing = true
///     @State private var vibrateOnSilent = true
///
///     var body: some View {
///         VStack {
///             Toggle("Vibrate on Ring 🔔", isOn: $vibrateOnRing)
///             Toggle("Vibrate on Silent 🔕", isOn: $vibrateOnSilent)
///         }
///         .toggleStyle(SwitchToggleStyle(tint: .orange))
///     }
/// }
/// ```
///
/// ![A gif displaying two toggles in a VStack reading "Vibrate on Ring"
/// and "Vibrate on Silent" with an orange tint color being switched on and off;
/// the tint is applied using SwitchToggleStyle.](toggle-styling-orange-ex.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Toggle<Label> : View where Label : View {

    /// Creates an on-off switch with a custom label.
    ///
    /// ```
    /// struct ToggleView: View {
    ///     @State private var on = false
    ///
    ///     var body: some View {
    ///         Toggle(isOn: $on) {
    ///             Text("Airplane Mode ✈️")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a toggle switched to off with a custom label
    /// that reads "Airplane Mode."](toggle-init-2.png)
    ///
    /// - Parameters:
    ///   - isOn: A boolean binding connected to whether the toggle is on.
    ///   - label: A closure that returns the toggle label.
    public init(isOn: Binding<Bool>, @ViewBuilder label: () -> Label) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Toggle where Label == ToggleStyleConfiguration.Label {

    /// Creates a an on-off switch based on a toggle style configuration.
    ///
    /// Use this initializer **only** within the
    /// ``ToggleStyle/makeBody(configuration:)`` method of a ``ToggleStyle`` to
    /// create a toggle for configuring. This is useful for new custom
    /// toggle styles that only modify the current toggle style, instead of
    /// implementing a brand new style.
    ///
    /// For example, the following style adds a red border around the toggle,
    /// but otherwise preserves the toggle's current style:
    ///
    ///     struct RedBorderedToggleStyle: ToggleStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             Toggle(configuration)
    ///                 .border(Color.red)
    ///         }
    ///     }
    ///
    ///     struct ContentView: View {
    ///         @State private var on = true
    ///         var body: some View {
    ///             Toggle("🍌🍌", isOn: $on)
    ///                 .toggleStyle(RedBorderedToggleStyle())
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a switch toggle in the center of the screen
    /// with a custom label of two banana emojis and a red border surrounding
    /// the entire toggle area, including the label. The custom toggle style
    /// used only modifies the current toggle style.](toggle-init.png)
    ///
    /// - Parameter configuration: A toggle style configuration, passed from makeBody(configuration:).
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public init(_ configuration: ToggleStyleConfiguration) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Toggle where Label == Text {

    /// Creates an on-off switch with a localized string key label.
    ///
    /// Uses a localized string key to create a toggle.
    ///
    /// ```
    /// struct LocalizedToggleView: View {
    ///     @State private var on = false
    ///
    ///     var body: some View {
    ///         Toggle(LocalizedStringKey("Airplane Mode ✈️"), isOn: $on)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a toggle switched to off with a custom label
    /// that reads "Airplane Mode" which is passed as a localized string key to
    /// the initializer.](toggle-init-2.png)
    ///
    /// Conveniently, if you pass the ``Toggle`` a
    /// [`String`](https://developer.apple.com/documentation/swift/string)
    /// literal,
    /// it will call this initializer to treat the text you provide
    /// as a localization key:
    ///
    /// ```
    /// struct LocalizedToggleView: View {
    ///     @State private var on = false
    ///
    ///     var body: some View {
    ///         Toggle("Airplane Mode ✈️", isOn: $on)
    ///     }
    /// }
    /// ```
    ///
    /// - Note: If you pass in a
    /// [`String`](https://developer.apple.com/documentation/swift/string)
    /// **variable** instead of a
    /// [`String`](https://developer.apple.com/documentation/swift/string),
    /// **literal**, ``Toggle/init(_:isOn:)-fcaeb`` will get called instead.
    /// The text will not get localized.
    ///
    /// - Parameters:
    ///   - titleKey: A localized string label.
    ///   - isOn: A boolean binding connected to whether the toggle is on.
    public init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>) { }

    /// Creates an on-off switch with a string label.
    ///
    /// Uses a string to create a toggle.
    ///
    /// ```
    /// struct SettingsToggleView: View {
    ///     @State private var on = false
    ///     let title = "Airplane Mode ✈️"
    ///
    ///     var body: some View {
    ///         Toggle(title, isOn: $on)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a toggle switched to off with a custom label
    /// that reads "Airplane Mode" which is passed as a string variable to
    /// the initializer.](toggle-init-2.png)
    ///
    /// - Note: If you'd like to localize your text, use ``Toggle/init(_:isOn:)-00a8a``
    /// instead.
    ///
    /// - Parameters:
    ///   - title: A string label.
    ///   - isOn: A boolean binding connected to whether the toggle is on.
    public init<S>(_ title: S, isOn: Binding<Bool>) where S : StringProtocol { }
}
