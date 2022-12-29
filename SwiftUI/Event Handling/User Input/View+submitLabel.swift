@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Sets the submit label for this view.
    ///
    ///     Form {
    ///         TextField("Username", $viewModel.username)
    ///             .submitLabel(.continue)
    ///         SecureField("Password", $viewModel.password)
    ///             .submitLabel(.done)
    ///     }
    ///
    /// - Parameter submitLabel: One of the cases specified in ``SubmitLabel``.
    public func submitLabel(_ submitLabel: SubmitLabel) -> some View { }

}
