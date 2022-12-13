/// A proxy that encapsulates the container's frame and safe area insets, used
/// by ``GeometryReader``.
///
/// For example, to create a new `GeometryProxy` for use in a ``GeometryReader``:
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
/// ![A view containing a GeometryReader with a GeometryProxy, green color, and
/// frame height and width defined by the proxy; the view results in a green
/// rectangle in the upper left corner of the frame.](042F385D-3CF9-43E7-BC4E-DB4A5D1381A1.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct GeometryProxy {

    /// The size of the container view.
    public var size: CGSize { get }

    /// Converts the anchor to a value in the coordinate space of the target view.
    public subscript<T>(anchor: Anchor<T>) -> T { get }

    /// The safe area inset of the container view.
    public var safeAreaInsets: EdgeInsets { get }

    /// Returns the parent ``GeometryReader``'s frame, converted to a defined
    /// ``CoordinateSpace``.
    public func frame(in coordinateSpace: CoordinateSpace) -> CGRect { }
}

