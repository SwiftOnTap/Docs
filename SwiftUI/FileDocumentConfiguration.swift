/// The properties of an open file document.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct FileDocumentConfiguration<Document> where Document : FileDocument {

    /// The current document model.
    ///
    /// Setting a new value will mark the document as dirty for later saving
    /// as well as register an undo action to restore the model to its previous
    /// value.
    ///
    /// If `isEditable` is `false`, setting a new value will have no effect.
    public var document: Document { get /*nonmutating set*/ }

    /// A read-write binding to the current document model.
    public var $document: Binding<Document> { get }

    /// The url of the open file document.
    public var fileURL: URL?

    /// Whether the document is able to be edited.
    ///
    /// This can return `false` if the document is in viewing mode or if the
    /// file is unable to be written to.
    public var isEditable: Bool
}

