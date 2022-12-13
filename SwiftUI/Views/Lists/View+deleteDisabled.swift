@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Disable a list item's delete action.
    ///
    /// Use this modifier to disable a list item's delete action. When a list is editable, swiping left
    /// on it will expose a red "DELETE" button. To disable this feature on specific items in the list,
    /// use this modifier.
    ///
    /// In the following example, only the first item can be deleted.
    ///
    ///     struct Item: Identifiable {
    ///         let id = UUID()
    ///         let name: String
    ///         let undeletable: Bool
    ///     }
    ///
    ///     class Model: ObservableObject {
    ///         @Published var rows: [Item] = [
    ///             Item(name: "Swipe ⬅️ to delete me", undeletable: false),
    ///             Item(name: "Try deleting me, you can't 😊", undeletable: true),
    ///         ]
    ///     }
    ///
    ///     struct ExampleView: View {
    ///         @ObservedObject private var model = Model()
    ///
    ///         var body: some View {
    ///             List {
    ///                 ForEach(model.rows) { item in
    ///                     Text(item.name)
    ///                         .deleteDisabled(item.undeletable)
    ///                 }
    ///                 .onDelete { offsets in
    ///                     model.rows.remove(atOffsets: offsets)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a view with a list containing two items, one of which
    /// is deletable and the other in which delete has been disabled; the gif
    /// shows the first item, which reads "Swipe ⬅️ to delete me" being deleted
    /// by swiping all the way left so that the red delete bar covers the item
    /// and it disappears completely.](disable-delete-ex.gif)
    ///
    /// - Parameter isDisabled: Whether the view's delete functionality is disabled.
    @inlinable public func deleteDisabled(_ isDisabled: Bool) -> some View { }

}

