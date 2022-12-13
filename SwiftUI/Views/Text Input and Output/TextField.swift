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

extension TextField where Label == Text {

    /// Creates a text field with a text label generated from a localized title
    /// string.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the text field,
    ///     describing its purpose.
    ///   - text: The text to display and edit.
    ///   - prompt: A `Text` representing the prompt of the text field
    ///     which provides users with guidance on what to type into the text
    ///     field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?) { }

    /// Creates a text field with a text label generated from a title string.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    /// - Parameters:
    ///   - title: The title of the text view, describing its purpose.
    ///   - text: The text to display and edit.
    ///   - prompt: A `Text` representing the prompt of the text field
    ///     which provides users with guidance on what to type into the text
    ///     field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<S>(_ title: S, text: Binding<String>, prompt: Text?) where S : StringProtocol { }
}

extension TextField {

    /// Creates a text field with a prompt generated from a `Text`.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit.
    ///   - prompt: A `Text` representing the prompt of the text field
    ///     which provides users with guidance on what to type into the text
    ///     field.
    ///   - label: A view that describes the purpose of the text field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init(text: Binding<String>, prompt: Text? = nil, @ViewBuilder label: () -> Label) { }
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

extension TextField where Label == Text {

    /// Creates a text field that applies a format style to a bound optional
    /// value, with a label generated from a localized title string.
    ///
    /// Use this initializer to create a text field that binds to a bound optional
    /// value, using a
    /// <doc://com.apple.documentation/documentation/Foundation/ParseableFormatStyle>
    /// to convert to and from this type. Changes to the bound value update
    /// the string displayed by the text field. Editing the text field
    /// updates the bound value, as long as the format style can parse the
    /// text. If the format style can't parse the input, the text field
    /// sets the bound value to `nil`.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    /// The following example uses an optional
    /// <doc://com.apple.documentation/documentation/Swift/Double>
    /// as the bound currency value, and a
    /// <doc://com.apple.documentation/documentation/Foundation/FloatingPointFormatStyle/Currency>
    /// instance to convert to and from a representation as U.S. dollars. As
    /// the user types, a `View.onChange(of:_:)` modifier logs the new value to
    /// the console. If the user enters an invalid currency value, like letters
    /// or emoji, the console output is `Optional(nil)`.
    ///
    ///     @State private var myMoney: Double? = 300.0
    ///     var body: some View {
    ///         TextField(
    ///             "Currency (USD)",
    ///             value: $myMoney,
    ///             format: .currency(code: "USD")
    ///         )
    ///         .onChange(of: myMoney) { newValue in
    ///             print ("myMoney: \(newValue)")
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - titleKey: The title of the text field, describing its purpose.
    ///   - value: The underlying value to edit.
    ///   - format: A format style of type `F` to use when converting between
    ///     the string the user edits and the underlying value of type
    ///     `F.FormatInput`. If `format` can't perform the conversion, the text
    ///     field sets `binding.value` to `nil`.
    ///   - prompt: A `Text` which provides users with guidance on what to type
    ///     into the text field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<F>(_ titleKey: LocalizedStringKey, value: Binding<F.FormatInput?>, format: F, prompt: Text? = nil) where F : ParseableFormatStyle, F.FormatOutput == String { }

