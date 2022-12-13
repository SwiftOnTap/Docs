/// The protocol used to serialize a reference type document to and from a file.
///
/// Conform to this protocol to move a document between its file representation and its "swift-usable"
/// representation.
///
/// This protocol is very similar to ``FileDocument``, with the difference being whether the data
/// is stored as a `class` (reference type) or a `struct` (value type). Use the two protocols like this:
/// - `struct` --> ``FileDocument``
/// - `class` --> ``ReferenceFileDocument``
///
/// While the two protocols are similar, ``ReferenceFileDocument`` has the unique challenge
/// of the user editing a document while it is being written to a file. For this reason,
/// ``ReferenceFileDocument/snapshot`` must be used. See the example for more details.
///
/// Don't worry about thread safety when using ``ReferenceFileDocument``, since
/// deserialization and serialization are done on a background thread.
///
/// - Note: If your app will have documents, it very likely will be easiest to begin from Apple's own
/// Document app template. To do this, go to *File > New > Project*, and then use *Document App*.
///
/// ### Example
///
/// #### App structure
///
/// To begin, update the scene definition to use ``DocumentGroup``.
///
///     import SwiftUI
///
///     @main
///     struct ExampleApp: App {
///         var body: some Scene {
///             DocumentGroup(newDocument: { ExampleDocument() }) { file in
///                 ContentView(document: file.$document)
///             }
///         }
///     }
///
/// #### FileDocument conformance
///
/// Next, conform to the ``FileDocument`` protocol by implementing these properties:
/// - A: ``FileDocument/readableContentTypes``
/// - B: ``FileDocument/init(configuration:)``
/// - C: ``FileDocument/fileWrapper(snapshot:configuration:)``
///
/// ```
/// import SwiftUI
/// import UniformTypeIdentifiers
///
/// struct ExampleDocument: FileDocument {
///     var text: String
///
///     init(text: String = "This is a brand new document! 📃") {
///         self.text = text
///     }
///
///     // A
///     static var readableContentTypes: [UTType] { [.exampleText] }
///
///     // B
///     init(configuration: ReadConfiguration) throws {
///         guard let data = configuration.file.regularFileContents,
///             let string = String(data: data, encoding: .utf8)
///         else {
///             throw CocoaError(.fileReadCorruptFile)
///         }
///         text = string
///     }
///
///     // C
///     func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
///         let data = text.data(using: .utf8)!
///         return .init(regularFileWithContents: data)
///     }
/// }
/// ```
///
/// #### View implementation
///
/// Finally, use the ``TextEditor`` view to edit the document file.
///
///     import SwiftUI
///
///     struct ExampleView: View {
///         @Binding var document: ExampleDocument
///
///         var body: some View {
///             TextEditor(text: $document.text)
///         }
///     }
///
/// #### `UTType` settings
///
/// In order for any of this to work, your Xcode project will have to define a document type. To do this,
/// follow these steps:
/// 1. Go to the Xcode project settings.
/// 2. Click on your target to the left.
/// 3. Expand the `Document Types` tab.
/// 4. Click `Click here to add additional document type properties`
/// 5. Make the **Key** `NSUbiquitousDocumentUserActivityType`.
/// 6. Ensure the **Type** is `String`.
/// 7. Make the **Value** `$(PRODUCT_BUNDLE_IDENTIFIER).example-document`.
/// 8. Change the **Types** (top right) to `com.example.plain-text`.
///
/// Lastly, in your **ExampleDocument.swift** file, extend `UTType`:
///
///     import SwiftUI
///     import UniformTypeIdentifiers
///
///     extension UTType {
///         static var exampleText: UTType {
///             UTType(importedAs: "com.example.plain-text")
///         }
///     }
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol ReferenceFileDocument : ObservableObject { }

extension ReferenceFileDocument : ObservableObject {

