/// A configuration of a menu.
///
/// Use this type in ``MenuStyle/makeBody(configuration:)`` to create
/// your own custom ``MenuStyle``. The parameter passed to `makeBody(configuration:)`
/// is of type `MenuStyleConfiguration`.
///
/// For example, the following code creates a new, custom style that adds a red
/// border to the current menu style:
///
///     struct RedBorderMenuStyle : MenuStyle {
///         func makeBody(configuration: MenuStyleConfiguration) -> some View {
///             Menu(configuration)
///                 .border(Color.red)
///         }
///     }
///
/// You can then apply the style to a ``Menu`` using the
/// ``View/menuStyle(_:)`` view modifier:
///
///     strut ContentView: View {
///         var body: some View {
///             Menu {
///                 Button("Open in Preview", action: { })
///                 Button("Save as PDF", action: { })
///             } label: {
///                 Image(systemName: "doc")
///                 Text("PDF")
///             }
///             .menuStyle(RedBorderMenuStyle())
///         }
///     }
///
/// ![A gif with a button in the center of the screen that reads "PDF" with
/// the system doc image preceding it, all surrounded by a rectangular red border,
/// which holds down to reveal a menu with two options: Save as PDF or Open in Preview
/// box as rendered by passing BorderlessButtonMenuStyle to the modifier.](menu-init-ex.gif
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct MenuStyleConfiguration {

    /// A type-erased label of a menu.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A type-erased content of a menu.
    public struct Content : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }
}

