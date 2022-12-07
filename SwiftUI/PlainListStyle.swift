/// The instance that describes the behavior and appearance of a plain list.
///
///
///     struct ExampleView: View {
///         var body: some View {
///             List {
///                 Text("Bananas 🍌🍌")
///                 Text("Apples 🍎🍎")
///                 Text("Peaches 🍑🍑")
///             }
///             .listStyle(PlainListStyle())
///         }
///     }
///
/// ![A view diplaying a plain list with three items "Bananas 🍌🍌", "Apples
/// 🍎🍎", "Peaches 🍑🍑", which are separated by thin gray lines.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/liststyle-plain-example-1.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlainListStyle : ListStyle {

    /// Creates a plain list style.
    public init() { }
}