    /// Creates a text field that applies a format style to a bound optional
    /// value, with a label generated from a title string.
    ///
    /// Use this initializer to create a text field that binds to a bound optional
    /// value, using a
    /// <doc://com.apple.documentation/documentation/Foundation/ParseableFormatStyle>
    /// to convert to and from this type. Changes to the bound value update
    /// the string displayed by the text field. Editing the text field
    /// updates the bound value, as long as the format style can parse the
    /// text. If the format style can't parse the input, the text field
    /// sets the bound value to `nil`.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    /// The following example uses an optional
    /// <doc://com.apple.documentation/documentation/Swift/Double>
    /// as the bound currency value, and a
    /// <doc://com.apple.documentation/documentation/Foundation/FloatingPointFormatStyle/Currency>
    /// instance to convert to and from a representation as U.S. dollars. As
    /// the user types, a `View.onChange(of:_:)` modifier logs the new value to
    /// the console. If the user enters an invalid currency value, like letters
    /// or emoji, the console output is `Optional(nil)`.
    ///
    ///     @State private var label = "Currency (USD)"
    ///     @State private var myMoney: Double? = 300.0
    ///     var body: some View {
    ///         TextField(
    ///             label,
    ///             value: $myMoney,
    ///             format: .currency(code: "USD")
    ///         )
    ///         .onChange(of: myMoney) { newValue in
    ///             print ("myMoney: \(newValue)")
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - title: The title of the text field, describing its purpose.
    ///   - value: The underlying value to edit.
    ///   - format: A format style of type `F` to use when converting between
    ///     the string the user edits and the underlying value of type
    ///     `F.FormatInput`. If `format` can't perform the conversion, the text
    ///     field sets `binding.value` to `nil`.
    ///   - prompt: A `Text` which provides users with guidance on what to type
    ///     into the text field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<S, F>(_ title: S, value: Binding<F.FormatInput?>, format: F, prompt: Text? = nil) where S : StringProtocol, F : ParseableFormatStyle, F.FormatOutput == String { }

    /// Creates a text field that applies a format style to a bound
    /// value, with a label generated from a localized title string.
    ///
    /// Use this initializer to create a text field that binds to a bound
    /// value, using a
    /// <doc://com.apple.documentation/documentation/Foundation/ParseableFormatStyle>
    /// to convert to and from this type. Changes to the bound value update
    /// the string displayed by the text field. Editing the text field
    /// updates the bound value, as long as the format style can parse the
    /// text. If the format style can't parse the input, the bound value
    /// remains unchanged.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    ///
    /// The following example uses a
    /// <doc://com.apple.documentation/documentation/Swift/Double>
    /// as the bound value, and a
    /// <doc://com.apple.documentation/documentation/Foundation/FloatingPointFormatStyle>
    /// instance to convert to and from a string representation. As the user types, the bound
    /// value updates, which in turn updates three ``Text`` views that use
    /// different format styles. If the user enters text that doesn't represent
    /// a valid `Double`, the bound value doesn't update.
    ///
    ///     @State private var myDouble: Double = 0.673
    ///     var body: some View {
    ///         VStack {
    ///             TextField(
    ///                 "Double",
    ///                 value: $myDouble,
    ///                 format: .number
    ///             )
    ///             Text(myDouble, format: .number)
    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
    ///             Text(myDouble, format: .number.notation(.scientific))
    ///         }
    ///     }
    ///
    /// ![A text field with the string 0.673. Below this, three text views
    /// showing the number with different styles: 0.673, 0.67300, and 6.73E-1.](TextField-init-format-1)
    ///
    /// - Parameters:
    ///   - titleKey: The title of the text field, describing its purpose.
    ///   - value: The underlying value to edit.
    ///   - format: A format style of type `F` to use when converting between
    ///     the string the user edits and the underlying value of type
    ///     `F.FormatInput`. If `format` can't perform the conversion, the text
    ///     field leaves `binding.value` unchanged. If the user stops editing
    ///     the text in an invalid state, the text field updates the field's
    ///     text to the last known valid value.
    ///   - prompt: A `Text` which provides users with guidance on what to type
    ///     into the text field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<F>(_ titleKey: LocalizedStringKey, value: Binding<F.FormatInput>, format: F, prompt: Text? = nil) where F : ParseableFormatStyle, F.FormatOutput == String { }

