/// A value that describes the purpose of a button.
///
/// A button role provides a description of a button's purpose.  For example,
/// the ``ButtonRole/destructive`` role indicates that a button performs
/// a destructive action, like delete user data:
///
///     Button("Delete", role: .destructive) { delete() }
///
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ButtonRole : Equatable {

    /// A role that indicates a destructive button.
    ///
    /// Use this role for a button that deletes user data, or performs an
    /// irreversible operation. A destructive button signals by its appearance
    /// that the user should carefully consider whether to tap or click the
    /// button. For example, SwiftUI presents a destructive button that you add
    /// with the ``View/swipeActions(edge:allowsFullSwipe:content:)``
    /// modifier using a red background:
    ///
    ///     List {
    ///         ForEach(items) { item in
    ///             Text(item.title)
    ///                 .swipeActions {
    ///                     Button(role: .destructive) { delete() } label: {
    ///                         Label("Delete", systemImage: "trash")
    ///                     }
    ///                 }
    ///         }
    ///     }
    ///     .navigationTitle("Shopping List")
    ///
    /// ![A screenshot of a list of three items, where the second item is
    /// shifted to the left, and the row displays a red button with a trash
    /// icon on the right side.](ButtonRole-destructive-1)
    public static let destructive: ButtonRole

    /// A role that indicates a button that cancels an operation.
    ///
    /// Use this role for a button that cancels the current operation.
    public static let cancel: ButtonRole

}

