/// The working color space for color-compositing operations.
///
/// Each color space guarantees to preserve a particular range of color values.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ColorRenderingMode: Equatable, Hashable {

    /// The non-linear sRGB working color space, with color component values
    /// outside the range `[0, 1]` producing undefined results.
    ///
    /// This color space is gamma corrected.
    case nonLinear

    /// The linear sRGB working color space, with color component values outside
    /// the range `[0, 1]` producing undefined results.
    ///
    /// This color space isn't gamma corrected.
    case linear

    /// The linear sRGB working color space, with color component values outside
    /// the range `[0, 1]` preserved.
    ///
    /// This color space isn't gamma corrected.
    case extendedLinear

}
