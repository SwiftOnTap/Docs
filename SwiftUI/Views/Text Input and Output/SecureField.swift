/// A text field for entering private text, usually a password.
///
/// A secure field is just like a ``TextField``, except the entered text is shown as dots instead of
/// as the actual text. Typically, you use this for entering passwords and other sensitive information.
///
/// A `SecureField` uses a binding to a string value, and a closure that
/// executes when the user commits their edits, such as by pressing the
/// Return key. The field updates the bound string on every keystroke or
/// other edit, so you can read its value at any time from another control,
/// such as a Done button.
///
/// The following example shows a SecureField bound to the string password. If
/// the user commits their edit in the secure field, the onCommit closure displays
/// a message to confirm that a password has been entered.
///
/// ```
/// struct PasswordView: View {
///     @State private var password = ""
///     @State private var message = ""
///
///     var body: some View {
///         VStack(spacing: 20) {
///             Text(message)
///             SecureField("Password", text: $password, onCommit: {
///                 message = "Password has been entered ✅"
///             })
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a secure text field being used, in which each character
/// typed is displayed as a dot on the screen. Once the user confirms the password,
/// a text view appears that reads "Password has been entered."](secure-field-ex.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SecureField<Label> : View where Label : View {

    /// The body of a secure field, which is the underlying TextField.
    ///
    /// ```
    /// struct PasswordView: View {
    ///     @State private var password = ""
    ///     var body: some View {
    ///         let field = SecureField("Password", text: $password)
    ///         return field.onAppear { print(field.body) } //"TextField<Text>(..."
    ///     }
    /// }
    /// ```
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    ///
    /// In this instance, the type evaluates to ``TextField``, since the body of a ``SecureField``
    /// is a text field.
    ///
    /// ```
    /// struct PasswordView: View {
    ///     @State private var password = ""
    ///     var body: some View {
    ///         SecureField("Password", text: $password, onCommit: {
    ///             print("Password has been entered ✅")
    ///         })
    ///     }
    /// }
    /// ```
    public typealias Body = some View
}

extension SecureField where Label == Text {

    /// Creates a secure field with a prompt generated from a `Text`.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this secure field.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of `self`, describing
    ///     its purpose.
    ///   - text: The text to display and edit
    ///   - prompt: A `Text` representing the prompt of the secure field
    ///     which provides users with guidance on what to type into the secure
    ///     field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?) { }

    /// Creates a secure field with a prompt generated from a `Text`.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this secure field.
    ///
    /// - Parameters:
    ///   - title: The title of `self`, describing its purpose.
    ///   - text: The text to display and edit.
    ///   - prompt: A `Text` representing the prompt of the secure field
    ///     which provides users with guidance on what to type into the secure
    ///     field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<S>(_ title: S, text: Binding<String>, prompt: Text?) where S : StringProtocol { }
}

extension SecureField {

    /// Creates a secure field with a prompt generated from a `Text`.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit.
    ///   - prompt: A `Text` representing the prompt of the secure field
    ///     which provides users with guidance on what to type into the secure
    ///     field.
    ///   - label: A view that describes the purpose of the secure field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init(text: Binding<String>, prompt: Text? = nil, @ViewBuilder label: () -> Label) { }
}


@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SecureField where Label == Text {

    /// Creates a text field for entering private text, usually a password, with a ``LocalizedStringKey`` placeholder.
    ///
    /// ```
    /// struct PasswordView: View {
    ///     @State private var password = ""
    ///     var body: some View {
    ///         SecureField(LocalizedStringKey("Password"), text: $password, onCommit: {
    ///             print("Password has been entered ✅")
    ///         })
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a secure text field being used, in which each character
    /// typed is displayed as a dot on the screen. The text field has a localized
    /// string key placeholder, so it reads "Password" before anything is entered.
    /// Once the user confirms the password, a text view appears that reads
    /// "Password has been entered."](localized-string-key-ex.gif)
    ///
    /// - Parameters:
    ///   - titleKey: The localized string key placeholder, which is visible when the field is empty.
    ///   - text: A binding variable to the displayed and edited text.
    ///   - onCommit: The function called when the user presses the Return key.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed SecureField.init(_:text:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed SecureField.init(_:text:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed SecureField.init(_:text:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed SecureField.init(_:text:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter.")
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onCommit: @escaping () -> Void = {}) { }

    /// Creates a text field for entering private text, usually a password, with a String placeholder.
    ///
    /// - Parameters:
    ///   - title: The string placeholder, which is visible when the field is empty.
    ///   - text: A binding variable to the displayed and edited text.
    ///   - onCommit: The function called when the user presses the Return key.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed SecureField.init(_:text:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed SecureField.init(_:text:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed SecureField.init(_:text:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed SecureField.init(_:text:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter.")
    public init<S>(_ title: S, text: Binding<String>, onCommit: @escaping () -> Void = {}) where S : StringProtocol { }
}