    /// The type of the the document snapshot used for serialization
    /// in parallel to the main document being editable.
    ///
    /// This associated type is resolved when a class conforming to the ``ReferenceFileDocument``
    /// protocol implements the required
    /// ``ReferenceFileDocument/snapshot(contentType:)`` method.
    /// It is the return type of this function.
    ///
    /// In the following example, the
    /// ``ReferenceFileDocument/snapshot(contentType:)``
    /// method returns a
    /// [`String`](https://developer.apple.com/documentation/swift/string),
    /// so the associated type `Snapshot` would resolve to
    /// [`String`](https://developer.apple.com/documentation/swift/string).
    ///
    /// ### Example
    ///
    /// #### App structure
    ///
    /// To begin, update the scene definition to use ``DocumentGroup``.
    ///
    ///     import SwiftUI
    ///
    ///     @main
    ///     struct ExampleApp: App {
    ///         var body: some Scene {
    ///             DocumentGroup(newDocument: { ExampleDocument() }) { file in
    ///                 ContentView(document: file.$document)
    ///             }
    ///         }
    ///     }
    ///
    /// #### FileDocument conformance
    ///
    /// Next, conform to the ``FileDocument`` protocol by implementing these properties:
    /// - A: ``FileDocument/readableContentTypes``
    /// - B: ``FileDocument/init(configuration:)``
    /// - C: ``FileDocument/fileWrapper(snapshot:configuration:)``
    ///
    /// ```
    /// import SwiftUI
    /// import UniformTypeIdentifiers
    ///
    /// struct ExampleDocument: FileDocument {
    ///     var text: String
    ///
    ///     init(text: String = "This is a brand new document! 📃") {
    ///         self.text = text
    ///     }
    ///
    ///     // A
    ///     static var readableContentTypes: [UTType] { [.exampleText] }
    ///
    ///     // B
    ///     init(configuration: ReadConfiguration) throws {
    ///         guard let data = configuration.file.regularFileContents,
    ///             let string = String(data: data, encoding: .utf8)
    ///         else {
    ///             throw CocoaError(.fileReadCorruptFile)
    ///         }
    ///         text = string
    ///     }
    ///
    ///     // C
    ///     func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    ///         let data = text.data(using: .utf8)!
    ///         return .init(regularFileWithContents: data)
    ///     }
    /// }
    /// ```
    ///
    /// #### View implementation
    ///
    /// Finally, use the ``TextEditor`` view to edit the document file.
    ///
    ///     import SwiftUI
    ///
    ///     struct ExampleView: View {
    ///         @Binding var document: ExampleDocument
    ///
    ///         var body: some View {
    ///             TextEditor(text: $document.text)
    ///         }
    ///     }
    ///
    /// #### `UTType` settings
    ///
    /// In order for any of this to work, your Xcode project will have to define
    /// a document type. To do this,
    /// follow these steps:
    /// 1. Go to the Xcode project settings.
    /// 2. Click on your target to the left.
    /// 3. Expand the `Document Types` tab.
    /// 4. Click `Click here to add additional document type properties`
    /// 5. Make the **Key** `NSUbiquitousDocumentUserActivityType`.
    /// 6. Ensure the **Type** is `String`.
    /// 7. Make the **Value** `$(PRODUCT_BUNDLE_IDENTIFIER).example-document`.
    /// 8. Change the **Types** (top right) to `com.example.plain-text`.
    ///
    /// Lastly, in your *ExampleDocument.swift* file, extend `UTType`:
    ///
    ///     import SwiftUI
    ///     import UniformTypeIdentifiers
    ///
    ///     extension UTType {
    ///         static var exampleText: UTType {
    ///             UTType(importedAs: "com.example.plain-text")
    ///         }
    ///     }
    ///
    /// ![](file-doc-config-ex.gif)
    ///
    associatedtype Snapshot

