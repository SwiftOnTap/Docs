@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// A view modifier that sets the tab view page dots style.
    ///
    /// Use this modifier when your ``TabView`` uses the ``PageTabViewStyle``.
    /// You can pass this modifier an instance of any type that conforms to the
    /// ``IndexViewStyle`` protocol.
    ///
    /// This changes the style of the page dots.
    ///
    /// See ``IndexViewStyle`` and ``PageIndexViewStyle`` for more info on
    /// the parameter.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         TabView {
    ///             Text("Page 1️⃣")
    ///             Color.pink
    ///         }
    ///         .tabViewStyle(.page)
    ///         .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif that flips back and forth between the two pages of a TabView,
    /// one reading "Page 1️⃣" and the other fully pink, as reflected by the page
    /// index indicators at the bottom of the page.](index-view-style-ex.gif)
    ///
    /// - Parameter style: The ``IndexViewStyle`` style to apply to this view.
    public func indexViewStyle<S>(_ style: S) -> some View where S : IndexViewStyle { }

}

