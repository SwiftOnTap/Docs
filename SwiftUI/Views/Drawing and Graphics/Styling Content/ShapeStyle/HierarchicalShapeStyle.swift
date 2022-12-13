/// A shape style that maps to one of the numbered content styles.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct HierarchicalShapeStyle : ShapeStyle {

    /// A shape style that maps to the first level of the current
    /// content style.
    public static let primary: HierarchicalShapeStyle

    /// A shape style that maps to the second level of the current
    /// content style.
    public static let secondary: HierarchicalShapeStyle

    /// A shape style that maps to the third level of the current
    /// content style.
    public static let tertiary: HierarchicalShapeStyle

    /// A shape style that maps to the fourth level of the current
    /// content style.
    public static let quaternary: HierarchicalShapeStyle
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension HierarchicalShapeStyle : Sendable { }
