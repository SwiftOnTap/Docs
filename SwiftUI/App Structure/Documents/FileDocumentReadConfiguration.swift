/// The configuration for reading file contents.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct FileDocumentReadConfiguration {

    /// The expected uniform type of the file contents.
    public let contentType: UTType

    /// The file wrapper containing the document content.
    public let file: FileWrapper
}

