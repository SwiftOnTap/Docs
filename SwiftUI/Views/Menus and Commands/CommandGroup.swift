/// Command groups describe additional groupings of controls to add to existing
/// command menus.
///
/// On macOS, command groups are realized as collections of menu items in a menu
/// bar menu. On iOS, iPadOS, and tvOS, SwiftUI creates key commands for each of
/// a group's commands that has a keyboard shortcut.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct CommandGroup<Content> : Commands where Content : View {

    /// The composition of commands that comprise the command group.
    public var body: some Commands { get }

    /// A value describing the addition of the given views to the beginning of
    /// the indicated group.
    public init(before group: CommandGroupPlacement, @ViewBuilder addition: () -> Content) { }

    /// A value describing the addition of the given views to the end of the
    /// indicated group.
    public init(after group: CommandGroupPlacement, @ViewBuilder addition: () -> Content) { }

    /// A value describing the complete replacement of the contents of the
    /// indicated group with the given views.
    public init(replacing group: CommandGroupPlacement, @ViewBuilder addition: () -> Content) { }

    /// The type of command group representing the body of this command group.
    public typealias Body = some Commands
}

