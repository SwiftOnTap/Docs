/// A semantic label describing the label of submission within a view hierarchy.
///
/// A submit label is a description of a submission action provided to a
/// view hierarchy using the ``View/onSubmit(of:_:)`` modifier.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct SubmitLabel {

    /// Defines a submit label with text of "Done".
    public static var done: SubmitLabel { get }

    /// Defines a submit label with text of "Go".
    public static var go: SubmitLabel { get }

    /// Defines a submit label with text of "Send".
    public static var send: SubmitLabel { get }

    /// Defines a submit label with text of "Join".
    public static var join: SubmitLabel { get }

    /// Defines a submit label with text of "Route".
    public static var route: SubmitLabel { get }

    /// Defines a submit label with text of "Search".
    public static var search: SubmitLabel { get }

    /// Defines a submit label with text of "Return".
    public static var `return`: SubmitLabel { get }

    /// Defines a submit label with text of "Next".
    public static var next: SubmitLabel { get }

    /// Defines a submit label with text of "Continue".
    public static var `continue`: SubmitLabel { get }
}
