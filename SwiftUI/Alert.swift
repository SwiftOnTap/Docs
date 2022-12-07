/// A representation for an alert presentation.
///
/// An ``Alert`` is a modal-like presentation which contains a title, message, and
/// between one and two action buttons. Alerts often convey important information
/// about the state of the app and typically request feedback from the user. While the
/// styling of alerts is semi-fixed, there are three available styles for the buttons to choose from:
/// ``Alert/Button/default(_:action:)``, ``Alert/Button/destructive(_:action:)``,
/// and ``Alert/Button/cancel(_:action:)``. To actually present an alert, see
/// ``View/alert(isPresented:content:)``.
///
/// An alert can be created with one of two initializers, depending on if one button
/// or two is required. For example, to create an Alert with one button:
///
/// ```
/// struct ExampleAlertView: View {
///     @State private var showAlert = false
///
///     var body: some View {
///         Button("Tap to view alert") {
///             showAlert = true
///         }
///         .alert(isPresented: $showAlert) {
///             Alert(
///                 title: Text("An important title!"),
///                 message: Text("A message that adds additional context on the alert.")
///             )
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view with a button reading "Tap to view alert", that
/// once pressed triggers the appearance of an alert titled "An important title!"
/// with the text message "A message that adds additional context on the alert." a
/// and an "OK" button that hides the alert when pressed.](alert-example-1.gif)
///
/// If the `dismissButton` value is left unspecified (as it was in this example),
/// it will default to a dismiss button with the text "Ok".
///
/// In order to customize the type of button (or to create an alert with two buttons),
/// create a new ``Alert/Button`` instance and pass it in as a part of the initializer.
/// For example, to make an alert with a cancel and destructive button:
///
///
/// ```
/// struct ExampleAlertView: View {
///     @State private var showAlert = false
///
///     var body: some View {
///         Button("Tap to view alert") {
///             showAlert = true
///         }
///         .alert(isPresented: $showAlert) {
///             Alert(
///                 title: Text("Are you sure?"),
///                 message: Text("The following action will delete everything. Please confirm."),
///                 primaryButton: Alert.Button.destructive(Text("Delete")),
///                 secondaryButton: Alert.Button.cancel(Text("No, take me back!"))
///             )
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view with a button reading "Tap to view alert", that
/// once pressed triggers the appearance of an alert titled "Are you sure?"
/// with the text message "The following action will delete everything. Please
/// confirm."; the alert has two buttons, a primary destructive button reading
/// "Delete" and a secondary cancel button reading "No, take me back!"](alert-example-2.gif)
///
/// For illustrative purposes, the alert button values used the expanded syntax in this example.
/// It is also valid to use the shorthand syntax when declaring alert buttons: `.default(_:action:)`,
/// `.cancel(_:)`, or `.destructive(_:action:)`
///
/// Notes:
///  - Stylistically, `.default` and `.cancel` alert button styles are nearly identical with
///  the exception that `.cancel` has a bolded font weight.
///  - Alert is the equivalent to UIKit's [`UIAlertController`](https://developer.apple.com/documentation/uikit/uialertcontroller).
///  - For information on the human interface guidelines for alerts, see:
///  [https://developer.apple.com/design/human-interface-guidelines/ios/views/alerts/](https://developer.apple.com/design/human-interface-guidelines/ios/views/alerts/)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Alert {

    /// Creates an alert with one button.
    ///
    /// If the `dismissButton` parameter is left unspecified, it will default to a button with the text "Ok".
    ///
    /// For example, to create a new Alert with this initializer and present it:
    ///
    /// ```
    /// struct ExampleAlertView: View {
    ///     @State private var showAlert = false
    ///
    ///     var body: some View {
    ///         Button("Tap to view alert") {
    ///             showAlert = true
    ///         }
    ///         .alert(isPresented: $showAlert) {
    ///             Alert(
    ///                 title: Text("An important title!"),
    ///                 message: Text("A message that adds additional context on the alert."),
    ///                 dismissButton: .default(Text("I understand."))
    ///             )
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a button reading "Tap to view alert", that
    /// once pressed triggers the appearance of an alert titled "An important title!"
    /// with the text message "A message that adds additional context on the alert."
    /// and a default dismiss button that reads "I understand".](alert-example-3.gif)
    ///
    public init(title: Text, message: Text? = nil, dismissButton: Alert.Button? = nil) { }

    /// Creates an alert with two buttons.
    ///
    /// When the screen is too small to display both buttons horizontally, they will
    /// switch to being vertically stacked. The system determines the visual
    /// ordering of the buttons based on their type and
    /// if they are a primary or secondary button.
    ///
    /// For example, to create a new Alert with this initializer and present it:
    ///
    /// ```
    /// struct ExampleAlertView: View {
    ///     @State private var showAlert = false
    ///
    ///     var body: some View {
    ///         Button("Tap to view alert") {
    ///             showAlert = true
    ///         }
    ///         .alert(isPresented: $showAlert) {
    ///             Alert(
    ///                 title: Text("Are you sure?"),
    ///                 message: Text("The following action will delete everything. Please confirm."),
    ///                 primaryButton: .destructive(Text("Delete")),
    ///                 secondaryButton: .cancel(Text("No, take me back!"))
    ///             )
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view with a button reading "Tap to view alert", that
    /// once pressed triggers the appearance of an alert titled "Are you sure?"
    /// with the text message "The following action will delete everything. Please
    /// confirm."; the alert has two buttons, a primary destructive button reading
    /// "Delete" and a secondary cancel button reading "No, take me back!"](alert-example-2.gif)
    ///
    public init(title: Text, message: Text? = nil, primaryButton: Alert.Button, secondaryButton: Alert.Button) { }

    /// A button representing an ``Alert`` button action.
    public struct Button {

        /// Creates an ``Alert/Button`` with the default style. The `.default` alert
        /// button is styled nearly identically with `.cancel` except that `.cancel`
        /// has a bolded font weight.
        ///
        /// For example, to create a new alert button with the default style:
        ///
        /// ```
        /// Alert(
        ///     title: Text("An important title!"),
        ///     message: Text("A message that adds additional context on the alert."),
        ///     dismissButton: .default(Text("A default button"), action: {
        ///         print("Default button pressed, do something.")
        ///     })
        /// )
        /// ```
        public static func `default`(_ label: Text, action: (() -> Void)? = {}) -> Alert.Button { }

        /// Creates an ``Alert/Button`` that indicates cancellation of some
        /// operation. The `.cancel` alert button is styled nearly identically with
        /// `.default` except that `.cancel` has a bolded font weight.
        ///
        /// For example, to create a new alert button with the cancel style:
        ///
        /// ```
        /// Alert(
        ///     title: Text("An important title!"),
        ///     message: Text("A message that adds additional context on the alert."),
        ///     dismissButton: .cancel(Text("A cancel button"), action: {
        ///         print("Cancel button pressed, do something.")
        ///     })
        /// )
        /// ```
        public static func cancel(_ label: Text, action: (() -> Void)? = {}) -> Alert.Button { }

        /// Creates an ``Alert/Button`` that indicates cancellation of some
        /// operation. The `.cancel` alert button is styled nearly identically with
        /// `.default` except that `.cancel` has a bolded font weight.
        ///
        /// The system automatically chooses the label of the button for the appropriate locale.
        /// For the English locale, this defaults to "Cancel"
        ///
        /// For example, to create a new alert button with the cancel style:
        ///
        /// ```
        /// Alert(
        ///     title: Text("An important title!"),
        ///     message: Text("A message that adds additional context on the alert."),
        ///     dismissButton: .cancel(action: {
        ///         print("Cancel button pressed, do something.")
        ///     })
        /// )
        /// ```
        public static func cancel(_ action: (() -> Void)? = {}) -> Alert.Button { }

        /// Creates an ``Alert/Button`` with a style indicating destruction of
        /// some data.
        ///
        /// For example, to create a new alert button with the destructive style:
        ///
        /// ```
        /// Alert(
        ///     title: Text("An important title!"),
        ///     message: Text("A message that adds additional context on the alert."),
        ///     dismissButton: .destructive(Text("A destructive button"), action: {
        ///         print("Destructive button pressed, do something.")
        ///     })
        /// )
        /// ```
        public static func destructive(_ label: Text, action: (() -> Void)? = {}) -> Alert.Button { }
    }
}

