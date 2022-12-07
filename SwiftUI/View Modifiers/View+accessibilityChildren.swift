@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Replaces one or more accessibility elements for this view with new
    /// accessibility elements.
    ///
    /// You can make controls accessible by using a custom style. For example, a custom
    /// ``ToggleStyle`` that you create inherits the accessibility features of ``Toggle``
    /// automatically. When you can't use the parent view's accessibility elements, use the
    /// `accessibilityRepresentation(representation:)`
    /// modifier instead. This modifier replaces default accessibility elements with different accessibility
    /// elements that you provide. You use synthetic, non-visual accessibility elements to represent
    /// what the view displays.
    ///
    /// The example below makes a custom adjustable control accessible by explicitly
    /// defining the representation of its step increments using a ``Slider``:
    ///
    ///     var body: some View {
    ///         VStack {
    ///             SliderTrack(...) // Custom slider implementation.
    ///         }
    ///         .accessibilityRepresentation {
    ///             Slider(value: $value, in: 0...100) {
    ///                 Text("Label")
    ///             }
    ///         }
    ///     }
    ///
    /// SwiftUI hides the view that you provide in the `representation` closure
    /// and makes it non-interactive. The framework uses it only to
    /// generate accessibility elements.
    ///
    /// - Parameter representation: A hidden view that the accessibility
    ///   system uses to generate accessibility elements.
    ///
    public func accessibilityRepresentation<V>(@ViewBuilder representation: () -> V) -> some View where V : View { }


    /// Replaces the existing accessibility element's children with one or
    /// more new synthetic accessibility elements.
    ///
    /// Use this modifier to replace an existing element's children with one
    /// or more new synthetic accessibility elements you provide. This allows
    /// for synthetic, non-visual accessibility elements to be set as children
    /// of a visual accessibility element.
    ///
    /// SwiftUI creates an accessibility container implicitly when needed.
    /// If an accessibility element already exists, the framework converts it
    /// into an accessibility container.
    ///
    /// In the  example below, a ``Canvas`` displays a graph of vertical bars that don't have any
    /// inherent accessibility elements. You make the view accessible by adding
    /// the ``accessibilityChildren(children:)`` modifier with views whose accessibility
    /// elements represent the values of each bar drawn in the canvas:
    ///
    ///     var body: some View {
    ///         Canvas { context, size in
    ///             // Draw Graph
    ///             for data in dataSet {
    ///                 let path = Path(
    ///                     roundedRect: CGRect(
    ///                         x: (size.width / CGFloat(dataSet.count))
    ///                         * CGFloat(data.week),
    ///                         y: 0,
    ///                         width: size.width / CGFloat(dataSet.count),
    ///                         height: CGFloat(data.lines),
    ///                     cornerRadius: 5)
    ///                 context.fill(path, with: .color(.blue))
    ///             }
    ///             // Draw Axis and Labels
    ///             ...
    ///         }
    ///         .accessibilityLabel("Lines of Code per Week")
    ///         .accessibilityChildren {
    ///             HStack {
    ///                 ForEach(dataSet) { data in
    ///                     RoundedRectangle(cornerRadius: 5)
    ///                         .accessibilityLabel("Week \(data.week)")
    ///                         .accessibilityValue("\(data.lines) lines")
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// SwiftUI hides any views that you provide with the `children` parameter,
    /// then the framework uses the views to generate the accessibility elements.
    ///
    /// - Parameter children: A ``ViewBuilder`` that represents the replacement
    ///   child views the framework uses to generate accessibility elements.
    public func accessibilityChildren<V>(@ViewBuilder children: () -> V) -> some View where V : View { }

}

