/// A shape style that fills a shape by repeating a region of an image.
///
/// Use this shape style to tile images as strokes or fills.
///
/// See ``ShapeStyle`` for more info on how and where to use shape styles.
///
/// ```
/// struct DogsEverywhereView: View {
///     var body: some View {
///         Rectangle()
///             .fill(ImagePaint(image: Image("dog")))
///     }
/// }
/// ```
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ImagePaint : ShapeStyle {

    /// The image to be drawn.
    ///
    /// This image property must be declared when the ``ImagePaint`` structure
    /// is initialized, but it can be read or written to later.
    ///
    /// ```
    /// struct DogsEverywhereView: View {
    ///     var body: some View {
    ///         var imagePaint = ImagePaint(image: Image("placeholder"))
    ///         imagePaint.image = Image("dog")
    ///
    ///         return Rectangle()
    ///             .fill(imagePaint)
    ///     }
    /// }
    /// ```
    public var image: Image

    /// A unit-space rectangle defining how much of the source image to draw.
    ///
    /// This of this as the 1-by-1 rectangle from the original image that you
    /// want to be tiled over the entirety of the space.
    ///
    /// The results are undefined if this rectangle selects areas outside the
    /// `[0, 1]` range in either axis.
    ///
    /// This image property can be declared when the ``ImagePaint`` structure
    /// is initialized, or written to or read later.
    ///
    /// ```
    /// struct TrippyDogsEverywhereView: View {
    ///     var body: some View {
    ///         var imagePaint = ImagePaint(image: Image("dog"))
    ///         imagePaint.sourceRect = CGRect(x: 0.0, y: 0.0, width: 0.34, height: 1.0)
    ///
    ///         return Rectangle()
    ///             .fill(imagePaint)
    ///     }
    /// }
    /// ```
    public var sourceRect: CGRect

    /// A scale factor applied to the image while being drawn.
    ///
    /// This image property can be declared when the ``ImagePaint`` structure
    /// is initialized, or written to or read later.
    ///
    /// ```
    /// struct BigDogsEverywhereView: View {
    ///     var body: some View {
    ///         var imagePaint = ImagePaint(image: Image("dog"))
    ///         imagePaint.scale = 3
    ///
    ///         return Rectangle()
    ///             .fill(imagePaint)
    ///     }
    /// }
    /// ```
    public var scale: CGFloat

    /// Creates a shape-filling shape style from a source image.
    ///
    /// ```
    /// struct DogsEverywhereView: View {
    ///     let imagePaint = ImagePaint(image: Image("dog"),
    ///                                 sourceRect: CGRect(x: 0.0, y: 0.0, width: 0.34, height: 1.0),
    ///                                 scale: 4)
    ///     var body: some View {
    ///         Rectangle()
    ///             .fill(imagePaint)
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - image: The image to be drawn.
    ///   - sourceRect: A unit-space rectangle defining how much of the source
    ///     image to draw. The results are undefined if `sourceRect` selects
    ///     areas outside the `[0, 1]` range in either axis.
    ///   - scale: A scale factor applied to the image during rendering.
    public init(image: Image, sourceRect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1), scale: CGFloat = 1) { }
}

