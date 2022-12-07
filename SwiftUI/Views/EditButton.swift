/// A button that toggles the edit mode for the current edit scope.
///
/// An `EditButton` toggles the ``EditMode`` (passed via
/// ``EnvironmentValues/editMode``) for content within a container that
/// supports `EditMode.active`.
/// For example, an `EditButton` placed inside the toolbar of a
/// ``NavigationView`` enables the editing of a ``List``:
///
///```
/// struct ExampleView: View {
///     @State var fruits = ["🍌", "🍏", "🍑"]
///
///     var body: some View {
///         NavigationView {
///             List {
///                 ForEach(fruits, id: \.self) { fruit in
///                     Text(fruit)
///                 }
///                 .onDelete { offsets in
///                     fruits.remove(atOffsets: offsets)
///                 }
///             }
///             .toolbar {
///                 EditButton()
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif showing a view with an "Edit" button right aligned above a list containg three fruit emojis as members; when clicked, the word "Edit" is replaced by "Done" and a red circle appears next to each list item, allowing it to be deleted.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/EditButton-example-1.gif)
///
/// [[list-edit-button]]
///
/// The title and appearance of an ``EditButton`` is determined by the
/// system and cannot be overriden.
@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct EditButton : View {

    /// Creates an edit button.
    public init() { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

