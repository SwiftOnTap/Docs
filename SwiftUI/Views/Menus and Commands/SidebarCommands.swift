/// A built-in set of commands for manipulating window sidebars.
///
/// These commands are optional and can be explicitly requested by passing a
/// value of this type to the `Scene.commands(_:)` modifier.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SidebarCommands : Commands {

    /// A new value describing the built-in sidebar-related commands.
    public init() { }

    /// The composition of commands that comprise the command group.
    public var body: some Commands { get }

    /// The type of command group representing the body of this command group.
    public typealias Body = some Commands
}
