/// A view that controls a navigation presentation.
///
/// [[navigation-link]]
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct NavigationLink<Label, Destination> : View where Label : View, Destination : View {

    /// Creates an instance that presents `destination`.
    ///
    /// A ``NavigationLink`` should be placed within a ``NavigationView`` and can
    /// be initialized with ``NavigationLink/init(destination:label:)``. To use this
    /// initializer, provide the `destination`, the ``View`` that is linked.
    /// The`label` parameter can be passed in a trailing ``ViewBuilder`` closure.
    ///
    /// ```
    /// struct MenuView: View {
    ///     var body: some View {
    ///         List {
    ///             Text("🥞")
    ///             Text("🥓")
    ///             Text("🍔")
    ///             Text("🍰")
    ///         }
    ///         .navigationTitle("Menu")
    ///     }
    /// }
    ///
    /// struct ContentView: View {
    ///     var body: some View {
    ///         NavigationView {
    ///             NavigationLink(destination: MenuView()) {
    ///                 Text("Menu")
    ///             }
    ///             .navigationTitle("Besty's Diner")
    ///         }
    ///     }
    /// }
    /// ```
    /// ![A gif displaying a view with the title "Betsy's Diner" and a NavigationLink
    /// reading "Menu"; when the link is clicked, another view reading "Menu" with
    /// 4 food emoji items in a list and a back button reading "Betsy's Diner"
    /// slides left over the current view.](nav-link-menu-ex.gif)
    ///
    /// - Parameters
    ///   - destination: A view for the navigation link to present.
    ///   - label: A view builder that produces a label describing the destination.
    public init(destination: Destination, @ViewBuilder label: () -> Label) { }

    /// Creates an instance that presents `destination` when active.
    public init(destination: Destination, isActive: Binding<Bool>, @ViewBuilder label: () -> Label) { }

    /// Creates an instance that presents `destination` when `selection` is set
    /// to `tag`.
    public init<V>(destination: Destination, tag: V, selection: Binding<V?>, @ViewBuilder label: () -> Label) where V : Hashable { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension NavigationLink where Label == Text {

    /// Creates an instance that presents `destination`, with a ``Text`` label
    /// generated from a title string.
    public init(_ titleKey: LocalizedStringKey, destination: Destination) { }

    /// Creates an instance that presents `destination`, with a ``Text`` label
    /// generated from a title string.
    public init<S>(_ title: S, destination: Destination) where S : StringProtocol { }

    /// Creates an instance that presents `destination` when active, with a
    /// ``Text`` label generated from a title string.
    public init(_ titleKey: LocalizedStringKey, destination: Destination, isActive: Binding<Bool>) { }

    /// Creates an instance that presents `destination` when active, with a
    /// ``Text`` label generated from a title string.
    public init<S>(_ title: S, destination: Destination, isActive: Binding<Bool>) where S : StringProtocol { }

    /// Creates an instance that presents `destination` when `selection` is set
    /// to `tag`, with a ``Text`` label generated from a title string.
    public init<V>(_ titleKey: LocalizedStringKey, destination: Destination, tag: V, selection: Binding<V?>) where V : Hashable { }

    /// Creates an instance that presents `destination` when `selection` is set
    /// to `tag`, with a ``Text`` label generated from a title string.
    public init<S, V>(_ title: S, destination: Destination, tag: V, selection: Binding<V?>) where S : StringProtocol, V : Hashable { }
}

@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension NavigationLink {

    /// Sets whether or not the ``NavigationLink`` should present its destination
    /// as the "detail" component of the containing ``NavigationView``.
    ///
    /// If not set, defaults to `true`.
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func isDetailLink(_ isDetailLink: Bool) -> some View { }

}

