/// Keyboard shortcuts describe combinations of keys on a keyboard that the user
/// can press in order to activate a button or toggle.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct KeyboardShortcut {
    
    /// Options for how a keyboard shortcut participates in automatic localization.
    ///
    /// A shortcut's `key` that is defined on an US-English keyboard
    /// layout might not be reachable on international layouts.
    /// For example the shortcut `⌘[` works well for the US layout but is
    /// hard to reach for German users.
    /// On the German keyboard layout, pressing `⌥5` will produce
    /// `[`, which causes the shortcut to become `⌥⌘5`.
    /// If configured, which is the default behavior, automatic shortcut
    /// remapping will convert it to `⌘Ö`.
    ///
    /// In addition to that, some keyboard shortcuts carry information
    /// about directionality.
    /// Right-aligning a block of text or seeking forward in context of music
    /// playback are such examples. These kinds of shortcuts benefit from the option
    /// ``KeyboardShortcut/Localization-swift.struct/withoutMirroring``
    /// to tell the system that they won't be flipped when running in a
    /// right-to-left context.
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public struct Localization {

        /// Remap shortcuts to their international counterparts, mirrored for
        /// right-to-left usage if appropriate.
        ///
        /// This is the default configuration.
        public static let automatic: KeyboardShortcut.Localization

        /// Don't mirror shortcuts.
        ///
        /// Use this for shortcuts that always have a specific directionality, like
        /// aligning something on the right.
        ///
        /// Don't use this option for navigational shortcuts like "Go Back" because navigation
        /// is flipped in right-to-left contexts.
        public static let withoutMirroring: KeyboardShortcut.Localization

        /// Don't use automatic shortcut remapping.
        ///
        /// When you use this mode, you have to take care of international use-cases separately.
        public static let custom: KeyboardShortcut.Localization
    }

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
    
    /// The localization strategy to apply to this shortcut.
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var localization: KeyboardShortcut.Localization

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
    
    /// Creates a new keyboard shortcut with the given key equivalent and set of
    /// modifier keys.
    ///
    /// Use the `localization` parameter to specify a localization strategy
    /// for this shortcut.
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ key: KeyEquivalent, modifiers: EventModifiers = .command, localization: KeyboardShortcut.Localization) { }
    
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension KeyboardShortcut : Hashable { }
