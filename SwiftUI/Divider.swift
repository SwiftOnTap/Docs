/// A divider that visually separates views in a stack.
///
/// The `Divider` in iOS is either a horizontal or a vertical `1pt` thick line.
/// The height of a `Divider` is determined by the system, and
/// cannot be overriden. The system is responsible for adapting the appearance
/// of `Divider` as best appropriate for the host platform.
///
/// When contained in a stack, the divider stretches across the axis
/// perpendicular to the axis of the stack. When not in a stack, the divider
/// stretches across the horizontal axis.
///
/// For example, use a `Divider` in a ``VStack`` to create a horizontal line
/// between vertically laid out elements:
///
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         VStack {
///             Text("My Awesome Book")
///
///             Divider()
///
///             Text("My Name")
///         }
///     }
/// }
/// ```
///
/// ![A view containing a VStack with two text lines, "My Awesome Book" and "My Name," separated by a horizontal divider in the form of a thin gray line.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Divider-example-1.png)
///
/// Or use a `Divider` in an ``HStack`` to create a vertical line between
/// horizontally laid out elements:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         HStack {
///             Text("This is a line of text")
///
///             Divider()
///
///             Text("This is an unrelated line of text")
///         }
///     }
/// }
/// ```
///
/// ![A view containing an HStack with two text lines "This is a line of text" and "This is an unrelated line of text," separated by a vertical divider in the form of a thin gray line.](Horizontally-Split-Text.png)
///
/// The color of a divider can be modified using
/// ``View/background(_:alignment:)``:
///
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         VStack {
///             Text("My Awesome Book")
///
///             Divider()
///                 .background(Color.orange)
///
///             Text("My Name")
///         }
///     }
/// }
/// ```
///
/// ![A screenshot containing two lines of text in a VStack separated by a
/// divider. Using the background view modifier renders the divider
/// in orange. The text reads "My Awesome Book" on top of the divider, and
/// "My Name" underneath.](divider-colored.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Divider : View {

    /// Creates a new ``Divider``.
    ///
    /// See ``Divider`` for more on what a divider is and how to use it.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Text("This is a line of text")
    ///
    ///             Divider()
    ///
    ///             Text("This is an unrelated line of text")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot containing two lines of text in an HStack separated by a
    /// divider; The text reads "This is a line of text" to the left of the
    /// divider, and "This is an unrelated line of text" to the right.](20.20.56.png)
    ///
    public init() { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

