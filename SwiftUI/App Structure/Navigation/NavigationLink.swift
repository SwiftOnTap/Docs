/// A view that controls a navigation presentation.
///
/// [[navigation-link]]
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct NavigationLink<Label, Destination> : View where Label : View, Destination : View {
    
    /// Creates a navigation link that presents the destination view.
    ///
    /// - Parameters:
    ///   - destination: A view for the navigation link to present.
    ///   - label: A view builder to produce a label describing the `destination`
    ///    to present.
    public init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label) { }
    
    /// Creates a navigation link that presents the destination view when active.
    /// - Parameters:
    ///   - isActive: A binding to a Boolean value that indicates whether
    ///   `destination` is currently presented.
    ///   - destination: A view for the navigation link to present.
    ///   - label: A view builder to produce a label describing the `destination`
    ///    to present.
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(value:label:) inside a NavigationStack or NavigationSplitView")
    @available(macOS, introduced: 10.15, deprecated: 13.0, message: "use NavigationLink(value:label:) inside a NavigationStack or NavigationSplitView")
    @available(tvOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(value:label:) inside a NavigationStack or NavigationSplitView")
    @available(watchOS, introduced: 6.0, deprecated: 9.0, message: "use NavigationLink(value:label:) inside a NavigationStack or NavigationSplitView")
    public init(isActive: Binding<Bool>, @ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label) { }
    
    /// Creates a navigation link that presents the destination view when
    /// a bound selection variable equals a given tag value.
    /// - Parameters:
    ///   - tag: The value of `selection` that causes the link to present
    ///   `destination`.
    ///   - selection: A bound variable that causes the link to present
    ///   `destination` when `selection` becomes equal to `tag`.
    ///   - destination: A view for the navigation link to present.
    ///   - label: A view builder to produce a label describing the
    ///   `destination` to present.
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(value:label:) inside a List within a NavigationStack or NavigationSplitView")
    @available(macOS, introduced: 10.15, deprecated: 13.0, message: "use NavigationLink(value:label:) inside a List within a NavigationStack or NavigationSplitView")
    @available(tvOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(value:label:) inside a List within a NavigationStack or NavigationSplitView")
    @available(watchOS, introduced: 6.0, deprecated: 9.0, message: "use NavigationLink(value:label:) inside a List within a NavigationStack or NavigationSplitView")
    public init<V>(tag: V, selection: Binding<V?>, @ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label) where V : Hashable
    
    /// The content and behavior of the view.
    public var body: some View { get }

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
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Pass a closure as the destination")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Pass a closure as the destination")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Pass a closure as the destination")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Pass a closure as the destination")
    public init(destination: Destination, @ViewBuilder label: () -> Label) { }

    /// Creates an instance that presents `destination` when active.
    ///
    /// - Parameters:
    ///   - destination: A view for the navigation link to present.
    ///   - isActive: A binding to a Boolean value that indicates whether
    ///   `destination` is currently presented.
    ///   - label: A view builder to produce a label describing the `destination`
    ///    to present.
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(value:label:) inside a NavigationStack or NavigationSplitView")
    @available(macOS, introduced: 10.15, deprecated: 13.0, message: "use NavigationLink(value:label:) inside a NavigationStack or NavigationSplitView")
    @available(tvOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(value:label:) inside a NavigationStack or NavigationSplitView")
    @available(watchOS, introduced: 6.0, deprecated: 9.0, message: "use NavigationLink(value:label:) inside a NavigationStack or NavigationSplitView")
    public init(destination: Destination, isActive: Binding<Bool>, @ViewBuilder label: () -> Label) { }

    /// Creates an instance that presents `destination` when `selection` is set
    /// to `tag`.
    ///
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(value:label:) inside a List within a NavigationStack or NavigationSplitView")
    @available(macOS, introduced: 10.15, deprecated: 13.0, message: "use NavigationLink(value:label:) inside a List within a NavigationStack or NavigationSplitView")
    @available(tvOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(value:label:) inside a List within a NavigationStack or NavigationSplitView")
    @available(watchOS, introduced: 6.0, deprecated: 9.0, message: "use NavigationLink(value:label:) inside a List within a NavigationStack or NavigationSplitView")
    public init<V>(destination: Destination, tag: V, selection: Binding<V?>, @ViewBuilder label: () -> Label) where V : Hashable { }

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
    ///
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Pass a closure as the destination")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Pass a closure as the destination")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Pass a closure as the destination")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Pass a closure as the destination")
    public init(_ titleKey: LocalizedStringKey, destination: Destination) { }

    /// Creates an instance that presents `destination`, with a ``Text`` label
    /// generated from a title string.
    ///
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Pass a closure as the destination")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Pass a closure as the destination")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Pass a closure as the destination")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Pass a closure as the destination")
    public init<S>(_ title: S, destination: Destination) where S : StringProtocol { }

    /// Creates an instance that presents `destination` when active, with a
    /// ``Text`` label generated from a title string.
    ///
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a NavigationStack or NavigationSplitView")
    @available(macOS, introduced: 10.15, deprecated: 13.0, message: "use NavigationLink(_:value:) inside a NavigationStack or NavigationSplitView")
    @available(tvOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a NavigationStack or NavigationSplitView")
    @available(watchOS, introduced: 6.0, deprecated: 9.0, message: "use NavigationLink(_:value:) inside a NavigationStack or NavigationSplitView")
    public init(_ titleKey: LocalizedStringKey, destination: Destination, isActive: Binding<Bool>) { }

    /// Creates an instance that presents `destination` when active, with a
    /// ``Text`` label generated from a title string.
    ///
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a NavigationStack or NavigationSplitView")
    @available(macOS, introduced: 10.15, deprecated: 13.0, message: "use NavigationLink(_:value:) inside a NavigationStack or NavigationSplitView")
    @available(tvOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a NavigationStack or NavigationSplitView")
    @available(watchOS, introduced: 6.0, deprecated: 9.0, message: "use NavigationLink(_:value:) inside a NavigationStack or NavigationSplitView")
    public init<S>(_ title: S, destination: Destination, isActive: Binding<Bool>) where S : StringProtocol { }

    /// Creates a navigation link that presents a destination view when a bound
    /// selection variable matches a value you provide, using a text label
    /// that the link generates from a localized string key.
    /// - Parameters:
    ///   - titleKey: A localized string key for creating a text label.
    ///   - tag: The value of `selection` that causes the link to present
    ///   `destination`.
    ///   - selection: A bound variable that causes the link to present
    ///   `destination` when `selection` becomes equal to `tag`.
    ///   - destination: A view for the navigation link to present.
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(macOS, introduced: 10.15, deprecated: 13.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(tvOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(watchOS, introduced: 6.0, deprecated: 9.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    public init<V>(_ titleKey: LocalizedStringKey, tag: V, selection: Binding<V?>, @ViewBuilder destination: () -> Destination) where V : Hashable

    /// Creates a navigation link that presents a destination view when a bound
    /// selection variable matches a value you provide, using a text label
    /// that the link generates from a title string.
    /// - Parameters:
    ///   - title: A string for creating a text label.
    ///   - tag: The value of `selection` that causes the link to present
    ///   `destination`.
    ///   - selection: A bound variable that causes the link to present
    ///   `destination` when `selection` becomes equal to `tag`.
    ///   - destination: A view for the navigation link to present.
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(macOS, introduced: 10.15, deprecated: 13.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(tvOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(watchOS, introduced: 6.0, deprecated: 9.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    public init<S, V>(_ title: S, tag: V, selection: Binding<V?>, @ViewBuilder destination: () -> Destination) where S : StringProtocol, V : Hashable
    
    /// Creates a navigation link that presents a destination view when a bound
    /// selection variable matches a value you provide, using a text label
    /// that the link generates from a localized string key.
    /// - Parameters:
    ///   - titleKey: A localized string key for creating a text label.
    ///   - destination: A view for the navigation link to present.
    ///   - tag: The value of `selection` that causes the link to present
    ///   `destination`.
    ///   - selection: A bound variable that causes the link to present
    ///   `destination` when `selection` becomes equal to `tag`.
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(macOS, introduced: 10.15, deprecated: 13.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(tvOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(watchOS, introduced: 6.0, deprecated: 9.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    public init<V>(_ titleKey: LocalizedStringKey, destination: Destination, tag: V, selection: Binding<V?>) where V : Hashable
    
    /// Creates a navigation link that presents a destination view when a bound
    /// selection variable matches a value you provide, using a text label
    /// that the link generates from a title string.
    /// - Parameters:
    ///   - title: A string for creating a text label.
    ///   - destination: A view for the navigation link to present.
    ///   - tag: The value of `selection` that causes the link to present
    ///   `destination`.
    ///   - selection: A bound variable that causes the link to present
    ///   `destination` when `selection` becomes equal to `tag`.
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(macOS, introduced: 10.15, deprecated: 13.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(tvOS, introduced: 13.0, deprecated: 16.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    @available(watchOS, introduced: 6.0, deprecated: 9.0, message: "use NavigationLink(_:value:) inside a List within a NavigationStack or NavigationSplitView")
    public init<S, V>(_ title: S, destination: Destination, tag: V, selection: Binding<V?>) where S : StringProtocol, V : Hashable

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

