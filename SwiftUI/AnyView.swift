/// A view that provides type-erasure for views of other types.
///
/// An `AnyView` hides the type of the ``View`` value passed to it (similar
/// to how `AnyHashable` hides the type of `Hashable` value passed to it).
///
/// To type-erase your view, pass it to ``AnyView/init(_:)`` like this:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         AnyView(Text("Hello, world!"))
///     }
/// }
/// ```
///
/// ![A white AnyView displaying the text "Hello,world!"](17C757BC-E76E-4E17-9513-6C5AB3A80796.png)
///
/// Changing the type of view using with `AnyView` destroys the view hierarchy
/// for the old type and creates a new hierarchy for the new type. In the
/// following example, ``Text`` is destroyed and ``Color`` is created when
/// `foo` is set to `false`:
///
/// ```
/// struct ExampleView: View {
///     let foo: Bool = false
///
///     var body: some View {
///         if foo {
///             AnyView(Text("Hello, world!"))
///         } else {
///             AnyView(Color.red)
///         }
///     }
/// }
/// ```
///
/// ![A blank red AnyView.](5AFA4383-AD4C-4AC6-9C25-5E3F154E395D.png)
///
/// Avoid frequently changing the underlying type of view being erased,
/// especially for complex views, as poor performance may result.
/// `AnyView` is best suited for use in the deepest part of your view
/// hierarchy, such as a list's row content in
/// ``List/init(_:id:selection:rowContent:)``. It is also suited for use in
/// different layers of your view hierarchy, via either
/// ``View/overlay(_:alignment:)`` or ``View/background(_:alignment:)``.
///
/// Consider whether the usage of `AnyView` is appropriate, or even necessary.
/// A common mistake is to use `AnyView` like this:
///
/// ```
/// func makeHelperView() -> some View {
///     if foo {
///         return AnyView(Text("Hello, world!"))
///     } else {
///         return AnyView(Color.red)
///     }
/// }
/// ```
///
/// Wherein adding a ``ViewBuilder`` would be more appropriate:
///
/// ```
/// @ViewBuilder
/// func makeHelperView() -> some View {
///     if foo {
///         Text("Hello, world!")
///     } else {
///         Color.red
///     }
/// }
/// ```
///
/// ![A blank red AnyView.](5AFA4383-AD4C-4AC6-9C25-5E3F154E395D.png)
///
/// The latter example performs better as the SwiftUI runtime is given a
/// more explicit type hierarchy, where the switch between `foo` being `true`
/// or `false` can only result in a ``Text`` or a ``Color``. The former
/// example erases that information, forcing the SwiftUI runtime to evaluate
/// the actual view type lazily, and thus requires more work to compute and
/// render.
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct AnyView : View {

    /// Create an instance that type-erases ``View``.
    ///
    /// See ``AnyView`` for the uses and dangers of using this structure.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         AnyView(Text("Hello, world!"))
    ///     }
    /// }
    /// ```
    ///
    /// ![An AnyView containing the text view "Hello, world!", resulting in the
    /// type erasure of the view.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/anyview-example-1.png)
    ///
    public init<V>(_ view: V) where V : View { }

    /// Creates an instance that type-erases the parameter.
    ///
    /// See ``AnyView`` for the uses and dangers of using this structure.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         AnyView(erasing: Text("Hello, world!"))
    ///     }
    /// }
    /// ```
    ///
    /// ![An AnyView containing the text view "Hello, world!" in an erasing instance,
    /// resulting in type erasure of the parameter.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/anyview-example-1.png)
    ///
    public init<V>(erasing view: V) where V : View { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

