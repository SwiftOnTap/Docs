@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Adds an action to perform when the user submits a value to this view.
    ///
    /// Different views may have different triggers for the provided action.
    /// A ``TextField``, or ``SecureField`` will trigger this action when the
    /// user hits the hardware or software return key. This modifier may also
    /// bind this action to a default action keyboard shortcut. You may set this
    /// action on an individual view or an entire view hierarchy.
    ///
    ///     TextField("Username", text: $username)
    ///         .onSubmit {
    ///             guard viewModel.validate() else { return }
    ///             viewModel.login()
    ///         }
    ///
    /// You can use the ``View/submitScope(_:)`` modifier to stop a submit
    /// trigger from a control from propagating higher up in the view hierarchy
    /// to higher `View.onSubmit(of:_:)` modifiers.
    ///
    ///     Form {
    ///         TextField("Username", text: $viewModel.userName)
    ///         SecureField("Password", text: $viewModel.password)
    ///
    ///         TextField("Tags", text: $viewModel.tags)
    ///             .submitScope()
    ///     }
    ///     .onSubmit {
    ///         guard viewModel.validate() else { return }
    ///         viewModel.login()
    ///     }
    ///
    /// You can use different submit triggers to filter the types of triggers
    /// that should invoke the provided submission action. For example, you
    /// may provide a value of ``SubmitTriggers/search`` to only hear
    /// submission triggers that originate from search fields vended by
    /// searchable modifiers.
    ///
    ///     @StateObject var viewModel = ViewModel()
    ///
    ///     NavigationView {
    ///         SidebarView()
    ///         DetailView()
    ///     }
    ///     .searchable(
    ///         text: $viewModel.searchText,
    ///         placement: .sidebar
    ///     ) {
    ///         SuggestionsView()
    ///     }
    ///     .onSubmit(of: .search) {
    ///         viewModel.submitCurrentSearchQuery()
    ///     }
    ///
    /// - Parameters:
    ///   - triggers: The triggers that should invoke the provided action.
    ///   - action: The action to perform on submission of a value.
    public func onSubmit(of triggers: SubmitTriggers = .text, _ action: @escaping (() -> Void)) -> some View { }


    /// Prevents submission triggers originating from this view to invoke
    /// a submission action configured by a submission modifier higher up
    /// in the view hierarchy.
    ///
    /// Use this modifier when you want to avoid specific views from initiating
    /// a submission action configured by the ``View/onSubmit(of:_:)`` modifier.
    /// In the example below, the tag field doesn't trigger the submission of
    /// the form:
    ///
    ///     Form {
    ///         TextField("Username", text: $viewModel.userName)
    ///         SecureField("Password", text: $viewModel.password)
    ///
    ///         TextField("Tags", text: $viewModel.tags)
    ///             .submitScope()
    ///     }
    ///     .onSubmit {
    ///         guard viewModel.validate() else { return }
    ///         viewModel.login()
    ///     }
    ///
    /// - Parameter isBlocking: A Boolean that indicates whether this scope is
    ///   actively blocking submission triggers from reaching higher submission
    ///   actions.
    public func submitScope(_ isBlocking: Bool = true) -> some View { }

}
