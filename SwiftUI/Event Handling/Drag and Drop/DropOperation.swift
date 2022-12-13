/// Operation types that determine how a drag and drop session resolves when the
/// user drops a drag item.
@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public enum DropOperation: Hashable, Equatable {

    /// Cancel the drag operation and transfer no data.
    case cancel

    /// The drop activity is not allowed at this time or location.
    case forbidden

    /// Copy the data to the modified view.
    case copy

    /// Move the data represented by the drag items instead of copying it.
    case move

}
