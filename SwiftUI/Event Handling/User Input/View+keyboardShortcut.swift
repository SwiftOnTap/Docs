@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// A view modifier that defines a keyboard shortcut and assigns it to the modified control.
    ///
    /// Pressing the control's shortcut while the control is anywhere in the
    /// frontmost window or scene, or anywhere in the macOS main menu, is
    /// equivalent to direct interaction with the control to perform its primary
    /// action.
    ///
    /// The target of a keyboard shortcut is resolved in a leading-to-trailing,
    /// depth-first traversal of one or more view hierarchies. On macOS, the
    /// system looks in the key window first, then the main window, and then the
    /// command groups; on other platforms, the system looks in the active
    /// scene, and then the command groups.
    ///
    /// If multiple controls are associated with the same shortcut, the first
    /// one found is used.
    ///
    /// ```
    /// struct ShortcutView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         let key = KeyEquivalent("p")
    ///         let modifiers: EventModifiers = [.command, .control]
    ///
    ///         return VStack {
    ///             Text(bananas)
    ///             Button("Click or press command+ctrl+P to print 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(key, modifiers: modifiers)
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a button that reads "Click or press command+ctrl+P
    /// to print" followed by a banana emoji. Each time the user clicks the button or
    /// uses the defined shortcut, a new banana emoji appears above the button as
    /// rendered by the keyboardShortcut view modifier applied to the button.](key-board-short-cut-modifiers.gif)
    ///
    /// - Parameters:
    ///   - key: A key of type ``KeyEquivalent``.
    ///   - modifiers: The modifier or function keys to use for the shortcut.
    public func keyboardShortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command) -> some View { }


    /// A view modifier that assigns a keyboard shortcut to the modified control.
    ///
    /// Pressing the control's shortcut while the control is anywhere in the
    /// frontmost window or scene, or anywhere in the macOS main menu, is
    /// equivalent to direct interaction with the control to perform its primary
    /// action.
    ///
    /// The target of a keyboard shortcut is resolved in a leading-to-trailing
    /// traversal of one or more view hierarchies. On macOS, the system looks in
    /// the key window first, then the main window, and then the command groups;
    /// on other platforms, the system looks in the active scene, and then the
    /// command groups.
    ///
    /// If multiple controls are associated with the same shortcut, the first
    /// one found is used.
    ///
    /// ```
    /// struct ShortcutView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         let key = KeyEquivalent("p")
    ///         let modifiers: EventModifiers = [.command, .control]
    ///         let shortcut = KeyboardShortcut(key, modifiers: modifiers)
    ///
    ///         return VStack {
    ///             Text(bananas)
    ///             Button("Click or press command+ctrl+P to print 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(shortcut)
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a button that reads "Click or press command+ctrl+P
    /// to print" followed by a banana emoji. Each time the user clicks the button or
    /// uses the defined shortcut, a new banana emoji appears above the button as
    /// rendered by the keyboardShortcut view modifier applied to the button.](key-board-short-cut-modifiers.gif)
    ///
    /// You can also use ``KeyboardShortcut`` actions directly:
    ///
    /// ```
    /// struct KeyboardShortcutView: View {
    ///     @State var message = "Press ENTER to save or ESC to cancel."
    ///
    ///     var body: some View {
    ///         Text(message)
    ///             .offset(y: 180)
    ///         HStack {
    ///             Button("Cancel") { message = "Canceled." }
    ///                 .keyboardShortcut(.cancelAction)
    ///             Button("Save") { message = "Saved." }
    ///                 .keyboardShortcut(.defaultAction)
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a window that reads "Press ENTER to save or ESC
    /// to cancel," which uses the default keyboard shortcut actions directly on
    /// each button.](keyboard-sc-ex2.gif)
    ///
    public func keyboardShortcut(_ shortcut: KeyboardShortcut) -> some View { }
    
    /// Assigns an optional keyboard shortcut to the modified control.
    ///
    /// Pressing the control's shortcut while the control is anywhere in the
    /// frontmost window or scene, or anywhere in the macOS main menu, is
    /// equivalent to direct interaction with the control to perform its primary
    /// action.
    ///
    /// The target of a keyboard shortcut is resolved in a leading-to-trailing
    /// traversal of one or more view hierarchies. On macOS, the system looks in
    /// the key window first, then the main window, and then the command groups;
    /// on other platforms, the system looks in the active scene, and then the
    /// command groups.
    ///
    /// If multiple controls are associated with the same shortcut, the first
    /// one found is used. If the provided shortcut is `nil`, the modifier will
    /// have no effect.
    @available(iOS 15.4, macOS 12.3, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func keyboardShortcut(_ shortcut: KeyboardShortcut?) -> some View

}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Defines a keyboard shortcut and assigns it to the modified control.
    ///
    /// Pressing the control's shortcut while the control is anywhere in the
    /// frontmost window or scene, or anywhere in the macOS main menu, is
    /// equivalent to direct interaction with the control to perform its primary
    /// action.
    ///
    /// The target of a keyboard shortcut is resolved in a leading-to-trailing,
    /// depth-first traversal of one or more view hierarchies. On macOS, the
    /// system looks in the key window first, then the main window, and then the
    /// command groups; on other platforms, the system looks in the active
    /// scene, and then the command groups.
    ///
    /// If multiple controls are associated with the same shortcut, the first
    /// one found is used.
    ///
    /// ### Localization
    ///
    /// Provide a `localization` value to specify how this shortcut
    /// should be localized.
    /// Given that `key` is always defined in relation to the US-English
    /// keyboard layout, it might be hard to reach on different international
    /// layouts. For example the shortcut `⌘[` works well for the
    /// US layout but is hard to reach for German users, where
    /// `[` is available by pressing `⌥5`, making users type `⌥⌘5`.
    /// The automatic keyboard shortcut remapping re-assigns the shortcut to
    /// an appropriate replacement, `⌘Ö` in this case.
    ///
    /// Certain shortcuts carry information about directionality. For instance,
    /// `⌘[` can reveal a previous view. Following the layout direction of
    /// the UI, this shortcut will be automatically mirrored to `⌘]`.
    /// However, this does not apply to items such as "Align Left `⌘{`",
    /// which will be "left" independently of the layout direction.
    /// When the shortcut shouldn't follow the directionality of the UI, but rather
    /// be the same in both right-to-left and left-to-right directions, using
    /// ``KeyboardShortcut/Localization-swift.struct/withoutMirroring``
    /// will prevent the system from flipping it.
    ///
    ///     var body: some Commands {
    ///         CommandMenu("Card") {
    ///             Button("Align Left") { ... }
    ///                 .keyboardShortcut("{",
    ///                      modifiers: .option,
    ///                      localization: .withoutMirroring)
    ///             Button("Align Right") { ... }
    ///                 .keyboardShortcut("}",
    ///                      modifiers: .option,
    ///                      localization: .withoutMirroring)
    ///         }
    ///     }
    ///
    /// Lastly, providing the option
    /// ``KeyboardShortcut/Localization-swift.struct/custom``
    /// disables
    /// the automatic localization for this shortcut to tell the system that
    /// internationalization is taken care of in a different way.
    public func keyboardShortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command, localization: KeyboardShortcut.Localization) -> some View { }

}
