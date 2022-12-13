/// The instance that describes a platform's default behavior and appearance for
/// a list.
///
///     struct ExampleView: View {
///         var body: some View {
///             List {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍎🍎")
///                 Text("Peaches 🍑🍑")
///             }
///             .listStyle(DefaultListStyle())
///         }
///     }
///
/// ![A white view containing a list with three text items.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/liststyle-default-example-1.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultListStyle : ListStyle {

    /// Creates a default list style.
    public init() { }
}

