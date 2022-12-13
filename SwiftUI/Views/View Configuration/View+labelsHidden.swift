extension View {

    /// A view modifier that hides the labels of any controls contained within this view.
    ///
    /// Use `labelsHidden()` when it would not be appropriate to show a
    /// label near controls in the context of your user interface.
    ///
    /// Although the labels are not visually laid out alongside the controls,
    /// the control's label text is still often required, because it is used
    /// for other purposes including accessibility. This example shows two
    /// controls where the first control’s label is hidden.
    ///
    /// In the example below, one of the toggles has its label hidden:
    ///
    /// ```
    /// struct TogglesView: View {
    ///     @State var toggle1 = true
    ///     @State var toggle2 = true
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Toggle(isOn: $toggle1) {
    ///                 Text("I am hidden! 🐄")
    ///             }
    ///             .labelsHidden()
    ///
    ///             Toggle(isOn: $toggle2) {
    ///                 Text("I am not 👀")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two toggles in a VStack, where the first applies
    /// the labelsHidden view modifier and the second does not. The result is a
    /// lone toggle on top with no associated label, and a separate toggle below
    /// with a label that reads "I am not."](labelshidden.png)
    ///
    /// - Note: This modifier does not work for all labels. It applies to
    ///   labels that are external/separate from the rest of the control's
    ///   interface like ``Toggle``, but not to controls like a bordered button
    ///   where the label is inside the button's border.
    public func labelsHidden() -> some View { }

}

