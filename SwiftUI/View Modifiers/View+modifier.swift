@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that applies a modifier to a view and returns a new view.
    ///
    /// Whenever you reuse a bunch of view modifiers together, it's a good idea
    /// to encapsulate them by creating a new ``ViewModifier``. Then, call that
    /// new modifier using this.
    ///
    /// Use this modifier to combine a ``View`` and a ``ViewModifier``, to
    /// create a new view. For example, if you create a view modifier for
    /// a new kind of caption with blue text surrounded by a rounded rectangle:
    ///
    ///     struct BorderedCaption: ViewModifier {
    ///         func body(content: Content) -> some View {
    ///             content
    ///                 .font(.caption2)
    ///                 .padding(10)
    ///                 .overlay(
    ///                     RoundedRectangle(cornerRadius: 15)
    ///                         .stroke(lineWidth: 1)
    ///                 )
    ///                 .foregroundColor(Color.blue)
    ///         }
    ///     }
    ///
    /// You can use ``View/modifier(_:)`` to extend ``View`` to create new modifier
    /// for applying the `BorderedCaption` defined above:
    ///
    ///     extension View {
    ///         func borderedCaption() -> some View {
    ///             modifier(BorderedCaption())
    ///         }
    ///     }
    ///
    /// Then you can apply the bordered caption to any view:
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Image(systemName: "bus")
    ///                 .resizable()
    ///                 .frame(width:50, height:50)
    ///             Text("Downtown Bus")
    ///                 .borderedCaption()
    ///         }
    ///     }
    ///
    /// ![A screenshot showing the image of a bus with a caption reading
    /// Downtown Bus. A view extension, using custom a modifier, renders the
    /// caption in blue text surrounded by a rounded rectangle.](SwiftUI-View-ViewModifier.png)
    ///
    /// - Parameter modifier: The modifier to apply to this view.
    @inlinable public func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> { }
}

