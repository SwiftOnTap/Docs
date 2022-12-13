extension View {

    /// Modifies this view by injecting a value that you provide for use by
    /// other views whose state depends on the focused view hierarchy.
    ///
    /// - Parameters:
    ///   - keyPath: The key path to associate `value` with when adding
    ///     it to the existing table of exported focus values.
    ///   - value: The focus value to export.
    /// - Returns: A modified representation of this view.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public func focusedValue<Value>(_ keyPath: WritableKeyPath<FocusedValues, Value?>, _ value: Value) -> some View { }
    
    /// Modifies this view by injecting a value that you provide for use by
    /// other views whose state depends on the focused scene.
    ///
    /// Use this method instead of ``View/focusedValue(_:_:)`` for values that
    /// must be visible regardless of where focus is located in the active
    /// scene. For example, if an app needs a command for moving focus to a
    /// particular text field in the sidebar, it could use this modifier to
    /// publish a button action that's visible to command views as long as the
    /// scene is active, and regardless of where focus happens to be in it.
    ///
    ///     struct Sidebar: View {
    ///         @FocusState var isFiltering: Bool
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 TextField(...)
    ///                     .focused(when: $isFiltering)
    ///                     .focusedSceneValue(\.filterAction) {
    ///                         isFiltering = true
    ///                     }
    ///             }
    ///         }
    ///     }
    ///
    ///     struct NavigationCommands: Commands {
    ///         @FocusedValue(\.filterAction) var filterAction
    ///
    ///         var body: some Commands {
    ///             CommandMenu("Navigate") {
    ///                 Button("Filter in Sidebar") {
    ///                     filterAction?()
    ///                 }
    ///             }
    ///             .disabled(filterAction == nil)
    ///         }
    ///     }
    ///
    ///     struct FilterActionKey: FocusedValuesKey {
    ///         typealias Value = () -> Void
    ///     }
    ///
    ///     extension FocusedValues {
    ///         var filterAction: (() -> Void)? {
    ///             get { self[FilterActionKey.self] }
    ///             set { self[FilterActionKey.self] = newValue }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - keyPath: The key path to associate `value` with when adding
    ///     it to the existing table of published focus values.
    ///   - value: The focus value to publish.
    /// - Returns: A modified representation of this view.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public func focusedSceneValue<T>(_ keyPath: WritableKeyPath<FocusedValues, T?>, _ value: T) -> some View { }

}

