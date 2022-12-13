/// An effect applied when the pointer hovers over a view.
///
/// HoverEffects are only used on iPadOS when a user is interacting with a pointer.
/// See ``View/hoverEffect(_:)`` for how to apply the different HoverEffects.
/// The available options are:
/// - automatic: the default effect for the platform
/// - highlight: morphs the pointer into a platter behind the view and shows a light source
/// - lift: slides the pointer under the view and scaled up the view with a shadow
///
/// For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         VStack {
///             Rectangle()
///                 .fill(Color.red)
///                 .frame(width: 100, height: 100)
///                 .hoverEffect(.automatic)
///         }
///         .padding(75)
///         .background(Color.blue)
///     }
/// }
/// ```
///
/// ![A view containing a VStack with 75 point padding and background color blue;
/// within the VStack is a red filled rectangle with an 100 x 100 frame and the
/// automatic hover effect, appearing as a red square hovering within the larger
/// blue square.](10D7AAEA-D933-499B-A64B-143CEF3D8E0E.png)
///
/// See the individual `HoverEffect` value pages for a visualization of each effect.
@available(iOS 13.4, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct HoverEffect {

    /// An effect that attempts to determine the effect automatically.
    /// This is the default effect.
    ///
    /// For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .fill(Color.red)
    ///                 .frame(width: 100, height: 100)
    ///                 .hoverEffect(.automatic)
    ///         }
    ///         .padding(75)
    ///         .background(Color.blue)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with 75 point padding and background color blue;
    /// within the VStack is a red filled rectangle with an 100 x 100 frame and the
    /// automatic hover effect, appearing as a red square hovering within the larger
    /// blue square.](hovereffect-automatic-example.gif)
    ///
    public static let automatic: HoverEffect

    /// An effect that morphs the pointer into a platter behind the view
    /// and shows a light source indicating position.
    ///
    /// For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .fill(Color.red)
    ///                 .frame(width: 100, height: 100)
    ///                 .hoverEffect(.highlight)
    ///         }
    ///         .padding(75)
    ///         .background(Color.blue)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with 75 point padding and background color blue;
    /// within the VStack is a red filled rectangle with an 100 x 100 frame and the
    /// highlight hover effect, appearing as a red square hovering within the larger
    /// blue square.](hovereffect-highlight-example.gif)
    ///
    public static let highlight: HoverEffect

    /// An effect that slides the pointer under the view and disappears as the
    /// view scales up and gains a shadow.
    ///
    /// For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .fill(Color.red)
    ///                 .frame(width: 100, height: 100)
    ///                 .hoverEffect(.lift)
    ///         }
    ///         .padding(75)
    ///         .background(Color.blue)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with 75 point padding and background color blue;
    /// within the VStack is a red filled rectangle with an 100 x 100 frame and the
    /// lift hover effect, appearing as a red square hovering within the larger
    /// blue square, pronounced with shadow.](hovereffect-lift-example.gif)
    ///
    public static let lift: HoverEffect
}