    /// Creates a text field that applies a format style to a bound
    /// value, with a label generated from a title string.
    ///
    /// Use this initializer to create a text field that binds to a bound
    /// value, using a
    /// <doc://com.apple.documentation/documentation/Foundation/ParseableFormatStyle>
    /// to convert to and from this type. Changes to the bound value update
    /// the string displayed by the text field. Editing the text field
    /// updates the bound value, as long as the format style can parse the
    /// text. If the format style can't parse the input, the bound value
    /// remains unchanged.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    /// The following example uses a
    /// <doc://com.apple.documentation/documentation/Swift/Double>
    /// as the bound value, and a
    /// <doc://com.apple.documentation/documentation/Foundation/FloatingPointFormatStyle>
    /// instance to convert to and from a string representation. As the user types, the bound
    /// value updates, which in turn updates three ``Text`` views that use
    /// different format styles. If the user enters text that doesn't represent
    /// a valid `Double`, the bound value doesn't update.
    ///
    ///     @State private var label = "Double"
    ///     @State private var myDouble: Double = 0.673
    ///     var body: some View {
    ///         VStack {
    ///             TextField(
    ///                 label,
    ///                 value: $myDouble,
    ///                 format: .number
    ///             )
    ///             Text(myDouble, format: .number)
    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
    ///             Text(myDouble, format: .number.notation(.scientific))
    ///         }
    ///     }
    ///
    /// ![A text field with the string 0.673. Below this, three text views
    /// showing the number with different styles: 0.673, 0.67300, and 6.73E-1.](TextField-init-format-1)
    /// - Parameters:
    ///   - title: The title of the text field, describing its purpose.
    ///   - value: The underlying value to edit.
    ///   - format: A format style of type `F` to use when converting between
    ///     the string the user edits and the underlying value of type
    ///     `F.FormatInput`. If `format` can't perform the conversion, the text
    ///     field leaves `binding.value` unchanged. If the user stops editing
    ///     the text in an invalid state, the text field updates the field's
    ///     text to the last known valid value.
    ///   - prompt: A `Text` which provides users with guidance on what to type
    ///     into the text field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<S, F>(_ title: S, value: Binding<F.FormatInput>, format: F, prompt: Text? = nil) where S : StringProtocol, F : ParseableFormatStyle, F.FormatOutput == String { }
}

extension TextField {

    /// Creates a text field that applies a format style to a bound optional
    /// value, with a label generated from a view builder.
    ///
    /// Use this initializer to create a text field that binds to a bound optional
    /// value, using a
    /// <doc://com.apple.documentation/documentation/Foundation/ParseableFormatStyle>
    /// to convert to and from this type. Changes to the bound value update
    /// the string displayed by the text field. Editing the text field
    /// updates the bound value, as long as the format style can parse the
    /// text. If the format style can't parse the input, the text field
    /// sets the bound value to `nil`.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    /// The following example uses an optional
    /// <doc://com.apple.documentation/documentation/Swift/Double>
    /// as the bound currency value, and a
    /// <doc://com.apple.documentation/documentation/Foundation/FloatingPointFormatStyle/Currency>
    /// instance to convert to and from a representation as U.S. dollars. As
    /// the user types, a `View.onChange(of:_:)` modifier logs the new value to
    /// the console. If the user enters an invalid currency value, like letters
    /// or emoji, the console output is `Optional(nil)`.
    ///
    ///     @State private var myMoney: Double? = 300.0
    ///     var body: some View {
    ///         TextField(
    ///             value: $myMoney,
    ///             format: .currency(code: "USD")
    ///         ) {
    ///             Text("Currency (USD)")
    ///         }
    ///         .onChange(of: myMoney) { newValue in
    ///             print ("myMoney: \(newValue)")
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - value: The underlying value to edit.
    ///   - format: A format style of type `F` to use when converting between
    ///     the string the user edits and the underlying value of type
    ///     `F.FormatInput`. If `format` can't perform the conversion, the text
    ///     field sets `binding.value` to `nil`.
    ///   - prompt: A `Text` which provides users with guidance on what to type
    ///     into the text field.
    ///   - label: A view builder that produces a label for the text field,
    ///     describing its purpose.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<F>(value: Binding<F.FormatInput?>, format: F, prompt: Text? = nil, @ViewBuilder label: () -> Label) where F : ParseableFormatStyle, F.FormatOutput == String { }

