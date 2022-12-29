/// The behavior of a drop.
@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DropProposal {

    /// The drop operation that the drop proposes to perform.
    public let operation: DropOperation

    /// Creates a drop proposal based on the provided operation.
    ///
    /// - Parameter operation: The drop operation to associate with the proposal.
    ///
    /// - SeeAlso: DropOperation
    public init(operation: DropOperation) { }
}

