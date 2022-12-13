/// The protocol used to serialize a document to and from a file.
///
/// Conform to this protocol to move a document between its **file** representation and its **"swift-usable"**
/// representation.
///
/// This protocol is very similar to ``ReferenceFileDocument``, with the difference being whether the data
/// is stored as a `class` (reference type) or a `struct` (value type). Use the two protocols like this:
/// - ``FileDocument``: `struct`
/// - ``ReferenceFileDocument``: `class`
///
/// Don't worry about thread safety when using `ReferenceFileDocument`, since
/// deserialization and serialization are done on a background thread.
///
/// - Note: If your app will have documents, it very likely will be easiest to begin from Apple's own
/// Document app template. To do this, go to `File > New > Project`, and then use `Document App`.
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
/// - C: ``FileDocument/fileWrapper(configuration:)``
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
/// Note that in this example, we create a custom ``FileDocument/readableContentTypes`` called `UTType.exampleText`.
///
/// #### View implementation
///
/// Finally, use the ``TextEditor`` view to edit the document file.
///
/// ```
/// import SwiftUI
///
/// struct ContentView: View {
///     @Binding var document: ExampleDocument
///
///     var body: some View {
///         TextEditor(text: $document.text)
///     }
/// }
/// ```
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
/// ```
/// import SwiftUI
/// import UniformTypeIdentifiers
///
/// extension UTType {
///     static var exampleText: UTType {
///         UTType(importedAs: "com.example.plain-text")
///     }
/// }
/// ```
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol FileDocument { }

extension FileDocument {

    /// The file types the ``FileDocument`` document is able to open.
    ///
    /// The readable types of a document should be specified in its declaration. Often,
    /// the process of creating a document-based app requires a custom `UTType` object.
    static var readableContentTypes: [UTType] { get }

    /// The file types that a file document is able to save or export to.
    ///
    /// SwiftUI defaults the value of this to `readableContentTypes`, and it usually doesn't need
    /// to change. In the following example, `writableContentTypes` defaults to
    /// `UTType.exampleText`.
    ///
    /// ### Example
    ///
    ///     import SwiftUI
    ///     import UniformTypeIdentifiers
    ///
    ///     @main
    ///     struct ExampleApp: App {
    ///         var body: some Scene {
    ///             DocumentGroup(newDocument: { ExampleDocument() }) { file in
    ///                 ExampleView(document: file.$document)
    ///             }
    ///         }
    ///     }
    ///
    ///     struct ExampleDocument: FileDocument {
    ///         var text: String
    ///
    ///         init(text: String = "This is a brand new document! 📃") {
    ///             self.text = text
    ///         }
    ///
    ///         // 1.
    ///         static var readableContentTypes: [UTType] { [.exampleText] }
    ///
    ///         // 2.
    ///         init(configuration: ReadConfiguration) throws {
    ///             guard let data = configuration.file.regularFileContents,
    ///                 let string = String(data: data, encoding: .utf8)
    ///             else {
    ///                 throw CocoaError(.fileReadCorruptFile)
    ///             }
    ///             text = string
    ///         }
    ///
    ///         // 3.
    ///         func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    ///             let data = text.data(using: .utf8)!
    ///             return .init(regularFileWithContents: data)
    ///         }
    ///     }
    ///
    ///     struct ExampleView: View {
    ///         @Binding var document: ExampleDocument
    ///
    ///         var body: some View {
    ///             TextEditor(text: $document.text)
    ///         }
    ///     }
    ///
    ///     extension UTType {
    ///         static var exampleText: UTType {
    ///             UTType(importedAs: "com.example.plain-text")
    ///         }
    ///     }
    ///
    static var writableContentTypes: [UTType] { get }

    /// Initialize the file document from the contents of a file.
    ///
    /// See ``FileDocumentReadConfiguration`` to learn how to use the configuration parameter.
    ///
    /// In the following example, the initializer parses the configuration parameter
    /// to pull out the simple text [`String`](https://developer.apple.com/documentation/swift/string) from the document.
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
    /// 1. ``FileDocument/readableContentTypes``
    /// 2. ``FileDocument/init(configuration:)``
    /// 3. ``FileDocument/fileWrapper(snapshot:configuration:)``
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
    init(configuration: Self.ReadConfiguration) throws { }

    /// A type alias for referring to the configuration for reading document contents.
    ///
    /// See ``FileDocumentReadConfiguration`` to learn everything about what this
    /// type alias refers to within the ``FileDocument`` protocol.
    ///
    /// This type alias is primarily used in the protocol's required initializer,
    /// ``FileDocument/init(configuration:)``
    /// as the type of its configuration parameter.
    typealias ReadConfiguration = FileDocumentReadConfiguration

    /// Serialize the document with the specified configuration.
    ///
    /// This is essentially the "saving" function in a file document.
    ///
    /// In the following example, the `fileWrapper(snapshot:configuration:)` function
    /// simply uses the struct's ``text`` variable to create a new ``FileWrapper`` object.
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
    ///     import SwiftUI
    ///     import UniformTypeIdentifiers
    ///
    ///     struct ExampleDocument: FileDocument {
    ///         var text: String
    ///
    ///         init(text: String = "This is a brand new document! 📃") {
    ///             self.text = text
    ///         }
    ///
    ///         // A
    ///         static var readableContentTypes: [UTType] { [.exampleText] }
    ///
    ///         // B
    ///         init(configuration: ReadConfiguration) throws {
    ///             guard let data = configuration.file.regularFileContents,
    ///                 let string = String(data: data, encoding: .utf8)
    ///             else {
    ///                 throw CocoaError(.fileReadCorruptFile)
    ///             }
    ///             text = string
    ///         }
    ///
    ///         // C
    ///         func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    ///             let data = text.data(using: .utf8)!
    ///             return .init(regularFileWithContents: data)
    ///         }
    ///     }
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
    /// - Parameter configuration: The ``FileDocumentWriteConfiguration`` used
    /// to serialize the document.
    ///
    /// - Returns: The destination for the serialized the document. It can be a newly created
    /// ``FileWrapper` or an updated ``FileWrapper` from the one provided by `configuration`.
    func fileWrapper(configuration: Self.WriteConfiguration) throws -> FileWrapper { }

    /// A type alias used for the configuration when writing a file document.
    ///
    /// Since this is just a type alias, see ``FileDocumentWriteConfiguration`` for
    /// full information on what this type does.
    typealias WriteConfiguration = FileDocumentWriteConfiguration
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension FileDocument {

    /// The types that a file document is able to save or export to.
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
