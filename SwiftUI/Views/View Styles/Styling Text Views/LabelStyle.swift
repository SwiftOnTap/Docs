/// A protocol for creating styles for Label views.
///
/// Use this protocol to create a label style that can easily be reused, or
/// to quickly implement one of the built-in label styles. These can all be applied
/// to a `Label` with the ``View/labelStyle(_:)`` modifier.
///
/// ### Styling a ``Label`` with a `LabelStyle`
///
/// There are two ways to style a ``Label``:
/// - By creating a `struct` that
/// conforms to this protocol.
/// - By using a default `struct` that conforms
/// to this protocol.
///
/// #### Creating Your Own `LabelStyle`
///
/// To create your own label style by conforming to the `LabelStyle` protocol,
/// there is only one required
/// function: ``LabelStyle/makeBody(configuration:)``.
///
/// ``LabelStyle/makeBody(configuration:)`` is a function that takes in a
/// ``LabelStyleConfiguration`` parameter and expects `some View`
/// to be returned. So what is a ``LabelStyleConfiguration``? Basically,
/// just like a ``Label``, it's an ``LabelStyleConfiguration/icon-swift.variable`` and
/// a ``LabelStyleConfiguration/title-swift.variable``.
///
/// ```
/// struct MyLabelStyle: LabelStyle {
///     let color: Color
///
///     func makeBody(configuration: Configuration) -> some View {
///         VStack {
///             configuration.title
///             configuration.icon
///                 .foregroundColor(color)
///         }
///     }
/// }
/// ```
///
/// This label style does two things: it stacks the title and icon vertically,
/// and colors the icon. See below for how to use this custom label style.
///
/// #### Built-in `LabelStyle` Structures
///
/// If you don't want to create your own label style, there are 3 default
/// styles. These are `struct`s that conform to the `LabelStyle` protocol
/// by implementing the ``LabelStyle/makeBody(configuration:)`` function
/// internally, so you don't have to do it yourself.
///
/// These are the default styles:
/// - ``DefaultLabelStyle``, which displays the ``Label`` as-is
/// - ``IconOnlyLabelStyle``, which displays the icon only
/// - ``TitleOnlyLabelStyle``, which displays the title only
///
/// All 3 styles have only one initializer, which takes no parameters.
/// See below for how to use them.
///
/// ### Using a `LabelStyle`
///
/// To use a `LabelStyle`, pass it to a ``Label``'s ``View/labelStyle(_:)``
/// modifier.
///
/// Here is an example that uses our custom label style from earlier:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack {
///             Label("Banana", systemImage: "suit.heart.fill")
///                 .labelStyle(MyLabelStyle(color: .yellow))
///             Label("Apple", systemImage: "suit.heart.fill")
///                 .labelStyle(MyLabelStyle(color: .red))
///         }
///         .font(.title)
///     }
/// }
/// ```
///
/// ![A screenshot displaying two custom labels in a VStack that read "Banana"
/// and "Apple," each with a heart emoji underneath it corresponding to the color
/// defined in the label style.](custom-labelstyle-comparison.png)
///
/// And here is a comparison of the 3 built-in label styles:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack {
///             Label("Banana", systemImage: "suit.heart.fill")
///                 .labelStyle(DefaultLabelStyle())
///             Label("Banana", systemImage: "suit.heart.fill")
///                 .labelStyle(IconOnlyLabelStyle())
///             Label("Banana", systemImage: "suit.heart.fill")
///                 .labelStyle(TitleOnlyLabelStyle())
///         }
///         .font(.title)
///     }
/// }
/// ```
///
/// ![A screenshot displaying three default labels in a VStack that read "Banana"
/// with a black heart icon to its left, a black heart icon by itself, and
/// "Banana" by itself. These displays are dictated by their corresponding
/// label styles, which render them differently in each case.](default-labelstyle-comparison.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol LabelStyle { }
extension LabelStyle {

    /// A view that represents the body of a label.
    associatedtype Body : View

    /// Creates a view that represents the body of a label.
    ///
    /// Implement this function to conform to the ``LabelStyle`` protocol,
    /// which allows you to create reusable label styles.
    ///
    /// ``LabelStyle/makeBody(configuration:)`` is a function that takes in a
    /// ``LabelStyleConfiguration`` parameter and expects `some View`
    /// to be returned. So what is a ``LabelStyleConfiguration``? Basically,
    /// just like a ``Label``, it's an ``LabelStyleConfiguration/icon`` and
    /// a ``LabelStyleConfiguration/title``.
    ///
    /// Here's an example of a `struct` called `MyLabelStyle` that
    /// conforms to the ``LabelStyle`` protocol by implementing the
    /// ``LabelStyle/makeBody(configuration:)`` function:
    ///
    /// ```
    /// struct MyLabelStyle: LabelStyle {
    ///     let color: Color
    ///
    ///     func makeBody(configuration: Configuration) -> some View {
    ///         VStack {
    ///             configuration.title
    ///             configuration.icon
    ///                 .foregroundColor(color)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// This label style does two things: it stacks the title and icon vertically,
    /// and colors the icon. See below for how to use this custom label style.
    ///
    /// To use a ``LabelStyle``, pass it to a ``Label``'s ``View/labelStyle(_:)``
    /// modifier:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Label("Banana", systemImage: "suit.heart.fill")
    ///                 .labelStyle(MyLabelStyle(color: .yellow))
    ///             Label("Apple", systemImage: "suit.heart.fill")
    ///                 .labelStyle(MyLabelStyle(color: .red))
    ///         }
    ///         .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two custom labels in a VStack that read "Banana"
    /// and "Apple," each with a heart emoji underneath it corresponding to the color
    /// defined in the custom label style.](custom-labelstyle-comparison.png)
    ///
    /// - Note: Any ``LabelStyle`` must implement this function. That means
    /// that even the default styles like ``TitleOnlyLabelStyle`` and
    /// ``IconOnlyLabelStyle`` implement this function internally.
    ///
    /// - Parameter configuration: The properties of the label.
    func makeBody(configuration: Self.Configuration) -> Self.Body { }

    /// The properties of a label.
    ///
    /// This is the type passed as a parameter to the required
    /// ``LabelStyle/makeBody(configuration:)`` function.
    /// See ``LabelStyleConfiguration`` to learn about the properties
    /// of a label style configuration.
    typealias Configuration = LabelStyleConfiguration
}

