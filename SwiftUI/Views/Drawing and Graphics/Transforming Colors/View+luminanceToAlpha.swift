@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that adds a luminance to alpha effect to this view.
    ///
    /// The `luminanceToAlpha()` modifier creates a semitransparent mask out of
    /// the view to which you apply it. The dark regions in a view become
    /// transparent, and the bright regions become opaque black. Medium
    /// brightness regions become a partially opaque gray color.
    ///
    /// The example below shows two views: the first is a red square with an
    /// overlaid green circle; the second is a copy of the first view where
    /// the `luminanceToAlpha()` modifier's masking operation transforms the
    /// view's brightness levels into an equivalent grayscale version of the
    /// first view:
    ///
    ///     struct LuminanceCircleView: View {
    ///         var body: some View {
    ///             Circle()
    ///                 .fill(Color.green)
    ///                 .frame(width: 40, height: 40, alignment: .center)
    ///         }
    ///     }
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             HStack {
    ///                 Color.red.frame(width: 60, height: 60, alignment: .center)
    ///                     .overlay(LuminanceCircleView(), alignment: .center)
    ///                     .padding()
    ///
    ///                 Color.red.frame(width: 60, height: 60, alignment: .center)
    ///                     .overlay(LuminanceCircleView(), alignment: .center)
    ///                     .luminanceToAlpha()
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying two squares with overlaid circles in an HStack;
    /// The first is a red square with a green circle, while the second is a copy
    /// of the first where the luminanceToAlpha view modifier transforms the
    /// brightness levels such that it appears as an equivalent grayscale version,
    /// with a darker gray circle set within a lighten gray square.](luminancetoalpha.png)
    ///
    /// - Returns: A view that applies a luminance to alpha effect to this view.
    @inlinable public func luminanceToAlpha() -> some View { }

}

