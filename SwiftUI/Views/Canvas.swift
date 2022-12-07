/// A view type that supports immediate mode drawing.
///
/// Use a canvas to draw rich and dynamic 2D graphics inside a SwiftUI view.
/// The canvas passes a ``GraphicsContext`` to the closure that you use
/// to perform immediate mode drawing operations. The canvas also passes a
/// <doc://com.apple.documentation/documentation/CoreGraphics/CGSize> value
/// that you can use to customize what you draw. For example, you can use the
/// context's ``GraphicsContext/stroke(_:with:lineWidth:)`` command to draw
/// a ``Path`` instance:
///
///     Canvas { context, size in
///         context.stroke(
///             Path(ellipseIn: CGRect(origin: .zero, size: size)),
///             with: .color(.green),
///             lineWidth: 4)
///     }
///     .frame(width: 300, height: 200)
///     .border(Color.blue)
///
/// The example above draws the outline of an ellipse that exactly inscribes
/// a canvas with a blue border:
///
/// ![A screenshot of a canvas view that shows the green outline of an
/// ellipse inside a blue rectangle.](Canvas-1)
///
/// In addition to outlined and filled paths, you can draw images, text, and
/// complete SwiftUI views. To draw views, use the
/// ``init(opaque:colorMode:rendersAsynchronously:renderer:symbols:)`` method
/// to supply views that you can reference from inside the renderer. You can
/// also add masks, apply filters, perform transforms, control blending, and
/// more. For information about how to draw, see ``GraphicsContext``.
///
/// A canvas doesn't offer interactivity or accessibility for
/// individual elements, including for views that you pass in as symbols.
/// However, it might provide better performance for a complex drawing that
/// involves dynamic data. Use a canvas to improve performance for a drawing
/// that doesn't primarily involve text or require interactive elements.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct Canvas<Symbols> where Symbols : View {

    /// A view that provides child views that you can use in the drawing
    /// callback.
    ///
    /// Uniquely tag each child view using the ``View/tag(_:)`` modifier,
    /// so that you can find them from within your renderer using the
    /// ``GraphicsContext/resolveSymbol(id:)`` method.
    public var symbols: Symbols

    /// The drawing callback that you use to draw into the canvas.
    ///
    /// - Parameters:
    ///   - context: The graphics context to draw into.
    ///   - size: The current size of the view.
    public var renderer: (inout GraphicsContext, CGSize) -> Void

    /// A Boolean that indicates whether the canvas is fully opaque.
    ///
    /// You might be able to improve performance by setting this value to
    /// `true`, making the canvas is fully opaque. However, in that case,
    /// the result of drawing a non-opaque image into the canvas is undefined.
    public var isOpaque: Bool

    /// The working color space and storage format of the canvas.
    public var colorMode: ColorRenderingMode

    /// A Boolean that indicates whether the canvas can present its contents
    /// to its parent view asynchronously.
    public var rendersAsynchronously: Bool

    /// Creates and configures a canvas that you supply with renderable
    /// child views.
    ///
    /// This initializer behaves like the
    /// ``init(opaque:colorMode:rendersAsynchronously:renderer:)`` initializer,
    /// except that you also provide a collection of SwiftUI views for the
    /// renderer to use as drawing elements.
    ///
    /// SwiftUI stores a rendered version of each child view that you specify
    /// in the `symbols` view builder and makes these available to the canvas.
    /// Tag each child view so that you can retrieve it from within the
    /// renderer using the ``GraphicsContext/resolveSymbol(id:)`` method.
    /// For example, you can create a scatter plot using a passed-in child view
    /// as the mark for each data point:
    ///
    ///     struct ScatterPlotView<Mark: View>: View {
    ///         let rects: [CGRect]
    ///         let mark: Mark
    ///
    ///         enum SymbolID: Int {
    ///             case mark
    ///         }
    ///
    ///         var body: some View {
    ///             Canvas { context, size in
    ///                 if let mark = context.resolveSymbol(id: SymbolID.mark) {
    ///                     for rect in rects {
    ///                         context.draw(mark, in: rect)
    ///                     }
    ///                 }
    ///             } symbols: {
    ///                 mark.tag(SymbolID.mark)
    ///             }
    ///             .frame(width: 300, height: 200)
    ///             .border(Color.blue)
    ///         }
    ///     }
    ///
    /// You can use any SwiftUI view for the `mark` input:
    ///
    ///     ScatterPlotView(rects: rects, mark: Image(systemName: "circle"))
    ///
    /// If the `rects` input contains 50 randomly arranged
    /// <doc://com.apple.documentation/documentation/CoreGraphics/CGRect>
    /// instances, SwiftUI draws a plot like this:
    ///
    /// ![A screenshot of a scatter plot inside a blue rectangle, containing
    /// about fifty small circles scattered randomly throughout.](Canvas-init-1)
    ///
    /// The symbol inputs, like all other elements that you draw to the
    /// canvas, lack individual accessibility and interactivity, even if the
    /// original SwiftUI view has these attributes. However, you can add
    /// accessibility and interactivity modifers to the canvas as a whole.
    ///
    /// - Parameters:
    ///   - opaque: A Boolean that indicates whether the canvas is fully
    ///     opaque. You might be able to improve performance by setting this
    ///     value to `true`, but then drawing a non-opaque image into the
    ///     context produces undefined results. The default is `false`.
    ///   - colorMode: A working color space and storage format of the canvas.
    ///     The default is ``ColorRenderingMode/nonLinear``.
    ///   - rendersAsynchronously: A Boolean that indicates whether the canvas
    ///     can present its contents to its parent view asynchronously. The
    ///     default is `false`.
    ///   - renderer: A closure in which you conduct immediate mode drawing.
    ///     The closure takes two inputs: a context that you use to issue
    ///     drawing commands and a size --- representing the current
    ///     size of the canvas --- that you can use to customize the content.
    ///     The canvas calls the renderer any time it needs to redraw the
    ///     content.
    ///   - symbols: A ``ViewBuilder`` that you use to supply SwiftUI views to
    ///     the canvas for use during drawing. Uniquely tag each view
    ///     using the ``View/tag(_:)`` modifier, so that you can find them from
    ///     within your renderer using the ``GraphicsContext/resolveSymbol(id:)``
    ///     method.
    public init(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, rendersAsynchronously: Bool = false, renderer: @escaping (inout GraphicsContext, CGSize) -> Void, @ViewBuilder symbols: () -> Symbols) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Canvas where Symbols == EmptyView {

    /// Creates and configures a canvas.
    ///
    /// Use this initializer to create a new canvas that you can draw into.
    /// For example, you can draw a path:
    ///
    ///     Canvas { context, size in
    ///         context.stroke(
    ///             Path(ellipseIn: CGRect(origin: .zero, size: size)),
    ///             with: .color(.green),
    ///             lineWidth: 4)
    ///     }
    ///     .frame(width: 300, height: 200)
    ///     .border(Color.blue)
    ///
    /// The example above draws the outline of an ellipse that exactly inscribes
    /// a canvas with a blue border:
    ///
    /// ![A screenshot of a canvas view that shows the green outline of an
    /// ellipse inside a blue rectangle.](Canvas-1)
    ///
    /// For information about using a context to draw into a canvas, see
    /// ``GraphicsContext``. If you want to provide SwiftUI views for the
    /// renderer to use as drawing elements, use
    /// ``init(opaque:colorMode:rendersAsynchronously:renderer:symbols:)``
    /// instead.
    ///
    /// - Parameters:
    ///   - opaque: A Boolean that indicates whether the canvas is fully
    ///     opaque. You might be able to improve performance by setting this
    ///     value to `true`, but then drawing a non-opaque image into the
    ///     context produces undefined results. The default is `false`.
    ///   - colorMode: A working color space and storage format of the canvas.
    ///     The default is ``ColorRenderingMode/nonLinear``.
    ///   - rendersAsynchronously: A Boolean that indicates whether the canvas
    ///     can present its contents to its parent view asynchronously. The
    ///     default is `false`.
    ///   - renderer: A closure in which you conduct immediate mode drawing.
    ///     The closure takes two inputs: a context that you use to issue
    ///     drawing commands and a size --- representing the current
    ///     size of the canvas --- that you can use to customize the content.
    ///     The canvas calls the renderer any time it needs to redraw the
    ///     content.
    public init(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, rendersAsynchronously: Bool = false, renderer: @escaping (inout GraphicsContext, CGSize) -> Void) { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Canvas : View { }

