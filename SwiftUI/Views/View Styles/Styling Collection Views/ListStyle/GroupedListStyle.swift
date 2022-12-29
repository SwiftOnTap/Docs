/// A standard grouped list style.
///
///     struct ExampleView: View {
///         var body: some View {
///             List {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍎🍎")
///                 Text("Peaches 🍑🍑")
///             }
///             .listStyle(GroupedListStyle())
///         }
///     }
///
/// ![A view containing a grouped list with three text views, "Bananas 🍌🍌",
/// "Apples 🍎🍎", and "Peaches 🍑🍑".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/liststyle-grouped-example-1.png)
///
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct GroupedListStyle : ListStyle {

    /// Creates a grouped list style.
    public init() { }
}

