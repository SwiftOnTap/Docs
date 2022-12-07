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

}

