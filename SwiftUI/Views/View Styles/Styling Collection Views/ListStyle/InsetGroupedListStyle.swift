/// The instance that describes the behavior and appearance of an inset grouped list.
///
/// This style creates a gap between the borders of the list and the edge of the screen:
///
///     struct ExampleView: View {
///         var body: some View {
///             List {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍎🍎")
///                 Text("Peaches 🍑🍑")
///             }
///             .listStyle(InsetGroupedListStyle())
///         }
///     }
///
/// ![A view which contains an inset grouped listwith three text items, "Bananas 🍌🍌","Apples 🍎🍎",
/// and "Peaches 🍑🍑"; the set of list items sit together in a rounded box that is separated by a gap from
/// the edge of the frame.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/liststyle-inset-grouped-example-1.png)
///
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct InsetGroupedListStyle : ListStyle {

    /// Creates an inset grouped list style.
    public init() { }
}

