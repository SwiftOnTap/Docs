@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Sets whether this view should ignore the system Smart Invert setting.
    ///
    /// Use this modifier to suppress Smart Invert in a view that shouldn't
    /// be inverted. Or pass an `active` argument of `false` to begin following
    /// the Smart Invert setting again when it was previously disabled.
    ///
    /// - Parameter active: A true value ignores the system Smart Invert
    ///   setting. A false value follows the system setting.
    @inlinable public func accessibilityIgnoresInvertColors(_ active: Bool = true) -> some View { }

}

