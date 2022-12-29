/// A container view that displays semantically-related controls
/// in a visually-appropriate manner for the context
///
/// You can provide an optional label to this view that describes its children.
/// This view may be used in different ways depending on the surrounding
/// context. For example, when you place the control group in a
/// toolbar item, SwiftUI uses the label when the group is moved to the
/// toolbar's overflow menu.
///
///     ContentView()
///         .toolbar(id: "items") {
///             ToolbarItem(id: "media") {
///                 ControlGroup {
///                     MediaButton()
///                     ChartButton()
///                     GraphButton()
///                 } label: {
///                     Label("Plus", systemImage: "plus")
///                 }
///             }
///         }
///
@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ControlGroup<Content> : View where Content : View {

    /// Creates a new ControlGroup with the specified children
    ///
    /// - Parameters:
    ///   - content: the children to display
    public init(@ViewBuilder content: () -> Content) { }

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = some View
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ControlGroup where Content == ControlGroupStyleConfiguration.Content {

    /// Creates a control group based on a style configuration.
    ///
    /// Use this initializer within the
    /// ``ControlGroupStyle/makeBody(configuration:)`` method of a
    /// ``ControlGroupStyle`` instance to create an instance of the control group
    /// being styled. This is useful for custom control group styles that modify
    /// the current control group style.
    ///
    /// For example, the following code creates a new, custom style that places a
    /// red border around the current control group:
    ///
    ///     struct RedBorderControlGroupStyle: ControlGroupStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             ControlGroup(configuration)
    ///                 .border(Color.red)
    ///         }
    ///     }
    ///
    public init(_ configuration: ControlGroupStyleConfiguration) { }
}

@available(iOS 16.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ControlGroup {

    /// Creates a new control group with the specified content and a label.
    ///
    /// - Parameters:
    ///   - content: The content to display.
    ///   - label: A view that describes the purpose of the group.
    public init<C, L>(@ViewBuilder content: () -> C, @ViewBuilder label: () -> L) where Content == LabeledControlGroupContent<C, L>, C : View, L : View { }
}

