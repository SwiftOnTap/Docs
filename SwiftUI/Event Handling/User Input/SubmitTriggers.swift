/// A type that defines various triggers that result in the firing of a
/// submission action.
///
/// These triggers may be provided to the ``View/onSubmit(of:_:)``
/// modifier to alter which types of user behaviors trigger a provided
/// submission action.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct SubmitTriggers : OptionSet {

    /// Defines triggers originating from text input controls like `TextField`
    /// and `SecureField`.
    public static let text: SubmitTriggers

    /// Defines triggers originating from search fields constructed from
    /// searchable modifiers.
    ///
    /// In the example below, only the search field or search completions
    /// placed by the searchable modifier will trigger the view model to submit
    /// its current search query.
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
    public static let search: SubmitTriggers

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = SubmitTriggers

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = SubmitTriggers
}

