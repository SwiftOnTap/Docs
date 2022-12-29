@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the unique tag value of this view.
    ///
    /// Use ``View/tag(_:)`` to differentiate between a number of views for the purpose
    /// of selecting controls like pickers and lists. Tag values can be of any
    /// type that conforms to the [Hashable](https://developer.apple.com/documentation/swift/hashable)
    /// protocol.
    ///
    /// [[tabview-tag]]
    ///
    /// In the example below, the `ForEach` loop in the ``Picker`` view
    /// builder iterates over the `Flavor` enumeration. It extracts the text raw
    /// value of each enumeration element for use as the row item label and uses
    /// the enumeration item itself as input to the ``View/tag(_:)`` modifier.
    /// The tag identifier can be any value that conforms to the
    /// [Hashable](https://developer.apple.com/documentation/swift/hashable) protocol:
    ///
    ///     struct FlavorPicker: View {
    ///         enum Flavor: String, CaseIterable, Identifiable {
    ///             var id: String { self.rawValue }
    ///             case vanilla, chocolate, strawberry
    ///         }
    ///
    ///         @State private var selectedFlavor: Flavor? = nil
    ///         var body: some View {
    ///             Picker("Flavor", selection: $selectedFlavor) {
    ///                 ForEach(Flavor.allCases) {
    ///                     Text($0.rawValue).tag($0)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif that spins through a wheel style picker with three options,
    /// vanilla, chocolate, and strawberry, all derived from the same enum and
    /// tagged with raw values.](view-tag-flavor.gif)
    ///
    /// - Parameter tag: A [Hashable](https://developer.apple.com/documentation/swift/hashable) value
    ///   to use as the view's tag.
    ///
    /// - Returns: A view with the specified tag set.
    @inlinable public func tag<V>(_ tag: V) -> some View where V : Hashable { }

}

