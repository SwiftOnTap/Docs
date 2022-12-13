/// A multi-line text field.
///
/// A text editor view allows you to display and edit multiline, scrollable
/// text in your app's user interface. The text editor responds to usual
/// view modifiers like:
///
/// - ``View/font(_:)``
/// - ``View/foregroundColor(_:)``
/// - ``View/multilineTextAlignment(_:)``
///
/// ### Creating a text editor
///
/// You create a text editor by adding a `TextEditor` instance to the
/// body of your view, and initialize it by passing in a
/// ``Binding`` to a string variable in your app:
///
///     struct TextEditingView: View {
///         @State private var fullText = "This is some editable text..."
///
///         var body: some View {
///             TextEditor(text: $fullText)
///                 .padding()
///         }
///     }
///
/// ![A screenshot displaying a keyboard on the lower half of the screen with
/// text that reads "This is some editable text..." which can be edited
/// by the user with as many lines as necessary.](text-editor.png)
///
/// ### Styling a text editor
///
/// To style the text, use the standard view modifiers to configure a system
/// font, set a custom font, or change the color of the view's text.
///
/// In this example, the view renders the editor's text in gray with a
/// custom font:
///
///     struct TextEditingView: View {
///         @State private var fullText = "This is some editable text..."
///
///         var body: some View {
///             TextEditor(text: $fullText)
///                 .foregroundColor(Color.gray)
///                 .font(.custom("HelveticaNeue", size: 13))
///                 .padding()
///         }
///     }
///
/// ![A screenshot displaying a keyboard on the lower half of the screen with
/// text that reads "This is some editable text..." which has a style applied
/// such that the font is Helvetica Neue with a large 13 pt.](texteditor-2.png)
///
/// If you want to change the spacing or font scaling aspects of the text, you
/// can use modifiers like ``View/lineLimit(_:)``,
/// ``View/lineSpacing(_:)``, and ``View/minimumScaleFactor(_:)`` to configure
/// how the view displays text depending on the space constraints. For example,
/// here the ``View/lineSpacing(_:)`` modifier sets the spacing between lines
/// to `5` points:
///
///     struct TextEditingView: View {
///         @State private var fullText = "This is some editable text..."
///
///         var body: some View {
///             TextEditor(text: $fullText)
///                 .lineLimit(3)
///                 .lineSpacing(5)
///                 .minimumScaleFactor(0.5)
///                 .padding()
///         }
///     }
///
/// ![A screenshot displaying a keyboard on the lower half of the screen with
/// text that reads "This is some editable text..." which has a style applied
/// such that the spacing between lines is 5 pt.](texteditor-3.png)
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct TextEditor : View {

    /// Creates a multi-line text field.
    ///
    /// Use a ``TextEditor`` instance to create a view in which users can enter
    /// and edit long-form text.
    ///
    /// In this example, the text editor renders gray text using the `13`
    /// point Helvetica Neue font with `5` points of spacing between each line:
    ///
    ///     struct TextEditingView: View {
    ///         @State private var fullText: String = "This is some editable text..."
    ///
    ///         var body: some View {
    ///             TextEditor(text: $fullText)
    ///                 .foregroundColor(Color.gray)
    ///                 .font(.custom("HelveticaNeue", size: 13))
    ///                 .lineSpacing(5)
    ///                 .padding()
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a keyboard on the lower half of the screen with
    /// text that reads "This is some editable text..." which has a style applied
    /// such that the font is Helvetica Neue with a large 13 pt.](texteditor-2.png)
    ///
    /// You can define the styling for the text within the view, including the
    /// text color, font, and line spacing. You define these styles by applying
    /// standard view modifiers to the view.
    ///
    /// - Parameter text: A ``Binding`` to the variable containing the
    ///    text to edit.
    public init(text: Binding<String>) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

