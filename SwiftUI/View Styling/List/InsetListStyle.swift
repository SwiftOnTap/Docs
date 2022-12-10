/// The behavior and appearance of an inset list.
///
/// Use the ``View/listStyle(_:)`` modifier to apply this list style to a
/// ``List``. This style creates a gap between the borders of the list and the
/// edge of the screen:
///
///     struct ExampleView: View {
///         var body: some View {
///             List {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍎🍎")
///                 Text("Peaches 🍑🍑")
///             }
///             .listStyle(InsetListStyle())
///         }
///     }
///
///
/// ![A view displaying an inset list with three items "Bananas 🍌🍌", "Apples 🍎🍎",
/// and "Peaches 🍑🍑"; the list items and the thin gray lines that separate them
/// sit condensed in the center of the view, creating a gap between the list and the edges of the frame.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/liststyle-inset-example-1.png)
///
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct InsetListStyle : ListStyle {

    /// Creates an inset list style.
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             List {
    ///                 Text("Bananas 🍌🍌")
    ///                 Text("Apples 🍎🍎")
    ///                 Text("Peaches 🍑🍑")
    ///             }
    ///             .listStyle(InsetListStyle())
    ///         }
    ///     }
    ///
    /// ![A view displaying an inset list with three items "Bananas 🍌🍌", "Apples 🍎🍎",
    /// and "Peaches 🍑🍑"; the list items and the thin gray lines that separate them
    /// sit condensed in the center of the view, creating a gap between the list and the
    /// edges of the frame.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/liststyle-inset-example-1.png)
    ///
    public init() { }
}

