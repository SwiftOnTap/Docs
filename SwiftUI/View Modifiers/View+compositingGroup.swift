@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that wraps this view in a compositing group.
    ///
    /// A compositing group makes compositing effects in this view's ancestor
    /// views, such as opacity and the blend mode, take effect before this view
    /// is rendered.
    ///
    /// Use `compositingGroup()` to apply effects to a parent view before
    /// applying effects to this view.
    ///
    /// In the example below the `compositingGroup()` modifier separates the
    /// application of effects into stages. It applies the ``View/opacity(_:)``
    /// effect to the ``VStack`` before the ``View/blur(radius:opaque:)`` effect is applied to the
    /// views inside the enclosed ``ZStack``. This limits the scope of the
    /// opacity change to the outermost view.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             ZStack {
    ///                 Text("CompositingGroup")
    ///                     .foregroundColor(.black)
    ///                     .padding(20)
    ///                     .background(Color.red)
    ///                 Text("CompositingGroup")
    ///                     .blur(radius: 2)
    ///             }
    ///             .font(.largeTitle)
    ///             .compositingGroup()
    ///             .opacity(0.9)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a red rectangle in the center of the screen and
    /// slightly blurred black text that reads "CompositingGroup."](compositinggroup.png)
    ///
    /// - Returns: A view that wraps this view in a compositing group.
    @inlinable public func compositingGroup() -> some View { }

}

