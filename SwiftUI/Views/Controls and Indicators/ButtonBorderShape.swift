/// A shape that is used to draw a button's border.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ButtonBorderShape : Equatable {

    /// A shape that defers to the system to determine an appropriate shape
    /// for the given context and platform.
    public static let automatic: ButtonBorderShape

    /// A capsule shape.
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    public static let capsule: ButtonBorderShape

    /// A rounded rectangle shape.
    public static let roundedRectangle: ButtonBorderShape

    /// A rounded rectangle shape.
    ///
    /// - Parameter radius: the corner radius of the rectangle.
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    public static func roundedRectangle(radius: CGFloat) -> ButtonBorderShape { }

}
