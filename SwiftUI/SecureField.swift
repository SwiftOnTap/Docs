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
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onCommit: @escaping () -> Void = {}) { }

    /// Creates a text field for entering private text, usually a password, with a String placeholder.
    ///
    /// - Parameters:
    ///   - title: The string placeholder, which is visible when the field is empty.
    ///   - text: A binding variable to the displayed and edited text.
    ///   - onCommit: The function called when the user presses the Return key.
    public init<S>(_ title: S, text: Binding<String>, onCommit: @escaping () -> Void = {}) where S : StringProtocol { }
}

