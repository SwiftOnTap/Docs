@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the view's horizontal alignment.
    ///
    /// Use `alignmentGuide(_:computeValue:)` to calculate specific offsets
    /// to reposition views in relationship to one another. You can return a
    /// constant or can use the ``ViewDimensions`` argument to the closure to
    /// calculate a return value.
    ///
    /// In the example below, the ``HStack`` is offset by a constant of 50
    /// points to the right of center:
    ///
    /// ```
    /// struct ContentView {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Today's Weather")
    ///                 .font(.title)
    ///                 .border(Color.gray)
    ///             HStack {
    ///                 Text("🌧")
    ///                 Text("Rain & Thunderstorms")
    ///                 Text("⛈")
    ///             }
    ///             .alignmentGuide(HorizontalAlignment.center) { _ in  50 }
    ///             .border(Color.gray)
    ///         }
    ///         .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![](alignmentguide-2.png)
    ///
    /// Changing the alignment of one view may have effects on surrounding
    /// views. Here the offset values inside a stack and its contained views is
    /// the difference of their absolute offsets.
    ///
    /// - Parameters:
    ///   - g: A ``HorizontalAlignment`` value at which to a base the offset.
    ///   - computeValue: A closure that returns the offset value to apply to
    ///     this view.
    ///
    /// - Returns: A view modified with respect to its horizontal alignment
    ///   according to the computation performed in the method's closure.
    @inlinable public func alignmentGuide(_ g: HorizontalAlignment, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View { }


    /// Sets the view's vertical alignment.
    ///
    /// Use `alignmentGuide(_:computeValue:)` to calculate specific offsets
    /// to reposition views in relationship to one another. You can return a
    /// constant or can use the ``ViewDimensions`` argument to the closure to
    /// calculate a return value.
    ///
    /// In the example below, the weather emoji are offset 20 points from the
    /// vertical center of the ``HStack``.
    ///
    /// ```
    /// struct ContentView {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Today's Weather")
    ///                 .font(.title)
    ///                 .border(Color.gray)
    ///
    ///             HStack {
    ///                 Text("🌧")
    ///                     .alignmentGuide(VerticalAlignment.center) { _ in -20 }
    ///                 Text("Rain & Thunderstorms")
    ///                     .border(Color.gray)
    ///                 Text("⛈")
    ///                     .alignmentGuide(VerticalAlignment.center) { _ in 20 }
    ///                     .border(Color.gray)
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![](alignmentguide.png)
    ///
    /// Changing the alignment of one view may have effects on surrounding
    /// views. Here the offset values inside a stack and its contained views is
    /// the difference of their absolute offsets.
    ///
    /// - Parameters:
    ///   - g: A ``VerticalAlignment`` value at which to a base the offset.
    ///   - computeValue: A closure that returns the offset value to apply to
    ///     this view.
    ///
    /// - Returns: A view modified with respect to its vertical alignment
    ///   according to the computation performed in the method's closure.
    @inlinable public func alignmentGuide(_ g: VerticalAlignment, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View { }

}

