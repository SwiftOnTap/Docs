@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Sets the tint effect associated with specific content in a list.
    ///
    /// The containing list's style will apply that tint as appropriate. watchOS
    /// uses the tint color for its background platter appearance. Sidebars on
    /// iOS and macOS apply the tint color to their ``Label`` icons, which
    /// otherwise use the accent color by default.
    ///
    /// See ``ListItemTint`` for more on the 3 options for tinting a list.
    ///
    /// ```
    /// struct SettingsView: View {
    ///     var body: some View {
    ///         List {
    ///             Label("Airplane Mode", systemImage: "airplane.circle.fill")
    ///                 .listItemTint(.fixed(Color.orange))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single list item that reads "Airplane Mode"
    /// with a circular airplane icon to its left. The view modifier render the
    /// icon as orange.](listitemtint-orange.png)
    ///
    /// - Parameter tint: The tint effect to use, or nil to not override the
    ///   inherited tint.
    @inlinable public func listItemTint(_ tint: ListItemTint?) -> some View { }


    /// Sets a fixed tint color associated with specific content in a list.
    ///
    /// This is equivalent to using a tint of `ListItemTint.fixed(_:)` with the
    /// provided `tint` color.
    ///
    /// The containing list's style will apply that tint as appropriate. watchOS
    /// uses the tint color for its background platter appearance. Sidebars on
    /// iOS and macOS apply the tint color to their ``Label`` icons, which
    /// otherwise use the accent color by default.
    ///
    /// ```
    /// struct SettingsView: View {
    ///     var body: some View {
    ///         List {
    ///             Label("Airplane Mode", systemImage: "airplane.circle.fill")
    ///                 .listItemTint(Color.orange)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single list item that reads "Airplane Mode"
    /// with a circular airplane icon to its left. The view modifier render the
    /// icon as orange.](listitemtint-orange.png)
    ///
    /// - Parameter color: The color to use to tint the content, or nil to not
    ///   override the inherited tint.
    @inlinable public func listItemTint(_ tint: Color?) -> some View { }

}

