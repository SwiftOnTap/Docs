/// The behavior and appearance of a sidebar or source list.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         List {
///             Text("Bananas 🍌🍌")
///             Text("Apples 🍎🍎")
///             Text("Peaches 🍑🍑")
///         }
///         .listStyle(SidebarListStyle())
///     }
/// }
/// ```
///
/// ![A view diplaying a sidebar list with three items "Bananas 🍌🍌", "Apples
/// 🍎🍎", "Peaches 🍑🍑", which are right aligned and separated by spacing.](6BC5187B-683C-4E3C-9EA1-BDA2950108F6.png)
///
@available(iOS 14.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SidebarListStyle : ListStyle {

    /// Creates a sidebar list style.
    public init() { }
}

