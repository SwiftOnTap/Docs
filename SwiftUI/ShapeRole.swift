/// Ways of styling a shape.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public enum ShapeRole {

    /// Indicates to the shape's style that SwiftUI fills the shape.
    case fill

    /// Indicates to the shape's style that SwiftUI applies a stroke to
    /// the shape's path.
    case stroke

    /// Indicates to the shape's style that SwiftUI uses the shape as a
    /// separator.
    case separator

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension ShapeRole : Equatable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension ShapeRole : Hashable { }

