@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the contrast and separation between similar colors in this view.
    ///
    /// Apply contrast to a view to increase or decrease the separation between
    /// similar colors in the view.
    ///
    /// In the example below, the `contrast(_:)` modifier is applied to a set of
    /// red squares each containing a contrasting green inner circle. At each
    /// step in the loop, the `contrast(_:)` modifier changes the contrast of
    /// the circle/square view in 20% increments. This ranges from -20% contrast
    /// (yielding inverted colors — turning the red square to pale-green and the
    /// green circle to mauve), to neutral-gray at 0%, to 100% contrast
    /// (bright-red square / bright-green circle). Applying negative contrast
    /// values, as shown in the -20% square, will apply contrast in addition to
    /// inverting colors.
    ///
    ///     struct CircleView: View {
    ///         var body: some View {
    ///             Circle()
    ///                 .fill(Color.green)
    ///                 .frame(width: 25, height: 25, alignment: .center)
    ///         }
    ///     }
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             VStack {
    ///                 ForEach(-1..<6) { i in
    ///                     Color.red.frame(width: 50, height: 50, alignment: .center)
    ///                         .overlay(CircleView(), alignment: .center)
    ///                         .contrast(Double(i) * 0.2)
    ///                         .overlay(Text("\(Double(i) * 0.2 * 100, specifier: "%.0f")%")
    ///                                      .font(.callout),
    ///                                  alignment: .bottom)
    ///                         .border(Color.gray)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a VStack of seven identical red squares, each
    /// containing a contrasting green circle. For each square, the contrast
    /// modifier is used to change the contrast of the circle/square view in
    /// 20% increments, ranging from -20% contrast to 100%. At -20%, the shape
    /// appears as a blue square with a purple circle, and at 100% the colors
    /// are normal red and green as they were initialized. From 0 to 20%, the
    /// red and green colors brighten to reveal increasing contrast.](contrast.png)
    ///
    /// - Parameter amount: The intensity of color contrast to apply. negative
    ///   values invert colors in addition to applying contrast.
    ///
    /// - Returns: A view that applies color contrast to this view.
    @inlinable public func contrast(_ amount: Double) -> some View { }

}

