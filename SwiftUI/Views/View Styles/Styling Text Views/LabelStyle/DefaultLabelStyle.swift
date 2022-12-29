/// The default label style in the current context.
///
/// Use this label style to ensure all the views in the hierarchy use
/// the default label style.
///
/// This is one of 3 default label
/// styles. These are `struct`s that conform to the ``LabelStyle`` protocol
/// by implementing the ``LabelStyle/makeBody(configuration:)`` function
/// internally, so you don't have to do it yourself.
///
/// These are the default styles:
/// - `DefaultLabelStyle` (this style), which displays the ``Label`` as-is
/// - ``IconOnlyLabelStyle``, which displays the icon only
/// - ``TitleOnlyLabelStyle``, which displays the title only
///
/// All 3 styles have only one initializer, which takes no parameters.
///
/// To use a ``LabelStyle``, pass it to a ``Label``'s ``View/labelStyle(_:)``
/// modifier:
///
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
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct DefaultLabelStyle : LabelStyle {

    /// Creates a default label style.
    ///
    /// Use this label style initializer to ensure all the views in the hierarchy use
    /// the default label style.
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
    public init() { }

    /// Creates a view that represents the body of a label.
    ///
    /// The system calls this method for each ``Label`` instance in a view
    /// hierarchy where this style is the current label style.
    ///
    /// - Parameter configuration: The properties of the label.
    public func makeBody(configuration: DefaultLabelStyle.Configuration) -> some View { }


    /// A view that represents the body of a label.
    public typealias Body = some View
}

