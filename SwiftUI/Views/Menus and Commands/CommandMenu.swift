/// Command menus are stand-alone, top-level containers for controls that
/// perform related, app-specific commands.
///
/// Command menus are realized as menu bar menus on macOS, inserted between the
/// built-in View and Window menus in order of declaration. On iOS, iPadOS, and
/// tvOS, SwiftUI creates key commands for each of a menu's commands that has a
/// keyboard shortcut.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct CommandMenu<Content> : Commands where Content : View {

    /// The composition of commands that comprise the command group.
    public var body: some Commands { get }

    /// Creates a new menu with a localized name for a collection of app-
    /// specific commands, inserted in the standard location for app menus
    /// (after the View menu, in order with other menus declared without an
    /// explicit location).
    public init(_ nameKey: LocalizedStringKey, @ViewBuilder content: () -> Content) { }

    /// Creates a new menu for a collection of app-specific commands, inserted
    /// in the standard location for app menus (after the View menu, in order
    /// with other menus declared without an explicit location).
    public init(_ name: Text, @ViewBuilder content: () -> Content) { }

    /// Creates a new menu for a collection of app-specific commands, inserted
    /// in the standard location for app menus (after the View menu, in order
    /// with other menus declared without an explicit location).
    public init<S>(_ name: S, @ViewBuilder content: () -> Content) where S : StringProtocol { }

    /// The type of command group representing the body of this command group.
    public typealias Body = some Commands
}