    /// The types the ``ReferenceFileDocument`` document is able to open.
    ///
    /// The readable types of a document should be specified in its declaration. Very often,
    /// the process of creating a document-based app requires a custom `UTType` object.
    ///
    /// In the following example, we create a custom readable content type called `exampleText`.
    ///
    /// ### Example
    ///
    /// #### App structure
    ///
    /// To begin, update the scene definition to use ``DocumentGroup``.
    ///
    ///     import SwiftUI
    ///
    ///     @main
    ///     struct ExampleApp: App {
    ///         var body: some Scene {
    ///             DocumentGroup(newDocument: { ExampleDocument() }) { file in
    ///                 ©ContentView(document: file.$document)
    ///             }
    ///         }
    ///     }
    ///
    /// #### FileDocument conformance
    ///
    /// Next, conform to the ``FileDocument`` protocol by implementing these properties:
    /// - A: ``FileDocument/readableContentTypes``
    /// - B: ``FileDocument/init(configuration:)``
    /// - C: ``FileDocument/fileWrapper(snapshot:configuration:)``
    ///
    /// ```
    /// import SwiftUI
    /// import UniformTypeIdentifiers
    ///
    /// struct ExampleDocument: FileDocument {
    ///     var text: String
    ///
    ///     init(text: String = "This is a brand new document! 📃") {
    ///         self.text = text
    ///     }
    ///
    ///     // A
    ///     static var readableContentTypes: [UTType] { [.exampleText] }
    ///
    ///     // B
    ///     init(configuration: ReadConfiguration) throws {
    ///         guard let data = configuration.file.regularFileContents,
    ///             let string = String(data: data, encoding: .utf8)
    ///         else {
    ///             throw CocoaError(.fileReadCorruptFile)
    ///         }
    ///         text = string
    ///     }
    ///
    ///     // C
    ///     func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    ///         let data = text.data(using: .utf8)!
    ///         return .init(regularFileWithContents: data)
    ///     }
    /// }
    /// ```
    ///
    /// #### View implementation
    ///
    /// Finally, use the ``TextEditor`` view to edit the document file.
    ///
    ///     import SwiftUI
    ///
    ///     struct ExampleView: View {
    ///         @Binding var document: ExampleDocument
    ///
    ///         var body: some View {
    ///             TextEditor(text: $document.text)
    ///         }
    ///     }
    ///
    /// #### `UTType` settings
    ///
    /// In order for any of this to work, your Xcode project will have to
    /// define a document type. To do this,
    /// follow these steps:
    /// 1. Go to the Xcode project settings.
    /// 2. Click on your target to the left.
    /// 3. Expand the `Document Types` tab.
    /// 4. Click `Click here to add additional document type properties`
    /// 5. Make the **Key** `NSUbiquitousDocumentUserActivityType`.
    /// 6. Ensure the **Type** is `String`.
    /// 7. Make the **Value** `$(PRODUCT_BUNDLE_IDENTIFIER).example-document`.
    /// 8. Change the **Types** (top right) to `com.example.plain-text`.
    ///
    /// Lastly, in your *ExampleDocument.swift* file, extend `UTType`:
    ///
    ///     import SwiftUI
    ///     import UniformTypeIdentifiers
    ///
    ///     extension UTType {
    ///         static var exampleText: UTType {
    ///             UTType(importedAs: "com.example.plain-text")
    ///         }
    ///     }
    ///
    /// ![](file-doc-config-ex.gif)
    ///
    static var readableContentTypes: [UTType] { get }

    /// The types that a reference file document is able to save or export to.
    ///
    /// SwiftUI defaults the value of this to `readableContentTypes`, and it usually doesn't need
    /// to change. In the following example, `writableContentTypes` defaults to
    /// `UTType.exampleText`.
    ///
    /// ### Example
    ///
    /// #### App structure
    ///
    /// To begin, update the scene definition to use ``DocumentGroup``.
    ///
    ///     import SwiftUI
    ///
    ///     @main
    ///     struct ExampleApp: App {
    ///         var body: some Scene {
    ///             DocumentGroup(newDocument: { ExampleDocument() }) { file in
    ///                 ContentView(document: file.$document)
    ///             }
    ///         }
    ///     }
    ///
    /// #### FileDocument conformance
    ///
    /// Next, conform to the ``FileDocument`` protocol by implementing these properties:
    /// - A: ``FileDocument/readableContentTypes``
    /// - B: ``FileDocument/init(configuration:)``
    /// - C: ``FileDocument/fileWrapper(snapshot:configuration:)``
    ///
    /// ```
    /// import SwiftUI
    /// import UniformTypeIdentifiers
    ///
    /// struct ExampleDocument: FileDocument {
    ///     var text: String
    ///
    ///     init(text: String = "This is a brand new document! 📃") {
    ///         self.text = text
    ///     }
    ///
    ///     // A
    ///     static var readableContentTypes: [UTType] { [.exampleText] }
    ///
    ///     // B
    ///     init(configuration: ReadConfiguration) throws {
    ///         guard let data = configuration.file.regularFileContents,
    ///             let string = String(data: data, encoding: .utf8)
    ///         else {
    ///             throw CocoaError(.fileReadCorruptFile)
    ///         }
    ///         text = string
    ///     }
    ///
    ///     // C
    ///     func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    ///         let data = text.data(using: .utf8)!
    ///         return .init(regularFileWithContents: data)
    ///     }
    /// }
    /// ```
    ///
    /// #### View implementation
    ///
    /// Finally, use the ``TextEditor`` view to edit the document file.
    ///
    ///     import SwiftUI
    ///
    ///     struct ExampleView: View {
    ///         @Binding var document: ExampleDocument
    ///
    ///         var body: some View {
    ///             TextEditor(text: $document.text)
    ///         }
    ///     }
    ///
    /// #### `UTType` settings
    ///
    /// In order for any of this to work, your Xcode project will have to define
    /// a document type. To do this,
    /// follow these steps:
    /// 1. Go to the Xcode project settings.
    /// 2. Click on your target to the left.
    /// 3. Expand the `Document Types` tab.
    /// 4. Click `Click here to add additional document type properties`
    /// 5. Make the **Key** `NSUbiquitousDocumentUserActivityType`.
    /// 6. Ensure the **Type** is `String`.
    /// 7. Make the **Value** `$(PRODUCT_BUNDLE_IDENTIFIER).example-document`.
    /// 8. Change the **Types** (top right) to `com.example.plain-text`.
    ///
    /// Lastly, in your *ExampleDocument.swift* file, extend `UTType`:
    ///
    ///     import SwiftUI
    ///     import UniformTypeIdentifiers
    ///
    ///     extension UTType {
    ///         static var exampleText: UTType {
    ///             UTType(importedAs: "com.example.plain-text")
    ///         }
    ///     }
    ///
    /// ![](file-doc-config-ex.gif)
    ///
    static var writableContentTypes: [UTType] { get }

