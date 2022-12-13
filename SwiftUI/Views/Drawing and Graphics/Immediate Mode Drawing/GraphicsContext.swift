/// An immediate mode drawing destination, and its current state.
///
/// Use a context to execute 2D drawing primitives. For example, you can draw
/// filled shapes using the ``fill(_:with:style:)`` method inside a ``Canvas``
/// view:
///
///     Canvas { context, size in
///         context.fill(
///             Path(ellipseIn: CGRect(origin: .zero, size: size)),
///             with: .color(.green))
///     }
///     .frame(width: 300, height: 200)
///
/// The example above draws an ellipse that just fits inside a canvas that's
/// constrained to 300 points wide and 200 points tall:
///
/// ![A screenshot of a view that shows a green ellipse.](GraphicsContext-1)
///
/// In addition to outlining or filling paths, you can draw images, text,
/// and SwiftUI views. You can also use the context to perform many common
/// graphical operations, like adding masks, applying filters and
/// transforms, and setting a blend mode. For example you can add
/// a mask using the ``clip(to:style:options:)`` method:
///
///     let halfSize = size.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))
///     context.clip(to: Path(CGRect(origin: .zero, size: halfSize)))
///     context.fill(
///         Path(ellipseIn: CGRect(origin: .zero, size: size)),
///         with: .color(.green))
///
/// The rectangular mask hides all but one quadrant of the ellipse:
///
/// ![A screenshot of a view that shows the upper left quarter of a green
/// ellipse.](GraphicsContext-2)
///
/// The order of operations matters. Changes that you make to the state of
/// the context, like adding a mask or a filter, apply to later
/// drawing operations. If you reverse the fill and clip operations in
/// the example above, so that the fill comes first, the mask doesn't
/// affect the ellipse.
///
/// Each context references a particular layer in a tree of transparency layers,
/// and also contains a full copy of the drawing state. You can modify the
/// state of one context without affecting the state of any other, even if
/// they refer to the same layer. For example you can draw the masked ellipse
/// from the previous example into a copy of the main context, and then add a
/// rectangle into the main context:
///
///     // Create a copy of the context to draw a clipped ellipse.
///     var maskedContext = context
///     let halfSize = size.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))
///     maskedContext.clip(to: Path(CGRect(origin: .zero, size: halfSize)))
///     maskedContext.fill(
///         Path(ellipseIn: CGRect(origin: .zero, size: size)),
///         with: .color(.green))
///
///     // Go back to the original context to draw the rectangle.
///     let origin = CGPoint(x: size.width / 4, y: size.height / 4)
///     context.fill(
///         Path(CGRect(origin: origin, size: halfSize)),
///         with: .color(.blue))
///
/// The mask doesn't clip the rectangle because the mask isn't part of the
/// main context. However, both contexts draw into the same view because
/// you created one context as a copy of the other:
///
/// ![A screenshot of a view that shows the upper left quarter of a green
/// ellipse, overlaid by a blue rectangle centered in the
/// view.](GraphicsContext-3)
///
/// The context has access to an ``EnvironmentValues`` instance called
/// ``environment`` that's initially copied from the environment of its
/// enclosing view. SwiftUI uses environment values --- like the display
/// resolution and color scheme --- to resolve types like ``Image`` and
/// ``Color`` that appear in the context. You can also access values stored
/// in the environment for your own purposes.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct GraphicsContext {

    /// The ways that a graphics context combines new content with background
    /// content.
    ///
    /// Use one of these values to set the
    /// ``GraphicsContext/blendMode-swift.property`` property of a
    /// ``GraphicsContext``. The value that you set affects how content
    /// that you draw replaces or combines with content that you
    /// previously drew into the context.
    ///
    @frozen public struct BlendMode : RawRepresentable, Equatable {

        /// A mode that paints source image samples over the background image
        /// samples.
        ///
        /// This is the default blend mode.
        @inlinable public static var normal: GraphicsContext.BlendMode { get }

        /// A mode that multiplies the source image samples with the background
        /// image samples.
        ///
        /// Drawing in this mode results in colors that are at least as
        /// dark as either of the two contributing sample colors.
        @inlinable public static var multiply: GraphicsContext.BlendMode { get }

        /// A mode that multiplies the inverse of the source image samples with
        /// the inverse of the background image samples.
        ///
        /// Drawing in this mode results in colors that are at least as light
        /// as either of the two contributing sample colors.
        @inlinable public static var screen: GraphicsContext.BlendMode { get }

        /// A mode that either multiplies or screens the source image samples
        /// with the background image samples, depending on the background
        /// color.
        ///
        /// Drawing in this mode overlays the existing image samples
        /// while preserving the highlights and shadows of the
        /// background. The background color mixes with the source
        /// image to reflect the lightness or darkness of the
        /// background.
        @inlinable public static var overlay: GraphicsContext.BlendMode { get }

        /// A mode that creates composite image samples by choosing the darker
        /// samples from either the source image or the background.
        ///
        /// When you draw in this mode, source image samples that are darker
        /// than the background replace the background.
        /// Otherwise, the background image samples remain unchanged.
        @inlinable public static var darken: GraphicsContext.BlendMode { get }

        /// A mode that creates composite image samples by choosing the lighter
        /// samples from either the source image or the background.
        ///
        /// When you draw in this mode, source image samples that are lighter
        /// than the background replace the background.
        /// Otherwise, the background image samples remain unchanged.
        @inlinable public static var lighten: GraphicsContext.BlendMode { get }

        /// A mode that brightens the background image samples to reflect the
        /// source image samples.
        ///
        /// Source image sample values that
        /// specify black do not produce a change.
        @inlinable public static var colorDodge: GraphicsContext.BlendMode { get }

        /// A mode that darkens background image samples to reflect the source
        /// image samples.
        ///
        /// Source image sample values that specify
        /// white do not produce a change.
        @inlinable public static var colorBurn: GraphicsContext.BlendMode { get }

        /// A mode that either darkens or lightens colors, depending on the
        /// source image sample color.
        ///
        /// If the source image sample color is
        /// lighter than 50% gray, the background is lightened, similar
        /// to dodging. If the source image sample color is darker than
        /// 50% gray, the background is darkened, similar to burning.
        /// If the source image sample color is equal to 50% gray, the
        /// background is not changed. Image samples that are equal to
        /// pure black or pure white produce darker or lighter areas,
        /// but do not result in pure black or white. The overall
        /// effect is similar to what you'd achieve by shining a
        /// diffuse spotlight on the source image. Use this to add
        /// highlights to a scene.
        @inlinable public static var softLight: GraphicsContext.BlendMode { get }

        /// A mode that either multiplies or screens colors, depending on the
        /// source image sample color.
        ///
        /// If the source image sample color
        /// is lighter than 50% gray, the background is lightened,
        /// similar to screening. If the source image sample color is
        /// darker than 50% gray, the background is darkened, similar
        /// to multiplying. If the source image sample color is equal
        /// to 50% gray, the source image is not changed. Image samples
        /// that are equal to pure black or pure white result in pure
        /// black or white. The overall effect is similar to what you'd
        /// achieve by shining a harsh spotlight on the source image.
        /// Use this to add highlights to a scene.
        @inlinable public static var hardLight: GraphicsContext.BlendMode { get }

        /// A mode that subtracts the brighter of the source image sample color
        /// or the background image sample color from the other.
        ///
        /// Source image sample values that are black produce no change; white
        /// inverts the background color values.
        @inlinable public static var difference: GraphicsContext.BlendMode { get }

        /// A mode that produces an effect similar to that produced by the
        /// difference blend mode, but with lower contrast.
        ///
        /// Source image sample values that are black don't produce a change;
        /// white inverts the background color values.
        @inlinable public static var exclusion: GraphicsContext.BlendMode { get }

        /// A mode that uses the luminance and saturation values of the
        /// background with the hue of the source image.
        @inlinable public static var hue: GraphicsContext.BlendMode { get }

        /// A mode that uses the luminance and hue values of the background with
        /// the saturation of the source image.
        ///
        /// Areas of the background that have no saturation --- namely,
        /// pure gray areas --- don't produce a change.
        @inlinable public static var saturation: GraphicsContext.BlendMode { get }

        /// A mode that uses the luminance values of the background with the hue
        /// and saturation values of the source image.
        ///
        /// This mode preserves the gray levels in the image. You can use this
        /// mode to color monochrome images or to tint color images.
        @inlinable public static var color: GraphicsContext.BlendMode { get }

        /// A mode that uses the hue and saturation of the background with the
        /// luminance of the source image.
        ///
        /// This mode creates an effect that is inverse to the effect created
        /// by the ``color`` mode.
        @inlinable public static var luminosity: GraphicsContext.BlendMode { get }

        /// A mode that clears any pixels that the source image overwrites.
        ///
        /// With this mode, you can use the source image like an eraser.
        ///
        /// This mode implements the equation `R = 0` where
        /// `R` is the composite image.
        @inlinable public static var clear: GraphicsContext.BlendMode { get }

        /// A mode that replaces background image samples with source image
        /// samples.
        ///
        /// Unlike the ``normal`` mode, the source image completely replaces
        /// the background, so that even transparent pixels in the source image
        /// replace opaque pixels in the background, rather than letting the
        /// background show through.
        ///
        /// This mode implements the equation `R = S` where
        /// * `R` is the composite image.
        /// * `S` is the source image.
        @inlinable public static var copy: GraphicsContext.BlendMode { get }

        /// A mode that you use to paint the source image, including
        /// its transparency, onto the opaque parts of the background.
        ///
        /// This mode implements the equation `R = S*Da` where
        /// * `R` is the composite image.
        /// * `S` is the source image.
        /// * `Da` is the source background's alpha value.
        @inlinable public static var sourceIn: GraphicsContext.BlendMode { get }

        /// A mode that you use to paint the source image onto the
        /// transparent parts of the background, while erasing the background.
        ///
        /// This mode implements the equation `R = S*(1 - Da)` where
        /// * `R` is the composite image.
        /// * `S` is the source image.
        /// * `Da` is the source background's alpha value.
        @inlinable public static var sourceOut: GraphicsContext.BlendMode { get }

        /// A mode that you use to paint the opaque parts of the
        /// source image onto the opaque parts of the background.
        ///
        /// This mode implements the equation `R = S*Da + D*(1 - Sa)` where
        /// * `R` is the composite image.
        /// * `S` is the source image.
        /// * `D` is the background.
        /// * `Sa` is the source image's alpha value.
        /// * `Da` is the source background's alpha value.
        @inlinable public static var sourceAtop: GraphicsContext.BlendMode { get }

        /// A mode that you use to paint the source image under
        /// the background.
        ///
        /// This mode implements the equation `R = S*(1 - Da) + D` where
        /// * `R` is the composite image.
        /// * `S` is the source image.
        /// * `D` is the background.
        /// * `Da` is the source background's alpha value.
        @inlinable public static var destinationOver: GraphicsContext.BlendMode { get }

        /// A mode that you use to erase any of the background that
        /// isn't covered by opaque source pixels.
        ///
        /// This mode implements the equation `R = D*Sa` where
        /// * `R` is the composite image.
        /// * `S` is the source image.
        /// * `Da` is the source background's alpha value.
        @inlinable public static var destinationIn: GraphicsContext.BlendMode { get }

        /// A mode that you use to erase any of the background that
        /// is covered by opaque source pixels.
        ///
        /// This mode implements the equation `R = D*(1 - Sa)` where
        /// * `R` is the composite image.
        /// * `D` is the background.
        /// * `Sa` is the source image's alpha value.
        @inlinable public static var destinationOut: GraphicsContext.BlendMode { get }

        /// A mode that you use to paint the source image under
        /// the background, while erasing any of the background not matched
        /// by opaque pixels from the source image.
        ///
        /// This mode implements the equation `R = S*(1 - Da) + D*Sa` where
        /// * `R` is the composite image.
        /// * `S` is the source image.
        /// * `D` is the background.
        /// * `Sa` is the source image's alpha value.
        /// * `Da` is the source background's alpha value.
        @inlinable public static var destinationAtop: GraphicsContext.BlendMode { get }

        /// A mode that you use to clear pixels where both the source and
        /// background images are opaque.
        ///
        /// This mode implements the equation `R = S*(1 - Da) + D*(1 - Sa)` where
        /// * `R` is the composite image.
        /// * `S` is the source image.
        /// * `D` is the background.
        /// * `Sa` is the source image's alpha value.
        /// * `Da` is the source background's alpha value.
        ///
        /// This XOR mode is only nominally related to the classical bitmap
        /// XOR operation, which SwiftUI doesn't support.
        @inlinable public static var xor: GraphicsContext.BlendMode { get }

        /// A mode that adds the inverse of the color components of the source
        /// and background images, and then inverts the result, producing
        /// a darkened composite.
        ///
        /// This mode implements the equation `R = MAX(0, 1 - ((1 - D) + (1 - S)))` where
        /// * `R` is the composite image.
        /// * `S` is the source image.
        /// * `D` is the background.
        @inlinable public static var plusDarker: GraphicsContext.BlendMode { get }

        /// A mode that adds the components of the source and background images,
        /// resulting in a lightened composite.
        ///
        /// This mode implements the equation `R = MIN(1, S + D)` where
        /// * `R` is the composite image.
        /// * `S` is the source image.
        /// * `D` is the background.
        @inlinable public static var plusLighter: GraphicsContext.BlendMode { get }

    }

    /// The opacity of drawing operations in the context.
    ///
    /// Set this value to affect the opacity of content that you subsequently
    /// draw into the context. Changing this value has no impact on the
    /// content you previously drew into the context.
    public var opacity: Double

    /// The blend mode used by drawing operations in the context.
    ///
    /// Set this value to affect how any content that you subsequently draw
    /// into the context blends with content that's already in the context.
    /// Use one of the ``GraphicsContext/BlendMode-swift.struct`` values.
    public var blendMode: GraphicsContext.BlendMode

    /// The environment associated with the graphics context.
    ///
    /// SwiftUI initially sets this to the environment of the context's
    /// enclosing view. The context uses values like display
    /// resolution and the color scheme from the environment to resolve types
    /// like ``Image`` and ``Color``. You can also access values stored in the
    /// environment for your own purposes.
    public var environment: EnvironmentValues { get }

    /// The current transform matrix, defining user space coordinates.
    ///
    /// Modify this matrix to transform content that you subsequently
    /// draw into the context. Changes that you make don't affect
    /// existing content.
    public var transform: CGAffineTransform

    /// Scales subsequent drawing operations by an amount in each dimension.
    ///
    /// Calling this method is equivalent to updating the context's
    /// ``transform`` directly using the given scale factors:
    ///
    ///     transform = transform.scaledBy(x: x, y: y)
    ///
    /// - Parameters:
    ///   - x: The amount to scale in the horizontal direction.
    ///   - y: The amount to scale in the vertical direction.
    public mutating func scaleBy(x: CGFloat, y: CGFloat) { }

    /// Moves subsequent drawing operations by an amount in each dimension.
    ///
    /// Calling this method is equivalent to updating the context's
    /// ``transform`` directly using the given translation amount:
    ///
    ///     transform = transform.translatedBy(x: x, y: y)
    ///
    /// - Parameters:
    ///   - x: The amount to move in the horizontal direction.
    ///   - y: The amount to move in the vertical direction.
    public mutating func translateBy(x: CGFloat, y: CGFloat) { }

    /// Rotates subsequent drawing operations by an angle.
    ///
    /// Calling this method is equivalent to updating the context's
    /// ``transform`` directly using the `angle` parameter:
    ///
    ///     transform = transform.rotated(by: angle.radians)
    ///
    /// - Parameters:
    ///   - angle: The amount to rotate.
    public mutating func rotate(by angle: Angle) { }

    /// Appends the given transform to the context's existing transform.
    ///
    /// Calling this method is equivalent to updating the context's
    /// ``transform`` directly using the `matrix` parameter:
    ///
    ///     transform = matrix.concatenating(transform)
    ///
    /// - Parameter matrix: A transform to append to the existing transform.
    public mutating func concatenate(_ matrix: CGAffineTransform) { }

    /// Options that affect the use of clip shapes.
    ///
    /// Use these options to affect how SwiftUI interprets a clip shape
    /// when you call ``clip(to:style:options:)`` to add a path to the array of
    /// clip shapes, or when you call ``clipToLayer(opacity:options:content:)``
    /// to add a clipping layer.
    @frozen public struct ClipOptions : OptionSet {

        /// An option to invert the shape or layer alpha as the clip mask.
        ///
        /// When you use this option, SwiftUI uses `1 - alpha` instead of
        /// `alpha` for the given clip shape.
        @inlinable public static var inverse: GraphicsContext.ClipOptions { get }

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = GraphicsContext.ClipOptions

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = GraphicsContext.ClipOptions
    }

    /// The bounding rectangle of the intersection of all current clip
    /// shapes in the current user space.
    public var clipBoundingRect: CGRect { get }

    /// Adds a path to the context's array of clip shapes.
    ///
    /// Call this method to add a shape to the array of clip shapes that
    /// the context uses to define a clipping mask. Shapes that you add
    /// affect only subsequent drawing operations.
    ///
    /// - Parameters:
    ///   - path: A ``Path`` that defines the shape of the clipping mask.
    ///   - style: A ``FillStyle`` that defines how to rasterize the shape.
    ///   - options: Clip options that tell SwiftUI how to interpret the `path`
    ///     as a clip shape. For example, you can invert the clip
    ///     shape by setting the ``ClipOptions/inverse`` option.
    public mutating func clip(to path: Path, style: FillStyle = FillStyle(), options: GraphicsContext.ClipOptions = ClipOptions()) { }

    /// Adds a clip shape that you define in a new layer to the context's array
    /// of clip shapes.
    ///
    /// Call this method to add a shape to the array of clip shapes that
    /// the context uses to define a clipping mask. Shapes that you add
    /// affect only subsequent drawing operations.
    ///
    /// - Parameters:
    ///   - opacity: A value that SwiftUI uses to multiply the alpha channel of
    ///     the rasterized layer that you define in the `content` closure. The
    ///     alpha values that result define the clip shape.
    ///   - options: A set of options that tell SwiftUI how to interpret the
    ///     clip shape. For example, you can invert the clip
    ///     shape by setting the ``ClipOptions/inverse`` option.
    ///   - content: A closure that receives as input a new ``GraphicsContext``,
    ///     which represents a new transparency layer. The alpha channel of
    ///     content that you draw into this context, multiplied by the `opacity`
    ///     parameter, defines the clip shape.
    public mutating func clipToLayer(opacity: Double = 1, options: GraphicsContext.ClipOptions = ClipOptions(), content: (inout GraphicsContext) throws -> Void) rethrows { }

    /// A type that applies image processing operations to rendered content.
    ///
    /// Create and configure a filter that produces an image processing effect,
    /// like adding a drop shadow or a blur effect, by calling one of the
    /// factory methods defined by the `Filter` structure. Call the
    /// ``addFilter(_:options:)`` method to add the filter to a
    /// ``GraphicsContext``. The filter only affects content that you draw
    /// into the context after adding the filter.
    public struct Filter {

        /// Returns a filter that that transforms the rasterized form
        /// of subsequent graphics primitives.
        ///
        /// - Parameters:
        ///   - matrix: A projection transform to apply to the rasterized
        ///     form of graphics primitives.
        /// - Returns: A filter that applies a transform.
        public static func projectionTransform(_ matrix: ProjectionTransform) -> GraphicsContext.Filter { }

        /// Returns a filter that adds a shadow.
        ///
        /// SwiftUI produces the shadow by blurring the alpha channel of the
        /// object receiving the shadow, multiplying the result by a color,
        /// optionally translating the shadow by an amount,
        /// and then blending the resulting shadow into a new layer below the
        /// source primitive. You can customize some of these steps by adding
        /// one or more shadow options.
        ///
        /// - Parameters:
        ///   - color: A ``Color`` that tints the shadow.
        ///   - radius: A measure of how far the shadow extends from the edges
        ///     of the content receiving the shadow.
        ///   - x: An amount to translate the shadow horizontally.
        ///   - y: An amount to translate the shadow vertically.
        ///   - blendMode: The ``GraphicsContext/BlendMode-swift.struct`` to use
        ///     when blending the shadow into the background layer.
        ///   - options: A set of options that you can use to customize the
        ///     process of adding the shadow. Use one or more of the options
        ///     in ``GraphicsContext/ShadowOptions``.
        /// - Returns: A filter that adds a shadow style.
        public static func shadow(color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33), radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0, blendMode: GraphicsContext.BlendMode = .normal, options: GraphicsContext.ShadowOptions = ShadowOptions()) -> GraphicsContext.Filter { }

        /// Returns a filter that multiplies each color component by
        /// the matching component of a given color.
        ///
        /// - Parameters:
        ///   - color: The color that the filter uses for the multiplication
        ///     operation.
        /// - Returns: A filter that multiplies color components.
        public static func colorMultiply(_ color: Color) -> GraphicsContext.Filter { }

        /// Returns a filter that multiplies by a given color matrix.
        ///
        /// This filter is equivalent to the `feColorMatrix` filter primitive
        /// defined by the Scalable Vector Graphics (SVG) specification.
        ///
        /// The filter creates the output color `[R', G', B', A']` at each pixel
        /// from an input color `[R, G, B, A]` by multiplying the input color by
        /// the square matrix formed by the first four columns of the
        /// ``ColorMatrix``, then adding the fifth column to the result:
        ///
        ///     R' = r1 ✕ R + r2 ✕ G + r3 ✕ B + r4 ✕ A + r5
        ///     G' = g1 ✕ R + g2 ✕ G + g3 ✕ B + g4 ✕ A + g5
        ///     B' = b1 ✕ R + b2 ✕ G + b3 ✕ B + b4 ✕ A + b5
        ///     A' = a1 ✕ R + a2 ✕ G + a3 ✕ B + a4 ✕ A + a5
        ///
        /// - Parameters:
        ///   - matrix: A ``ColorMatrix`` instance used by the filter.
        /// - Returns: A filter that transforms color using the given matrix.
        public static func colorMatrix(_ matrix: ColorMatrix) -> GraphicsContext.Filter { }

        /// Returns a filter that applies a hue rotation adjustment.
        ///
        /// This filter is equivalent to the `hue-rotate` filter primitive
        /// defined by the Scalable Vector Graphics (SVG) specification.
        ///
        /// - Parameters:
        ///   - angle: The amount by which to rotate the hue value of each
        ///     pixel.
        /// - Returns: A filter that applies a hue rotation adjustment.
        public static func hueRotation(_ angle: Angle) -> GraphicsContext.Filter { }

        /// Returns a filter that applies a saturation adjustment.
        ///
        /// This filter is equivalent to the `saturate` filter primitive
        /// defined by the Scalable Vector Graphics (SVG) specification.
        ///
        /// - Parameters:
        ///   - amount: The amount of the saturation adjustment. A value
        ///     of zero to completely desaturates each pixel, while a value of
        ///     one makes no change. You can use values greater than one.
        /// - Returns: A filter that applies a saturation adjustment.
        public static func saturation(_ amount: Double) -> GraphicsContext.Filter { }

        /// Returns a filter that applies a brightness adjustment.
        ///
        /// This filter is different than `brightness` filter primitive
        /// defined by the Scalable Vector Graphics (SVG) specification.
        /// You can obtain an effect like that filter using a ``grayscale(_:)``
        /// color multiply. However, this filter does match the
        /// <doc://com.apple.documentation/documentation/CoreImage/CIColorControls>
        /// filter's brightness adjustment.
        ///
        /// - Parameters:
        ///   - amount: An amount to add to the pixel's color components.
        /// - Returns: A filter that applies a brightness adjustment.
        public static func brightness(_ amount: Double) -> GraphicsContext.Filter { }

        /// Returns a filter that applies a contrast adjustment.
        ///
        /// This filter is equivalent to the `contrast` filter primitive
        /// defined by the Scalable Vector Graphics (SVG) specification.
        ///
        /// - Parameters:
        ///   - amount: An amount to adjust the contrast. A value of
        ///     zero leaves the result completely gray. A value of one leaves
        ///     the result unchanged. You can use values greater than one.
        /// - Returns: A filter that applies a contrast adjustment.
        public static func contrast(_ amount: Double) -> GraphicsContext.Filter { }

        /// Returns a filter that inverts the color of their results.
        ///
        /// This filter is equivalent to the `invert` filter primitive
        /// defined by the Scalable Vector Graphics (SVG) specification.
        ///
        /// - Parameters:
        ///   - amount: The inversion amount. A value of one results in total
        ///     inversion, while a value of zero leaves the result unchanged.
        ///     Other values apply a linear multiplier effect.
        /// - Returns: A filter that applies a color inversion.
        public static func colorInvert(_ amount: Double = 1) -> GraphicsContext.Filter { }

        /// Returns a filter that applies a grayscale adjustment.
        ///
        /// This filter is equivalent to the `grayscale` filter primitive
        /// defined by the Scalable Vector Graphics (SVG) specification.
        ///
        /// - Parameters:
        ///   - amount: An amount that controls the effect. A value of one
        ///     makes the image completely gray. A value of zero leaves the
        ///     result unchanged. Other values apply a linear multiplier effect.
        /// - Returns: A filter that applies a grayscale adjustment.
        public static func grayscale(_ amount: Double) -> GraphicsContext.Filter { }

        /// Returns a filter that sets the opacity of each pixel based on its
        /// luminance.
        ///
        /// The filter computes the luminance of each pixel
        /// and uses it to define the opacity of the result, combined
        /// with black (zero) color components.
        ///
        /// - Returns: A filter that applies a luminance to alpha transformation.
        public static var luminanceToAlpha: GraphicsContext.Filter { get }

        /// Returns a filter that applies a Gaussian blur.
        ///
        /// - Parameters:
        ///   - radius: The standard deviation of the Gaussian blur.
        ///   - options: A set of options controlling the application of the
        ///     effect.
        /// - Returns: A filter that applies Gaussian blur.
        public static func blur(radius: CGFloat, options: GraphicsContext.BlurOptions = BlurOptions()) -> GraphicsContext.Filter { }

        /// Returns a filter that replaces each pixel with alpha components
        /// within a range by a constant color, or transparency otherwise.
        ///
        /// - Parameters:
        ///   - min: The minimum alpha threshold. Pixels whose alpha
        ///     component is less than this value will render as
        ///     transparent. Results are undefined unless `min < max`.
        ///   - max: The maximum alpha threshold. Pixels whose alpha
        ///     component is greater than this value will render
        ///     as transparent. Results are undefined unless `min < max`.
        ///   - color: The color that is output for pixels with an alpha
        ///     component between the two threshold values.
        /// - Returns: A filter that applies a threshold to alpha values.
        public static func alphaThreshold(min: Double, max: Double = 1, color: Color = Color.black) -> GraphicsContext.Filter { }
    }

    /// Options that configure the graphics context filter that creates shadows.
    ///
    /// You can use a set of these options when you call
    /// ``Filter/shadow(color:radius:x:y:blendMode:options:)`` to create a
    /// ``Filter`` that adds a drop shadow to an object that you draw into a
    /// ``GraphicsContext``.
    @frozen public struct ShadowOptions : OptionSet {

        /// An option that causes the filter to draw the shadow above the
        /// object, rather than below it.
        @inlinable public static var shadowAbove: GraphicsContext.ShadowOptions { get }

        /// An option that causes the filter to draw only the shadow, and
        /// omit the source object.
        @inlinable public static var shadowOnly: GraphicsContext.ShadowOptions { get }

        /// An option that causes the filter to invert the alpha of the shadow.
        ///
        /// You can create an "inner shadow" effect by combining this option
        /// with ``shadowAbove`` and using the
        /// ``GraphicsContext/BlendMode-swift.struct/sourceAtop`` blend mode.
        @inlinable public static var invertsAlpha: GraphicsContext.ShadowOptions { get }

        /// An option that causes the filter to composite the object and its
        /// shadow separately in the current layer.
        @inlinable public static var disablesGroup: GraphicsContext.ShadowOptions { get }

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = GraphicsContext.ShadowOptions

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = GraphicsContext.ShadowOptions

    }

    /// Options that configure the graphics context filter that creates blur.
    ///
    /// You can use a set of these options when you call
    /// ``Filter/blur(radius:options:)`` to create a ``Filter`` that adds
    /// blur to an object that you draw into a ``GraphicsContext``.
    @frozen public struct BlurOptions : OptionSet {

        /// An option that causes the filter to ensure the result is completely
        /// opaque.
        ///
        /// The filter ensure opacity by dividing each pixel by its alpha
        /// value. The result may be undefined if the input to the filter
        /// isn't also completely opaque.
        @inlinable public static var opaque: GraphicsContext.BlurOptions { get }

        /// An option that causes the filter to dither the result, to reduce
        /// banding.
        @inlinable public static var dithersResult: GraphicsContext.BlurOptions { get }

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = GraphicsContext.BlurOptions

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = GraphicsContext.BlurOptions
    }

    /// Options that configure a filter that you add to a graphics context.
    ///
    /// You can use filter options to configure a ``Filter`` that you apply
    /// to a ``GraphicsContext`` with the ``addFilter(_:options:)`` method.
    @frozen public struct FilterOptions : OptionSet {

        /// An option that causes the filter to perform calculations in a
        /// linear color space.
        @inlinable public static var linearColor: GraphicsContext.FilterOptions { get }

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = GraphicsContext.FilterOptions

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = GraphicsContext.FilterOptions

    }

    /// Adds a filter that applies to subsequent drawing operations.
    ///
    /// To draw with filtering, SwiftUI:
    ///
    /// - Rasterizes the drawing operation to an implicit transparency layer
    ///   without blending, adjusting opacity, or applying any clipping.
    /// - Applies the filter to the layer containing the rasterized image.
    /// - Composites the layer onto the background, using the context's
    ///   current blend mode, opacity setting, and clip shapes.
    ///
    /// When SwiftUI draws with a filter, the blend mode might apply to regions
    /// outside the drawing operation's intrinsic shape, but inside its clip
    /// shape. That might result in unexpected behavior for certain blend
    /// modes like ``GraphicsContext/BlendMode-swift.struct/copy``, where
    /// the drawing operation completely overwrites the background even if
    /// the source alpha is zero.
    ///
    /// - Parameters:
    ///   - filter: A graphics context filter that you create by calling one
    ///     of the ``Filter`` factory methods.
    ///   - options: A set of options from ``FilterOptions`` that you can use to
    ///     configure filter operations.
    public mutating func addFilter(_ filter: GraphicsContext.Filter, options: GraphicsContext.FilterOptions = FilterOptions()) { }

    /// A color or pattern that you can use to outline or fill a path.
    ///
    /// Use a shading instance to describe the color or pattern of a path that
    /// you outline with a method like ``stroke(_:with:style:)``, or of the
    /// interior of a region that you fill with the ``fill(_:with:style:)``
    /// method. Get a shading instance by calling one of the `Shading`
    /// structure's factory methods. You can base shading on:
    /// - A ``Color``.
    /// - A ``Gradient``.
    /// - Any type that conforms to ``ShapeStyle``.
    /// - An ``Image``.
    /// - What you've already drawn into the context.
    /// - A collection of other shading instances.
    public struct Shading {

        /// A shading instance that draws a copy of the current background.
        public static var backdrop: GraphicsContext.Shading { get }

        /// A shading instance that fills with the foreground style from
        /// the graphics context's environment.
        public static var foreground: GraphicsContext.Shading { get }

        /// Returns a multilevel shading instance constructed from an
        /// array of shading instances.
        ///
        /// - Parameter array: An array of shading instances. The array must
        ///   contain at least one element.
        /// - Returns: A shading instance composed from the given instances.
        public static func palette(_ array: [GraphicsContext.Shading]) -> GraphicsContext.Shading { }

        /// Returns a shading instance that fills with a color.
        ///
        /// - Parameter color: A ``Color`` instance that defines the color
        ///   of the shading.
        /// - Returns: A shading instance filled with a color.
        public static func color(_ color: Color) -> GraphicsContext.Shading { }

        /// Returns a shading instance that fills with a color in the given
        /// color space.
        ///
        /// - Parameters:
        ///   - colorSpace: The RGB color space used to define the color. The
        ///     default is ``Color/RGBColorSpace/sRGB``.
        ///   - red: The red component of the color.
        ///   - green: The green component of the color.
        ///   - blue: The blue component of the color.
        ///   - opacity: The opacity of the color. The default is `1`, which
        ///     means fully opaque.
        /// - Returns: A shading instance filled with a color.
        public static func color(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1) -> GraphicsContext.Shading { }

        /// Returns a shading instance that fills with a monochrome color in
        /// the given color space.
        ///
        /// - Parameters:
        ///   - colorSpace: The RGB color space used to define the color. The
        ///     default is ``Color/RGBColorSpace/sRGB``.
        ///   - white: The value to use for each of the red, green, and blue
        ///     components of the color.
        ///   - opacity: The opacity of the color. The default is `1`, which
        ///     means fully opaque.
        /// - Returns: A shading instance filled with a color.
        public static func color(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1) -> GraphicsContext.Shading { }

        /// Returns a shading instance that fills with the given shape style.
        ///
        /// Styles with geometry defined in a unit coordinate space
        /// map that space to the rectangle associated with the drawn
        /// object. You can adjust that using the ``ShapeStyle/in(_:)``
        /// method. The shape style might affect the blend mode and opacity
        /// of the drawn object.
        ///
        /// - Parameter style: A ``ShapeStyle`` instance to draw with.
        /// - Returns: A shading instance filled with a shape style.
        public static func style<S>(_ style: S) -> GraphicsContext.Shading where S : ShapeStyle { }

        /// Returns a shading instance that fills a linear (axial) gradient.
        ///
        /// The shading instance defines an axis from `startPoint` to `endPoint`
        /// in the current user space and maps colors from `gradient`
        /// to lines perpendicular to the axis.
        ///
        /// - Parameters:
        ///   - gradient: A ``Gradient`` instance that defines the colors
        ///     of the gradient.
        ///   - startPoint: The start point of the gradient axis.
        ///   - endPoint: The end point of the gradient axis.
        ///   - options: Options that you use to configure the gradient.
        /// - Returns: A shading instance filled with a linear gradient.
        public static func linearGradient(_ gradient: Gradient, startPoint: CGPoint, endPoint: CGPoint, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading { }

        /// Returns a shading instance that fills a radial gradient.
        ///
        /// - Parameters:
        ///   - gradient: A ``Gradient`` instance that defines the colors
        ///     of the gradient.
        ///   - center: The point in the current user space on which SwiftUI
        ///     centers the gradient.
        ///   - startRadius: The distance from the center where the gradient
        ///     starts.
        ///   - endRadius:The distance from the center where the gradient ends.
        ///   - options: Options that you use to configure the gradient.
        /// - Returns: A shading instance filled with a radial gradient.
        public static func radialGradient(_ gradient: Gradient, center: CGPoint, startRadius: CGFloat, endRadius: CGFloat, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading { }

        /// Returns a shading instance that fills a conic (angular) gradient.
        ///
        /// - Parameters:
        ///   - gradient: A ``Gradient`` instance that defines the colors
        ///     of the gradient.
        ///   - center: The point in the current user space on which SwiftUI
        ///     centers the gradient.
        ///   - angle: The angle about the center that SwiftUI uses to start and
        ///     finish the gradient. The gradient sweeps all the way around the
        ///     center.
        ///   - options: Options that you use to configure the gradient.
        /// - Returns: A shading instance filled with a conic gradient.
        public static func conicGradient(_ gradient: Gradient, center: CGPoint, angle: Angle = Angle(), options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading { }

        /// Returns a shading instance that tiles an image across the infinite
        /// plane.
        ///
        /// - Parameters:
        ///   - image: An ``Image`` to use as fill.
        ///   - origin: The point in the current user space where SwiftUI
        ///     places the bottom left corner of the part of the image
        ///     defined by `sourceRect`. The image repeats as needed.
        ///   - sourceRect: A unit space subregion of the image. The default
        ///     is a unit rectangle, which selects the whole image.
        ///   - scale: A factor that you can use to control the image size.
        /// - Returns: A shading instance filled with a tiled image.
        public static func tiledImage(_ image: Image, origin: CGPoint = .zero, sourceRect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1), scale: CGFloat = 1) -> GraphicsContext.Shading { }
    }

    /// Options that affect the rendering of color gradients.
    ///
    /// Use these options to affect how SwiftUI manages a gradient that you
    /// create for a ``Shading`` instance for use in a ``GraphicsContext``.
    @frozen public struct GradientOptions : OptionSet {

        /// An option that repeats the gradient outside its nominal range.
        ///
        /// Use this option to cause the gradient to repeat its pattern in
        /// areas that exceed the bounds of its start and end points.
        /// The repetitions use the same start and end value for each
        /// repetition.
        ///
        /// Without this option or ``mirror``, the gradient stops at
        /// the end of its range. The ``mirror`` option takes precendence if
        /// you set both this one and that one.
        @inlinable public static var `repeat`: GraphicsContext.GradientOptions { get }

        /// An option that repeats the gradient outside its nominal range,
        /// reflecting every other instance.
        ///
        /// Use this option to cause the gradient to repeat its pattern in
        /// areas that exceed the bounds of its start and end points.
        /// The repetitions alternately reverse the start and end points,
        /// producing a pattern like `0 -> 1`, `1 -> 0`, `0 -> 1`, and so on.
        ///
        /// Without either this option or ``repeat``, the gradient stops at
        /// the end of its range. This option takes precendence if
        /// you set both this one and ``repeat``.
        @inlinable public static var mirror: GraphicsContext.GradientOptions { get }

        /// An option that interpolates between colors in a linear color space.
        @inlinable public static var linearColor: GraphicsContext.GradientOptions { get }

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = GraphicsContext.GradientOptions

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = GraphicsContext.GradientOptions

    }

    /// Returns a version of a shading resolved with the current values
    /// of the graphics context's environment.
    ///
    /// Calling this function once and then drawing multiple times with
    /// the result will often have less overhead than drawing with the
    /// original shading multiple times.
    public func resolve(_ shading: GraphicsContext.Shading) -> GraphicsContext.Shading { }

    /// Draws a new layer, created by drawing code that you provide, into the
    /// context.
    ///
    /// - Parameter context: A closure that receives a new ``GraphicsContext``
    ///   as input. This context represents a new transparency layer that you
    ///   can draw into. When the closure returns, SwiftUI draws the new layer
    ///   into the current context.
    public func drawLayer(content: (inout GraphicsContext) throws -> Void) rethrows { }

    /// Draws a path into the context and fills the outlined region.
    ///
    /// The current drawing state of the context defines the
    /// full drawing operation. For example, the current transformation and
    /// clip shapes, and any styles applied to the result, affect the final
    /// result.
    ///
    /// - Parameters:
    ///   - path: The outline of the region to fill.
    ///   - shading: The color or pattern to use when filling the region
    ///     bounded by `path`.
    ///   - style: A style that indicates how to rasterize the path.
    public func fill(_ path: Path, with shading: GraphicsContext.Shading, style: FillStyle = FillStyle()) { }

    /// Draws a path into the context with a specified stroke style.
    ///
    /// If you only need to control the style's ``StrokeStyle/lineWidth``
    /// property, use ``stroke(_:with:lineWidth:)`` instead.
    ///
    /// - Parameters:
    ///   - path: The path to outline.
    ///   - shading: The color or pattern to use when outlining the `path`.
    ///   - style: A style that indicates how to outline the path.
    public func stroke(_ path: Path, with shading: GraphicsContext.Shading, style: StrokeStyle) { }

    /// Draws a path into the context with a specified line width.
    ///
    /// When you call this method, all ``StrokeStyle`` properties other than
    /// ``StrokeStyle/lineWidth`` take their default values. To control other
    /// style properties, use ``stroke(_:with:style:)`` instead.
    ///
    /// - Parameters:
    ///   - path: The path to outline.
    ///   - shading: The color or pattern to use when outlining the `path`.
    ///   - lineWidth: The width of the stroke, which defaults to `1`.
    public func stroke(_ path: Path, with shading: GraphicsContext.Shading, lineWidth: CGFloat = 1) { }

    /// An image resolved to a particular environment.
    ///
    /// You resolve an ``Image`` in preparation for drawing it into a context,
    /// either manually by calling ``resolve(_:)-898z6``, or automatically
    /// when calling ``draw(_:in:style:)-blhz`` or ``draw(_:at:anchor:)-1z5wt``.
    /// The resolved image takes into account environment values like the
    /// display resolution and current color scheme.
    public struct ResolvedImage {

        /// The size of the image.
        public var size: CGSize { get }

        /// The distance from the top of the image to its baseline.
        ///
        /// If the image has no baseline, this value is equivalent to the
        /// image's height.
        public let baseline: CGFloat

        /// An optional shading to fill the image with.
        ///
        /// The value of this property defaults to
        /// ``GraphicsContext/Shading/foreground`` for template images, and
        /// to `nil` otherwise.
        public var shading: GraphicsContext.Shading?
    }

    /// Gets a version of an image that's fixed with the current values of
    /// the graphics context's environment.
    ///
    /// You can measure the resolved image by looking at its
    /// ``ResolvedImage/size`` and ``ResolvedImage/baseline`` properties.
    /// You can draw the resolved image with the context's
    /// ``draw(_:in:style:)-7rvee`` or ``draw(_:at:anchor:)-1z5wt`` method.
    ///
    /// - Parameter image: The ``Image`` to resolve.
    /// - Returns: An image that's resolved into the current context's
    ///   environment, taking into account environment values like the
    ///   display resolution and current color scheme.
    public func resolve(_ image: Image) -> GraphicsContext.ResolvedImage { }

    /// Draws a resolved image into the context, using the specified rectangle
    /// as a layout frame.
    ///
    /// The current context state defines the full drawing operation. For
    /// example, the current transformation and clip shapes affect how SwiftUI
    /// draws the image.
    ///
    /// - Parameters:
    ///   - image: The ``ResolvedImage`` to draw. Get a resolved image from an
    ///     ``Image`` by calling ``resolve(_:)-898z6``. Alternatively, you can
    ///     call ``draw(_:in:style:)-blhz`` with an ``Image``, and that method
    ///     performs the resolution automatically.
    ///   - rect: The rectangle in the current user space to draw the image in.
    ///   - style: A fill style to use when rasterizing the image.
    public func draw(_ image: GraphicsContext.ResolvedImage, in rect: CGRect, style: FillStyle = FillStyle()) { }

    /// Draws a resolved image into the context, aligning an anchor within the
    /// image to a point in the context.
    ///
    /// The current context state defines the full drawing operation. For
    /// example, the current transformation and clip shapes affect how SwiftUI
    /// draws the image.
    ///
    /// - Parameters:
    ///   - image: The ``ResolvedImage`` to draw. Get a resolved image from an
    ///     ``Image`` by calling ``resolve(_:)-898z6``. Alternatively, you can
    ///     call ``draw(_:at:anchor:)-7l217`` with an ``Image``, and that method
    ///     performs the resolution automatically.
    ///   - point: A point within the rectangle of the resolved image to anchor
    ///     to a point in the context.
    ///   - anchor: A ``UnitPoint`` within the context to align the image with.
    ///     The default is ``UnitPoint/center``.
    public func draw(_ image: GraphicsContext.ResolvedImage, at point: CGPoint, anchor: UnitPoint = .center) { }

    /// Draws an image into the context, using the specified rectangle
    /// as a layout frame.
    ///
    /// The current context state defines the full drawing operation. For
    /// example, the current transformation and clip shapes affect how SwiftUI
    /// draws the image.
    ///
    /// - Parameters:
    ///   - image: The ``Image`` to draw. Before drawing, the method converts
    ///     the image to a ``ResolvedImage`` by calling ``resolve(_:)-898z6``.
    ///   - rect: The rectangle in the current user space to draw the image in.
    ///   - style: A fill style to use when rasterizing the image.
    public func draw(_ image: Image, in rect: CGRect, style: FillStyle = FillStyle()) { }

    /// Draws an image into the context, aligning an anchor within the image
    /// to a point in the context.
    ///
    /// The current context state defines the full drawing operation. For
    /// example, the current transformation and clip shapes affect how SwiftUI
    /// draws the image.
    ///
    /// - Parameters:
    ///   - image: The ``Image`` to draw. Before drawing, the method converts
    ///     the image to a ``ResolvedImage`` by calling ``resolve(_:)-898z6``.
    ///   - point: A point within the rectangle of the resolved image to anchor
    ///     to a point in the context.
    ///   - anchor: A ``UnitPoint`` within the context to align the image with.
    ///     The default is ``UnitPoint/center``.
    public func draw(_ image: Image, at point: CGPoint, anchor: UnitPoint = .center) { }

    /// A text view resolved to a particular environment.
    ///
    /// You resolve a ``Text`` view in preparation for drawing it into a context,
    /// either manually by calling ``resolve(_:)-4dx65`` or automatically
    /// when calling ``draw(_:in:)-5opqf`` or ``draw(_:at:anchor:)-5dgmd``.
    /// The resolved text view takes into account environment values like the
    /// display resolution and current color scheme.
    public struct ResolvedText {

        /// The shading to fill uncolored text regions with.
        ///
        /// This value defaults to the ``GraphicsContext/Shading/foreground``
        /// shading.
        public var shading: GraphicsContext.Shading

        /// Measures the size of the resolved text for a given
        /// area into which the text should be placed.
        ///
        /// - Parameter size: The area to place the ``Text`` view in.
        public func measure(in size: CGSize) -> CGSize { }

        /// Gets the distance from the first line's ascender to its baseline.
        public func firstBaseline(in size: CGSize) -> CGFloat { }

        /// Gets the distance from the first line's ascender to the last
        /// line's baseline.
        public func lastBaseline(in size: CGSize) -> CGFloat { }
    }

    /// Gets a version of a text view that's fixed with the current values of
    /// the graphics context's environment.
    ///
    /// You can measure the resolved text by calling its
    /// ``ResolvedText/measure(in:)`` method.
    /// You can draw the resolved text with the context's
    /// ``draw(_:in:)-69ad8`` or ``draw(_:at:anchor:)-6xr87`` method.
    ///
    /// - Parameter text: The ``Text`` view to resolve.
    /// - Returns: A text view that's resolved into the current context's
    ///   environment, taking into account environment values like the
    ///   display resolution and current color scheme.
    public func resolve(_ text: Text) -> GraphicsContext.ResolvedText { }

    /// Draws resolved text into the context using the specified rectangle
    /// as a layout frame.
    ///
    /// The current context state defines the full drawing operation. For
    /// example, the current transformation and clip shapes affect how SwiftUI
    /// draws the text.
    ///
    /// - Parameters:
    ///   - text: The ``ResolvedText`` to draw. Get resolved text from a
    ///     ``Text`` view by calling ``resolve(_:)-4dx65``. Alternatively, you
    ///     can call ``draw(_:in:)-5opqf`` with a ``Text`` view, and that
    ///     method performs the resolution automatically.
    ///   - rect: The rectangle in the current user space to draw the text in.
    ///   - shading: The shading to use when coloring the text.
    public func draw(_ text: GraphicsContext.ResolvedText, in rect: CGRect) { }

    /// Draws resolved text into the context, aligning an anchor within the
    /// ideal size of the text to a point in the context.
    ///
    /// The current context state defines the full drawing operation. For
    /// example, the current transformation and clip shapes affect how SwiftUI
    /// draws the text.
    ///
    /// - Parameters:
    ///   - text: The ``ResolvedText`` to draw. Get resolved text from a
    ///     ``Text`` view by calling ``resolve(_:)-4dx65``. Alternatively, you
    ///     can call ``draw(_:at:anchor:)-5dgmd`` with a ``Text`` view, and that
    ///     method performs the resolution automatically.
    ///   - point: A point within the rectangle of the ideal size of the
    ///     resolved text to anchor to a point in the context.
    ///   - anchor: A ``UnitPoint`` within the context to align the text with.
    ///     The default is ``UnitPoint/center``.
    public func draw(_ text: GraphicsContext.ResolvedText, at point: CGPoint, anchor: UnitPoint = .center) { }

    /// Draws text into the context using the specified rectangle
    /// as a layout frame.
    ///
    /// The current context state defines the full drawing operation. For
    /// example, the current transformation and clip shapes affect how SwiftUI
    /// draws the text.
    ///
    /// - Parameters:
    ///   - text: The ``Text`` view to draw. Before drawing, the method converts
    ///     the view to ``ResolvedText`` by calling ``resolve(_:)-4dx65``.
    ///   - rect: The rectangle in the current user space to draw the text in.
    public func draw(_ text: Text, in rect: CGRect) { }

    /// Draws text into the context, aligning an anchor within the ideal size
    /// of the rendered text to a point in the context.
    ///
    /// The current context state defines the full drawing operation. For
    /// example, the current transformation and clip shapes affect how SwiftUI
    /// draws the text.
    ///
    /// - Parameters:
    ///   - text: The ``Text`` view to draw. Before drawing, the method converts
    ///     the view to ``ResolvedText`` by calling ``resolve(_:)-4dx65``.
    ///   - point: A point within the rectangle of the resolved text to anchor
    ///     to a point in the context.
    ///   - anchor: A ``UnitPoint`` within the context to align the text with.
    ///     The default is ``UnitPoint/center``.
    public func draw(_ text: Text, at point: CGPoint, anchor: UnitPoint = .center) { }

    /// A static sequence of drawing operations that may be drawn
    /// multiple times, preserving their resolution independence.
    ///
    /// You resolve a child view in preparation for drawing it into a context
    /// by calling ``resolveSymbol(id:)``. The resolved view takes into account
    /// environment values like the display resolution and current color scheme.
    public struct ResolvedSymbol {

        /// The dimensions of the resolved symbol.
        public var size: CGSize { get }
    }

    /// Gets the identified child view as a resolved symbol, if the view exists.
    ///
    /// - Parameter id: The value that you used to tag the view when you
    ///   define it in the `symbols` parameter of the ``Canvas`` initializer
    ///   ``Canvas/init(opaque:colorMode:rendersAsynchronously:renderer:symbols:)``.
    /// - Returns: The resolved symbol, or `nil` if SwiftUI can't find a child
    ///   view with the given `id`.
    public func resolveSymbol<ID>(id: ID) -> GraphicsContext.ResolvedSymbol? where ID : Hashable { }

    /// Draws a resolved symbol into the context, using the specified rectangle
    /// as a layout frame.
    ///
    /// The current context state defines the full drawing operation. For
    /// example, the current transformation and clip shapes affect how SwiftUI
    /// draws the symbol.
    ///
    /// - Parameters:
    ///   - symbol: The ``ResolvedSymbol`` to draw. Get a resolved symbol
    ///     by calling ``resolveSymbol(id:)`` with the identifier that you
    ///     use to tag the corresponding child view during ``Canvas``
    ///     initialization.
    ///   - rect: The rectangle in the current user space to draw the symbol in.
    public func draw(_ symbol: GraphicsContext.ResolvedSymbol, in rect: CGRect) { }

    /// Draws a resolved symbol into the context, aligning an anchor within the
    /// symbol to a point in the context.
    ///
    /// The current context state defines the full drawing operation. For
    /// example, the current transformation and clip shapes affect how SwiftUI
    /// draws the symbol.
    ///
    /// - Parameters:
    ///   - symbol: The ``ResolvedSymbol`` view to draw. Get a resolved symbol
    ///     by calling ``resolveSymbol(id:)`` with the identifier that you
    ///     use to tag the corresponding child view during ``Canvas``
    ///     initialization.
    ///   - point: A point within the rectangle of the resolved symbol to anchor
    ///     to a point in the context.
    ///   - anchor: A ``UnitPoint`` within the context to align the symbol with.
    ///     The default is ``UnitPoint/center``.
    public func draw(_ symbol: GraphicsContext.ResolvedSymbol, at point: CGPoint, anchor: UnitPoint = .center) { }

    /// Provides a Core Graphics context that you can use as a proxy to draw
    /// into this context.
    ///
    /// Use this method to use existing drawing code that relies on
    /// Core Graphics primitives.
    ///
    /// - Parameter content: A closure that receives a
    ///   <doc://com.apple.documentation/documentation/CoreGraphics/CGContext>
    ///   that you use to perform drawing operations, just like you draw into a
    ///   ``GraphicsContext`` instance. Any filters, blend mode settings, clip
    ///   masks, and other state set before calling `withCGContext(content:)`
    ///   apply to drawing operations in the Core Graphics context as well. Any
    ///   state you set on the Core Graphics context is lost when the closure
    ///   returns. Accessing the Core Graphics context after the closure
    ///   returns produces undefined behavior.
    public func withCGContext(content: (CGContext) throws -> Void) rethrows { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.BlendMode : Sendable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.ClipOptions : Sendable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.ShadowOptions : Sendable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.BlurOptions : Sendable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.FilterOptions : Sendable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.GradientOptions : Sendable { }
