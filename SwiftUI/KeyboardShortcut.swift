/// Keyboard shortcuts describe combinations of keys on a keyboard that the user
/// can press in order to activate a button or toggle.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct KeyboardShortcut {

    /// The standard keyboard shortcut for the default button, consisting of
    /// the Return (↩) key and no modifiers.
    ///
    /// On macOS, the default button is designated with special coloration. If
    /// more than one control is assigned this shortcut, only the first one is
    /// emphasized.
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct KeyboardShortcutView: View {
    ///     var body: some View {
    ///         Text("Press ENTER to save or ESC to cancel.")
    ///         HStack {
    ///             Button("Cancel") { print("cancel") }
    ///                 .keyboardShortcut(.cancelAction)
    ///             Button("Save") { print("save") }
    ///                 .keyboardShortcut(.defaultAction)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A macOS view containing the text "Press ENTER to save or ESC to cancel."
    /// and an HStack with two buttons, "Cancel" which prints "cancel" and uses
    /// the keyboardShortcut cancelAction and "Save" which prints "save" and uses
    /// the keyboardShortcut defaultAction.](keyboard-shortcut-default.png)
    ///
    public static let defaultAction: KeyboardShortcut

    /// The standard keyboard shortcut for cancelling the in-progress action
    /// or dismissing a prompt, consisting of the Escape (⎋) key and no
    /// modifiers.
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct KeyboardShortcutView: View {
    ///     var body: some View {
    ///         Text("Press ENTER to save or ESC to cancel.")
    ///         HStack {
    ///             Button("Cancel") { print("cancel") }
    ///                 .keyboardShortcut(.cancelAction)
    ///             Button("Save") { print("save") }
    ///                 .keyboardShortcut(.defaultAction)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A macOS view containing the text "Press ENTER to save or ESC to cancel."
    /// and an HStack with two buttons, "Cancel" which prints "cancel" and uses
    /// the keyboardShortcut cancelAction and "Save" which prints "save" and uses
    /// the keyboardShortcut defaultAction.](keyboard-shortcut-default.png)
    ///
    public static let cancelAction: KeyboardShortcut

    /// The key equivalent that the user presses in conjunction with any
    /// specified modifier keys to activate the shortcut.
    ///
    /// This property is usually specified from the
    /// ``KeyboardShortcut``'s initializer, but can also be written to
    /// or read directly.
    ///
    /// See ``KeyEquivalent`` for more on key equivalents.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     var body: some View {
    ///         var shortcut = KeyboardShortcut(.escape, modifiers: [.command, .control])
    ///         shortcut.key = .return
    ///
    ///         return Button("Press command-control-return to print the 🍌") {
    ///             print("🍌")
    ///         }
    ///         .keyboardShortcut(shortcut)
    ///     }
    /// }
    /// ```
    ///
    /// ![A macOS view containing the KeyboardShortcut escape with command
    /// and control as modifiers and the shortcut key return; the view returns
    /// the a button reading "Press command-control-return to print the 🍌" that
    /// prints "🍌".](keyboard-shortcut-key-ex.png)
    ///
    public var key: KeyEquivalent

    /// The modifier keys that the user presses in conjunction with a key
    /// equivalent to activate the shortcut.
    ///
    /// This property is usually specified from the
    /// ``KeyboardShortcut``'s initializer, but can also be written to
    /// or read directly.
    ///
    /// See ``EventModifiers`` for more on event modifiers.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     var body: some View {
    ///         var shortcut = KeyboardShortcut(.return)
    ///         shortcut.modifiers = [.command, .control]
    ///
    ///         return Button("Press command-control-return to print the 🍌") {
    ///             print("🍌")
    ///         }
    ///         .keyboardShortcut(shortcut)
    ///     }
    /// }
    /// ```
    ///
    /// ![A macOS view containing the KeyboardShortcut escape and the shortcut
    /// key modifiers command and control; the view returns
    /// button reading "Press command-control-return to print the 🍌" that
    /// prints "🍌".](keyboard-shortcut-key-ex.png)
    ///
    public var modifiers: EventModifiers

    /// Creates a new keyboard shortcut with the given key equivalent and set of
    /// modifier keys.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     var body: some View {
    ///         var shortcut = KeyboardShortcut(.return, modifiers: [.command, .control])
    ///
    ///         return Button("Press command-control-return to print the 🍌") {
    ///             print("🍌")
    ///         }
    ///         .keyboardShortcut(shortcut)
    ///     }
    /// }
    /// ```
    ///
    /// ![A macOS view containing the KeyboardShortcut escape with command and
    /// control as modifiers; the view returns button reading "Press
    /// command-control-return to print the 🍌" that prints "🍌".](keyboard-shortcut-key-ex.png)
    ///
    public init(_ key: KeyEquivalent, modifiers: EventModifiers = .command) { }
}

