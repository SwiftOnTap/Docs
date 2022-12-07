@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// A view modifier that presents a system interface for allowing the user to import an existing
    /// file.
    ///
    /// In order for the interface to appear, `isPresented` must be `true`. When
    /// the operation is finished, `isPresented` will be set to `false` before
    /// `onCompletion` is called. If the user cancels the operation,
    /// `isPresented` will be set to `false` and `onCompletion` will not be
    /// called.
    ///
    /// - Note: Changing `allowedContentTypes` while the file importer is
    ///   presented will have no immediate effect, however will apply the next
    ///   time it is presented.
    ///
    /// ```
    /// import SwiftUI
    /// import UniformTypeIdentifiers
    ///
    /// struct ContentView: View {
    ///     @State private var showImporter = false
    ///     @State private var textInFile = ""
    ///
    ///     var body: some View {
    ///         Button("Import File 📁") {
    ///             showImporter = true
    ///         }
    ///         .fileImporter(isPresented: $showImporter,
    ///                       allowedContentTypes: [.plainText]) { result in
    ///
    ///              switch result {
    ///              case .failure(let error):
    ///                  print("Error selecting file: \(error.localizedDescription)")
    ///              case .success(let url):
    ///                 do {
    ///                     if url.startAccessingSecurityScopedResource() {
    ///                         textInFile = try String(contentsOf: url)
    ///                         url.stopAccessingSecurityScopedResource()
    ///                     }
    ///                 } catch let error {
    ///                     print("Error reading file \(error.localizedDescription)")
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    ///
    /// ```
    ///
    /// ![A gif with a button in the center of the screen that reads "Import Files."
    /// When clicked, it shows the fileImporter which appears as a popup with the
    /// header "Recents" and an option to Cancel. The bottom of the screen gives
    /// the user the option to select Recents or "Browse," which in turn prompts
    /// a sign in to iCloud.](film-importer-is-presented-ex.gif)
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - allowedContentTypes: The list of supported content types which can
    ///     be imported.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileImporter(isPresented: Binding<Bool>, allowedContentTypes: [UTType], onCompletion: @escaping (Result<URL, Error>) -> Void) -> some View { }


    /// A view modifier that presents a system interface for allowing the user to import multiple
    /// files.
    ///
    /// In order for the interface to appear, `isPresented` must be `true`. When
    /// the operation is finished, `isPresented` will be set to `false` before
    /// `onCompletion` is called. If the user cancels the operation,
    /// `isPresented` will be set to `false` and `onCompletion` will not be
    /// called.
    ///
    /// - Note: Changing `allowedContentTypes` or `allowsMultipleSelection`
    ///   while the file importer is presented will have no immediate effect,
    ///   however will apply the next time it is presented.
    ///
    /// ```
    /// import SwiftUI
    /// import UniformTypeIdentifiers
    ///
    /// struct ContentView: View {
    ///     @State private var showImporter = false
    ///     @State private var textInFiles = [String]()
    ///
    ///     var body: some View {
    ///         Button("Import Files 📁📂") {
    ///             showImporter = true
    ///         }
    ///         .fileImporter(isPresented: $showImporter,
    ///                       allowedContentTypes: [.plainText],
    ///                       allowsMultipleSelection: true) { result in
    ///
    ///              switch result {
    ///              case .failure(let error):
    ///                  print("Error selecting file: \(error.localizedDescription)")
    ///              case .success(let urls):
    ///                 textInFiles = []
    ///                 for url in urls {
    ///                     do {
    ///                         if url.startAccessingSecurityScopedResource() {
    ///                             textInFiles.append(try String(contentsOf: url))
    ///                             url.stopAccessingSecurityScopedResource()
    ///                         }
    ///                     } catch let error {
    ///                         print("Error reading file \(error.localizedDescription)")
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    ///
    /// ```
    ///
    /// ![A gif with a button in the center of the screen that reads "Import Files."
    /// When clicked, it shows the fileImporter which appears as a popup with the
    /// header "Recents" and an option to Cancel. The bottom of the screen gives
    /// the user the option to select Recents or "Browse," which in turn prompts
    /// a sign in to iCloud.](film-importer-is-presented-ex.gif)
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - allowedContentTypes: The list of supported content types which can
    ///     be imported.
    ///   - allowsMultipleSelection: Whether the importer allows the user to
    ///     select more than one file to import.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileImporter(isPresented: Binding<Bool>, allowedContentTypes: [UTType], allowsMultipleSelection: Bool, onCompletion: @escaping (Result<[URL], Error>) -> Void) -> some View { }

}