    /// Initialize the reference file document from the contents of a file.
    ///
    /// See ``FileDocumentReadConfiguration`` to learn how to use the
    /// configuration parameter.
    ///
    /// In the following example, the required initializer parses the
    /// configuration parameter
    /// to pull out the simple text
    /// [`String`](https://developer.apple.com/documentation/swift/string)
    /// from the document.
    ///
    /// ### Example
    ///
    /// #### App structure
    ///
    /// To begin, update the scene definition to use ``DocumentGroup``.
    ///
    ///     import SwiftUI
    ///
    ///     @main
    ///     struct ExampleApp: App {
    ///         var body: some Scene {
    ///             DocumentGroup(newDocument: { ExampleDocument() }) { file in
    ///                 ContentView(document: file.$document)
    ///             }
    ///         }
    ///     }
    ///
    /// #### FileDocument conformance
    ///
    /// Next, conform to the ``FileDocument`` protocol by implementing these
    /// properties:
    /// - A: ``FileDocument/readableContentTypes``
    /// - B: ``FileDocument/init(configuration:)``
    /// - C: ``FileDocument/fileWrapper(snapshot:configuration:)``
    ///
    /// ```
    /// import SwiftUI
    /// import UniformTypeIdentifiers
    ///
    /// struct ExampleDocument: FileDocument {
    ///     var text: String
    ///
    ///     init(text: String = "This is a brand new document! 📃") {
    ///         self.text = text
    ///     }
    ///
    ///     // A
    ///     static var readableContentTypes: [UTType] { [.exampleText] }
    ///
    ///     // B
    ///     init(configuration: ReadConfiguration) throws {
    ///         guard let data = configuration.file.regularFileContents,
    ///             let string = String(data: data, encoding: .utf8)
    ///         else {
    ///             throw CocoaError(.fileReadCorruptFile)
    ///         }
    ///         text = string
    ///     }
    ///
    ///     // C
    ///     func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    ///         let data = text.data(using: .utf8)!
    ///         return .init(regularFileWithContents: data)
    ///     }
    /// }
    /// ```
    ///
    /// #### View implementation
    ///
    /// Finally, use the ``TextEditor`` view to edit the document file.
    ///
    ///     import SwiftUI
    ///
    ///     struct ExampleView: View {
    ///         @Binding var document: ExampleDocument
    ///
    ///         var body: some View {
    ///             TextEditor(text: $document.text)
    ///         }
    ///     }
    ///
    /// #### `UTType` settings
    ///
    /// In order for any of this to work, your Xcode project will have to define
    /// a document type. To do this,
    /// follow these steps:
    /// 1. Go to the Xcode project settings.
    /// 2. Click on your target to the left.
    /// 3. Expand the `Document Types` tab.
    /// 4. Click `Click here to add additional document type properties`
    /// 5. Make the **Key** `NSUbiquitousDocumentUserActivityType`.
    /// 6. Ensure the **Type** is `String`.
    /// 7. Make the **Value** `$(PRODUCT_BUNDLE_IDENTIFIER).example-document`.
    /// 8. Change the **Types** (top right) to `com.example.plain-text`.
    ///
    /// Lastly, in your *ExampleDocument.swift* file, extend `UTType`:
    ///
    ///     import SwiftUI
    ///     import UniformTypeIdentifiers
    ///
    ///     extension UTType {
    ///         static var exampleText: UTType {
    ///             UTType(importedAs: "com.example.plain-text")
    ///         }
    ///     }
    ///
    /// ![](file-doc-config-ex.gif)
    ///
    /// - Parameter configuration: The read-configuration for creating a reference file document.
    init(configuration: Self.ReadConfiguration) throws { }

