@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Sets the header prominence for this view.
    ///
    /// In the following example, the section header appears with increased
    /// prominence:
    ///
    ///     List {
    ///         Section(header: Text("Header")) {
    ///             Text("Row")
    ///         }
    ///         .headerProminence(.increased)
    ///     }
    ///     .listStyle(.insetGrouped)
    ///
    /// - Parameter prominence: The prominence to apply.
    public func headerProminence(_ prominence: Prominence) -> some View { }

}
