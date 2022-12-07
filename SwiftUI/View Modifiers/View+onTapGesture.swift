@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension View {

    /// A view modifier that adds an action to perform when this view recognizes a tap gesture.
    ///
    /// Use this method to perform a specific `action` when the user clicks or
    /// taps on the view or container `count` times.
    ///
    /// > Note: If you are creating a control that's functionally equivalent
    /// to a ``Button``, use ``ButtonStyle`` to create a customized button
    /// instead.
    ///
    /// In the example below, the color of the heart images changes to a random
    /// color from the `colors` array whenever the user clicks or taps on the
    /// view twice:
    ///
    /// ```
    /// struct ContentView: View {
    ///     let colors: [Color] = [.gray, .red, .orange, .yellow,
    ///                            .green, .blue, .purple, .pink]
    ///     @State private var fgColor: Color = .gray
    ///
    ///     var body: some View {
    ///         Image(systemName: "heart.fill")
    ///             .resizable()
    ///             .frame(width: 200, height: 200)
    ///             .foregroundColor(fgColor)
    ///             .onTapGesture(count: 2, perform: {
    ///                 fgColor = colors.randomElement()!
    ///             })
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a grey heart icon that cycles through various colors
    /// as the user double taps.](ontapgesture.gif)
    ///
    /// - Parameters:
    ///    - count: The number of taps or clicks required to trigger the action
    ///      closure provided in `action`. Defaults to `1`.
    ///    - action: The action to perform.
    ///
    public func onTapGesture(count: Int = 1, perform action: @escaping () -> Void) -> some View { }

}