    /// A type alias for referring to the configuration for reading document contents.
    ///
    /// See ``FileDocumentReadConfiguration`` to learn everything about what this
    /// type alias refers to within the ``ReferenceFileDocument`` protocol.
    ///
    /// This type alias is primarily used in the protocol's required initializer,
    /// ``ReferenceFileDocument/init(configuration:)``
    /// as the type of its configuration parameter.
    typealias ReadConfiguration = FileDocumentReadConfiguration

    /// Creates a snapshot of the current document, which will be
    /// used for serialization, while `self` becomes editable by the user.
    ///
    /// Taking a snapshot of the document is necessary because the data is stored as a reference
    /// type. This means that if a separate snapshot was not taken, the user could potentially edit
    /// the data while it's in the process of being serialized.
    /// See ``ReferenceFileDocument`` for more information on this.
    ///
    /// A ``ReferenceFileDocument`` blocks edits to the document while it's being saved
    /// until snapshot can be created
    /// Once the snapshot is created, the document becomes editable in parallel
    /// to the snapshot being serialized.
    ///
    /// The following example shows how to use
    /// ``ReferenceFileDocument/snapshot(contentType:)``
    /// along with the rest of the required methods to create a document-based app.
    ///
    /// ### Example
    ///
    /// #### App structure
    ///
    /// To begin, update the scene definition to use ``DocumentGroup``.
    ///
    ///     import SwiftUI
    ///
    ///     @main
    ///     struct ExampleApp: App {
    ///         var body: some Scene {
    ///             DocumentGroup(newDocument: { ExampleDocument() }) { file in
    ///                 ContentView(document: file.$document)
    ///             }
    ///         }
    ///     }
    ///
    /// #### FileDocument conformance
    ///
    /// Next, conform to the ``FileDocument`` protocol by implementing these properties:
    /// - A: ``FileDocument/readableContentTypes``
    /// - B: ``FileDocument/init(configuration:)``
    /// - C: ``FileDocument/fileWrapper(snapshot:configuration:)``
    ///
    /// ```
    /// import SwiftUI
    /// import UniformTypeIdentifiers
    ///
    /// struct ExampleDocument: FileDocument {
    ///     var text: String
    ///
    ///     init(text: String = "This is a brand new document! 📃") {
    ///         self.text = text
    ///     }
    ///
    ///     // A
    ///     static var readableContentTypes: [UTType] { [.exampleText] }
    ///
    ///     // B
    ///     init(configuration: ReadConfiguration) throws {
    ///         guard let data = configuration.file.regularFileContents,
    ///             let string = String(data: data, encoding: .utf8)
    ///         else {
    ///             throw CocoaError(.fileReadCorruptFile)
    ///         }
    ///         text = string
    ///     }
    ///
    ///     // C
    ///     func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    ///         let data = text.data(using: .utf8)!
    ///         return .init(regularFileWithContents: data)
    ///     }
    /// }
    /// ```
    ///
    /// #### View implementation
    ///
    /// Finally, use the ``TextEditor`` view to edit the document file.
    ///
    ///     import SwiftUI
    ///
    ///     struct ExampleView: View {
    ///         @Binding var document: ExampleDocument
    ///
    ///         var body: some View {
    ///             TextEditor(text: $document.text)
    ///         }
    ///     }
    ///
    /// #### `UTType` settings
    ///
    /// In order for any of this to work, your Xcode project will have to define a document type. To do this,
    /// follow these steps:
    /// 1. Go to the Xcode project settings.
    /// 2. Click on your target to the left.
    /// 3. Expand the `Document Types` tab.
    /// 4. Click `Click here to add additional document type properties`
    /// 5. Make the **Key** `NSUbiquitousDocumentUserActivityType`.
    /// 6. Ensure the **Type** is `String`.
    /// 7. Make the **Value** `$(PRODUCT_BUNDLE_IDENTIFIER).example-document`.
    /// 8. Change the **Types** (top right) to `com.example.plain-text`.
    ///
    /// Lastly, in your *ExampleDocument.swift* file, extend `UTType`:
    ///
    ///     import SwiftUI
    ///     import UniformTypeIdentifiers
    ///
    ///     extension UTType {
    ///         static var exampleText: UTType {
    ///             UTType(importedAs: "com.example.plain-text")
    ///         }
    ///     }
    ///
    /// ![](file-doc-config-ex.gif)
    ///
    /// - Parameter contentType: The content type being written, for which the
    ///   snapshot should be created.
    func snapshot(contentType: UTType) throws -> Self.Snapshot { }

