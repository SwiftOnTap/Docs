@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that calls a function whenever a value is received by a publisher.
    ///
    /// ```
    /// struct ReceiverView: View {
    ///     let timer = Timer.publish(every: 1.0, on: .main, in: .default).autoconnect()
    ///
    ///     @State var time = ""
    ///
    ///     var body: some View {
    ///         Text(time)
    ///             .onReceive(timer) { t in time = String(describing: t) }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - publisher: The publisher to subscribe to.
    ///   - action: The action to perform when an event is emitted by
    ///     `publisher`. The event emitted by publisher is passed as a
    ///     parameter to `action`.
    ///
    /// - Returns: A view that triggers `action` when `publisher` emits an
    ///   event.
    @inlinable public func onReceive<P>(_ publisher: P, perform action: @escaping (P.Output) -> Void) -> some View where P : Publisher, P.Failure == Never { }

}

