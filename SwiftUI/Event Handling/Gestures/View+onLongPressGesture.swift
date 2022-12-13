@available(iOS 13.0, macOS 10.15, watchOS 6.0, tvOS 14.0, *)
extension View {

    /// A view modifier that calls a function after a long press.
    ///
    /// Use this modifier to call a function when the user long presses on a view.
    ///
    /// Use the modifier like this:
    ///
    ///     struct ExampleView: View {
    ///         @State private var pressed = false
    ///         @State private var longPressed = false
    ///
    ///         var body: some View {
    ///             Text(longPressed ? "✅" : "Press me")
    ///                 .font(.title)
    ///                 .background(pressed ? Color.green : Color.clear)
    ///                 .onLongPressGesture(minimumDuration: 1.0,
    ///                     maximumDistance: 5,
    ///                     pressing: { pressing in pressed = pressing },
    ///                     perform: { longPressed.toggle() })
    ///         }
    ///     }
    ///
    /// ![A gif displaying a text view reading "Press me" in title style font;
    /// a green background appears behind the text when pressed cotninuously
    /// for 1 full second or more.](view-on-long-press-gesture-mdmdpp-ex.gif)
    ///
    /// - Parameters:
    ///   - minimumDuration: How long it takes to detect a long press.
    ///   - maximumDistance: How far the user can drag before the long press is canceled.
    ///   - pressing: A closure takes in whether the view is being pressed.
    ///   - action: A closure called when the long press happens.
    ///
    @available(iOS, deprecated: 100000.0, renamed: "onLongPressGesture(minimumDuration:maximumDuration:perform:onPressingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "onLongPressGesture(minimumDuration:maximumDuration:perform:onPressingChanged:)")
    @available(tvOS, unavailable)
    @available(watchOS, deprecated: 100000.0, renamed: "onLongPressGesture(minimumDuration:maximumDuration:perform:onPressingChanged:)")
    @available(tvOS, unavailable)
    public func onLongPressGesture(minimumDuration: Double = 0.5, maximumDistance: CGFloat = 10, pressing: ((Bool) -> Void)? = nil, perform action: @escaping () -> Void) -> some View { }

}

