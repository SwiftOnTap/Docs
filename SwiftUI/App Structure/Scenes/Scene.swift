/// This protocol is used to create different content areas on the screen.
///
/// On-screen ``Scene``s are the building blocks of any app built entirely in SwiftUI. They can look
/// different depending on the platform the app is running on. For example, in iOS, the screen usually
/// only displays one scene at a time. In macOS, every window in an app might be a different scene.
///
/// Scenes can either be custom, or one of the primitives like ``WindowGroup`` or
/// ``DocumentGroup``.
///
/// ### Creating a Scene
///
/// #### Using primitive Scenes
///
/// Primitive scenes like `WindowGroup` can go directly in the body of your ``App``.
///
///     @main
///     struct SuperSimpleApp: App {
///         var body: some Scene {
///             WindowGroup {
///                 Text("This is an entire app! 🙌")
///             }
///         }
///     }
///
/// ![A white view that displays the text ""This is an entire app! 🙌""](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Scene-example-1.png)
///
/// #### Using custom Scenes
///
/// Just like how custom ``View``s are made out of a `var body` of smaller  ``View``s,
/// custom ``Scene``s are made out of a `var body` of smaller ``Scene``s.
///
///     @main
///     struct MacCompatibleApp: App {
///         var body: some Scene {
///             CustomScene()
///         }
///
///     struct CustomScene: Scene {
///         var body: some Scene {
///             WindowGroup {
///                 Text("This is a mac-compatible app! 💻")
///             }
///
///             #if os(macOS)
///             Settings {
///                 SettingsView()
///             }
///             #endif
///         }
///     }
///
/// ![A white view that displays the text "This is a mac-compatible app! 💻"](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Scene-example-2.png)
///
/// ### Modifiers
///
/// Just like how ``View``s have a bunch of custom modifiers that work right out of the box,
/// ``Scene`` provides default implementations of many useful modifiers. These can be used to do things
/// like adding macOS commands, changing the toolbar, and adding support for app storage.
/// [scene-phase ->]
/// ### Getting Scene Status
///
/// The ``EnvironmentValues/scenePhase`` environment value can easily be read in a scene
/// to respond to whether the scene is active or in another state. It returns an enumeration of type
/// ``ScenePhase``.
///
///     struct StateAdaptingScene: Scene {
///         @Environment(\.scenePhase) private var scenePhase
///         var body: some Scene {
///             WindowGroup {
///                 Text(scenePhase == .active ? "Active!" : "Inactive")
///             }
///         }
///     }
///
/// [<-]
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol Scene { }
extension Scene {

    /// The type of the body variable in a scene.
    ///
    /// This type is automatically inferred from the `Scene/body-swift.variable` variable
    /// when you make a custom Scene, so you don't have to worry about ever interacting with this
    /// directly.
    ///
    /// If you're using a primitive scene like ``WindowGroup``, you might wonder what the body
    /// type would be. If all scenes are built on scenes built on scenes, where does it start?
    ///
    /// Because of exactly that reason, all primitive Scene types set their body type to `Never`.
    ///
    associatedtype Body : Scene

