@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Rotates this view's rendered output in three dimensions around the given
    /// axis of rotation.
    ///
    /// Use ``View/rotation3DEffect(_:axis:anchor:anchorZ:perspective:)`` to rotate the
    /// view in three dimensions around the given axis of rotation, and
    /// optionally, position the view at a custom display order and perspective.
    ///
    /// In the example below, the text is rotated 45˚ about the `y` axis,
    /// front-most (the default `zIndex`) and default `perspective` (`1`):
    ///
    /// ```
    /// struct RotatedInSpaceView: View {
    ///     var body: some View {
    ///         Text("Rotation by passing an angle in degrees")
    ///             .rotation3DEffect(.degrees(45), axis: (x: 0.0, y: 1.0, z: 0.0))
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A text view reading "Rotation by passing an angle in degrees" that has
    /// been rotated 45 degrees around the y-axis, as shown by a gray border in
    /// the pre-rotated position; this transformation gives the text a 3D
    /// appearance, as if it is fading into the depths of the frame.](17.18.05.png)
    ///
    /// - Parameters:
    ///   - angle: The angle at which to rotate the view.
    ///   - axis: The `x`, `y` and `z` elements that specify the axis of
    ///     rotation.
    ///   - anchor: The location with a default of ``UnitPoint/center`` that
    ///     defines a point in 3D space about which the rotation is anchored.
    ///   - anchorZ: The location with a default of `0` that defines a point in
    ///     3D space about which the rotation is anchored.
    ///   - perspective: The relative vanishing point with a default of `1` for
    ///     this rotation.
    @inlinable public func rotation3DEffect(_ angle: Angle, axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View { }

}