    /// Serializes the document from a snapshot with the specified configuration.
    ///
    /// This is essentially the "saving" function in a reference file document.
    ///
    /// In the following example, the `fileWrapper(snapshot:configuration:)` function
    /// simply uses the snapshot to save a new ``FileWrapper`` object.
    ///
    /// ### Example
    ///
    /// #### App structure
    ///
    /// To begin, update the scene definition to use ``DocumentGroup``.
    ///
    ///     import SwiftUI
    ///
    ///     @main
    ///     struct ExampleApp: App {
    ///         var body: some Scene {
    ///             DocumentGroup(newDocument: { ExampleDocument() }) { file in
    ///                 ContentView(document: file.$document)
    ///             }
    ///         }
    ///     }
    ///
    /// #### FileDocument conformance
    ///
    /// Next, conform to the ``FileDocument`` protocol by implementing these properties:
    /// - A: ``FileDocument/readableContentTypes``
    /// - B: ``FileDocument/init(configuration:)``
    /// - C: ``FileDocument/fileWrapper(snapshot:configuration:)``
    ///
    /// ```
    /// import SwiftUI
    /// import UniformTypeIdentifiers
    ///
    /// struct ExampleDocument: FileDocument {
    ///     var text: String
    ///
    ///     init(text: String = "This is a brand new document! 📃") {
    ///         self.text = text
    ///     }
    ///
    ///     // A
    ///     static var readableContentTypes: [UTType] { [.exampleText] }
    ///
    ///     // B
    ///     init(configuration: ReadConfiguration) throws {
    ///         guard let data = configuration.file.regularFileContents,
    ///             let string = String(data: data, encoding: .utf8)
    ///         else {
    ///             throw CocoaError(.fileReadCorruptFile)
    ///         }
    ///         text = string
    ///     }
    ///
    ///     // C
    ///     func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    ///         let data = text.data(using: .utf8)!
    ///         return .init(regularFileWithContents: data)
    ///     }
    /// }
    /// ```
    ///
    /// #### View implementation
    ///
    /// Finally, use the ``TextEditor`` view to edit the document file.
    ///
    ///     import SwiftUI
    ///
    ///     struct ExampleView: View {
    ///         @Binding var document: ExampleDocument
    ///
    ///         var body: some View {
    ///             TextEditor(text: $document.text)
    ///         }
    ///     }
    ///
    /// #### `UTType` settings
    ///
    /// In order for any of this to work, your Xcode project will have to define a document type. To do this,
    /// follow these steps:
    /// 1. Go to the Xcode project settings.
    /// 2. Click on your target to the left.
    /// 3. Expand the `Document Types` tab.
    /// 4. Click `Click here to add additional document type properties`
    /// 5. Make the **Key** `NSUbiquitousDocumentUserActivityType`.
    /// 6. Ensure the **Type** is `String`.
    /// 7. Make the **Value** `$(PRODUCT_BUNDLE_IDENTIFIER).example-document`.
    /// 8. Change the **Types** (top right) to `com.example.plain-text`.
    ///
    /// Lastly, in your *ExampleDocument.swift* file, extend `UTType`:
    ///
    ///     import SwiftUI
    ///     import UniformTypeIdentifiers
    ///
    ///     extension UTType {
    ///         static var exampleText: UTType {
    ///             UTType(importedAs: "com.example.plain-text")
    ///         }
    ///     }
    ///
    /// ![](file-doc-config-ex.gif)
    ///
    /// - Parameters:
    ///   - snapshot: A snapshot of the document with the data to serialize.
    ///   - configuration: The ``FileDocumentWriteConfiguration`` used to serialize the document.
    ///
    /// - Returns: The destination for the serialized the document. It can be a newly created
    /// ``FileWrapper` or an updated ``FileWrapper` from the one provided by `configuration`.
    func fileWrapper(snapshot: Self.Snapshot, configuration: Self.WriteConfiguration) throws -> FileWrapper { }

