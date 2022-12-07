@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Defines a group of views with synchronized geometry using an
    /// identifier and namespace that you provide.
    ///
    /// This method sets the geometry of each view in the group from the
    /// inserted view with `isSource = true` (known as the "source" view),
    /// updating the values marked by `properties`.
    ///
    /// If inserting a view in the same transaction that another view
    /// with the same key is removed, the system will interpolate their
    /// frame rectangles in window space to make it appear that there
    /// is a single view moving from its old position to its new
    /// position. The usual transition mechanisms define how each of
    /// the two views is rendered during the transition (e.g. fade
    /// in/out, scale, etc), the `matchedGeometryEffect()` modifier
    /// only arranges for the geometry of the views to be linked, not
    /// their rendering.
    ///
    /// If the number of currently-inserted views in the group with
    /// `isSource = true` is not exactly one results are undefined, due
    /// to it not being clear which is the source view.
    ///
    /// - Parameters:
    ///   - id: The identifier, often derived from the identifier of
    ///     the data being displayed by the view.
    ///   - namespace: The namespace in which defines the `id`. New
    ///     namespaces are created by adding an `@Namespace()` variable
    ///     to a ``View`` type and reading its value in the view's body
    ///     method.
    ///   - properties: The properties to copy from the source view.
    ///   - anchor: The relative location in the view used to produce
    ///     its shared position value.
    ///   - isSource: True if the view should be used as the source of
    ///     geometry for other views in the group.
    ///
    /// - Returns: A new view that defines an entry in the global
    ///   database of views synchronizing their geometry.
    ///
    @inlinable public func matchedGeometryEffect<ID>(id: ID, in namespace: Namespace.ID, properties: MatchedGeometryProperties = .frame, anchor: UnitPoint = .center, isSource: Bool = true) -> some View where ID : Hashable { }

}

