/// The properties of an open reference file document.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ReferenceFileDocumentConfiguration<Document> where Document : ReferenceFileDocument {

    /// The current document model.
    ///
    /// Changes to the document are observed and on change dirty the document
    /// state for resaving. Undo actions are not automatically registered and
    /// need to be done explicitly.
    public var document: Document

    /// A read-only binding to the current document model.
    public var $document: ObservedObject<Document>.Wrapper { get }

    /// The url of the open file document.
    public var fileURL: URL?

    /// Whether the document is able to be edited.
    ///
    /// This can return `false` if the document is in viewing mode or if the
    /// file is unable to be written to.
    public var isEditable: Bool
}

