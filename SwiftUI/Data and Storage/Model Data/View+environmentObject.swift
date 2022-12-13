@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Supplies an `ObservableObject` to a view subhierachy.
    ///
    /// ``View/environmentObject(_:)`` supplies an ``ObservableObject`` to a
    /// view subhierachy. See ``ObservableObject`` for more on passing data
    /// between views.
    ///
    /// [[environment-objects]]
    ///
    /// - Parameter object: the object to store and make available to
    ///     the view's subhiearchy.
    @inlinable public func environmentObject<T>(_ object: T) -> some View where T : ObservableObject { }

}

