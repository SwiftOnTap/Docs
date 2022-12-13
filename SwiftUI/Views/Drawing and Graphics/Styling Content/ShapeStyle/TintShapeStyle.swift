/// A style that reflects the current tint color.
///
/// You can set the tint color with the ``View/tint(_:)-93mfq`` modifier. If no
/// explicit tint is set, the tint is derived from the app's accent color.
///
/// You can also use ``ShapeStyle/tint`` to construct this style.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct TintShapeStyle : ShapeStyle {

    /// Creates a tint shape style.
    public init() { }
}
