@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the priority by which a parent layout should apportion space to
    /// this child.
    ///
    /// Views typically have a default priority of `0` which causes space to be
    /// apportioned evenly to all sibling views. Raising a view's layout
    /// priority encourages the higher priority view to shrink later when the
    /// group is shrunk and stretch sooner when the group is stretched.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Text("This is a moderately long string.")
    ///                 .font(.largeTitle)
    ///                 .border(Color.gray)
    ///
    ///             Spacer()
    ///
    ///             Text("This is a higher priority string.")
    ///                 .font(.largeTitle)
    ///                 .layoutPriority(1)
    ///                 .border(Color.gray)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// In the example above, the first ``Text`` element has the default
    /// priority `0` which causes its view to shrink dramatically due to the
    /// higher priority of the second ``Text`` element, even though all of their
    /// other attributes (font, font size and character count) are the same.
    ///
    /// ![A screenshot showing two Text views in an HStack; the second string
    /// has layout priority so it reads normally and takes up the majority of
    /// the screen, pushing the other string up against the left hand side of
    /// the screen, making it relatively unreadable.](SwiftUI-View-layoutPriority.png)
    ///
    /// A parent layout offers the child views with the highest layout priority
    /// all the space offered to the parent minus the minimum space required for
    /// all its lower-priority children.
    ///
    /// - Parameter value: The priority by which a parent layout apportions
    ///   space to the child.
    @inlinable public func layoutPriority(_ value: Double) -> some View { }

}

