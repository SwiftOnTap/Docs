/// An empty, or identity, modifier, used during development to switch
/// modifiers at compile time.
///
/// Use the empty modifier to switch modifiers at compile time during
/// development. In the example below, in a debug build the ``Text``
/// view inside `ContentView` has a yellow background and a red border.
/// A non-debug build reflects the default system, or container supplied
/// appearance.
///
///     struct EmphasizedLayout: ViewModifier {
///         func body(content: Content) -> some View {
///             content
///                 .background(Color.yellow)
///                 .border(Color.red)
///         }
///     }
///
///     struct ContentView: View {
///         var body: some View {
///             Text("Hello, World!")
///                 .modifier(modifier)
///         }
///
///         var modifier: some ViewModifier {
///             #if DEBUG
///                 return EmphasizedLayout()
///             #else
///                 return EmptyModifier()
///             #endif
///         }
///     }
///
/// ![A view containing a text view reading "Hello, World!" and a ViewModifier
/// that returns either an outside custom ViewModifier or EmptyModifier; the
/// custom modifier is applied to the text view, resulting in "Hello, World!"
/// having a yellow background and red outline.](22.16.06.png)
///
/// In order to stack multiple modifiers, including the EmptyModifier, see
/// ``ViewModifier/concat(_:)``
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EmptyModifier : ViewModifier {

      /// A view modifier that leave the view unchanged.
    public static let identity: EmptyModifier

    /// The type of view representing the body.
    public typealias Body = Never

    /// Creates a new modifier that leaves the view unchanged.
    @inlinable public init() { }

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it. In simpler terms, content is the
    /// view that is being transformed and this function will return the view
    /// absent of any modifier transformations.
    public func body(content: EmptyModifier.Content) -> EmptyModifier.Body { }
}