    /// Creates a text field that applies a format style to a bound
    /// value, with a label generated from a view builder.
    ///
    /// Use this initializer to create a text field that binds to a bound
    /// value, using a
    /// <doc://com.apple.documentation/documentation/Foundation/ParseableFormatStyle>
    /// to convert to and from this type. Changes to the bound value update
    /// the string displayed by the text field. Editing the text field
    /// updates the bound value, as long as the format style can parse the
    /// text. If the format style can't parse the input, the bound value
    /// remains unchanged.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    /// The following example uses a
    /// <doc://com.apple.documentation/documentation/Swift/Double>
    /// as the bound value, and a
    /// <doc://com.apple.documentation/documentation/Foundation/FloatingPointFormatStyle>
    /// instance to convert to and from a string representation. As the user types, the bound
    /// value updates, which in turn updates three ``Text`` views that use
    /// different format styles. If the user enters text that doesn't represent
    /// a valid `Double`, the bound value doesn't update.
    ///
    ///     @State private var myDouble: Double = 0.673
    ///     var body: some View {
    ///         VStack {
    ///             TextField(
    ///                 value: $myDouble,
    ///                 format: .number
    ///             ) {
    ///                 Text("Double")
    ///             }
    ///             Text(myDouble, format: .number)
    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
    ///             Text(myDouble, format: .number.notation(.scientific))
    ///         }
    ///     }
    ///
    /// ![A text field with the string 0.673. Below this, three text views
    /// showing the number with different styles: 0.673, 0.67300, and 6.73E-1.](TextField-init-format-1)
    ///
    /// - Parameters:
    ///   - value: The underlying value to edit.
    ///   - format: A format style of type `F` to use when converting between
    ///     the string the user edits and the underlying value of type
    ///     `F.FormatInput`. If `format` can't perform the conversion, the text
    ///     field leaves the value unchanged. If the user stops editing
    ///     the text in an invalid state, the text field updates the field's
    ///     text to the last known valid value.
    ///   - prompt: A `Text` which provides users with guidance on what to type
    ///     into the text field.
    ///   - label: A view builder that produces a label for the text field,
    ///     describing its purpose.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<F>(value: Binding<F.FormatInput>, format: F, prompt: Text? = nil, @ViewBuilder label: () -> Label) where F : ParseableFormatStyle, F.FormatOutput == String { }
}

extension TextField where Label == Text {

    /// Creates a text field that applies a formatter to a bound
    /// value, with a label generated from a localized title string.
    ///
    /// Use this initializer to create a text field that binds to a bound
    /// value, using a
    /// <doc://com.apple.documentation/documentation/Foundation/Formatter>
    /// to convert to and from this type. Changes to the bound value update
    /// the string displayed by the text field. Editing the text field
    /// updates the bound value, as long as the formatter can parse the
    /// text. If the format style can't parse the input, the bound value
    /// remains unchanged.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    /// The following example uses a
    /// <doc://com.apple.documentation/documentation/Swift/Double>
    /// as the bound value, and a
    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter>
    /// instance to convert to and from a string representation. The formatter
    /// uses the
    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter/Style/decimal>
    /// style, to allow entering a fractional part. As the user types, the bound
    /// value updates, which in turn updates three ``Text`` views that use
    /// different format styles. If the user enters text that doesn't represent
    /// a valid `Double`, the bound value doesn't update.
    ///
    ///     @State private var myDouble: Double = 0.673
    ///     @State private var numberFormatter: NumberFormatter = {
    ///         var nf = NumberFormatter()
    ///         nf.numberStyle = .decimal
    ///         return nf
    ///     }()
    ///
    ///     var body: some View {
    ///         VStack {
    ///             TextField(
    ///                 "Double",
    ///                 value: $myDouble,
    ///                 formatter: numberFormatter
    ///             )
    ///             Text(myDouble, format: .number)
    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
    ///             Text(myDouble, format: .number.notation(.scientific))
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the text field,
    ///     describing its purpose.
    ///   - value: The underlying value to edit.
    ///   - formatter: A formatter to use when converting between the
    ///     string the user edits and the underlying value of type `V`.
    ///     If `formatter` can't perform the conversion, the text field doesn't
    ///     modify `binding.value`.
    ///   - prompt: A `Text` which provides users with guidance on what to enter
    ///     into the text field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, formatter: Formatter, prompt: Text?) { }

