@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the environment value of the specified key path to the given value.
    ///
    /// Use this modifier to set one of the writable properties of the
    /// ``EnvironmentValues`` structure, including custom values that you
    /// create. For example, you can set the value associated with the
    /// ``EnvironmentValues/truncationMode`` key:
    ///
    ///     struct ParentView: View {
    ///         var body: some View {
    ///             ChildView()
    ///                 .environment(\.truncationMode, .head)
    ///         }
    ///     }
    ///
    /// You then read the value inside `ChildView` or one of its descendants
    /// using the ``Environment`` property wrapper:
    ///
    ///     struct ChildView: View {
    ///         @Environment(\.truncationMode) var truncationMode
    ///
    ///         let working = "Environment 🌳 in SwiftUI works!"
    ///         let broken = "SwiftUI broke again 🤦"
    ///
    ///         var body: some View {
    ///             Text(truncationMode == .head ? working : broken)
    ///         }
    ///     }
    ///
    /// ![A white child view displaying the text "Environment 🌳 in SwiftUI works!"](environment.png)
    ///
    /// SwiftUI provides dedicated view modifiers for setting most
    /// environment values, like the ``View/truncationMode(_:)``
    /// modifier which sets the ``EnvironmentValues/truncationMode`` value:
    ///
    ///     struct ParentView: View {
    ///         var body: some View {
    ///             ChildView()
    ///                 .truncationMode(.head)
    ///         }
    ///     }
    ///
    /// Prefer the dedicated modifier when available, and offer your own when
    /// defining custom environment values, as described in
    /// ``EnvironmentKey``.
    ///
    /// The ``View/environment(_:_:)`` modifier affects the given view,
    /// as well as that view's descendant views. It has no effect
    /// outside the view hierarchy on which you call it.
    ///
    /// This is actually how SwiftUI is able to create modifiers that get
    /// passed through the environment instead of being applied to a specific
    /// view. You can apply this technique in your own views as well.
    /// To illustrate, see this demonstration using truncation mode from above:
    ///
    /// ```
    /// struct ChildView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("This is a long 🛹 piece of text 💬 to demonstrate environment")
    ///                 .lineLimit(1)
    ///                 .environment(\.truncationMode, .head)
    ///             Text("This is a long 🛹 piece of text 💬 to demonstrate environment")
    ///                 .lineLimit(1)
    ///                 .truncationMode(.head)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A white child view displaying two of the same head-truncated lines of text, which read "...of text 💬 to demonstrate environment", within a VStack.](environment-modifier.png)
    ///
    /// - Parameters:
    ///   - keyPath: A key path that indicates the property of the
    ///     ``EnvironmentValues`` structure to update.
    ///   - value: The new value to set for the item specified by `keyPath`.
    ///
    /// - Returns: A view that has the given value set in its environment.
    @inlinable public func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> some View { }

}

