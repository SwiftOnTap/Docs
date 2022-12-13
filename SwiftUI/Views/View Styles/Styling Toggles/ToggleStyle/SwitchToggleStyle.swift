/// A toggle style that displays a leading label and a trailing switch.
///
/// ```
/// struct ContentView: View {
///     @State private var status = true
///     var body: some View {
///         Toggle(isOn: $status) {
///             Text("Banana🍌🍌")
///         }
///         .toggleStyle(SwitchToggleStyle())
///         .padding()
///     }
/// }
/// ```
///
/// ![The gif shows a switch toggle with the text "Banana🍌🍌" flipping on and off.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/togglestyle-switch-example-1.gif)
///
/// To apply this style to a toggle, or to a view that contains toggles, use
/// the ``View/toggleStyle(_:)`` modifier.
@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct SwitchToggleStyle : ToggleStyle {

    /// Creates a switch toggle style.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State private var status = true
    ///     var body: some View {
    ///         Toggle(isOn: $status) {
    ///             Text("Banana🍌🍌")
    ///         }
    ///         .toggleStyle(SwitchToggleStyle())
    ///         .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a switch toggle in the center of the screen reading
    /// "Banana" on the left side. When the toggle is switched, nothing happens.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/togglestyle-switch-example-1.gif)
    public init() { }

    /// Creates a switch style with a tint color.
    @available(iOS 14.0, macOS 11.0, watchOS 7.0, *)
    @available(tvOS, unavailable)
    public init(tint: Color) { }

    /// Creates a view representing the body of a toggle.
    ///
    /// The system calls this method for each ``Toggle`` instance in a view
    /// hierarchy where this style is the current toggle style.
    ///
    /// - Parameter configuration: The properties of the toggle, such as its
    ///   label and its “on” state.
    public func makeBody(configuration: SwitchToggleStyle.Configuration) -> some View { }


    /// A view that represents the appearance and interaction of a toggle.
    public typealias Body = some View
}