    /// Creates a text field that applies a formatter to a bound
    /// value, with a label generated from a title string.
    ///
    /// Use this initializer to create a text field that binds to a bound
    /// value, using a
    /// <doc://com.apple.documentation/documentation/Foundation/Formatter>
    /// to convert to and from this type. Changes to the bound value update
    /// the string displayed by the text field. Editing the text field
    /// updates the bound value, as long as the formatter can parse the
    /// text. If the format style can't parse the input, the bound value
    /// remains unchanged.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    ///
    /// The following example uses a
    /// <doc://com.apple.documentation/documentation/Swift/Double>
    /// as the bound value, and a
    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter>
    /// instance to convert to and from a string representation. The formatter
    /// uses the
    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter/Style/decimal>
    /// style, to allow entering a fractional part. As the user types, the bound
    /// value updates, which in turn updates three ``Text`` views that use
    /// different format styles. If the user enters text that doesn't represent
    /// a valid `Double`, the bound value doesn't update.
    ///
    ///     @State private var label = "Double"
    ///     @State private var myDouble: Double = 0.673
    ///     @State private var numberFormatter: NumberFormatter = {
    ///         var nf = NumberFormatter()
    ///         nf.numberStyle = .decimal
    ///         return nf
    ///     }()
    ///
    ///     var body: some View {
    ///         VStack {
    ///             TextField(
    ///                 label,
    ///                 value: $myDouble,
    ///                 formatter: numberFormatter
    ///             )
    ///             Text(myDouble, format: .number)
    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
    ///             Text(myDouble, format: .number.notation(.scientific))
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - title: The title of the text field, describing its purpose.
    ///   - value: The underlying value to edit.
    ///   - formatter: A formatter to use when converting between the
    ///     string the user edits and the underlying value of type `V`.
    ///     If `formatter` can't perform the conversion, the text field doesn't
    ///     modify `binding.value`.
    ///   - prompt: A `Text` which provides users with guidance on what to enter
    ///     into the text field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<S, V>(_ title: S, value: Binding<V>, formatter: Formatter, prompt: Text?) where S : StringProtocol { }
}

extension TextField {

    /// Creates a text field that applies a formatter to a bound optional
    /// value, with a label generated from a view builder.
    ///
    /// Use this initializer to create a text field that binds to a bound optional
    /// value, using a
    /// <doc://com.apple.documentation/documentation/Foundation/Formatter>
    /// to convert to and from this type. Changes to the bound value update
    /// the string displayed by the text field. Editing the text field
    /// updates the bound value, as long as the formatter can parse the
    /// text. If the format style can't parse the input, the bound value
    /// remains unchanged.
    ///
    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
    /// whenever the user submits this text field.
    ///
    /// The following example uses a
    /// <doc://com.apple.documentation/documentation/Swift/Double>
    /// as the bound value, and a
    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter>
    /// instance to convert to and from a string representation. The formatter
    /// uses the
    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter/Style/decimal>
    /// style, to allow entering a fractional part. As the user types, the bound
    /// value updates, which in turn updates three ``Text`` views that use
    /// different format styles. If the user enters text that doesn't represent
    /// a valid `Double`, the bound value doesn't update.
    ///
    ///     @State private var myDouble: Double = 0.673
    ///     @State private var numberFormatter: NumberFormatter = {
    ///         var nf = NumberFormatter()
    ///         nf.numberStyle = .decimal
    ///         return nf
    ///     }()
    ///
    ///     var body: some View {
    ///         VStack {
    ///             TextField(
    ///                 value: $myDouble,
    ///                 formatter: numberFormatter
    ///             ) {
    ///                 Text("Double")
    ///             }
    ///             Text(myDouble, format: .number)
    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
    ///             Text(myDouble, format: .number.notation(.scientific))
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - value: The underlying value to edit.
    ///   - formatter: A formatter to use when converting between the
    ///     string the user edits and the underlying value of type `V`.
    ///     If `formatter` can't perform the conversion, the text field doesn't
    ///     modify `binding.value`.
    ///   - prompt: A `Text` which provides users with guidance on what to enter
    ///     into the text field.
    ///   - label: A view that describes the purpose of the text field.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init<V>(value: Binding<V>, formatter: Formatter, prompt: Text? = nil, @ViewBuilder label: () -> Label) { }
}
