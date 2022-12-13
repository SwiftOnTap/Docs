/// `WindowGroup` is the default ``Scene`` type in SwiftUI.
///
/// Use a ``WindowGroup`` to contain the SwiftUI view hierarchy of your app.
///
/// ### Usage
///
/// ```
/// @main
/// struct MyApp: App {
///     var body: some Scene {
///         WindowGroup {
///             Text("Bananas")
///                 .frame(width: 500, height: 300)
///         }
///     }
/// }
/// ```
///
/// ![A Mac view displaying a window group with the text "Bananas"; the text
/// view has a fram of width 500 and height 300.](windowgroup.png)
///
/// ![An iOS view displaying a window group with the text "Bananas"; the text
/// view has a fram of width 500 and height 300.](windowgroup-ios.png)
///
/// Note:
/// - The default implementation of a ``WindowGroup`` allows multiple instances
/// of the window to be created (either using ⌘N , or the "Show Tab Bar" command).
/// - Each instance of a window created from a window group contains the same
/// SwiftUI hierarchy, but maintains an independent state. That means if the
/// user creates two instances of your app's window, each window will maintain
/// its own separate (independent) state, unaffected by what the user does on
/// another window of your app.
///
/// ### Adding a title to a window
///
/// On macOS, a window's title is usually displayed in a window's title bar. A
/// window's title bar contains a centered text item to display the window's
/// title.
///
/// Use ``WindowGroup/init(_:content:)-0733f`` to title a window. For example:
///
/// ```
/// @main
/// struct MyApp: App {
///     var body: some Scene {
///         WindowGroup("Fruit App") {
///             Text("Bananas")
///                 .frame(width: 500, height: 300)
///         }
///     }
/// }
/// ```
///
/// ![A Mac view displaying a window group with the text "Bananas" and the
/// window title "Fruit App"; the text view has a frame of width 500 and height 300.](windowgroup-3.png)
///
/// - Note: The system may use the provided window title as a part of some default
/// window command names. For example, the **"New Window"** command would become
/// **"New Fruit App Window"**.
///
/// [window-commands ->]
///
/// ### Adding commands to a window group
///
/// On macOS, a window can provide a set of contextual commands as menu items
/// in the menu bar. To add a command menu to a ``WindowGroup``, use
/// ``Scene/commands(content:)``.
///
/// For example:
///
/// ```
/// @main
/// struct MyApp: App {
///     var body: some Scene {
///         WindowGroup {
///             Text("Bananas")
///                 .frame(width: 500, height: 300)
///         }
///         .commands {
///             CommandMenu("Some Commands") {
///                 Text("A Command")
///             }
///         }
///     }
/// }
/// ```
///
/// ![A Mac view displaying a window group with the text "Bananas" and the
/// command menu option "Some Commands", which contains the text "A Command" in
/// it's dropdown; the text view has a frame of width 500 and height 300.](windowgroup-4.png)
/// [<-]
/// ### Disabling creating multiple window instances
///
/// Currently, SwiftUI offers no canonical way to disable the user from creating
/// multiple instances of a window from a ``WindowGroup`` scene. This can be
/// done in two ways:
///
/// - Using the "New Window" (⌘N) command to create a new window instance
/// - Using the "Show Tab Bar" command, and creating a new tab containing a new
/// window instance
///
/// #### Disabling the "New Window" command
///
/// The "New Window" (⌘N) command can be disabled by replacing the "New Item"
/// command group with an empty command group.
///
/// ```
/// @main
/// struct MyApp: App {
///     var body: some Scene {
///         WindowGroup {
///             Text("Bananas")
///                 .frame(width: 500, height: 300)
///         }
///         .commands {
///             CommandGroup(replacing: .newItem, addition: { })
///         }
///     }
/// }
/// ```
///
/// Caveat: This does not currently work on macCatalyst (as of Big Sur 11.2).
///
/// #### Disabling the "Show Tab Bar" command
///
/// To disable the "Show Tab Bar" command, use `NSApplication` to iterate over
/// your app's windows at launch and set each window's `tabbingMode` to
/// `.disallowed`.
///
/// For example:
///
/// ```
/// @main
/// struct MyApp: App {
///     var body: some Scene {
///         WindowGroup {
///             Text("Bananas")
///                 .onAppear {
///                     NSApplication.shared.windows.forEach({ $0.tabbingMode = .disallowed })
///                 }
///         }
///     }
/// }
/// ```
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct WindowGroup<Content> : Scene where Content : View {

    /// Creates a window group with an identifier.
    ///
    /// The window group uses the given view as a
    /// template to form the content of each window in the group.
    ///
    /// - Parameters:
    ///   - id: A string that uniquely identifies the window group. Identifiers
    ///     must be unique among the window groups in your app.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init(id: String, @ViewBuilder content: () -> Content) { }

    /// Creates a window group with a localized title and an identifier.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    /// The system ignores any text styling in the title.
    ///
    /// - Parameters:
    ///   - title: The ``Text`` view to use for the group's title.
    ///   - id: A string that uniquely identifies the window group. Identifiers
    ///     must be unique among the window groups in your app.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init(_ title: Text, id: String, @ViewBuilder content: () -> Content) { }

    /// Creates a window group with a key for localized title string and an
    /// identifier.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    ///
    /// - Parameters:
    ///   - titleKey: The title key to use for the title of the group.
    ///   - id: A string that uniquely identifies the window group. Identifiers
    ///     must be unique among the window groups in your app.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init(_ titleKey: LocalizedStringKey, id: String, @ViewBuilder content: () -> Content) { }

    /// Creates a window group with a title string and an identifier.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    ///
    /// - Parameters:
    ///   - title: The string to use for the title of the group.
    ///   - id: A string that uniquely identifies the window group. Identifiers
    ///     must be unique among the window groups in your app.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init<S>(_ title: S, id: String, @ViewBuilder content: () -> Content) where S : StringProtocol { }

    /// Creates a window group.
    ///
    /// The window group using the given view as a template to form the
    /// content of each window in the group.
    ///
    /// - Parameter content: A closure that creates the content for each
    ///   instance of the group.
    public init(@ViewBuilder content: () -> Content) { }

    /// Creates a window group with a localized title.
    ///
    /// The window group uses the given view as a
    /// template to form the content of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    /// The system ignores any text styling in the title.
    ///
    /// - Parameters:
    ///   - title: The ``Text`` view to use for the group's title.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init(_ title: Text, @ViewBuilder content: () -> Content) { }

    /// Creates a window group with a key for localized title string.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    ///
    /// - Parameters:
    ///   - titleKey: The title key to use for the group's title.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content) { }

    /// Creates a window group with a title string.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    ///
    /// - Parameters:
    ///   - title: The string to use for the title of the group.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init<S>(_ title: S, @ViewBuilder content: () -> Content) where S : StringProtocol { }

    /// The content and behavior of the scene.
    ///
    /// For any scene that you create, provide a computed `body` property that
    /// defines the scene as a composition of other scenes. You can assemble a
    /// scene from primitive scenes that SwiftUI provides, as well as other
    /// scenes that you've defined.
    ///
    /// Swift infers the scene's ``Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    public var body: some Scene { get }

    /// The type of scene that represents the body of this scene.
    ///
    /// When you create a custom scene, Swift infers this type from your
    /// implementation of the required ``Scene/body-swift.variable``
    /// property.
    public typealias Body = some Scene
}

