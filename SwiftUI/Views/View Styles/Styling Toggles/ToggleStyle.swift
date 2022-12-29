/// Structs conforming to the this protocol can customize the styles for ``Toggle`` views.
///
/// ToggleStyle allows for easy customization of a toggle view. In order to customize the style,
/// simply create a new type conforming to this protocol that returns the custom view
/// in the ``ToggleStyle/makeBody(configuration:)`` function. Note that while the `ToggleStyle`
/// protocol takes care of most the implementation, the conforming type must still
/// toggle the `isOn` property.
///
/// To configure the current toggle style for a view hierarchy, use the
/// ``View/toggleStyle(_:)`` modifier.
///
/// For example, to make a custom toggle style which conforms to this protocol:
///
/// ```
/// struct CustomRectangleToggleStyle: ToggleStyle {
///     func makeBody(configuration: Configuration) -> some View {
///         HStack {
///             configuration.label
///             Rectangle()
///                 .frame(width: 75, height: 30)
///                 .overlay(
///                     Circle()
///                         .foregroundColor(configuration.isOn ? Color.green : Color.red)
///                         .padding(.all, 3)
///                         .offset(x: configuration.isOn ? 20 : -20, y: 0)
///                         .animation(Animation.linear(duration: 0.1))
///                 )
///                 .onTapGesture {
///                     configuration.isOn.toggle()
///                 }
///         }
///     }
/// }
/// ```
///
/// You can then apply this ``ToggleStyle`` to a ``Toggle``
/// using ``View/toggleStyle(_:)``:
///
/// ```
/// struct ExampleView: View {
///     @State private var toggleStatus: Bool = false
///
///     var body: some View {
///         Toggle(isOn: $toggleStatus) {
///             Text("Active")
///         }
///         .padding(50)
///         .toggleStyle(CustomRectangleToggleStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a toggle in the center of the screen with a label that
/// reads "Active" and a custom style toggle that renders as a black rectangle
/// with a red dot on its left when switched to off and a green dot on its right
/// when switched to on.](togglestyle-example-1.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ToggleStyle { }

extension ToggleStyle {

    /// A view that represents the appearance and interaction of a toggle.
    associatedtype Body : View

    /// Creates a view that represents the body of a toggle.
    ///
    /// The system calls this method for each ``Toggle`` instance in a view
    /// hierarchy where this style is the current toggle style.
    ///
    /// For example, to make a custom toggle style which returns a ``HStack`` from
    /// `makeBody(configuration:)`:
    ///
    /// ```
    /// struct CustomRectangleToggleStyle: ToggleStyle {
    ///     func makeBody(configuration: Configuration) -> some View {
    ///         HStack {
    ///             configuration.label
    ///             Rectangle()
    ///                 .frame(width: 75, height: 30)
    ///                 .overlay(
    ///                     Circle()
    ///                         .foregroundColor(configuration.isOn ? Color.green : Color.red)
    ///                         .padding(.all, 3)
    ///                         .offset(x: configuration.isOn ? 20 : -20, y: 0)
    ///                         .animation(Animation.linear(duration: 0.1))
    ///                 )
    ///                 .onTapGesture {
    ///                     configuration.isOn.toggle()
    ///                 }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// You can then apply this ``ToggleStyle`` to a ``Toggle``
    /// using ``View/toggleStyle(_:)``:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State private var toggleStatus: Bool = false
    ///
    ///     var body: some View {
    ///         Toggle(isOn: $toggleStatus) {
    ///             Text("Active")
    ///         }
    ///         .padding(50)
    ///         .toggleStyle(CustomRectangleToggleStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a toggle in the center of the screen with a label that
    /// reads "Active" and a custom style toggle that renders as a black rectangle
    /// with a red dot on its left when switched to off and a green dot on its right
    /// when switched to on.](togglestyle-example-1.gif)
    ///
    /// - Parameter configuration: The properties of the toggle, such as its
    ///   label and its “on” state.
    func makeBody(configuration: Self.Configuration) -> Self.Body { }

    /// The properties of a toggle instance.
    ///
    /// See ``ToggleStyleConfiguration`` for more details.
    typealias Configuration = ToggleStyleConfiguration
}

@available(iOS 15.0, macOS 12.0, watchOS 9.0, *)
@available(tvOS, unavailable)
extension ToggleStyle where Self == ButtonToggleStyle {

