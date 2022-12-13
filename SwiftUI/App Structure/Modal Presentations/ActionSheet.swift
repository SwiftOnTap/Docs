/// A storage type for an action sheet presentation.
///
/// Use this structure with the ``View/actionSheet(item:content:)`` and
/// ``View/actionSheet(ispresented:content:)`` view modifiers to present
/// the user with an **action sheet**.
///
/// ### What is an action sheet?
///
/// An ``ActionSheet`` is a modal alert that appears towards the bottom
/// of a user's screen. It provides **two or more** options
/// to the user based on the app context.
///
/// An ``ActionSheet`` is similar to an ``Alert``, but it appears at the bottom
/// of the screen instead of in the middle. To let the user respond
/// to the **state** of the app, use an ``Alert`` instead.
///
/// - Note: See Apple's
/// [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/views/action-sheets/)
/// for more about when to use action sheets.
///
/// ### Creating an action sheet
///
/// Creating an action sheet involves 3 components:
/// 1. A **title**, which is in bold font at the top of the sheet
/// 2. A **message**, which is optional, and appears under the title
/// 3. An **array of buttons**, which determine what the user can do from the
/// action sheet.
///
/// The buttons can take 3 styles: ``Alert/Button/cancel(_:action:)``
/// ``Alert/Button/default(_:action:)``, and
/// ``Alert/Button/destructive(_:action:)``.
/// Check out ``Alert/Button`` for the full overview of action sheet buttons,
/// the available styles, and how to create them.
///
/// ### Using an action sheet
///
/// Once you have an action sheet, it is simple to use. Just pass
/// it as a trailing closure to the ``View/actionSheet(ispresented:content:)``
/// view modifier. The action sheet will be presented whenever
/// the `isPresented` binding parameter is `true`.
///
/// The following example passes an ``ActionSheet`` to this view modifier,
/// and illustrates the 3 different types of
/// action sheet buttons.
///
/// ```
/// struct ContentView: View {
///     @State private var showActionSheet = false
///
///     var body: some View {
///         Button("Eat 🍌") {
///             showActionSheet = true
///         }
///         .actionSheet(isPresented: $showActionSheet) {
///             ActionSheet(
///                 title: Text("Food alert!"),
///                 message: Text("You have made a selection"),
///                 buttons: [
///                     .cancel(),
///                     .destructive(Text("Change to 🍑")) { /* override */ },
///                     .default(Text("Confirm")) { /* confirm */ }
///                 ]
///             )
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a view with a button reading "Eat 🍌", that once pressed
/// triggers the appearance of an action sheet titled "Food alert" with two
/// options, "Change to 🍑" and "Confirm", and a text message beneath the title
/// reading "You have made a selection".](action-sheet-main-ex.gif)
///
/// Notes:
/// - The system can override your button order. In the example above,
/// the cancel button is displayed last, because that is customary.
/// - If your action sheet requires a parameter, you can pass one in by
/// using the ``View/actionSheet(item:content:)`` view modifier instead.
///
@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "use `View.confirmationDialog(title:isPresented:titleVisibility:presenting::actions:)`instead.")
@available(macOS, unavailable)
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "use `View.confirmationDialog(title:isPresented:titleVisibility:presenting:actions:)`instead.")
@available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "use `View.confirmationDialog(title:isPresented:titleVisibility:presenting:actions:)`instead.")
public struct ActionSheet {

    /// Creates an action sheet with the provided buttons.
    public init(title: Text, message: Text? = nil, buttons: [ActionSheet.Button] = [.cancel()]) { }

    /// A button representing an operation of an action sheet presentation.
    public typealias Button = Alert.Button
}

