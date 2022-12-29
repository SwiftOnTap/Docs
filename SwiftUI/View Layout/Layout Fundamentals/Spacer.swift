/// A flexible empty view that expands to take up as much space as possible.
///
/// Spacers are commonly used inside of stacks, like ``VStack``, ``HStack``, and ``ZStack``.
/// In a stack, they take up as much space as possible, so push everything else to the side.
///
/// In the following ``HStack``, a spacer is used to align the text to the right:
///
/// ```
/// struct SpacerView: View {
///     var body: some View {
///         HStack {
///             Spacer()
///             Text("Ouch I'm crammed ➡️🤕")
///         }
///     }
/// }
/// ```
///
/// ![A screenshot displaying text reading "Ouch I'm crammed" which is pushed
/// up against the right side of the screen. Arranging the text in an HStack next
/// to a spacer places the text as far right as possible.](90EBB832-008C-455C-A969-28C1363B874C.png)
///
/// A spacer can also be framed to take a specific amount of space:
///
/// ```
/// struct SpacerView: View {
///     var body: some View {
///         VStack {
///             Spacer()
///             Text("I'm 15 points off the ground 😇")
///             Spacer()
///                 .frame(height: 15)
///         }
///     }
/// }
/// ```
///
/// ![A screenshot displaying text at the bottom of the screen that reads "I'm
/// 15 points off the ground." The text is arranged in a VStack sandwiched by a
/// spacer on either side, but the bottom spacer is framed to only take up 15 points.](C543EFB6-447B-452F-8928-102A3554A7FC.png)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Spacer {

    /// The minimum length the spacer will take up.
    ///
    /// If `nil`, the spacer will take up no space or the whole space, and its layout will be
    /// the last priority.
    ///
    /// This property is usually specified using ``Spacer/init(minLength:)``,
    /// but it can also be specified directly:
    ///
    /// ```
    /// struct SpacerMinLengthView: View {
    ///     @State private var spacer = Spacer()
    ///     var body: some View {
    ///         HStack {
    ///             spacer
    ///             Button("Cram!") { spacer.minLength = 300 }
    ///             Text("Ouch I'm crammed ➡️🤕")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a spacer in an HStack followed by a button that reads
    /// "Cram!" and a text view that reads "Ouch I'm crammed." The button action
    /// sets the minimum length of the spacer to 300 points, so when it is clicked,
    /// it pushes the text and button over to the right in order to fulfill its minimum length.](spacer-min-length-ex.gif)
    ///
    public var minLength: CGFloat?

    /// Creates a spacer view.
    ///
    /// A spacer is a flexible empty view that expands to take up as much space as possible.
    /// Spacers are commonly used inside of stacks, like ``VStack``, ``HStack``, and ``ZStack``.
    /// In a stack, they take up as much space as possible, so push everything else to the side.
    ///
    /// In the following ``HStack``, a spacer is used to align the text to the right:
    ///
    /// ```
    /// struct SpacerView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Spacer()
    ///             Text("Ouch I'm crammed ➡️🤕")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying text reading "Ouch I'm crammed" which is pushed
    /// up against the right side of the screen. Arranging the text in an HStack next
    /// to a spacer places the text as far right as possible.](spacer-init-1.png)
    ///
    /// Spacers ordinarily take up only as much space is left by other views. However,
    /// your spacer can also specify a minimum length:
    ///
    /// ```
    /// struct BigSpacerView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Spacer(minLength: 300)
    ///             Text("I'm REALLY crammed 😵")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view pushed all the way up against the
    /// right hand side of the screen that reads "I'm REALLY crammed." Setting the
    /// minimum length of the spacer makes it so that the text has to be pushed
    /// in order to fulfill the minimum length of the spacer.](spacer-init-2.png)
    ///
    /// - Parameter minLength: The minimum amount of space the spacer will take up.
    @inlinable public init(minLength: CGFloat? = nil) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Spacer : View {
}

