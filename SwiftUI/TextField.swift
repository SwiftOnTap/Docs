/// A view for editable text.
///
/// `TextField` provides an interface to display and modify editable text.
///
/// You create a text field with a label and a binding to a value. If the
/// value is a string, the text field updates this value continuously as the
/// user types or otherwise edits the text in the field. For non-string types,
/// it updates the value when the user commits their edits, such as by pressing
/// the Return key.
///
/// The text field also allows you to provide two closures that customize its
/// behavior. The `onEditingChanged` property informs your app when the user
/// begins or ends editing the text. The `onCommit` property executes when the
/// user commits their edits.
///
/// `TextField` has 4 different initializers, and is most commonly
/// initialized with a `@State` variable and placeholder text.
///
///
///     struct ExampleView: View {
///         @State var myFruit: String = ""
///
///         var body: some View {
///             VStack {
///                   Text(myFruit)
///                   TextField("Fruit", text: $myFruit)
///             }
///             .padding()
///         }
///     }
///
/// ![A gif showing a view with a VStack containing a text field that once
/// populated displays the corresponding text in a text item.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TextField-example-1.gif)
///
/// ### Styling Text Fields
///
/// SwiftUI provides a default text field style that reflects an appearance and
/// behavior appropriate to the platform. The default style also takes the
/// current context into consideration, like whether the text field is in a
/// container that presents text fields with a special style. Beyond this, you
/// can customize the appearance and interaction of text fields using the
/// ``View/textFieldStyle(_:)`` modifier, passing in an instance of
/// ``TextFieldStyle``.
///
/// [textfield-style ->]
/// ``TextField`` can be styled with the ``View/textFieldStyle(_:)`` modifier.
///
///     struct ExampleView: View {
///         @State var myFruit: String = ""
///
///         var body: some View {
///             Text(myFruit)
///             TextField("Fruit", text: $myFruit)
///                 .textFieldStyle(RoundedBorderTextFieldStyle())
///                 .padding()
///         }
///     }
///
/// ![A gif showing a view with a VStack containing a text field that once
/// populated displays the corresponding text in a text item; the text field has
/// a rounded border style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/TextField-example-2.gif)
///
/// [<-]
/// The ``TextFieldStyle`` protocol and ``View/textFieldStyle(_:)`` modifier
/// provide helpful functionality to implement a well styled ``TextField``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct TextField<Label> : View where Label : View {

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension TextField where Label == Text {

    /// Creates a text field with a text label generated from a localized title
    /// string.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the text field,
    ///     describing its purpose.
    ///   - text: The text to display and edit.
    ///   - onEditingChanged: An action to perform when the user
    ///     begins editing ``text`` and after the user finishes editing ``text``.
    ///     The closure receives a Boolean value that indicates the editing
    ///     status: `true` when the user begins editing, `false` when they
    ///     finish.
    ///   - onCommit: An action to perform when the user performs an action
    ///     (usually pressing the Return key) while the secure field has focus.
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) { }

    /// Creates a text field with a text label generated from a title string.
    ///
    /// - Parameters:
    ///   - title: The title of the text view, describing its purpose.
    ///   - text: The text to display and edit.
    ///   - onEditingChanged: An action to perform when the user
    ///     begins editing ``text`` and after the user finishes editing ``text``.
    ///     The closure receives a Boolean value that indicates the editing
    ///     status: `true` when the user begins editing, `false` when they
    ///     finish.
    ///   - onCommit: An action to perform when the user performs an action
    ///     (usually pressing the Return key) while the secure field has focus.
    public init<S>(_ title: S, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) where S : StringProtocol { }

    /// Create an instance which binds over an arbitrary type, `T`.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the text field,
    ///     describing its purpose.
    ///   - value: The underlying value to be edited.
    ///   - formatter: A formatter to use when converting between the
    ///     string the user edits and the underlying value of type `T`.
    ///     In the event that `formatter` is unable to perform the conversion,
    ///     `binding.value` isn't modified.
    ///   - onEditingChanged: An action to perform when the user
    ///     begins editing ``text`` and after the user finishes editing ``text``.
    ///     The closure receives a Boolean value that indicates the editing
    ///     status: `true` when the user begins editing, `false` when they
    ///     finish.
    ///   - onCommit: An action to perform when the user performs an action
    ///     (for example, when the user presses the Return key) while the text
    ///     field has focus.
    public init<T>(_ titleKey: LocalizedStringKey, value: Binding<T>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) { }

    /// Create an instance which binds over an arbitrary type, `T`.
    ///
    /// - Parameters:
    ///   - title: The title of the text field, describing its purpose.
    ///   - value: The underlying value to be edited.
    ///   - formatter: A formatter to use when converting between the
    ///     string the user edits and the underlying value of type `T`.
    ///     In the event that `formatter` is unable to perform the conversion,
    ///     `binding.value` isn't modified.
    ///   - onEditingChanged: An action to perform when the user
    ///     begins editing ``text`` and after the user finishes editing ``text``.
    ///     The closure receives a Boolean value that indicates the editing
    ///     status: `true` when the user begins editing, `false` when they
    ///     finish.
    ///   - onCommit: An action to perform when the user performs an action
    ///     (for example, when the user presses the Return key) while the text
    ///     field has focus.
    public init<S, T>(_ title: S, value: Binding<T>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) where S : StringProtocol { }
}

