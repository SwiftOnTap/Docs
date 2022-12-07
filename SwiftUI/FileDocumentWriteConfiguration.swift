/// The configuration for serializing file contents.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct FileDocumentWriteConfiguration {

    /// The expected uniform type of the file contents.
    public let contentType: UTType

    /// The file wrapper containing the current document content.
    /// `nil` if the document is unsaved.
    public let existingFile: FileWrapper?
}

