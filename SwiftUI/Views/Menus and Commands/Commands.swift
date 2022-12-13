/// Conforming types represent a group of related commands that can be exposed
/// to the user via the main menu on macOS and key commands on iOS.
///
/// The available Command types are:
/// - ``CommandGroup``
/// - ``CommandMenu``
/// - ``EmptyCommands``
/// - ``SidebarCommands``
/// - ``TextEditingCommands``
/// - ``TextFormattingCommands``
/// - ``ToolbarCommands``
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol Commands { }

extension Commands {

    /// The type of command group representing the body of this command group.
    associatedtype Body : Commands

    /// The composition of commands that comprise the command group.
    @CommandsBuilder var body: Self.Body { get }
}

