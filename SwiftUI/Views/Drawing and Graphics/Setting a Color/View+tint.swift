@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Sets the tint color within this view.
    ///
    /// Use this method to override the default accent color for this view.
    /// Unlike an app's accent color, which can be overridden by user
    /// preference, the tint color is always respected and should be used as a
    /// way to provide additional meaning to the control.
    ///
    /// This example shows Answer and Decline buttons with ``ShapeStyle/green``
    /// and ``ShapeStyle/red`` tint colors, respectively.
    ///
    ///     struct ControlTint: View {
    ///         var body: some View {
    ///             HStack {
    ///                 Button {
    ///                     // Answer the call
    ///                 } label: {
    ///                     Label("Answer", systemImage: "phone")
    ///                 }
    ///                 .tint(.green)
    ///                 Button {
    ///                     // Decline the call
    ///                 } label: {
    ///                     Label("Decline", systemImage: "phone.down")
    ///                 }
    ///                 .tint(.red)
    ///             }
    ///             .padding()
    ///         }
    ///     }
    ///
    /// - Parameter tint: The tint ``Color`` to apply.
    @inlinable public func tint(_ tint: Color?) -> some View { }

}
