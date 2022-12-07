/// A type that represents part of your app's user interface and provides
/// modifiers that you use to configure views.
///
/// Conform to this protocol in order to organize an app's UI into customizable,
/// related parts.
///
/// ### `View` Conformance
///
/// You create custom views by declaring types that conform to the ``View``
/// protocol.
///
/// #### Requirements
///
/// Implement the required ``View/body-swift.variable`` computed
/// property to provide the content for your custom view.
///
///     struct ContentView: View {
///         var body: some View {
///             Text("Hello, World!")
///         }
///     }
///
/// ![A custom view that reads "Hello, World!" in the center of the screen.](view-simple.png)
///
/// ### Using `View`
///
/// Assemble the view's body by combining one or more of the primitive views
/// provided by SwiftUI, like the ``Text`` instance in the example above, plus
/// other custom views that you define, into a hierarchy of views.
///
/// ### Default Implementations
///
/// The ``View`` protocol provides a large set of modifiers, defined as protocol
/// methods with default implementations, that you use to position and configure
/// views in the layout of your app. Modifiers typically work by wrapping the
/// view instance on which you call them in another view with the specified
/// characteristics. For example, adding the ``View/opacity(_:)`` modifier to a
/// text view returns a new view with some amount of transparency:
///
///     struct ContentView: View {
///         var body: some View {
///             Text("Hello, World!")
///                 .opacity(0.5) // Display partially transparent text.
///         }
///     }
///
/// ![A custom view that reads "Hello, World!" in the center of the screen
/// with an opacity modifier applied to make the text a lighter grey color, rather
/// than black.](view-simple.png)
///
/// The effects of a modifier typically propagate to any child views that don't
/// explicitly override the modifier. For example, a ``VStack`` instance on its
/// own acts only to vertically stack other views, and has no text to display.
/// Therefore, a ``View/font(_:)`` modifier that you apply to the stack has no
/// effect on the stack itself. Yet the font modifier does apply to any of the
/// stack's child views, some of which might display text. On the other hand,
/// you can locally override the stack's modifier by adding another to a
/// specific child view:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         VStack {
///             Text("Title")
///                 .font(.headline) // Override the font of this one view.
///             Text("First body line.")
///             Text("Second body line.")
///         }
///         .font(.body) // Set a default for text in the stack.
///     }
/// }
/// ```
///
/// ![A screenshot of three text views in a VStack, where the second and third
/// are displayed in body font, but the first has a modifier applied directly
/// to render it in headline font.](view-modfont.png)
///
/// You commonly chain modifiers, each wrapping the result of the previous one.
/// For example, you can wrap a text view in an invisible box with a given width
/// using the ``View/frame(width:height:alignment:)`` modifier to influence its
/// layout, and then use the ``View/border(_:width:)`` modifier to draw an
/// outline around that:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Text("Title")
///             .frame(width: 100)
///             .border(Color.gray)
///     }
/// }
/// ```
///
/// ![A screenshot of a text view displaying the string "Title", outlined by a
/// gray rectangle that's wider than the string it encloses, leaving empty space
/// inside the rectangle on either side of the string.](view-chain.png)
///
/// The order in which you apply modifiers matters. For example, the border that
/// results from the above code outlines the full width of the frame. If you
/// instead apply the border first, it outlines the text view, which
/// never takes more space than it needs to render its contents.
/// Wrapping that view in another invisible one with a fixed 100 point width
/// affects the layout of the composite view, but has no effect on the border.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Text("Title")
///             .border(Color.gray) //apply the border first this time
///             .frame(width: 100)
///     }
/// }
/// ```
///
/// ![A screenshot of a text view displaying the string "Title", outlined by a
/// gray rectangle that properly contains it, leaving no empty space
/// inside the rectangle on either side of the string.](view-border.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol View { }
extension View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    associatedtype Body : View

    /// The content and behavior of the view.
    @ViewBuilder var body: Self.Body { get }
}

