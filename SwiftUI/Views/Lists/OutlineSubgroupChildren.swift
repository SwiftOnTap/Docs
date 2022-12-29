/// A type-erased view representing the children in an outline subgroup.
///
/// ``OutlineGroup`` uses this type as a generic constraint for the `Content`
/// of the ``DisclosureGroup`` instances it creates.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct OutlineSubgroupChildren : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

