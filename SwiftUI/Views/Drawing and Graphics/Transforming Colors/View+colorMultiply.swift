@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that adds a color multiplication effect to this view.
    ///
    /// The following example shows two versions of the same image side by side;
    /// at left is the original, and at right is a duplicate with the
    /// `colorMultiply(_:)` modifier applied with ``Color/purple``.
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
    ///                     .colorMultiply(Color.purple)
    ///                     .overlay(Text("Multiply")
    ///                                 .font(.callout),
    ///                              alignment: .bottom)
    ///                     .border(Color.gray)
    ///             }
    ///             .padding(50)
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying two squares in an HStack, each with an interior
    /// circle. The first is a red square with a green circle which reads
    /// "Normal," while the second is a duplicate with the colorMultiply modifier
    /// applied with purple. The result is a darker red square and a gray circle.
    /// It's text reads "Multiply."](color-multiply.png)
    ///
    /// - Parameter color: The color to bias this view toward.
    ///
    /// - Returns: A view with a color multiplication effect.
    @inlinable public func colorMultiply(_ color: Color) -> some View { }

}

