/// A ``View`` that displays nothing.
///
/// `EmptyView` is a special view that displays nothing and occupies no space.
/// Modifying an `EmptyView` does nothing.
///
/// For example, the following stack ignores the `EmptyView` between the
/// two ``Text`` elements, even when it is modified to have a frame of
/// `1000` x `1000` and a red background color. It simply behaves as if the
/// middle view does not exist.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         VStack {
///             Text("Hello")
///
///             EmptyView()
///                 .frame(width: 1000, height: 1000)
///                 .background(Color.red)
///
///             Text("World")
///         }
///     }
/// }
/// ```
///
/// ![A view containing a VStack with two lines of text, "Hello" and "World", without an empty view between them.](AC0D635E-9E22-490E-83A5-F7E4B93C6F45.png)
///
/// `EmptyView` has many uses. For example, it can be used to instruct
/// SwiftUI that your UI control does not want a label:
///
/// ```
/// Toggle(isOn: $myBooleanValue, label: { EmptyView() })
/// ```
///
/// `EmptyView` can also be used in conjunction with ``GeometryReader``:
///
/// ```
/// struct ExampleView: View {
///     @State var width: CGFloat? = nil
///
///     var body: some View {
///         Text("Hello, world!")
///             .background(
///                 GeometryReader { geometry -> EmptyView in
///                     DispatchQueue.main.async {
///                         width = geometry.size.width
///                     }
///                     return EmptyView()
///                 }
///             )
///     }
/// }
/// ```
///
/// ![A view displaying the text "Hello, world!"](5B6AA5FC-AE37-414B-B13A-FD1854710D5D.png)
///
/// Account for `EmptyView` when building your own custom UI controls.
/// For example, the following code specifies that `label` should be hidden
/// from system accessibility features when the `label` is an instance of
/// `EmptyView`:
///
/// ```
/// struct MyCustomControl<Label: View, Content: View>: View {
///     let label: Label
///     let content: Content
///
///     var body: some View {
///         HStack {
///             label
///                 .accessibility(hidden: label is EmptyView)
///             content
///         }
///     }
/// }
/// ```
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EmptyView : View {

    /// Creates a new ``EmptyView``.
    ///
    /// See ``EmptyView`` for more on empty views and how to use them.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Hello")
    ///
    ///             EmptyView()
    ///                 .frame(width: 1000, height: 1000)
    ///                 .background(Color.red)
    ///
    ///             Text("World")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with two text views, "Hello" and "World"
    /// separated by an EmptyView with frame of width 1000 and height 1000 and
    /// red background color; the view displays as a VStack with just the two
    /// text views, "Hello" on one line and "World" on the next. ](22.17.47.png)
    ///
    @inlinable public init() { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

