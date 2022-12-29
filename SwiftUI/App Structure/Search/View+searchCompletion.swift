@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Associates a fully formed string with the value of this view.
    ///
    /// Use this method to associate a fully formed string with a
    /// view that is within a search suggestion list context. The system
    /// uses this value when the view is selected to replace the
    /// partial text being currently edited of the associated search field.
    ///
    /// On tvOS, the string that you provide to the this modifier is
    /// used when displaying the associated suggestion and when
    /// replacing the partial text of the search field.
    ///
    ///     SearchPlaceholderView()
    ///         .searchable(text: $text) {
    ///             Text("🍎").searchCompletion("apple")
    ///             Text("🍐").searchCompletion("pear")
    ///             Text("🍌").searchCompletion("banana")
    ///         }
    ///
    /// - Parameters:
    ///   - text: A string to use as the view’s completion.
    public func searchCompletion(_ completion: String) -> some View { }

}
