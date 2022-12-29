extension View {

    /// A view modifier that presents an action sheet that is passed a value.
    ///
    /// Use this modifier when your action sheet needs a passed value.
    /// The action will show when the value is not `nil`, and will set the
    /// value back to `nil` when it's dismissed.
    ///
    ///
    /// For more info on how to build an action sheet, check out ``ActionSheet``.
    /// To learn about action sheet's different buttons, see ``ActionSheet/Button``.
    ///
    /// ```
    /// struct Emoji: Identifiable {
    ///     let id = UUID()
    ///     let name: String
    /// }
    ///
    /// struct ContentView: View {
    ///     @State private var selection: Emoji?
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Button("Eat 🍌") { selection = Emoji(name: "🍌") }
    ///             Button("Eat 🍑") { selection = Emoji(name: "🍑") }
    ///         }
    ///         .actionSheet(item: $selection) { selection in
    ///             let confirm = ActionSheet.Button.default(Text("Confirm \(selection.name)")) { /* action here */ }
    ///             let cancel = ActionSheet.Button.cancel(Text("Cancel")) { /* action here */ }
    ///             let buttons = [confirm, cancel]
    ///
    ///             return ActionSheet(title: Text("Food alert!"),
    ///                                message: Text("You have made a selection"),
    ///                                buttons: buttons)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a VStack in the center of the screen with two button options:
    /// Eat a banana or Eat a peach. When tapped, each prompts the same food alert
    /// that pops up from the bottom of the screen. The alerts are rendered uniquely
    /// by passing the item a binding value for whichever selection the user makes.](action-sheet-item-ex.gif)
    ///
    /// - Parameters:
    ///   - item: A binding to an optional source of truth for the action
    ///     sheet. When representing a non-`nil` item, the system uses
    ///     `content` to create an action sheet representation of the item.
    ///     If the identity changes, the system dismisses a currently-presented
    ///     action sheet and replace it with a new one.
    ///   - content: A closure returning the action sheet to present.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "use `confirmationDialog(title:isPresented:titleVisibility:presenting::actions:)`instead.")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "use `confirmationDialog(title:isPresented:titleVisibility:presenting:actions:)`instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "use `confirmationDialog(title:isPresented:titleVisibility:presenting:actions:)`instead.")
    public func actionSheet<T>(item: Binding<T?>, content: (T) -> ActionSheet) -> some View where T : Identifiable { }


    /// A view modifier that presents an action sheet when a given condition is true.
    ///
    /// For more info on how to build an action sheet, check out ``ActionSheet``.
    /// To learn about action sheet's different buttons, see ``ActionSheet/Button``.
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State private var showActionSheet = false
    ///
    ///     var body: some View {
    ///         Button("Eat 🍌") { showActionSheet = true }
    ///             .actionSheet(isPresented: $showActionSheet) {
    ///                 let confirm = ActionSheet.Button.default(Text("Confirm")) { /*action here*/ }
    ///                 let cancel = ActionSheet.Button.cancel(Text("Cancel")) { /*action here*/ }
    ///                 let buttons = [confirm, cancel]
    ///
    ///                 return ActionSheet(title: Text("Food alert!"),
    ///                                message: Text("You have made a selection"),
    ///                                buttons: buttons)
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a single button in the center of the screen that reads "Eat"
    /// followed by a banana emoji. When pressed, the button prompts an action sheet
    /// from the bottom of the screen asking the user to confirm or cancel. This
    /// is accomplished by setting the showActionSheet value to true whenever
    /// the button is interacted with.](action-sheet-is-presented-ex.gif)
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the action sheet should be
    ///     shown.
    ///   - content: A closure returning the ``ActionSheet`` to present.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "use `confirmationDialog(title:isPresented:titleVisibility:presenting::actions:)`instead.")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "use `confirmationDialog(title:isPresented:titleVisibility:presenting:actions:)`instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "use `confirmationDialog(title:isPresented:titleVisibility:presenting:actions:)`instead.")
    public func actionSheet(isPresented: Binding<Bool>, content: () -> ActionSheet) -> some View { }

}

