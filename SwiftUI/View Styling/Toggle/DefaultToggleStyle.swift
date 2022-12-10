/// The default toggle style.
///
/// If you create a toggle directly on a blank canvas, the default toggle style varies:
/// - A switch for the phone, pad, and watch idioms
/// - A checkbox for the Mac idiom
/// - A button for the TV idom
///
/// ```
/// struct ExampleView: View {
///     @State private var status = true
///     var body: some View {
///         Toggle(isOn: $status) {
///             Text("Banana🍌🍌")
///         }
///         .toggleStyle(DefaultToggleStyle())
///         .padding()
///     }
/// }
/// ```
///
/// ![Gif displays a view containing the text "Banana🍌🍌" with a corresponding default toggle, which is being switched on and off.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/togglestyle-switch-example-1.gif)
///
/// If you create a toggle inside a container, such as a `List`, the toggle
/// automatically uses a style appropriate to the context. To apply a different
/// style to a toggle, or to a view that contains toggles, use the
/// ``View/toggleStyle(_:)`` modifier. To revert a custom-styled toggle to the
///  default, use `.toggleStyle(DefaultToggleStyle())`.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultToggleStyle : ToggleStyle {

    /// Creates a default toggle style.
    public init() { }

    /// Creates a view that represents the body of a toggle.
    ///
    /// The system calls this method for each ``Toggle`` instance in a view
    /// hierarchy where this style is the current toggle style.
    ///
    /// - Parameter configuration: The properties of the toggle.
    public func makeBody(configuration: DefaultToggleStyle.Configuration) -> some View { }


    /// A view that represents the appearance and interaction of a toggle.
    public typealias Body = some View
}

