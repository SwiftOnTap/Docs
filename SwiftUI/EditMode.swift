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

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: EditMode, b: EditMode) -> Bool { }

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) { }
}

