/// This protocol modifies how a list appears and behaves.
///
/// No public interface is provided for this protocol, but several styles are
/// provided by SwiftUI. These can be applied to a `List` with the
/// ``View/listStyle(_:)`` modifier.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         List {
///             Text("🍌🍌")
///             Text("🍎🍎")
///         }
///         .listStyle(InsetListStyle())
///     }
/// }
/// ```
///
/// ![A view containing an inset list wiht two text items.](BF5B130F-5A57-4FC5-8A40-723D8F924A06.png)
///
/// Two list styles are included specifically for rendering grouped lists:
/// - ``GroupedListStyle``
/// - ``InsetGroupedListStyle``
///
/// These styles provide styling consistent with operating system standards
/// for sectioned lists, including header styling.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         List {
///             Section(header: Text("🍌🍌")) {
///                 Text("🔥🔥")
///             }
///             Section(header: Text("🍎🍎")) {
///                 Text("🔥🔥")
///             }
///         }
///         .listStyle(GroupedListStyle())
///     }
/// }
/// ```
///
/// ![A view containing a list with two grouped sections.](8BDD107D-5866-4017-8B13-08DCF8F17495.png)
///
/// Many SwiftUI list styles can be visualized
/// [here](https://swift-cast.com/2020/10/1/). All styles are explicitly
/// referenced below.
///
/// - ``DefaultListStyle`` - provides the default list behavior and appearence
/// for the platform.
/// - ``GroupedListStyle`` - provides default list behavior for grouped lists,
/// including appropriate formating of section headers.
/// - ``InsetGroupedListStyle`` - is a variation of GroupedListStyle with insets
/// including row backgrounds with rounded corners.
/// - ``InsetListStyle`` - is similar to a plain list, but includes additional
/// layout insets.
/// - ``PlainListStyle`` - provides platform standard list appearance and
/// behavior.
/// - ``SidebarListStyle`` - provides styling and behavior designed for an
/// application level navigation bar used in iPadOS and MacOS. An example
/// implementation can be found
/// [here](https:swiftwithmajid.com/2020/07/21/sidebar-navigation-in-swiftui/).
/// Currently not working properly on MacCatalyst.
/// - `EllipticalListStyle` - provides an elliptical list experience on watchOS,
/// including haptic feedback and unique animation when scrolling.
/// - `CarouselListStyle` - provides a coverflow-like experience on watchOS
/// lists including scroll animations that shrinks cells off-screen.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ListStyle { }
extension ListStyle {
}

