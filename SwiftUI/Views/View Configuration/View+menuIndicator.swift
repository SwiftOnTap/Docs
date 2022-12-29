@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets the menu indicator visibility for controls within this view.
    ///
    /// Use this modifier to override the default menu indicator
    /// visibility for controls in this view. For example, the code below
    /// creates a menu without an indicator:
    ///
    ///     Menu {
    ///         ForEach(history , id: \.self) { historyItem in
    ///             Button(historyItem.title) {
    ///                 self.openURL(historyItem.url)
    ///             }
    ///         }
    ///     } label: {
    ///         Label("Back", systemImage: "chevron.backward")
    ///             .labelStyle(.iconOnly)
    ///     } primaryAction: {
    ///         if let last = history.last {
    ///             self.openURL(last.url)
    ///         }
    ///     }
    ///     .menuIndicator(.hidden)
    ///
    /// - Parameter visibility: The menu indicator visibility to apply.
    @inlinable public func menuIndicator(_ visibility: Visibility) -> some View { }

}
