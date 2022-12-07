/// A modifier that you apply to a view or another view modifier, producing a
/// new view.
///
/// Conform to the ``ViewModifier`` protocol when you want to create a reusable
/// modifier that you can apply to any view. The example below combines several
/// modifiers to create a new modifier that you can use to create blue caption
/// text surrounded by a rounded rectangle:
///
/// ```
/// struct BorderedCaption: ViewModifier {
///     func body(content: Content) -> some View {
///         content
///             .font(.caption2)
///             .padding(10)
///             .overlay(
///                 RoundedRectangle(cornerRadius: 15)
///                     .stroke(lineWidth: 1)
///             )
///             .foregroundColor(Color.blue)
///     }
/// }
///
/// struct ExampleView: View {
///     var body: some View {
///         VStack {
///             Text("Text without blue border")
///             Text("Text with blue border")
///                 .modifier(BorderedCaption())
///         }
///     }
/// }
/// ```
///
/// ![A screenshot displaying two lines of text in a VStack.
/// A custom modifier applied directly to the view renders the second line in
/// blue text surrounded by a rounded rectangle.](8786B2B4-A365-445D-96AB-DE5D5BD9F897.png)
///
/// You can apply ``View/modifier(_:)`` directly to a view, but a more common and
/// idiomatic approach uses ``View/modifier(_:)`` to define an extension to
/// ``View`` itself that incorporates the view modifier:
///
///     extension View {
///         func borderedCaption() -> some View {
///             modifier(BorderedCaption())
///         }
///     }
///
/// You can then apply the bordered caption to any view, similar to this:
///
///     struct BusView: View {
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
/// Downtown Bus. A view extension, using a custom modifier, renders the
///  caption in blue text surrounded by a rounded
///  rectangle.](SwiftUI-View-ViewModifier.png)
///
/// Note: The ``View/modifier(_:)`` only accepts a single modifier as a parameter.
/// In order to use multiple modifiers on a single view, see ``ViewModifier/concat(_:)``
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ViewModifier { }
extension ViewModifier {

    /// The type of view representing the body.
    associatedtype Body : View

    /// Gets the current body of the caller.
    ///
    /// Implement this function to create your own custom
    /// ``ViewModifier``.
    ///
    /// The `content` parameter is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it. In simpler terms, `content` is the
    /// view that is being transformed. For example:
    ///
    /// ```
    /// struct BorderedCaption: ViewModifier {
    ///     func body(content: Content) -> some View {
    ///         content
    ///             .font(.caption2)
    ///             .padding(10)
    ///             .overlay(
    ///                 RoundedRectangle(cornerRadius: 15)
    ///                     .stroke(lineWidth: 1)
    ///             )
    ///             .foregroundColor(.blue)
    ///     }
    /// }
    /// ```
    ///
    /// This modifier can then be applied to a ``View``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Text without bordered caption")
    ///
    ///             Text("Text with bordered caption")
    ///                 .modifier(BorderedCaption())
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of two text views in a VStack in the center of the screen;
    /// the first reads "Text without bordered caption" in normal black text,
    /// while the second on bottom has a rounded blue border and reads "Text
    /// with bordered caption" in smaller blue text.](viewmodifier-body.png)
    ///
    /// - Parameter content: The view to be modified.
    ///
    /// - Returns: A modified view
    ///
    func body(content: Self.Content) -> Self.Body { }

    /// The content view type passed to `body()`.
    typealias Content
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewModifier where Self.Body == Never {

    /// Gets the current body of the caller.
    ///
    /// Implement this function to create your own custom
    /// ``ViewModifier``.
    ///
    /// The `content` parameter is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it. In simpler terms, `content` is the
    /// view that is being transformed. For example:
    ///
    /// ```
    /// struct BorderedCaption: ViewModifier {
    ///     func body(content: Content) -> some View {
    ///         content
    ///             .font(.caption2)
    ///             .padding(10)
    ///             .overlay(
    ///                 RoundedRectangle(cornerRadius: 15)
    ///                     .stroke(lineWidth: 1)
    ///             )
    ///             .foregroundColor(.blue)
    ///     }
    /// }
    /// ```
    ///
    /// This modifier can then be applied to a ``View``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Text without bordered caption")
    ///
    ///             Text("Text with bordered caption")
    ///                 .modifier(BorderedCaption())
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of two text views stacked in the center of the screen;
    /// the first reads "Text without bordered caption" in normal black text,
    /// while the second on bottom has a rounded blue border and reads "Text
    /// with bordered caption" in smaller blue text.](viewmodifier-body.png)
    ///
    /// - Parameter content: The view to be modified.
    ///
    /// - Returns: A modified view
    ///
    public func body(content: Self.Content) -> Self.Body { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewModifier {

    /// Returns a new modifier that is the result of concatenating
    /// `self` with `modifier`.
    ///
    /// This allows you to chain multiple custom modifiers on a view.
    /// The ``View/modifier(_:)`` only accepts a single modifier as a parameter, which
    /// is why concat is needed. For example:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Text without blue border and padded shadow")
    ///             Text("Text with blue border and padded shadow")
    ///                 .modifier(BorderedCaption().concat(PaddedShadow()))
    ///         }
    ///     }
    /// }
    ///
    /// struct BorderedCaption: ViewModifier {
    ///     func body(content: Content) -> some View {
    ///         content
    ///             .font(.caption2)
    ///             .padding(10)
    ///             .overlay(
    ///                 RoundedRectangle(cornerRadius: 15)
    ///                     .stroke(lineWidth: 1)
    ///             )
    ///             .foregroundColor(Color.blue)
    ///     }
    /// }
    ///
    /// struct PaddedShadow: ViewModifier {
    ///     func body(content: Content) -> some View {
    ///         content
    ///             .padding(50)
    ///             .shadow(color: .blue, radius: 10)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of two text views stacked in the center of the screen; the first is in normal black text, while the second on bottom has a rounded blue border and a padded shadow.](view-modifier-concat-example-1.png)
    ///
    @inlinable public func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewModifier {

    /// Returns a new version of the modifier that will apply the
    /// transaction mutation function `transform` to all transactions
    /// within the modifier.
    @inlinable public func transaction(_ transform: @escaping (inout Transaction) -> Void) -> some ViewModifier { }


    /// Returns a new version of the modifier that will apply
    /// ``animation`` to all animatable values within the modifier.
    @inlinable public func animation(_ animation: Animation?) -> some ViewModifier { }

}

