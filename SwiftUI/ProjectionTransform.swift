/// A projection transform is a type of spacial transformation of an object
/// that can be represented as a 3x3 matrix.
///
/// Use this structure to apply a 3D transformation to a view.
///
/// Conceptually, this structure represents a 3D transformation matrix.
/// Each column of the matrix represents where the unit vector
/// of the original view lands in the transformed view. The **x** unit
/// vector is represented by the left column, the **y** unit vector
/// is represented by the middle column, and the **z** unit vector
/// is represented by the right column.
///
/// - Note: In the majority of circumstances, it is not necessary to use
/// a `ProjectionTransform` or the ``View/projectionEffect(_:)``
/// modifier. This is only necessary when maximum control is required.
/// For most normal use cases, use the following modifiers instead:
///
/// - **Rotation**: ``View/rotationEffect(_:anchor:)``
/// - **Scaling**: ``View/scaleEffect(_:anchor:)-92995``
/// - **Translation**: ``View/offset(_:)``
///
/// ### Making a `ProjectionTransform`
///
/// Constructing a `ProjectionTransform` is most commonly done in
/// one of three ways:
/// - Using a [`CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgaffinetransform)
/// - Using a [`CATransform3D`](https://developer.apple.com/documentation/quartzcore/catransform3d)
/// - Using ``GeometryEffect/effectValue(size:)``
///
/// See below for an example.
///
/// ### Using a `ProjectionTransform`
///
/// The primary way to use a `ProjectionTransform` is by using the
/// ``View/projectionEffect(_:)`` modifier.
///
/// ```
/// struct UpsideDownTrashCanView: View {
///     let effect = ProjectionTransform(CGAffineTransform(rotationAngle: .pi))
///
///     var body: some View {
///         Text("🗑")
///             .font(.title)
///             .projectionEffect(effect)
///     }
/// }
/// ```
///
/// ![471A4641-6C43-4407-A9E5-9DD446D77365](471A4641-6C43-4407-A9E5-9DD446D77365.png)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ProjectionTransform {

	/// The top left value in the projection transform matrix.
    ///
    /// This property can be written to or read directly, but it's usually
    /// calculated using one of the initializers instead.
    ///
    /// ```
    /// struct WarpedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform()
    ///         effect.m11 = 4
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view of a trash can emoji that applies
    /// a projection transform using the top left value in the projection transform
    /// matrix, which renders as a large, flattened trash can emoji shifted to
    /// the right.](m11.png)
    public var m11: CGFloat

    /// The top middle value in the projection transform matrix.
    ///
    /// This property can be written to or read directly, but it's usually
    /// calculated using one of the initializers instead.
    ///
    /// ```
    /// struct WarpedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform()
    ///         effect.m12 = 1
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    /// ![A screenshot displaying a text view of a trash can emoji that applies
    /// a projection transform using the top middle value in the projection transform
    /// matrix, which renders as a rotated, flattened trash can emoji in the
    /// center of the screen.](m12.png)
    public var m12: CGFloat

    /// The top right value in the projection transform matrix.
    ///
    /// This property can be written to or read directly, but it's usually
    /// calculated using one of the initializers instead.
    ///
    /// ```
    /// struct WarpedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform()
    ///         effect.m13 = 0.01
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view of a trash can emoji that applies
    /// a projection transform using the top right value in the projection transform
    /// matrix, which renders as a trash can emoji with a warped bottom in the
    /// center of the screen.](m13.png)
    public var m13: CGFloat

    /// The center left value in the projection transform matrix.
    ///
    /// This property can be written to or read directly, but it's usually
    /// calculated using one of the initializers instead.
    ///
    /// ```
    /// struct WarpedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform()
    ///         effect.m21 = 1
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view of a trash can emoji that applies
    /// a projection transform using the center left value in the projection transform
    /// matrix, which renders as a trash can emoji with its bottom stretched
    /// out to the right in the center of the screen.](m21.png)
    public var m21: CGFloat

    /// The center value in the projection transform matrix.
    ///
    /// This property can be written to or read directly, but it's usually
    /// calculated using one of the initializers instead.
    ///
    /// ```
    /// struct WarpedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform()
    ///         effect.m11 = 4
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view of a trash can emoji that applies
    /// a projection transform using center value in the projection transform
    /// matrix, which renders as a large, flattened trash can emoji shifted to
    /// the right.](m22.png)
    public var m22: CGFloat

    /// The center right value in the projection transform matrix.
    ///
    /// This property can be written to or read directly, but it's usually
    /// calculated using one of the initializers instead.
    ///
    /// ```
    /// struct WarpedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform()
    ///         effect.m23 = 0.01
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view of a trash can emoji that applies
    /// a projection transform using the center right value in the projection transform
    /// matrix, which renders as a trash can emoji with its top stretched
    /// out to the right in the center of the screen.](m23.png)
    public var m23: CGFloat

    /// The bottom left value in the projection transform matrix.
    ///
    /// This property can be written to or read directly, but it's usually
    /// calculated using one of the initializers instead.
    ///
    /// ```
    /// struct WarpedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform()
    ///         effect.m31 = 100
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view of a trash can emoji that applies
    /// a projection transform using the bottom left value in the projection transform
    /// matrix, which renders as a normal looking trash can emoji shifted
    /// to the right side of the screen.](m31.png)
    public var m31: CGFloat

    /// The bottom center value in the projection transform matrix.
    ///
    /// ```
    /// struct WarpedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform()
    ///         effect.m32 = 100
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view of a trash can emoji that applies
    /// a projection transform using the bottom center value in the projection transform
    /// matrix, which renders as a normal looking trash can emoji shifted
    /// to the bottom half of the screen.](m32.png)
    public var m32: CGFloat

    /// The bottom right value in the projection transform matrix.
    ///
    /// ```
    /// struct WarpedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform()
    ///         effect.m33 = 0.1
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view of a trash can emoji that applies
    /// a projection transform using the bottom right value in the projection transform
    /// matrix, which renders as a blown up trash can emoji shifted
    /// to the bottom right half of the screen.](m33.png)
    public var m33: CGFloat

    /// Creates a projection transform equal to the identity matrix.
    ///
    /// Use this initializer to create a matrix that does nothing so that
    /// you can modify it afterwards.
    ///
    /// ```
    /// struct WarpedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform()
    ///         effect.m11 = 4
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view of a trash can emoji that applies
    /// a projection transform using the top left value in the projection transform
    /// matrix, which renders as a large, flattened trash can emoji shifted to
    /// the right.](m11.png)
    @inlinable public init() { }

    /// Creates a projection transform from a `CGAffineTransform`.
    ///
    /// See [`CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgaffinetransform)
    /// for more info on how to create an affine transform.
    ///
    /// ```
    /// struct UpsideDownTrashCanView: View {
    ///     let effect = ProjectionTransform(CGAffineTransform(rotationAngle: .pi))
    ///
    ///     var body: some View {
    ///         Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a trash can emoji rendered upside down on the
    /// left half of the screen by applying a projection transform with a rotation angle.](471A4641-6C43-4407-A9E5-9DD446D77365.png)
    ///
    /// - Parameter m: The Core Graphics affine transform matrix.
    @inlinable public init(_ m: CGAffineTransform) { }

    /// Creates a projection transform from a `CATransform3D`.
    ///
    /// See [`CATransform3D`](https://developer.apple.com/documentation/quartzcore/catransform3d)
    /// for more info on how to create a 3D transform.
    ///
    /// - Parameter m: The Core Animation 3D transform matrix.
    @inlinable public init(_ m: CATransform3D) { }

    /// Whether the projection transform matrix is an identity matrix.
    ///
    /// ```
    /// struct JustATrashCanView: View {
    ///     let effect = ProjectionTransform()
    ///     var body: some View {
    ///         Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///             .onAppear { print(effect.isIdentity) } //true
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a normal sized trash can emoji in the center of
    /// the screen. The isIdentity variable returns true as the projection transform
    /// is the identity matrix.](projectiontransform-isidentity.png)
    @inlinable public var isIdentity: Bool { get }

    /// Whether the projection transform matrix is an affine transform.
    ///
    /// An affine transformation is one that preserves lines and parallelism
    /// (but not necessarily distances and angles).
    ///
    /// See this [Wikipedia](https://en.wikipedia.org/wiki/Affine_transformation)
    /// article for more info.
    ///
    /// ```
    /// struct AffineTransformedTrashCanView: View {
    ///     let effect = ProjectionTransform(CGAffineTransform(rotationAngle: .pi))
    ///
    ///     var body: some View {
    ///         Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///             .onAppear { print(effect.isAffine) } //true
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a normal sized, upside down trash can emoji in the center of
    /// the screen. The isAffine variable returns true as the projection transform
    /// is an affine transform (preserves lines and parallelism).](471A4641-6C43-4407-A9E5-9DD446D77365.png)
    @inlinable public var isAffine: Bool { get }

    /// Inverts the projection transform matrix if it's invertible.
    ///
    /// Use this function to mutate the effect to its inverse.
    /// If instead you would like to return a new inverted matrix,
    /// use ``ProjectionTransform/inverted()`` instead.
    ///
    /// ```
    /// struct RotatedTrashCanView: View {
    ///     var body: some View {
    ///         var effect = ProjectionTransform(CGAffineTransform(rotationAngle: 2))
    ///         let isInvertible = effect.invert() //rotates the other way!
    ///
    ///         return Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(isInvertible ? effect : ProjectionTransform())
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a rotated trash can emoji rendered by the invert
    /// function to face the bottom left of the screen.](projectiontransform-invert.png)
    ///
    /// - Returns: A Boolean of whether the matrix was successfully inverted.
    public mutating func invert() -> Bool { }

    /// Modifies the projection transform to its inverse if invertable.
    ///
    /// Use this function to return a new inverted matrix. If instead
    /// you would like to mutate the projection transform itself,
    /// use the ``ProjectionTransform/invert()`` method instead.
    ///
    /// ```
    /// struct MirroredTrashCanView: View {
    ///     var body: some View {
    ///         let clockwise = ProjectionTransform(CGAffineTransform(rotationAngle: 2))
    ///         let counterclockwise = clockwise.inverted()
    ///
    ///         return VStack {
    ///             Text("🗑")
    ///                 .font(.title)
    ///                 .projectionEffect(clockwise)
    ///             Text("🗑")
    ///                 .font(.title)
    ///                 .projectionEffect(counterclockwise)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two trash can emojis in a VStack, both rotated
    /// by a projection transform, with the second rotated as an inversion of the first.
    /// The result is a view in which both trash can tops lean towards each other.](projectiontransform-inverted.png)
    ///
    /// - Returns: An inverted projection transform matrix.
    public func inverted() -> ProjectionTransform { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ProjectionTransform : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ProjectionTransform, b: ProjectionTransform) -> Bool { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ProjectionTransform {

	/// Concatenates two projection transform matrices together to make a new one.
    ///
    /// Projection matrix concatenation is mathematically equivalent to
    /// multiplication. Matrix multiplication is *not* commutative.
    ///
    /// ```
    /// struct RotatedTrashCanView: View {
    ///     let effect1 = ProjectionTransform(CGAffineTransform(rotationAngle: 2))
    ///     let effect2 = ProjectionTransform(CGAffineTransform(rotationAngle: 1))
    ///     let effect = effect1.concatenating(effect2) //rotates 3 radians!
    ///
    ///     var body: some View {
    ///         Text("🗑")
    ///             .font(.title)
    ///             .projectionEffect(effect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a trash can emoji rendered upside down by
    /// concatenating two projection transforms to total the effect at a 3 radian rotation.](projectiontransform-concatenating.png)
	///
	/// - Parameter rhs: The projection transform matrix to concatenate.
	/// - Returns: A new concatenated projection transform matrix.
    @inlinable public func concatenating(_ rhs: ProjectionTransform) -> ProjectionTransform { }
}
