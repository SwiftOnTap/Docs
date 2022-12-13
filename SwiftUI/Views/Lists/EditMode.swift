/// The mode of a view indicating whether the user can edit its content.
///
/// ```
/// struct ExampleView: View {
///     @State var fruits = ["🍌", "🍏", "🍑"]
///
///     var body: some View {
///         List {
///             ForEach(fruits, id: \.self) { fruit in
///                 Text(fruit)
///             }
///             .onDelete { offets in
///                 fruits.remove(atOffsets: offets)
///             }
///         }
///         .environment(\.editMode, .constant(.active))
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing a list with three members; the gif
/// shows two of the items being deleted from the list.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Binding-example-3.gif)
///
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public enum EditMode {

    /// The view content cannot be edited.
    case inactive

    /// The view is in a temporary edit mode.
    ///
    /// The definition of temporary might vary by platform or specific control.
    /// As an example, temporary edit mode may be engaged over the duration of a
    /// swipe gesture.
    case transient

    /// The view content can be edited.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State var fruits = ["🍌", "🍏", "🍑"]
    ///
    ///     var body: some View {
    ///         List {
    ///             ForEach(fruits, id: \.self) { fruit in
    ///                 Text(fruit)
    ///             }
    ///             .onDelete { offets in
    ///                 fruits.remove(atOffsets: offets)
    ///             }
    ///         }
    ///         .environment(\.editMode, .constant(.active))
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a list with three members; the gif
    /// shows two of the items being deleted from the list.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Binding-example-3.gif)
    case active

    /// Indicates whether a view is being edited.
    public var isEditing: Bool { get }

}

