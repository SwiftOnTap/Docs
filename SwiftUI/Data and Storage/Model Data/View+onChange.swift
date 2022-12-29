@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Adds a modifier for this view that fires an action when a specific
    /// value changes.
    ///
    /// You can use `onChange` to trigger a side effect as the result of a
    /// value changing, such as an ``Environment`` key or a ``Binding``.
    ///
    /// `onChange` is called on the main thread. Avoid performing long-running
    /// tasks on the main thread. If you need to perform a long-running task in
    /// response to `value` changing, you should dispatch to a background queue.
    ///
    /// The new value is passed into the closure. The previous value may be
    /// captured by the closure to compare it to the new value.
    ///
    ///     struct ContentView: View {
    ///         @State private var name = ""
    ///         @State private var greeting = "Hi there!"
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Text(greeting)
    ///                 TextField("Enter your name:", text: $name)
    ///                     .onChange(of: name) { newValue in
    ///                         greeting = "Hi \(newValue)!"
    ///                     }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a text field with a text view above it that reads
    /// "Hi !" before anything is entered in the field. Once the text is changed,
    /// onChange renders the text view such that the name is put between "Hi" and
    /// the exclamation point.](on-change-perform-ex1.gif)
    ///
    /// - Parameters:
    ///   - value: The value to check against when determining whether
    ///     to run the closure.
    ///   - action: A closure to run when the value changes.
    ///   - newValue: The new value that failed the comparison check.
    ///
    /// - Returns: A view that fires an action when the specified value changes.
    @inlinable public func onChange<V>(of value: V, perform action: @escaping (V) -> Void) -> some View where V : Equatable { }

}

