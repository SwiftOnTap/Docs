/// A view that arranges children on top of each other.
///
/// `ZStack` arranges views "into" and "out of" the screen. The result
/// is vies stacked on top of each other.
///
///     struct ExampleView: View {
///         var body: some View {
///             ZStack {
///                 Text("I am obscured by clouds")
///                 Text("☁️☁️☁️☁️")
///             }
///         }
///     }
///
/// ![A screenshot displaying two text views in a ZStack; the bottom layer is text
/// that reads "I am obscured by clouds," where the top layer is a set of cloud emojis
/// that obscure the text.](zstack.png)
///
/// Learn more about the properties of each alignment choice via the
/// ``Alignment`` struct.
///
/// `ZStack` uses a ``ViewBuilder`` to construct the content.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ZStack<Content> : View where Content : View {

    /// Creates a ZStack with the given alignment.
    ///
    /// See the ``Alignment`` struct for the 9 types of standard alignments.
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             ZStack {
    ///                 Text("I am obscured by clouds and rain")
    ///                 Text("☁️☁️☁️☁️")
    ///                 Text("💧💧💧💧")
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying two text views in a ZStack; the bottom layer is text
    /// that reads "I am obscured by clouds and rain," where the subsequent layers
    /// are a set of cloud and rain emojis that obscure the text.](zstack-2.png)
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack on both
    ///     axis.
    ///   - content: A view builder that creates the content of this stack.
    @inlinable public init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