    /// A type alias used for the configuration when writing a reference file document.
    ///
    /// Since this is just a type alias, see ``FileDocumentWriteConfiguration`` for
    /// full information on what this type does.
    typealias WriteConfiguration = FileDocumentWriteConfiguration
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ReferenceFileDocument {

    /// The types that a reference file document is able to save or export to.
    ///
    /// SwiftUI defaults the value of this to `readableContentTypes`, and it usually doesn't need
    /// to change. In the following example, `writableContentTypes` defaults to
    /// `UTType.exampleText`.
    ///
    /// ### Example
    ///
    /// #### App structure
    ///
    /// To begin, update the scene definition to use ``DocumentGroup``.
    ///
    ///     import SwiftUI
    ///
    ///     @main
    ///     struct ExampleApp: App {
    ///         var body: some Scene {
    ///             DocumentGroup(newDocument: { ExampleDocument() }) { file in
    ///                 ContentView(document: file.$document)
    ///             }
    ///         }
    ///     }
    ///
    /// #### FileDocument conformance
    ///
    /// Next, conform to the ``FileDocument`` protocol by implementing these properties:
    /// - A: ``FileDocument/readableContentTypes``
    /// - B: ``FileDocument/init(configuration:)``
    /// - C: ``FileDocument/fileWrapper(snapshot:configuration:)``
    ///
    /// ```
    /// import SwiftUI
    /// import UniformTypeIdentifiers
    ///
    /// struct ExampleDocument: FileDocument {
    ///     var text: String
    ///
    ///     init(text: String = "This is a brand new document! 📃") {
    ///         self.text = text
    ///     }
    ///
    ///     // A
    ///     static var readableContentTypes: [UTType] { [.exampleText] }
    ///
    ///     // B
    ///     init(configuration: ReadConfiguration) throws {
    ///         guard let data = configuration.file.regularFileContents,
    ///             let string = String(data: data, encoding: .utf8)
    ///         else {
    ///             throw CocoaError(.fileReadCorruptFile)
    ///         }
    ///         text = string
    ///     }
    ///
    ///     // C
    ///     func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    ///         let data = text.data(using: .utf8)!
    ///         return .init(regularFileWithContents: data)
    ///     }
    /// }
    /// ```
    ///
    /// #### View implementation
    ///
    /// Finally, use the ``TextEditor`` view to edit the document file.
    ///
    ///     import SwiftUI
    ///
    ///     struct ExampleView: View {
    ///         @Binding var document: ExampleDocument
    ///
    ///         var body: some View {
    ///             TextEditor(text: $document.text)
    ///         }
    ///     }
    ///
    /// #### `UTType` settings
    ///
    /// In order for any of this to work, your Xcode project will have to define a document type. To do this,
    /// follow these steps:
    /// 1. Go to the Xcode project settings.
    /// 2. Click on your target to the left.
    /// 3. Expand the `Document Types` tab.
    /// 4. Click `Click here to add additional document type properties`
    /// 5. Make the **Key** `NSUbiquitousDocumentUserActivityType`.
    /// 6. Ensure the **Type** is `String`.
    /// 7. Make the **Value** `$(PRODUCT_BUNDLE_IDENTIFIER).example-document`.
    /// 8. Change the **Types** (top right) to `com.example.plain-text`.
    ///
    /// Lastly, in your *ExampleDocument.swift* file, extend `UTType`:
    ///
    ///     import SwiftUI
    ///     import UniformTypeIdentifiers
    ///
    ///     extension UTType {
    ///         static var exampleText: UTType {
    ///             UTType(importedAs: "com.example.plain-text")
    ///         }
    ///     }
    ///
    /// ![](file-doc-config-ex.gif)
    ///
    public static var writableContentTypes: [UTType] { get }
}
