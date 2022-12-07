@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Places a custom background view behind a list row item.
    ///
    /// Use ``View/listRowBackground(_:)`` to place a custom background view behind a
    /// list row item.
    ///
    /// [[list-row-background]]
    ///
    /// In the example below, the `Flavor` enumeration provides content for list
    /// items. The SwiftUI ``List`` builder iterates over the `Flavor`
    /// enumeration and extracts the raw value of each of its elements using the
    /// resulting text to create each list row item. After the list builder
    /// finishes, the ``View/listRowBackground(_:)`` modifier places the view you
    /// supply behind each of the list row items.
    ///
    ///     struct ListRowBackground: View {
    ///
    ///         enum Flavor: String, CaseIterable, Identifiable {
    ///             var id: String { self.rawValue }
    ///             case vanilla, chocolate, strawberry
    ///         }
    ///
    ///         var body: some View {
    ///             List {
    ///                 ForEach(Flavor.allCases, id: \.self) { flavor in
    ///                     Text(flavor.rawValue)
    ///                         .listRowBackground(Image(systemName: "sparkles"))
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A view containing a list with three text views, "vanilla",
    /// "chocolate", and "strawberry", populated from an enum, each with
    /// sparkles as a the list row background.](listrowbackground.png)
    ///
    /// - Parameter view: The ``View`` to use as the background behind the list
    ///   row view.
    ///
    /// - Returns: A list row view with ``view`` as its background view.
    @inlinable public func listRowBackground<V>(_ view: V?) -> some View where V : View { }

}

