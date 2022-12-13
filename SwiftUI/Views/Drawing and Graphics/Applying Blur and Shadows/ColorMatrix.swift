/// A matrix to use in an RGBA color transformation.
///
/// The matrix has five columns, each with a red, green, blue, and alpha
/// component. You can use the matrix for tasks like creating a color
/// transformation ``GraphicsContext/Filter`` for a ``GraphicsContext`` using
/// the ``GraphicsContext/Filter/colorMatrix(_:)`` method.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct ColorMatrix : Equatable {

    public var r1: Float

    public var r2: Float

    public var r3: Float

    public var r4: Float

    public var r5: Float

    public var g1: Float

    public var g2: Float

    public var g3: Float

    public var g4: Float

    public var g5: Float

    public var b1: Float

    public var b2: Float

    public var b3: Float

    public var b4: Float

    public var b5: Float

    public var a1: Float

    public var a2: Float

    public var a3: Float

    public var a4: Float

    public var a5: Float

    /// Creates the identity matrix.
    @inlinable public init() { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension ColorMatrix : Sendable { }
