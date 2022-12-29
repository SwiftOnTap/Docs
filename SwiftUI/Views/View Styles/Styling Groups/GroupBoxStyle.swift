/// This protocol is used to create a style for a GroupBox
///
/// By using GroupBoxStyle, the style can be used for a ``GroupBox`` across your application.
/// To configure the current `GroupBoxStyle` for a view hierarchy, you only need to use the
/// `.groupBoxStyle()` modifier.
///
/// The `GroupBoxStyle` protocol only requires that the user creates a
/// ``GroupBoxStyle/makeBody(configuration:)`` function which accepts an
/// instance of ``GroupBoxStyleConfiguration`` and returns a view. Here, we create
/// a custom `GroupBoxStyle` called `OrangeGroupBoxStyle`. The custom style
/// applies a variety of view modifiers to the `content` property of the `configuration`
/// parameter to create a light orange `GroupBox` with some spacing between its
/// label and content:
///
/// ```
/// struct OrangeGroupBoxStyle: GroupBoxStyle {
///     var background: some View {
///         RoundedRectangle(cornerRadius: 5)
///             .fill(Color.orange)
///     }
///
///     func makeBody(configuration: Configuration) -> some View {
///         configuration.content
///             .frame(maxWidth: 200, maxHeight: 30)
///             .padding()
///             .background(background)
///             .opacity(0.4)
///             .overlay(
///                 configuration.label
///                     .padding(.leading, 4),
///                 alignment: .topLeading
///             )
///     }
/// }
/// ```
///
/// We can then apply the custom style by initializing a `GroupBox` with
/// ``GroupBox/init(label:content:)`` and passing our style to the
/// ``View/GroupBoxStyle(_:)`` view modifier:
///
/// ```
/// struct ContentView: View {
///     var label: some View {
///         Label("Employee", systemImage: "person.fill")
///             .foregroundColor(.red)
///     }
///
///     var body: some View {
///         GroupBox(label: label) {
///             Text("Aaron")
///         }
///         .groupBoxStyle(OrangeGroupBoxStyle())
///     }
/// }
/// ```
///
/// ![A screenshot displaying a light orange group box in the center of the screen which
/// has a person icon in its upper left corner followed by the label "Employee."
/// The content reads "Aaron" in light grey text owed to the lower opacity in
/// the custom style.](gbox-style-orange.png)
///
/// See ``DefaultGroupBoxStyle`` for an example of a custom label applied with
/// the default style.
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol GroupBoxStyle { }
extension GroupBoxStyle {

    /// A `View` representing the body of a ``GroupBox``.
    associatedtype Body : View

    /// Creates a `View` representing the body of a ``GroupBox``.
    ///
    /// Implement this method to create the view for a ``GroupBox`` that uses this style.
    /// The configuration contains:
    /// - label
    /// - content
    ///
    /// For example,
    ///     struct ExampleView: View {
    ///     @State private var username: String = ""
    ///     @State private var password: String = ""
    ///
    ///     var body: some View {
    ///         GroupBox(label: Text("Account Login")) {
    ///             Form {
    ///                 Text("Username")
    ///                 TextField("", text: $username)
    ///
    ///                 Text("Password")
    ///                 SecureField("", text: $password)
    ///
    ///             }.padding(10)
    ///         }
    ///         .groupBoxStyle(MyStyle())
    ///         .frame(width: 300)
    ///     }
    ///
    //     struct MyStyle: GroupBoxStyle {
    //         func makeBody(configuration: Configuration) -> some View {
    //             VStack {
    //                 HStack {
    //                     Rectangle().fill(Color.red).frame(width: 30, height: 3)

    //                     configuration.label

    //                     Rectangle().fill(Color.red).frame(width: 30, height: 3)
    //                 }

    //                 configuration.content
    //             }
    //         }
    //     }
    // }

    /// - Parameter configuration: The properties of the group box instance being
    ///   created.
    ///
    /// This method will be called for each instance of ``GroupBox`` created within
    /// a view hierarchy where this style is the current ``GroupBoxStyle``.
    func makeBody(configuration: Self.Configuration) -> Self.Body { }

    /// The properties of a ``GroupBox`` instance being created.
    typealias Configuration = GroupBoxStyleConfiguration
}

