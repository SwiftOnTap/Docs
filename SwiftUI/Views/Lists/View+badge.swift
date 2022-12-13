@available(iOS 15.0, macOS 12.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension View {

    /// Generates a badge for the view from an integer value.
    ///
    /// Use a badge to convey optional, supplementary information about a
    /// view. Keep the contents of the badge as short as possible. Badges
    /// appear only in list rows and tab bars.
    ///
    /// The following example shows a ``List`` with the value of `recentItems.count`
    /// represented by a badge on one of the rows:
    ///
    ///     List {
    ///         Text("Recents")
    ///             .badge(recentItems.count)
    ///         Text("Favorites")
    ///     }
    ///
    /// ![A table with two rows, titled Recents and Favorites. The first row
    /// shows the number 10 at the trailing side of the row
    ///  cell.](View-badge-1)
    ///
    /// - Parameter count: An integer value to display in the badge.
    ///   Set the value to zero to hide the badge.
    public func badge(_ count: Int) -> some View { }


    /// Generates a badge for the view from a text view.
    ///
    /// Use a badge to convey optional, supplementary information about a
    /// view. Keep the contents of the badge as short as possible. Badges
    /// appear only in list rows and tab bars.
    ///
    /// Use this initializer when you want to style a ``Text`` view for use as a
    /// badge. The following example customizes the badge with the
    /// ``Text/monospacedDigit()``, ``Text/foregroundColor(_:)``, and
    /// ``Text/bold()`` modifiers.
    ///
    ///     var body: some View {
    ///         let badgeView = Text("\(recentItems.count)")
    ///             .monospacedDigit()
    ///             .foregroundColor(.red)
    ///             .bold()
    ///
    ///         List {
    ///             Text("Recents")
    ///                 .badge(badgeView)
    ///             Text("Favorites")
    ///         }
    ///     }
    ///
    /// ![A table with two rows, titled Recents and Favorites. The first row
    /// shows the number 21 at the side of the row cell. The number badge
    /// appears in bold red text with monospaced digits.](View-badge-2)
    ///
    /// Styling the text view has no effect when the badge appears in
    /// a ``TabView``.
    ///
    /// - Parameter label: An optional ``Text`` view to display as a badge.
    ///   Set the value to `nil` to hide the badge.
    public func badge(_ label: Text?) -> some View { }


    /// Generates a badge for the view from a localized string key.
    ///
    /// Use a badge to convey optional, supplementary information about a
    /// view. Keep the contents of the badge as short as possible. Badges
    /// appear only in list rows and tab bars.
    ///
    /// This modifier creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:tableName:bundle:comment:)``. For
    /// more information about localizing strings, see ``Text``. The following
    /// example shows a list with a "Default" badge on one of its rows.
    ///
    ///     NavigationView {
    ///         List(servers) { server in
    ///             Text(server.name)
    ///                 .badge(server.isDefault ? "Default" : nil)
    ///         }
    ///         .navigationTitle("Servers")
    ///     }
    ///
    /// ![A table with the navigation title Servers and four rows: North 1,
    /// North 2, East 1, and South 1. The North 2 row shows a badge with the
    /// text Default on its trailing side.](View-badge-3)
    ///
    /// - Parameter key: An optional string key to display as a badge.
    ///   Set the value to `nil` to hide the badge.
    public func badge(_ key: LocalizedStringKey?) -> some View { }


    /// Generates a badge for the view from a string.
    ///
    /// Use a badge to convey optional, supplementary information about a
    /// view. Keep the contents of the badge as short as possible. Badges only
    /// appear in list rows and tab bars.
    ///
    /// This modifier creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:)-9d1g4``. The following
    /// example shows a list with a "Default" badge on one of its rows.
    ///
    ///     NavigationView {
    ///         List(servers) { server in
    ///             Text(server.name)
    ///                 .badge(server.defaultString())
    ///         }
    ///         .navigationTitle("Servers")
    ///     }
    ///
    /// ![A table with the navigation title Servers and four rows: North 1,
    /// North 2, East 1, and South 1. The North 2 row shows a badge with the
    /// text Default on its trailing side.](View-badge-3)
    ///
    /// - Parameter label: An optional string to display as a badge.
    ///   Set the value to `nil` to hide the badge.
    public func badge<S>(_ label: S?) -> some View where S : StringProtocol { }

}

