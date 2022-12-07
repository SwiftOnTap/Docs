/// A type that can serve as the animatable data of an animatable type.
///
/// ``VectorArithmetic`` extends the `AdditiveArithmetic` protocol with scalar
/// multiplication and a way to query the vector magnitude of the value. Use
/// this type as the `animatableData` associated type of a type that conforms to
/// the ``Animatable`` protocol.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol VectorArithmetic : AdditiveArithmetic { }
extension VectorArithmetic : AdditiveArithmetic {

    /// Multiplies each component of this value by the given value.
    mutating func scale(by rhs: Double) { }

    /// Returns the dot-product of this vector arithmetic instance with itself.
    var magnitudeSquared: Double { get }
}

