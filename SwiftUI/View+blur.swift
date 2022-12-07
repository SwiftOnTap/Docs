@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that applies a Gaussian blur to this view.
    ///
    /// Use `blur(radius:opaque:)` to apply a gaussian blur effect to the
    /// rendering of this view.
    ///
    /// The example below shows two ``Text`` views, the first with no blur
    /// effects, the second with `blur(radius:opaque:)` applied with the
    /// `radius` set to `2`. The larger the radius, the more diffuse the
    /// effect.
    ///
    ///     struct BlurView: View {
    ///         var body: some View {
    ///             VStack {
    ///                 Text("This is some text.")
    ///                 Text("This is some blurry text.")
    ///                     .blur(radius: 2.0)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot that displays two text views in a VStack; the first
    /// reads "This is some text" in normal black font, while the second uses the
    /// blur modifier and reads "This is some blurry text" in blurry, less
    /// readable font.](blur.png)
    ///
    /// - Parameters:
    ///   - radius: The radial size of the blur. A blur is more diffuse when its
    ///     radius is large.
    ///   - opaque: A Boolean value that indicates whether the blur renderer
    ///     permits transparency in the blur output. Set to `true` to create an
    ///     opaque blur, or set to `false` to permit transparency.
    @inlinable public func blur(radius: CGFloat, opaque: Bool = false) -> some View { }

}

