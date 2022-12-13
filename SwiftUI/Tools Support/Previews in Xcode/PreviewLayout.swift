/// The size constraint for a preview.
///
/// Use this enumeration along with the
/// ``View/previewLayout(_:)``
/// view modifier to change the way a view is displayed in a preview.
///
/// This enumeration has 3 different cases:
/// 1. ``PreviewLayout/device``: Center the preview in the specified device.
/// 2. ``PreviewLayout/sizeThatFits``: Fix the preview to the view size.
/// 3. ``PreviewLayout/fixed``: Center the preview in a fixed
/// size container.
///
/// In the following example, we fit a preview box to the text view.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Text("➡️This box fits me snugly⬅️")
///     }
/// }
///
/// struct ContentView_Previews: PreviewProvider {
///     static var previews: some View {
///         ContentView()
///             .previewLayout(.sizeThatFits)
///     }
/// }
/// ```
///
/// ![An image of a text view in preview displaying the string "This box fits me snugly" outlined by a gray rectangle with no empty space on any side of the string.](previewlayout-sizethatfits.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum PreviewLayout {

    /// Center the preview in a container the size of the device on which the
    /// preview is running.
    ///
    /// Use this case along with the
    /// ``View/previewLayout(_:)``
    /// view modifier to change the way a view is displayed in a preview.
    ///
    /// This is the default if no preview layout is specified.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("I am in a device! 📲")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///             .previewLayout(.device)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a text view in preview displaying the string "I am in a device!" in the center of the screen.](previewlayout-device.png)
    ///
    case device

    /// Fit the container to the size of the preview when offered the size of
    /// the device on which the preview is running.
    ///
    /// Use this case along with the
    /// ``View/previewLayout(_:)``
    /// view modifier to change the way a view is displayed in a preview.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("➡️This box fits me snugly⬅️")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///             .previewLayout(.sizeThatFits)
    ///     }
    /// }
    /// ```
    ///
    /// ![An image of a text view in preview displaying the string "This box fits me snugly" outlined by a gray rectangle with no empty space on any side of the string.](previewlayout-sizethatfits.png)
    ///
    case sizeThatFits

    /// Center the preview in a fixed size container.
    ///
    /// Use this case along with the
    /// ``View/previewLayout(_:)``
    /// view modifier to change the way a view is displayed in a preview.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("I am in a 💯 by 💯 box")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///             .previewLayout(.fixed(width: 100, height: 100))
    ///     }
    /// }
    /// ```
    ///
    /// ![An image of a text view in preview displaying the string "I am in a 100 by 100 box" outlined by a gray square with little empty space on either side of the string.](previewlayout-fixed.png)
    ///
    case fixed(width: CGFloat, height: CGFloat)
}
