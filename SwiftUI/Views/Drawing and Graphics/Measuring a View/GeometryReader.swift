/// A type that reads the geometry of its container to produce a view.
///
/// ### How it works
///
/// `GeometryReader` can be expressed simply with the following pseudocode:
///
/// ```
/// struct GeometryReader<Content: View> {
///     var content: (GeometryProxy) -> Content
///
///     var body: some View {
///         content(<container geometry>)
///     }
/// }
/// ```
///
/// In the implementation above, `<container geometry>` is an instance of
/// ``GeometryProxy``. ``GeometryProxy`` simply encapsulates the container's
/// frame and safe area insets, provided at runtime by SwiftUI.
///
/// ### `GeometryReader` to get container bounds
///
/// In this example, `GeometryReader` is used to create a view scaled down to
/// exactly half of its parent container:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         GeometryReader { (proxy: GeometryProxy) in
///             Color.green
///                 .frame(
///                     width: proxy.size.width / 2,
///                     height: proxy.size.height / 2
///                 )
///         }
///     }
/// }
/// ```
///
/// ![A view displaying a green geometry reader frame in the upper left quadrant
/// of the view.](CA77AB4E-DB8C-453A-8A64-A86209607321.png)
///
/// Note: `GeometryReader` **fills into** its parent container, and the current
/// default alignment of its content is ``Alignment/topLeading``. The example
/// above results in a green rectangle aligned to the top left corner of the
/// screen, inset by the screen's safe area. The alignment cannot be overriden,
/// and is liable to change in the future.
///
/// ### `GeometryReader` to get a view's frame
///
/// `GeometryReader` can also be used with ``View/background(_:alignment:)``, to acquire the
/// geometry of a target view. Consider `redView` in the following example:
///
/// ```
/// struct ExampleView: View {
///     var redView: some View {
///         Rectangle()
///             .fill(Color.red)
///             .frame(width: 500, height: 500)
///     }
///
///     @State var someFrame: CGRect? // will be updated after the first layout pass
///
///     var body: some View {
///         VStack {
///             redView
///                 .frame(width: 500, height: 500)
///                 .background(
///                     GeometryReader { (proxy: GeometryProxy) -> EmptyView in
///                         if someFrame != proxy.frame(in: .global) {
///                             DispatchQueue.main.async {
///                                 someFrame = proxy.frame(in: .global)
///                             }
///                         }
///
///                         return EmptyView()
///                     }
///                 )
///             Text("Hello, World!")
///         }
///     }
/// }
/// ```
///
/// ![A view containing a VStack composed of a red background geometry reader frame with the text "Hello, World!" below it.](6DEDD064-9A38-4714-9732-9C8D6F6D5715.png)
///
/// Note that `someFrame` will be updated to hold the frame of `SomeView`, *not*
/// the frame of its container, the `VStack`. This is achieved by forcing a
/// `GeometryReader` as a background of `SomeView`, thereby constraining it to
/// `SomeView`'s bounds.
///
/// This task of acquiring a view's frame can be done in a generic and reusable
/// way using ``ViewModifier``:
///
/// ```
/// struct GetGlobalFrame: ViewModifier {
///     @Binding var globalFrame: CGRect?
///
///     func body(content: Content) -> some View {
///         content.background(
///             GeometryReader { (proxy: GeometryProxy) -> EmptyView in
///                 if globalFrame != proxy.frame(in: .global) {
///                     DispatchQueue.main.async {
///                         globalFrame = proxy.frame(in: .global)
///                     }
///                 }
///
///                 return EmptyView()
///             }
///         )
///     }
/// }
/// ```
///
/// The modifier above can be used in the following manner:
///
/// ```
/// struct ExampleView: View {
///     struct SomeView: View {
///         var body: some View {
///             Rectangle()
///                 .fill(Color.red)
///                 .frame(width: 500, height: 500)
///         }
///     }
///
///     @State var someFrame: CGRect? // will be updated after the first layout pass
///
///     var body: some View {
///         VStack {
///             SomeView()
///                 .frame(width: 500, height: 500)
///                 .modifier(GetGlobalFrame(globalFrame: $someFrame))
///
///             Text("Hello, World!")
///         }
///     }
/// }
///
/// struct GetGlobalFrame: ViewModifier {
///     @Binding var globalFrame: CGRect?
///
///     func body(content: Content) -> some View {
///         content.background(
///             GeometryReader { (proxy: GeometryProxy) -> EmptyView in
///                 if globalFrame != proxy.frame(in: .global) {
///                     DispatchQueue.main.async {
///                         globalFrame = proxy.frame(in: .global)
///                     }
///                 }
///
///                 return EmptyView()
///             }
///         )
///     }
/// }
/// ```
///
/// ![A view containing a VStack composed of a red background geometry reader frame with the text "Hello, World!" below it.](7933D23D-6833-4FE6-8BDE-21C08211172C.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct GeometryReader<Content> : View where Content : View {

    /// The content displayed within the ``GeometryReader`` view.
    ///
    /// Unlike traditional view builders, the content builder is generated from
    /// a parameter of type ``GeometryProxy``, giving you access to the geometric
    /// properties of the parent view.
    ///
    /// This property is usually specified directly using the
    /// ``GeometryReader/init(content:)``
    /// initializer. Technically this property can also be specified
    /// directly, but since a geometry reader's ``Content`` **generic
    /// type** can't change after initialization, it's rarely done in
    /// practice.
    ///
    /// In the following example, this property is the trailing closure:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         GeometryReader { proxy in
    ///             Color.green
    ///                 .frame(
    ///                     width: proxy.size.width / 2,
    ///                     height: proxy.size.height / 2
    ///                 )
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a GeometryReader with green color, and
    /// frame height and width defined by the proxy; the view results in a green
    /// rectangle in the upper left corner of the frame.](042F385D-3CF9-43E7-BC4E-DB4A5D1381A1.png)
    ///
    public var content: (GeometryProxy) -> Content

    /// Creates a ``GeometryReader`` parent view using the parent's geometry.
    ///
    /// Use this initializer to read the geometry properties of a view
    /// in laying out child views.
    ///
    /// See ``GeometryReader`` for a much more in-depth discusson
    /// of the geometry reader and how to use it.
    ///
    /// See ``GeometryProxy`` for more details on the parameter passed
    /// to the function parameter in this initializer.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         GeometryReader { proxy in
    ///             Color.green
    ///                 .frame(
    ///                     width: proxy.size.width / 2,
    ///                     height: proxy.size.height / 2
    ///                 )
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a GeometryReader with green color, and
    /// frame height and width defined by the proxy; the view results in a green
    /// rectangle in the upper left corner of the frame.](042F385D-3CF9-43E7-BC4E-DB4A5D1381A1.png)
    ///
    /// - Parameter content: A closure that takes the geometry of the parent
    /// view and returns a content view.
    @inlinable public init(@ViewBuilder content: @escaping (GeometryProxy) -> Content) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

