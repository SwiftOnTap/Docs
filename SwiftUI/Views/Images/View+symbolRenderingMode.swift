@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Sets the rendering mode for symbol images within this view.
    ///
    /// - Parameter mode: The symbol rendering mode to use.
    ///
    /// - Returns: A view that uses the rendering mode you supply.
    @inlinable public func symbolRenderingMode(_ mode: SymbolRenderingMode?) -> some View { }

}