    /// The entry point for building custom Scenes.
    ///
    /// This computed property is the only requirement of conforming to the Scene protocol.
    /// To make a custom Scene, compose `body` with other custom Scenes, or
    /// with primitive Scenes like ``WindowGroup`` or `Settings`.
    ///
    ///     @main
    ///     struct MacCompatibleApp: App {
    ///         var body: some Scene {
    ///             CustomScene()
    ///         }
    ///
    ///     struct CustomScene: Scene {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 Text("This is a mac-compatible app! 💻")
    ///             }
    ///
    ///             #if os(macOS)
    ///             Settings {
    ///                 SettingsView()
    ///             }
    ///             #endif
    ///         }
    ///     }
    @SceneBuilder var body: Self.Body { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Scene {

    /// Use this method to watch for changes in a variable value.
    ///
    /// This method is most often used to watch for changes in a scene's status (active, inactive, etc.)
    ///
    /// There is a different, but related, method called ``View/onChange(of:perform:)`` that
    /// can be used on `Views`.
    ///
    ///     struct CustomScene: Scene {
    ///         @Environment(\.scenePhase) private var scenePhase
    ///         @State private var message = "Don't go! 😢"
    ///
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 Text(message)
    ///             }
    ///             .onChange(of: scenePhase) { newScenePhase in
    ///                 if newScenePhase != .active {
    ///                     DispatchQueue.main.async {
    ///                         message = "Come back! 👋"
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// Then you can add this ``Scene`` to your ``App``:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             CustomScene()
    ///         }
    ///     }
    ///
    /// Now when you leave the app via multitasking, you get a message:
    ///
    /// ![A screenshot of a custom scene with the message "Come back! 👋", which
    /// results when you leave the app via multitasking.](scene-onchange-of-perform-ex.png)
    ///
    /// - Parameters:
    ///   - value: The value to watch for changes.
    ///   - action: A function to run when the value changes.
    ///
    /// - Returns: A scene that calls a function when a value changes.
    @inlinable public func onChange<V>(of value: V, perform action: @escaping (V) -> Void) -> some Scene where V : Equatable { }

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {

    /// Use this modifier to add a menu and keyboard shortcuts to your macOS and iPadOS apps.
    ///
    /// This modifier accepts a builder of ``Commands`` to create a menu bar with shortcuts.
    ///
    /// In macOS, these commands are visible in the menu bar at the top of the screen. On iPadOS,
    /// these commands are visible when you hold down the Command (⌘) key.
    ///
    /// See ``Commands`` for more info on how to build these commands.
    ///
    ///     @main
    ///     struct CommandApp: App {
    ///         WindowGroup {
    ///             Text("Press ⌘P to print 🍌")
    ///         }
    ///         .commands { PrintCommand() }
    ///     }
    ///
    ///     struct PrintCommand: Commands {
    ///         var body: some Commands {
    ///             CommandMenu("Print") {
    ///                 Button("Print", action: { print("🍌") })
    ///                     .keyboardShortcut(KeyboardShortcut(KeyEquivalent("p"), modifiers: [.command]))
    ///             }
    ///         }
    ///     }
    ///
    /// [[window-commands]]
    ///
    /// - Parameter content: The command menus to add to your scene.
    ///
    /// - Returns: A scene with command menus and shortcuts.
    public func commands<Content>(@CommandsBuilder content: () -> Content) -> some Scene where Content : Commands { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Scene {

    /// Use this modifier to change a scene's default storage for the @AppStorage property wrapper.
    ///
    /// Whenever the `@AppStorage` property wrapper is used, it defaults its location to
    /// `UserDefaults.standard`. Override this default location for all of your
    /// scene's views by using this modifier.
    ///
    /// There is a similar method for `View` called ``View/defaultAppStorage(_:)``
    ///
    /// Check out `UserDefaults` and ``AppStorage`` for more info on how in-app storage
    /// works.
    ///
    ///     @main
    ///     struct StorageExampleApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 StorageExampleView()
    ///             }
    ///             .defaultAppStorage(UserDefaults(suiteName: "com.yoursite.your-suite")!)
    ///         }
    ///     }
    ///
    ///     struct StorageExampleView: View {
    ///         //Looks for "key" in "com.yoursite.your-suite"
    ///         @AppStorage("key") var name = "Kanye West"
    ///
    ///         var body: some View {
    ///             TextField("Enter your name", text: $name)
    ///         }
    ///     }
    ///
    /// - Parameter store: The default user defaults storage site for `@AppStorage`.
    public func defaultAppStorage(_ store: UserDefaults) -> some Scene { }

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {

    /// Specifies a modifier to indicate if this Scene can be used
    /// when creating a new Scene for the received External Event.
    ///
    /// This modifier is only supported for WindowGroup Scene types.
    ///
    /// For DocumentGroups, the received External Event must have a URL
    /// for the DocumentGroup to be considered. (Either via openURL, or
    /// the webPageURL property of an NSUserActivity). The UTI for the URL
    /// is implicitly matched against the DocumentGroup's supported types.
    ///
    /// If the modifier evaluates to true, an instance of the
    /// Scene will be used.
    ///
    /// If the modifier evaluates to false, on macOS the Scene
    /// will not be used even if no other Scenes are available.
    /// This case is considered an error. On iOS, the first Scene
    /// specified in the body property for the App will be used.
    ///
    /// If no modifier is set, the Scene will be used if all
    /// other WindowGroups with a modifier evaluate to false.
    ///
    /// On platforms that only allow a single `Window`/`Scene`, this method is
    /// ignored.
    ///
    ///     @main
    ///     struct EventHandlingApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 SelectionView()
    ///             }
    ///             .handlesExternalEvents(matching: ["selection"])
    ///         }
    ///     }
    ///
    /// - Parameter matching: A Set of Strings that are checked to see
    /// if they are contained in the targetContentIdenfifier. The empty Set
    /// and empty Strings never match. The String value "*" always matches.
    public func handlesExternalEvents(matching conditions: Set<String>) -> some Scene { }

}

