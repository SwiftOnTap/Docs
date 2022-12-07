/// An attachment anchor for a popover.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum PopoverAttachmentAnchor {

    /// A rectangular anchor point for the popover attachment.
    case rect(Anchor<CGRect>.Source)

    /// A unit point anchor for the popover attachment.
    case point(UnitPoint)
}