    /// A toggle style that displays as a button with its label as the title.
    ///
    /// Apply this style to a ``Toggle`` or to a view hierarchy that contains
    /// toggles using the ``View/toggleStyle(_:)`` modifier:
    ///
    ///     Toggle(isOn: $isFlagged) {
    ///         Label("Flag", systemImage: "flag.fill")
    ///     }
    ///     .toggleStyle(.button)
    ///
    /// The style produces a button with a label that describes the purpose
    /// of the toggle. The user taps or clicks the button to change the
    /// toggle's state. The button indicates the `on` state by filling in the
    /// background with its tint color. You can change the tint color using
    /// the ``View/tint(_:)-93mfq`` modifier. SwiftUI uses this style as the
    /// default for toggles that appear in a toolbar.
    ///
    /// The following table shows the toggle in both the `off` and `on` states,
    /// respectively:
    ///
    ///   | Platform    | Appearance |
    ///   |-------------|------------|
    ///   | iOS, iPadOS | ![A screenshot of two buttons with a flag icon and the word flag inside. The first button isn't highlighted; the second one is.](ToggleStyle-button-1-iOS) |
    ///   | macOS       | ![A screenshot of two buttons with a flag icon and the word flag inside. The first button isn't highlighted; the second one is.](ToggleStyle-button-1-macOS) |
    ///
    /// A ``Label`` instance is a good choice for a button toggle's label.
    /// Based on the context, SwiftUI decides whether to display both the title
    /// and icon, as in the example above, or just the icon, like when the
    /// toggle appears in a toolbar. You can also control the label's style
    /// by adding a ``View/labelStyle(_:)`` modifier. In any case, SwiftUI
    /// always uses the title to identify the control using VoiceOver.
    public static var button: ButtonToggleStyle { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ToggleStyle where Self == DefaultToggleStyle {

    /// The default toggle style.
    ///
    /// Use this ``ToggleStyle`` to let SwiftUI pick a suitable style for
    /// the current platform and context. Toggles use the `automatic` style
    /// by default, but you might need to set it explicitly using the
    /// ``View/toggleStyle(_:)`` modifier to override another style
    /// in the environment. For example, you can request automatic styling for
    /// a toggle in an ``HStack`` that's otherwise configured to use the
    /// ``ToggleStyle/button`` style:
    ///
    ///     HStack {
    ///         Toggle(isOn: $isShuffling) {
    ///             Label("Shuffle", systemImage: "shuffle")
    ///         }
    ///         Toggle(isOn: $isRepeating) {
    ///             Label("Repeat", systemImage: "repeat")
    ///         }
    ///
    ///         Divider()
    ///
    ///         Toggle("Enhance Sound", isOn: $isEnhanced)
    ///             .toggleStyle(.automatic) // Set the style automatically here.
    ///     }
    ///     .toggleStyle(.button) // Use button style for toggles in the stack.
    ///
    /// ### Platform defaults
    ///
    /// The `automatic` style produces an appearance that varies by platform,
    /// using the following styles in most contexts:
    ///
    /// | Platform    | Default style                            |
    /// |-------------|------------------------------------------|
    /// | iOS, iPadOS | ``ToggleStyle/switch``                   |
    /// | macOS       | ``ToggleStyle/checkbox``                 |
    /// | tvOS        | A tvOS-specific button style (see below) |
    /// | watchOS     | ``ToggleStyle/switch``                   |
    ///
    /// The default style for tvOS behaves like a button. However,
    /// unlike the ``ToggleStyle/button`` style that's available in some other
    /// platforms, the tvOS toggle takes as much horizontal space as its parent
    /// offers, and displays both the toggle's label and a text field that
    /// indicates the toggle's state. You typically collect tvOS toggles into
    /// a ``List``:
    ///
    ///     List {
    ///         Toggle("Show Lyrics", isOn: $isShowingLyrics)
    ///         Toggle("Shuffle", isOn: $isShuffling)
    ///         Toggle("Repeat", isOn: $isRepeating)
    ///     }
    ///
    /// ![A screenshot of three buttons labeled Show Lyrics, Shuffle, and
    /// Repeat, stacked vertically. The first is highlighted. The second is
    /// on, while the others are off.](ToggleStyle-automatic-2-tvOS)
    ///
    /// ### Contextual defaults
    ///
    /// A toggle's automatic appearance varies in certain contexts:
    ///
    /// * A toggle that appears as part of the content that you provide to one
    ///   of the toolbar modifiers, like ``View/toolbar(content:)-5w0tj``, uses
    ///   the ``ToggleStyle/button`` style by default.
    ///
    /// * A toggle in a ``Menu`` uses a style that you can't create explicitly:
    ///     ```
    ///     Menu("Playback") {
    ///         Toggle("Show Lyrics", isOn: $isShowingLyrics)
    ///         Toggle("Shuffle", isOn: $isShuffling)
    ///         Toggle("Repeat", isOn: $isRepeating)
    ///     }
    ///     ```
    ///   SwiftUI shows the toggle's label with a checkmark that appears only
    ///   in the `on` state:
    ///
    ///   | Platform    | Appearance |
    ///   |-------------|------------|
    ///   | iOS, iPadOS | ![A screenshot of a Playback menu in iOS showing three menu items with the labels Repeat, Shuffle, and Show Lyrics. The shuffle item has a checkmark to its left, while the other two items have a blank space to their left.](ToggleStyle-automatic-1-iOS) |
    ///   | macOS       | ![A screenshot of a Playback menu in macOS showing three menu items with the labels Repeat, Shuffle, and Show Lyrics. The shuffle item has a checkmark to its left, while the other two items have a blank space to their left.](ToggleStyle-automatic-1-macOS) |
    public static var automatic: DefaultToggleStyle { get }
}
