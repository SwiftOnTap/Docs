/// A set of symbolic safe area regions.
///
/// Use this option set with the ``View/ignoresSafeArea(_:edges:)``
/// view modifier to specify which edges of a view
/// should ignore which safe areas.
///
/// Safe area options:
/// - ``SafeAreaRegions/container``: The top and bottom safe portions of the
/// screen, like the status bar.
/// - ``SafeAreaRegions/keyboard``: The portion of the screen covered by
/// a software keyboard
///
/// ```
/// struct SafeAreaIgnoringView: View {
///     var body: some View {
///         ZStack {
///             Color.pink
///             Text("I am everywhere (except the software keyboard)")
///         }
///         .ignoresSafeArea(SafeAreaRegions.container, edges: [.top, .bottom])
///     }
/// }
/// ```
///
/// ![A screenshot displaying a pink background that extends to every edge
/// of the screen, with text in the center that reads "I am everywhere (except
/// the software keyboard)." The ignoresSafeArea view modifier is applied to specify
/// which edges should ignore safe areas, in this case top and bottom.](0689E6DD-9B1A-43A0-84F2-CBA2EC6EEF13.png)
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct SafeAreaRegions : OptionSet {

    /// The safe area defined by the device and containers within the
    /// user interface, including elements such as top and bottom bars.
    ///
    /// ```
    /// struct SafeAreaIgnoringView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Color.pink
    ///             Text("I am everywhere (except the keyboard)")
    ///         }
    ///         .ignoresSafeArea(.container, edges: [.top, .bottom])
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a pink background that extends to every edge
    /// of the screen, with text in the center that reads "I am everywhere (except
    /// the software keyboard)." The ignoresSafeArea view modifier is applied to specify
    /// which edges should ignore safe areas, in this case top and bottom. The
    /// container variable clarifies to the view modifier which container it acts on.](safearearegions-container.png)
    public static let container: SafeAreaRegions

    /// The safe area matching the current extent of any software
    /// keyboard displayed over the view content.
    ///
    /// ```
    /// struct SafeAreaIgnoringView: View {
    ///     @State private var text = ""
    ///
    ///     var body: some View {
    ///         ZStack {
    ///             Color.pink
    ///             TextField("I am behind the keyboard 👀", text: $text)
    ///         }
    ///         .ignoresSafeArea(.keyboard, edges: [.top, .bottom])
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a pink background with the keyboard visible
    /// and a text field that reads "I am behind the keyboard." Since the
    /// ignoresSafeArea view modifier acts on the keyboard, when the keyboard
    /// pops up the text field stays in the same place. Without that view
    /// modifier, the keyboard would shift it up towards the top of the screen.](safearearegions-keyboard.png)
    public static let keyboard: SafeAreaRegions

    /// All safe area regions.
    ///
    /// ```
    /// struct SafeAreaIgnoringView: View {
    ///     @State private var text = ""
    ///
    ///     var body: some View {
    ///         ZStack {
    ///             Color.pink
    ///             TextField("I am everywhere 🤠", text: $text)
    ///         }
    ///         .ignoresSafeArea(.all, edges: [.top, .bottom])
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a pink background permeating the whole screen
    /// with the keyboard visible on the lower half and a text field directly
    /// above it which reads "I am everywhere." Since all safe area regions
    /// are ignored, the text field remains in place (rather than shifted up)
    /// and the pink background extends to all edges.](safearearegions-all.png)
    public static let all: SafeAreaRegions

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = SafeAreaRegions

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = SafeAreaRegions

}

