/// Modes for compositing a view with overlapping content.
///
/// There are 21 different types of blend modes. To use the following example,
/// drag in the following two photos and label them "ocean" and "space".
///
/// ![Image of the ocean](ocean.jpg)
///
/// ![Image of space](space.jpg)
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ZStack {
///             Image("ocean")
///                 .resizable()
///                 .scaledToFit()
///
///             Image("space")
///                 .resizable()
///                 .scaledToFit()
///                 .blendMode(BlendMode.softLight)
///         }
///     }
/// }
/// ```
///
/// ![A screenshot displaying a blended image of the ocean and space.](blendmode-softLight.png)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum BlendMode {

    /// Regular overlapping, with opacity taken into account.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.normal)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying the space image on top of the ocean image,
    /// with the normal blendmode rendering as a regular stack, so only the space
    /// image is visible.](blendmode-normal.png)
    ///
    case normal

    /// Multiplies the RGB channel numbers (0.0 - 1.0) of each pixel.
    ///
    /// The result is always a darker picture.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.multiply)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a dark blend between the ocean and space images.](blendmode-multiply.png)
    ///
    case multiply

    /// Each RGB pixel value is inverted (subtracted from 1), multiplied together,
    /// and then inverted back.
    ///
    /// The result is the opposite effect of multiply, and always a lighter
    /// picture. The results are also symmetric, so changing which layer is on
    /// top does not change the final picture.
    ///
    /// The formula for screen is this:
    ///
    ///     func screen(a: Double, b: Double) {
    ///         return 1 - (1 - a) * (1 - b)
    ///     }
    ///
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.screen)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a light blend between the ocean and space images.](blendmode-screen.png)
    ///
    case screen

    /// The parts where the bottom layer is light become lighter, and dark
    /// becomes darker.
    ///
    /// Overlay is a combo of ``BlendMode/multiply`` and ``BlendMode/screen``.
    /// The formula is this:
    ///
    ///     func overlay(a: Double, b: Double) -> Double {
    ///         if a > 0.5 {
    ///             return 2 * a * b
    ///         } else {
    ///             return 1 - 2 * (1 - a) * (1 - b)
    ///         }
    ///     }
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.overlay)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blend between the ocean and space images
    /// in which the darks of the ocean appear darker, and the lights of the
    /// sand and space appear lighter.](blendmode-overlay.png)
    ///
    case overlay

    /// Takes the darker of the top and bottom picture pixels.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.darken)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a dark blend between space and the ocean, taking
    /// the darker of the top and bottom pixels.](blendmode-darken.png)
    ///
    case darken

    /// Takes the lighter of the top and bottom picture pixels.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.lighten)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a light blend between space and the ocean, taking
    /// the lighter of the top and bottom pixels.](blendmode-lighten.png)
    ///
    case lighten

    /// Divides the bottom layer by the inversion of the top layer.
    ///
    /// Color dodge is inspired by dodging in a darkroom. The bottom layer is
    /// lightened by an amount determined by the top layer - a brighter top
    /// layer results in a more brightened bottom layer.
    ///
    /// Blending any pixel with white will result in a white pixel. Blending any
    /// color with black will result in an unchanged pixel.
    ///
    /// This operation is not invertible.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.colorDodge)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a bright blend between space and the ocean.](blendmode-colorDodge.png)
    ///
    case colorDodge

    /// Divides the inverted bottom layer by the top layer, then inverts the result.
    ///
    /// The top layer is darkened by an amount determined by the bottom layer.
    ///
    /// Blending any pixel by white results in no change.
    ///
    /// This operation is not invertible.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.colorBurn)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a very dark blend between space and the ocean,
    /// in which nearly all pixels which are not very light turn to black.](blendmode-colorBurn.png)
    case colorBurn

    /// Basically, every light color gets a little lighter, and every dark color gets darker.
    ///
    /// The actual formula for the operation is this:
    ///
    ///     func softLight(a: Double, b: Double) -> Double {
    ///         if b < 0.5 {
    ///             return 2*a*b + a*a*(1 - 2*b)
    ///         } else {
    ///             return 2*a*(1 - b) + sqrt(a)*(2*b - 1)
    ///         }
    ///     }
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.softLight)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a light blend between space and the ocean,
    /// in which the light colors appear lighter and the dark colors appear slightly darker.](blendmode-overlay.png)
    ///
    case softLight

    /// A combination of multiply and screen are applied.
    ///
    /// Hard light affects the bottom layer the way that overlay affects the top
    /// layer, and vice-versa.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.hardLight)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blend between space and the ocean that mostly
    /// appears as space, the bottom layer.](blendmode-hardLight.png)
    ///
    case hardLight

    /// Subtracts the bottom layer from the top layer, and then makes the result positive.
    ///
    /// If either layer is black, nothing changes. Blending with white inverts
    /// the picture.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.difference)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A colorful blend between space and the ocean.](blendmode-difference.png)
    ///
    case difference

    /// Subtracts the bottom layer from the top layer, and then makes the result positive.
    ///
    /// The difference between difference and exclusion is that blending with
    /// 50% gray will produce 50% gray.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.exclusion)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A light and colorful blend between space and the ocean.](blendmode-exclusion.png)
    ///
    case exclusion

    /// Keeps the brightness and saturation of the bottom layer, while taking the hue of the top layer.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.hue)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blend between space and the ocean that maintains most features of
    /// the ocean image, while appearing to take the hue of the space image.](blendmode-hue.png)
    ///
    case hue

    /// Keeps the brightness and hue of the bottom layer, while taking the saturation of the top layer.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.saturation)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blend between the ocean and space that appears
    /// to keep the brightness and hue of the ocean while taking the saturation of space.](blendmode-saturation.png)
    ///
    case saturation

    /// Keeps the brightness of the bottom layer, while taking the hue and saturation of the top layer.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.color)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with an image in the center of the screen where the ocean is visible with a pinkish hue.](blendmode-color.png)
    ///
    case color

    /// Keeps the hue and saturation of the bottom layer, while taking the brightness of the top layer.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.luminosity)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with an image in the center of the screen that appears as a fairly even blend between space and ocean.](blendmode-luminosity.png)
    ///
    case luminosity

    /// Shows the bottom layer fully, with the top layer drawn only where it
    /// intersect the bottom.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.sourceAtop)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with an image in the center of the screen where only the space image is visible.](blendmode-sourceAtop.png)
    ///
    case sourceAtop

    /// The bottom is drawn over the top, and the top is only visible where the
    /// bottom is transparent.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.destinationOver)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with an image in the center of the screen where only the ocean image is visible.](blendmode-destinationOver.png)
    ///
    case destinationOver

    /// Displays only the bottom layer, and only where the top is transparent.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.destinationOut)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with an image in the center of the screen where the entire image is dark.](blendmode-destinationOut.png)
    ///
    case destinationOut

    /// Adds the top layer pixels to the bottom layer.
    ///
    /// Displays white where the addition is greater than `1.0`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.plusDarker)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with an image in the center of the screen where the left half of the image is significantly darker than the right.](blendmode-plusDarker.png)
    ///
    case plusDarker

    /// Adds the top layer pixels to the bottom layer, than subtracts the result from 1.
    ///
    /// Displays black where the result is less than `0.0`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.plusLighter)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with an image in the center of the screen where the right half of the image is significantly brighter than the left.](blendmode-plusLighter.png)
    ///
    case plusLighter

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: BlendMode, b: BlendMode) -> Bool { }

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

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension BlendMode : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension BlendMode : Hashable {
}

