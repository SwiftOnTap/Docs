@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for lists within this view.
    ///
    /// [[list-style]]
    public func listStyle<S>(_ style: S) -> some View where S : ListStyle { }

}

