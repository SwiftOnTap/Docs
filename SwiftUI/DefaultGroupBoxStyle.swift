/// The default ``GroupBoxStyle``.
///
///     struct ExampleView: View {
///         var body: some View {
///             GroupBox(label: BananaLabel()) {
///                 Text("Go Bananas")
///             }
///             .padding()
///         }
///     }
///
///     struct BananaLabel: View {
///         var body: some View {
///             Label("Banana 🍌🍌", systemImage: "heart.fill")
///                 .foregroundColor(.yellow)
///                 .groupBoxStyle(DefaultGroupBoxStyle())
///         }
///     }
///
/// ![A default group box view containing a label with a heart that reads "Banana 🍌🍌" followed underneath by a text view which says "Go Bananas".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/default-groupboxstyle-example-1.png)
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultGroupBoxStyle : GroupBoxStyle {

    /// Creates a default group box style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         GroupBox(label: BananaLabel()) {
    ///             Text("Go Bananas")
    ///         }
    ///         .padding()
    ///     }
    /// }
    ///
    /// struct BananaLabel: View {
    ///     var body: some View {
    ///         Label("Bananas 🍌🍌", systemImage: "heart.fill")
    ///             .foregroundColor(.yellow)
    ///             .groupBoxStyle(DefaultGroupBoxStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![DefaultGroupBoxStyle Example 1](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/default-groupboxstyle-example-1.png)
    ///
    /// Check out ``GroupBoxStyle`` for more.
    public init() { }

    /// Creates a `View` representing the body of a ``GroupBox``.
    ///
    /// - Parameter configuration: The properties of the group box instance being
    ///   created.
    ///
    /// This method will be called for each instance of ``GroupBox`` created within
    /// a view hierarchy where this style is the current ``GroupBoxStyle``.
    public func makeBody(configuration: DefaultGroupBoxStyle.Configuration) -> some View { }


    /// A `View` representing the body of a ``GroupBox``.
    public typealias Body = some View
}

