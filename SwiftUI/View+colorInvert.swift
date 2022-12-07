@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that inverts the colors in this view.
    ///
    /// The `colorInvert()` modifier inverts all of the colors in a view so that
    /// each color displays as its complementary color. For example, blue
    /// converts to yellow, and white converts to black.
    ///
    /// In the example below, two red squares each have an interior green
    /// circle. The inverted square shows the effect of the square's colors:
    /// complimentary colors for red and green — teal and purple.
    ///
    ///     struct InnerCircleView: View {
    ///         var body: some View {
    ///             Circle()
    ///                 .fill(Color.green)
    ///                 .frame(width: 40, height: 40, alignment: .center)
    ///         }
    ///     }
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             HStack {
    ///                 Color.red.frame(width: 100, height: 100, alignment: .center)
    ///                     .overlay(InnerCircleView(), alignment: .center)
    ///                     .overlay(Text("Normal")
    ///                                  .font(.callout),
    ///                              alignment: .bottom)
    ///                     .border(Color.gray)
    ///
    ///                 Spacer()
    ///
    ///                 Color.red.frame(width: 100, height: 100, alignment: .center)
    ///                     .overlay(InnerCircleView(), alignment: .center)
    ///                     .colorInvert()
    ///                     .overlay(Text("Inverted")
    ///                                  .font(.callout),
    ///                              alignment: .bottom)
    ///                     .border(Color.gray)
    ///             }
    ///             .padding(50)
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying two squares in an HStack, each with an interior
    /// circle. The first is a red square with a green circle which reads
    /// "Normal," while the second is an inverted version of the first. It swaps
    /// the red and green for their complementary colors, teal and purple, using
    /// the colorInvert view modifier. It's text reads "Inverted."](color-invert.png)
    ///
    /// - Returns: A view that inverts its colors.
    @inlinable public func colorInvert() -> some View { }

}

