@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Presents a system interface for allowing the user to export an in-memory
    /// document to a file on disk.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `document` must not be `nil`. When the operation is finished,
    /// `isPresented` will be set to `false` before `onCompletion` is called. If
    /// the user cancels the operation, `isPresented` will be set to `false` and
    /// `onCompletion` will not be called.
    ///
    /// The `contentType` provided must be included within the document type's
    /// `writableContentTypes`, otherwise the first valid writable content type
    /// will be used instead.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - document: The in-memory document to export.
    ///   - contentType: The content type to use for the exported file.
    ///   - defaultFilename: If provided, the default name to use for the
    ///     exported file, which will the user will have an opportunity to edit
    ///     prior to the export.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     has succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileExporter<D>(isPresented: Binding<Bool>, document: D?, contentType: UTType, defaultFilename: String? = nil, onCompletion: @escaping (Result<URL, Error>) -> Void) -> some View where D : FileDocument { }


    /// Presents a system interface for allowing the user to export a collection
    /// of in-memory documents to files on disk.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `documents` must not be empty. When the operation is finished,
    /// `isPresented` will be set to `false` before `onCompletion` is called. If
    /// the user cancels the operation, `isPresented` will be set to `false` and
    /// `onCompletion` will not be called.
    ///
    /// The `contentType` provided must be included within the document type's
    /// `writableContentTypes`, otherwise the first valid writable content type
    /// will be used instead.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - documents: The collection of in-memory documents to export.
    ///   - contentType: The content type to use for the exported file.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     has succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileExporter<C>(isPresented: Binding<Bool>, documents: C, contentType: UTType, onCompletion: @escaping (Result<[URL], Error>) -> Void) -> some View where C : Collection, C.Element : FileDocument { }


    /// Presents a system interface for allowing the user to export an in-memory
    /// document to a file on disk.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `document` must not be `nil`. When the operation is finished,
    /// `isPresented` will be set to `false` before `onCompletion` is called. If
    /// the user cancels the operation, `isPresented` will be set to `false` and
    /// `onCompletion` will not be called.
    ///
    /// The `contentType` provided must be included within the document type's
    /// `writableContentTypes`, otherwise the first valid writable content type
    /// will be used instead.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - document: The in-memory document to export.
    ///   - contentType: The content type to use for the exported file.
    ///   - defaultFilename: If provided, the default name to use for the
    ///     exported file, which will the user will have an opportunity to edit
    ///     prior to the export.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     has succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileExporter<D>(isPresented: Binding<Bool>, document: D?, contentType: UTType, defaultFilename: String? = nil, onCompletion: @escaping (Result<URL, Error>) -> Void) -> some View where D : ReferenceFileDocument { }


    /// Presents a system interface for allowing the user to export a collection
    /// of in-memory documents to files on disk.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `documents` must not be empty. When the operation is finished,
    /// `isPresented` will be set to `false` before `onCompletion` is called. If
    /// the user cancels the operation, `isPresented` will be set to `false` and
    /// `onCompletion` will not be called.
    ///
    /// The `contentType` provided must be included within the document type's
    /// `writableContentTypes`, otherwise the first valid writable content type
    /// will be used instead.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - documents: The collection of in-memory documents to export.
    ///   - contentType: The content type to use for the exported file.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     has succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileExporter<C>(isPresented: Binding<Bool>, documents: C, contentType: UTType, onCompletion: @escaping (Result<[URL], Error>) -> Void) -> some View where C : Collection, C.Element : ReferenceFileDocument { }

}

