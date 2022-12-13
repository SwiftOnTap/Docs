@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Disable a list item's "move" action.
    ///
    /// Use this modifier to disable a list item's move action. When enabled, putting a list into edit mode
    /// will expose 3 lines on the right side. The user will then be able to move the row around in the list.
    /// To disable this feature on specific items in the list, use this modifier.
    ///
    /// In the following example, only the first item can be moved.
    ///
    ///     struct Item: Identifiable {
    ///         let id = UUID()
    ///         let name: String
    ///         let unmovable: Bool
    ///     }
    ///
    ///     class Model: ObservableObject {
    ///         @Published var rows: [Item] = [
    ///             Item(name: "Move me! ↕️", unmovable: false),
    ///             Item(name: "I'm fixed as a rock 🗿", unmovable: true)
    ///         ]
    ///     }
    ///
    ///     struct ContentView: View {
    ///         @ObservedObject private var model = Model()
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 List {
    ///                     ForEach(model.rows) { item in
    ///                         Text(item.name)
    ///                             .moveDisabled(item.unmovable)
    ///                     }
    ///                     .onMove { source, destination in
    ///                         model.rows.move(fromOffsets: source,
    ///                                         toOffset: destination)
    ///                     }
    ///                 }
    ///                 .navigationBarItems(trailing: EditButton())
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a view with navigation bar edit button and a list
    /// containing two items, one of which can move positions in the list and
    /// the other for which move has been disabled; when the edit button is
    /// pressed, three gray bars appear on the moveable list item, which is
    /// then dragged and dropped into a new psoition below the other item.](disable-move-ex.gif)
    ///
    /// - Parameter isDisabled: Whether the view's move functionality is disabled.
    @inlinable public func moveDisabled(_ isDisabled: Bool) -> some View { }

}

