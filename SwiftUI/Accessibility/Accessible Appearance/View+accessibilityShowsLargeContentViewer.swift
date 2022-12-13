extension View {

    /// Adds a custom large content view to be shown by
    /// the large content viewer.
    ///
    /// Rely on the large content viewer only in situations
    /// where items must remain small due to unavoidable
    /// design constraints. For example, buttons in a tab bar
    /// remain small to leave more room for the main app content.
    ///
    /// The following example shows how to add a custom large
    /// content view:
    ///
    ///     var body: some View {
    ///         Button(action: newMessage) {
    ///             Image(systemName: "plus")
    ///         }
    ///         .accessibilityShowsLargeContentViewer {
    ///             Label("New Message", systemImage: "plus")
    ///         }
    ///     }
    ///
    /// Don’t use the large content viewer as a replacement for proper
    /// Dynamic Type support. For example, Dynamic Type allows items
    /// in a list to grow or shrink vertically to accommodate the user’s preferred
    /// font size. Rely on the large content viewer only in situations where
    /// items must remain small due to unavoidable design constraints.
    ///
    /// For example, views that have their Dynamic Type size constrained
    /// with ``View/dynamicTypeSize(_:)-26aj0`` or
    /// ``View/dynamicTypeSize(_:)-26aj0`` may require a
    /// large content view.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public func accessibilityShowsLargeContentViewer<V>(@ViewBuilder _ largeContentView: () -> V) -> some View where V : View { }


    /// Adds a default large content view to be shown by
    /// the large content viewer.
    ///
    /// Rely on the large content viewer only in situations
    /// where items must remain small due to unavoidable
    /// design constraints. For example, buttons in a tab bar
    /// remain small to leave more room for the main app content.
    ///
    /// The following example shows how to add a custom large
    /// content view:
    ///
    ///     var body: some View {
    ///         Button("New Message", action: newMessage)
    ///             .accessibilityShowsLargeContentViewer()
    ///     }
    ///
    /// Don’t use the large content viewer as a replacement for proper
    /// Dynamic Type support. For example, Dynamic Type allows items
    /// in a list to grow or shrink vertically to accommodate the user’s preferred
    /// font size. Rely on the large content viewer only in situations where
    /// items must remain small due to unavoidable design constraints.
    ///
    /// For example, views that have their Dynamic Type size constrained
    /// with ``View/dynamicTypeSize(_:)-26aj0`` or
    /// ``View/dynamicTypeSize(_:)-26aj0`` may require a
    /// large content view.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public func accessibilityShowsLargeContentViewer() -> some View { }

}

