/// A proxy value allowing the scrollable views within a view hierarchy
/// to be scrolled programmatically.
///
/// [[scrollview-proxy]]
///
/// [[scrollview-scrollto]]
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ScrollViewProxy {

    /// Scroll to a section given a specific identifier.
    ///
    /// Scans all scroll views within the proxy for the first
    /// that has a child view with identifier `id`, and then scrolls to
    /// that view.
    ///
    /// [[scrollview-scrollto]]
    ///
    /// If ``anchor`` is nil the container of the identified view will be
    /// scrolled the minimum amount to make the identified view wholly
    /// visible.
    ///
    /// If ``anchor`` is non-nil it defines the points in the identified
    /// view and the scroll view that will be aligned, e.g. `.top`
    /// aligns the top of the identified view to the top of the scroll
    /// view, `.bottom` aligns the bottom of the identified view to the
    /// bottom of the scroll view, and so on.
    ///
    public func scrollTo<ID>(_ id: ID, anchor: UnitPoint? = nil) where ID : Hashable { }
}


