/// A type that represents the structure and behavior of an app.
///
/// Create an app by declaring a structure that conforms to the ``App`` protocol.
/// Implement the required ``App/body-swift.variable`` computed property
/// to define the app's content:
///
///     @main
///     struct MyApp: App {
///         var body: some Scene {
///             WindowGroup {
///                 Text("Hello, world! 🌍🙋")
///                     .font(.title)
///             }
///         }
///     }
///
/// ![An app containing a window group with a title font text view reading
/// "Hello, world! 🌍🙋".](app.png)
///
/// Precede the structure's declaration with the
/// [`@main`](https://docs.swift.org/swift-book/ReferenceManual/Attributes.html#ID626)
/// attribute to indicate that your custom ``App`` protocol conformer provides the
/// entry point into your app. The protocol provides a default implementation of
/// the ``App/main()`` method that the system calls to launch your app.
/// You can have exactly one entry point among all of your app's files.
///
/// Compose the app's ``App/body-swift.variable`` from instances that conform to the ``Scene``
/// protocol. Each scene contains the root view of a view hierarchy and has a
/// life cycle managed by the system. SwiftUI provides some concrete scene types
/// to handle common scenarios, like for displaying documents or settings. You
/// can also create custom scenes.
///
///     @main
///     struct Mail: App {
///         var body: some Scene {
///             WindowGroup {
///                 MailViewer()
///             }
///         }
///     }
///
/// Then `MailViewer` would be the root view of the app:
///
///     struct MailViewer: View {
///         var body: some View {
///             // Implement here
///             Text("Turn me into a mail app! 📨")
///         }
///     }
///
/// You can declare state in your app to share across all of its scenes. For
/// example, you can use the ``StateObject`` attribute to initialize a
/// data model, and then provide that model on a view input as an
/// ``ObservedObject`` or through the environment as an
/// ``EnvironmentObject`` to scenes in the app:
///
///     @main
///     struct Mail: App {
///         @StateObject private var model = MailModel()
///
///         var body: some Scene {
///             WindowGroup {
///                 MailViewer()
///                     .environmentObject(model) //Passed through the environment.
///             }
///             #if os(iOS)
///             Settings {
///                 SettingsView(model: model) //Passed as an observed object.
///             }
///             #endif
///         }
///     }
///
///     struct MailViewer: View {
///         @EnvironmentObject var model: MailModel
///         var body: some View { Text("Implement me! 📬") }
///     }
///
///     struct SettingsView: View {
///         @ObservedObject var mdoel: MailModel
///         var body: some View { Text("Implement me! ⚙️") }
///     }
///
///     class MailModel: ObservableObject { /* implement here */ }
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol App { }
extension App {

    /// The type of scene representing the content of the app.
    ///
    /// When you create a custom app, Swift infers this type from your
    /// implementation of the required `App/body-swift.property`
    /// property.
    associatedtype Body : Scene

    /// The content and behavior of the app.
    ///
    /// For any app that you create, provide a computed `body` property that
    /// defines your app's scenes, which are instances that conform to the
    /// ``Scene`` protocol. For example, you can create a simple app
    /// with a single scene containing a single view:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 Text("Hello, world!")
    ///             }
    ///         }
    ///     }
    ///
    /// Swift infers the app's `App/Body-swift.associatedtype`
    /// associated type based on the scene provided by the `body` property.
    @SceneBuilder var body: Self.Body { get }

    /// Creates an instance of the app using the body that you define for its
    /// content.
    ///
    /// **Don't use this function directly**.
    /// Swift synthesizes a default initializer for structures that don't
    /// provide one. You typically rely on the default initializer for
    /// your app.
    ///
    /// See ``App`` for details
    /// and examples of how to use this protocol.
    init() { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension App {

    /// Initializes and runs the app.
    ///
    /// **Don't use this function directly.** See ``App`` for details
    /// and examples of how to use this protocol.
    ///
    /// If you precede your ``App`` conformer's declaration with the
    /// [`@main`](https://docs.swift.org/swift-book/ReferenceManual/Attributes.html#ID626)
    /// attribute, the system calls the conformer's `main()` method to launch
    /// the app. SwiftUI provides a
    /// default implementation of the method that manages the launch process in
    /// a platform-appropriate way.
    public static func main() { }
}

