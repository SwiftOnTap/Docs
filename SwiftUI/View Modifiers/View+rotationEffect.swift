@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that rotates this view's rendered output around the specified point.
    ///
    /// Use ``View/rotationEffect(_:anchor:)`` to rotate the view by a specific amount.
    ///
    /// In the example below, the text is rotated by 22˚.
    ///
    /// ```
    /// struct RotationView: View {
    ///     var body: some View {
    ///         Text("Rotation by passing an angle in degrees")
    ///             .rotationEffect(.degrees(22))
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A text view reading "Rotation by passing an angle in degrees" that has
    /// been rotated 22 degrees clockwise around it's center, as shown by a gray
    /// border in the pre-rotated position.](17.15.53.png)
    ///
    /// - Parameters:
    ///   - angle: The angle at which to rotate the view.
    ///   - anchor: The location with a default of ``UnitPoint/center`` that
    ///     defines a point at which the rotation is anchored.
    @inlinable public func rotationEffect(_ angle: Angle, anchor: UnitPoint = .center) -> some View { }

}

