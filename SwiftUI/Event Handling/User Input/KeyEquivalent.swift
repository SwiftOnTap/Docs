/// Key equivalents consist of a letter, punctuation, or function key that can
/// be combined with an optional set of modifier keys to specify a keyboard
/// shortcut.
///
/// Key equivalents are used to establish keyboard shortcuts to app
/// functionality. Any key can be used as a key equivalent as long as pressing
/// it produces a single character value. Key equivalents are typically
/// initialized using a single-character string literal, with constants for
/// unprintable or hard-to-type values.
///
/// The modifier keys necessary to type a key equivalent are factored in to the
/// resulting keyboard shortcut. That is, a key equivalent whose raw value is
/// the capitalized string "A" corresponds with the keyboard shortcut
/// **Command-Shift-A**. The exact mapping may depend on the keyboard layout—for
/// example, a key equivalent whith the character value "}" produces a shortcut
/// equivalent to **Command-Shift-]** on ANSI keyboards, but would produce a
/// different shortcut for keyboard layouts where punctuation characters are in
/// different locations.
///
/// Use this structure with the ``View/keyboardShortcut(_:modifiers:)``
/// view modifier to add keyboard shortcuts to a view.
///
/// Key equivalents are also used in constructing ``KeyboardShortcut``
/// objects, which are used extensively in ``Commands``.
///
/// ```
/// struct ShortcutEnabledView: View {
///     @State var bananas = ""
///
///     let key = KeyEquivalent("p") //Try changing this
///
///     var body: some View {
///         VStack {
///             Text(bananas)
///             Button("Click or press command+P to print 🍌") {
///                 bananas += "🍌"
///             }
///             .keyboardShortcut(key, modifiers: [.command])
///         }
///         .frame(maxWidth: .infinity, maxHeight: .infinity)
///     }
/// }
/// ```
///
/// ![A view on macOs containing a state variable bananas initialized as an
/// empty string and the KeyEquivalent "p" followed by a VStack with a text view
/// calling bananas, a button reading "Click or press command+P to print 🍌",
/// and a keyboard shortcut with command as the modifier; the gif shows that when
/// the button is clicked or command and the p key are pressed, "🍌" is appended
/// to the bananas string, as reflected in its display on teh screen.](key-equivalent-ex.gif)
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct KeyEquivalent {

    /// Up Arrow (U+F700) key equivalent.
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-up to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.upArrow, modifiers: [.command])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-up to print the 🍌", and a keyboard shortcut upArrow
    /// with command as the modifier; the gif shows that when the button is
    /// clicked or command and upArrow key are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](key-equivalent-up-arrow-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let upArrow: KeyEquivalent

    /// Down Arrow (U+F701) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-down to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.downArrow, modifiers: [.command])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-down to print the 🍌", and a keyboard shortcut
    /// downArrow with command as the modifier; the gif shows that when the button
    /// is clicked or command and downArrow key are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](ke-down-arrow-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let downArrow: KeyEquivalent

    /// Left Arrow (U+F702) key equivalent.
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-left to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.leftArrow, modifiers: [.command])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-left to print the 🍌", and a keyboard shortcut
    /// leftArrow with command as the modifier; the gif shows that when the button
    /// is clicked or command and leftArrow key are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](ke-left-arrow-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let leftArrow: KeyEquivalent

    /// Right Arrow (U+F703) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-right to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.rightArrow, modifiers: [.command])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-right to print the 🍌", and a keyboard shortcut
    /// rightArrow with command as the modifier; the gif shows that when the button
    /// is clicked or command and rightArrow key are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](ke-right-arrow-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let rightArrow: KeyEquivalent

    /// Escape (U+001B) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-ctrl-escape to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.escape, modifiers: [.command, .control])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-ctrl-escape to print the 🍌", and a keyboard shortcut
    /// escape with command and control as the modifiers; the gif shows that when the button
    /// is clicked or command, control, and escape are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](escape-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let escape: KeyEquivalent

    /// Delete (U+0008) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-delete to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.delete, modifiers: [.command])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-delete to print the 🍌", and a keyboard shortcut
    /// delete with command as the modifier; the gif shows that when the button
    /// is clicked or command and delete are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](delete-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let delete: KeyEquivalent

    /// Delete Forward (U+F728) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// - Note: Many keyboards don't have this key.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-delete forward to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.deleteForward, modifiers: [.command])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-delete forward to print the 🍌", and a keyboard shortcut
    /// deleteForward with command as the modifier; the gif shows that when the button
    /// is clicked or command and deleteForward are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](delete-forward-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let deleteForward: KeyEquivalent

    /// Home (U+F729) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// - Note: Many keyboards don't have this key. If yours doesn't, press
    /// fn+left arrow instead.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-home to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.home, modifiers: [.command])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-home to print the 🍌", and a keyboard shortcut
    /// home with command as the modifier; the gif shows that when the button
    /// is clicked or command and home are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](home-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let home: KeyEquivalent

    /// End (U+F72B)
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// - Note: Many keyboards don't have this key. If yours doesn't, press
    /// fn+right arrow instead.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-end to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.end, modifiers: [.command])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-end to print the 🍌", and a keyboard shortcut
    /// end with command as the modifier; the gif shows that when the button
    /// is clicked or command and end are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](end-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let end: KeyEquivalent

    /// Page Up (U+F72C) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-page up to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.pageUp, modifiers: [.command])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-page up to print the 🍌", and a keyboard shortcut
    /// pageUp with command as the modifier; the gif shows that when the button
    /// is clicked or command and pageUp are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](page-up-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let pageUp: KeyEquivalent

    /// Page Down (U+F72D) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-page down to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.pageDown, modifiers: [.command])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-page down to print the 🍌", and a keyboard shortcut
    /// pageDown with command as the modifier; the gif shows that when the button
    /// is clicked or command and pageDown are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](ke-page-down-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let pageDown: KeyEquivalent

    /// Clear (U+F739) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-control-clear to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.clear, modifiers: [.command, .control])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-ctrl-clear to print the 🍌", and a keyboard shortcut
    /// clear with command and control as the modifiers; the gif shows that when the button
    /// is clicked or command, control, and clear are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](ke-clear-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let clear: KeyEquivalent

    /// Tab (U+0009) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-control-tab to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.tab, modifiers: [.command, .control])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-ctrl-tab to print the 🍌", and a keyboard shortcut
    /// tab with command and control as the modifiers; the gif shows that when the button
    /// is clicked or command, control, and tab are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](ke-tab-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let tab: KeyEquivalent

    /// Space (U+0020) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-control-option-space to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.space, modifiers: [.command, .control, .option])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-control-option-space to print the 🍌", and a keyboard shortcut
    /// space with command, control, and option as the modifiers; the gif shows that when the button
    /// is clicked or command, control, option, and space are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](ke-space-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let space: KeyEquivalent

    /// Return (U+000D) key equivalent
    ///
    /// Use this property with the ``View/keyboardShortcut(_:modifiers:)``
    /// view modifier to add keyboard shortcuts to a view.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-control-return to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(.return, modifiers: [.command, .control])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-control-return to print the 🍌", and a keyboard shortcut
    /// return with command and control as the modifiers; the gif shows that when the button
    /// is clicked or command, control, and return are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](ke-return-ex.gif)
    ///
    /// ``KeyEquivalent``s are also used in constructing ``KeyboardShortcut``
    /// objects, which are used extensively in ``Commands``.
    ///
    public static let `return`: KeyEquivalent

    /// The character value that the key equivalent represents.
    ///
    /// In the following example, command-control-P prints "P", and they are
    /// both constructed from the same ``Character`` object!
    ///
    /// ```
    /// struct PPrinterView: View {
    ///     @State var bananas = ""
    ///     let p = Character("p")
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-control-p to print the 🍌!") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(KeyEquivalent(p), modifiers: [.command, .control])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-control-p to print the 🍌", and a keyboard shortcut
    /// for the KeyEquivalent p with command and control as the modifiers; the gif shows that when the button
    /// is clicked or command, control, and p are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](ke-character-ex.gif)
    ///
    public var character: Character

    /// Creates a new key equivalent from the given character value.
    ///
    /// A character is just like a string, but it's only 1 letter long.
    /// See [Character](https://developer.apple.com/documentation/swift/character)
    /// for more on characters and how to create them.
    ///
    /// Note that characters are case sensitive, and passing a capital key
    /// equivalent to ``View/keyboardShortcut(_:modifiers)``
    /// means **[modifiers]+SHIFT+letter**.
    ///
    /// ```
    /// struct ShortcutEnabledView: View {
    ///     @State var bananas = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(bananas)
    ///             Button("Press command-control-p to print the 🍌") {
    ///                 bananas += "🍌"
    ///             }
    ///             .keyboardShortcut(KeyEquivalent(Character("p")), modifiers: [.command, .control])
    ///         }
    ///         .frame(maxWidth: .infinity, maxHeight: .infinity)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view on macOs containing a state variable bananas initialized as an
    /// empty string and  a VStack with a text view calling bananas, a button
    /// reading "Press command-control-p to print the 🍌", and a keyboard shortcut
    /// for the KeyEquivalent p with command and control as the modifiers; the gif shows that when the button
    /// is clicked or command, control, and p are pressed, "🍌" is appended
    /// to the bananas string, as reflected in its display on the screen.](ke-init-ex1.gif)
    ///
    public init(_ character: Character) { }
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension KeyEquivalent : ExpressibleByExtendedGraphemeClusterLiteral {

    /// Creates an instance initialized to the given value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(extendedGraphemeClusterLiteral: Character) { }

    /// A type that represents an extended grapheme cluster literal.
    ///
    /// Valid types for `ExtendedGraphemeClusterLiteralType` are `Character`,
    /// `String`, and `StaticString`.
    public typealias ExtendedGraphemeClusterLiteralType = Character

    /// A type that represents a Unicode scalar literal.
    ///
    /// Valid types for `UnicodeScalarLiteralType` are `Unicode.Scalar`,
    /// `Character`, `String`, and `StaticString`.
    public typealias UnicodeScalarLiteralType = Character
}

