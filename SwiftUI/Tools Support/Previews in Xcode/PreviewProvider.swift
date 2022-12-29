/// A protocol that generates previews on the right-hand side of Xcode.
///
/// Xcode statically discovers types that conform to the `PreviewProvider`
/// protocol in your app, and generates previews for each provider it discovers.
///
/// For example, to have Xcode render a preview of a simple view:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Circle()
///             .fill(Color.green)
///     }
/// }
///
/// struct ExampleViewPreview: PreviewProvider {
///     static var previews: some View {
///         ExampleView()
///     }
///
///     static var platform: PreviewPlatform? {
///         .iOS
///     }
/// }
/// ```
///
/// ![Preview provider example 1](previewprovider-example-1.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PreviewProvider : _PreviewProvider { }
extension PreviewProvider : _PreviewProvider {

    /// The type to preview.
    associatedtype Previews : View

    /// Generates a collection of previews.
    ///
    /// The following code shows how to create a preview provider that previews
    /// a view called `MyView` for iPhone X:
    ///
    ///     struct MyPreviews : PreviewProvider {
    ///         static var previews: some View {
    ///             MyView()
    ///                 .previewDevice("iPhone X")
    ///         }
    ///     }
    @ViewBuilder static var previews: Self.Previews { get }

    /// The platform on which to run the provider.
    ///
    /// If the preview provider returns `nil` for this property, Xcode infers
    /// the platform based on the file in which the ``PreviewProvider`` is
    /// defined. Return `nil` only when the file is in a target that supports
    /// multiple platforms.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("I am in a watch! ⌚️")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///     }
    ///
    ///     static var platform: PreviewPlatform? { .watchOS }
    /// }
    /// ```
    static var platform: PreviewPlatform? { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreviewProvider {

    /// The platform on which to run the provider.
    ///
    /// If the preview provider returns `nil` for this property, Xcode infers
    /// the platform based on the file in which the ``PreviewProvider`` is
    /// defined. Return `nil` only when the file is in a target that supports
    /// multiple platforms.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("I am in a watch! ⌚️")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///     }
    ///
    ///     static var platform: PreviewPlatform? { .watchOS }
    /// }
    /// ```
    public static var platform: PreviewPlatform? { get }
}
