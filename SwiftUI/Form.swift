/// A container for grouping controls used for data entry, such as in settings
/// or inspectors.
///
/// SwiftUI renders forms in a manner appropriate for the platform. For example,
/// on iOS, forms appear as grouped lists. Use ``Section`` to group different
/// parts of a form's content.
///
/// For example:
///
/// ```
/// struct ExampleView: View {
///     @State private var myFruit = ""
///
///     var body: some View {
///         Form {
///             TextField("Banana 🍌", text: $myFruit)
///             TextField("Banana 🍌", text: $myFruit)
///             TextField("Banana 🍌", text: $myFruit)
///         }
///     }
/// }
/// ```
///
/// ![Form Example 1](76F9D0FD-559A-46B7-AAFD-B6251C7A2AED.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Form<Content> : View where Content : View {

    /// Creates a form from a view builder containing child views.
    ///
    /// The content of a form is almost always different ``Section``s.
    ///
    ///
    /// The form view knows how to arrange standard controls inside it such as
    /// pickers, textfields and toggles.
    /// However, when using a custom control results are undefined.
    ///
    /// Controls can be grouped using the ``Section`` view as seen in the
    /// example below.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State private var email = ""
    ///     @State private var first = ""
    ///     @State private var last = ""
    ///     @State private var not = true
    ///     @State private var dark = true
    ///
    ///
    ///     var body: some View {
    ///         Form {
    ///             Section(header: Text("Contact Information")) {
    ///                 TextField("First Name", text: $first)
    ///                 TextField("Last Name", text: $last)
    ///                 TextField("Email", text: $email)
    ///             }
    ///             Section(header: Text("Preferences")) {
    ///                 Toggle(isOn: $not) {
    ///                     Text("Notifications")
    ///                 }
    ///                 Toggle(isOn: self.$dark) {
    ///                         Text("Dark Mode")
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a form with two sections, the first with the header
    /// "Contact Information" and the text fields "First Name", "Last Name", and
    /// "Email", and the second with the header "Preferences" and two toggles,
    /// "Notifications" and "Dark Mode"; the text inputs for each of the textfields
    /// and the isOn parameter for each of the toggles are bound to state variables
    /// also defined in the view.](form-example-2.png)
    ///
    /// - Parameter content: A closure that returns the view to the ``Form``.
    ///
    /// - SeeAlso: Section
    public init(@ViewBuilder content: () -> Content) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

