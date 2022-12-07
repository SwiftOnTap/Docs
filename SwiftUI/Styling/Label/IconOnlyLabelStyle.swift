/// A label style that only displays the icon of the label.
///
/// Use this label style to display a ``Label`` with an icon only.
///
/// This is one of 3 default label
/// styles. These are `struct`s that conform to the ``LabelStyle`` protocol
/// by implementing the ``LabelStyle/makeBody(configuration:)`` function
/// internally, so you don't have to do it yourself.
///
/// These are the default styles:
/// - ``DefaultLabelStyle``, which displays the ``Label`` as-is
/// - `IconOnlyLabelStyle` (this style), which displays the icon only
/// - ``TitleOnlyLabelStyle``, which displays the title only
///
/// All 3 styles have only one initializer, which takes no parameters.
///
/// To use a ``LabelStyle``, pass it to a ``Label``'s ``View/labelStyle(_:)``
/// modifier:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack {
///             Label("Banana", systemImage: "suit.heart.fill")
///                 .labelStyle(DefaultLabelStyle())
///             Label("Banana", systemImage: "suit.heart.fill")
///                 .labelStyle(IconOnlyLabelStyle())
///             Label("Banana", systemImage: "suit.heart.fill")
///                 .labelStyle(TitleOnlyLabelStyle())
///         }
///         .font(.title)
///     }
/// }
/// ```
///
/// ![A view displaying a VStack with three labels; the first reads as
/// "<3 Banana" and is of default style, the second reads as "<3" and is of
/// icon only style, and the third reads as "Banana" and is of title on style.](default-labelstyle-comparison.png)
///
/// - Note: The title of the label is still used for non-visual descriptions,
/// such as VoiceOver.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct IconOnlyLabelStyle : LabelStyle {

    /// Creates an icon-only label style.
    ///
    /// Use this initializer to create an icon-only label style.
    /// This is the only initializer of ``TitleOnlyLabelStyle``.
    ///
    /// Apply a icon-only label style using the ``View/labelStyle(_:)``
    /// view modifier:
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             VStack {
    ///                 Label("Banana🍌🍌", systemImage: "heart.fill")
    ///                 Label("Banana🍌🍌", systemImage: "heart.fill")
    ///                     .labelStyle(IconOnlyLabelStyle())
    ///             }
    ///             .font(.title)
    ///         }
    ///     }
    ///
    /// ![Icon-only Label Style](icon-only-labelstyle.png)
    ///
    public init() { }

    /// Creates a view that represents the body of a label.
    ///
    /// The system calls this method for each ``Label`` instance in a view
    /// hierarchy where this style is the current label style.
    ///
    /// - Parameter configuration: The properties of the label.
    public func makeBody(configuration: IconOnlyLabelStyle.Configuration) -> some View { }


    /// A view that represents the body of a label.
    public typealias Body = some View
}

