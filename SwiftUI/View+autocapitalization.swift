extension View {

    /// A view modifier that sets whether to apply auto-capitalization to this view.
    ///
    /// Use `autocapitalization(_:)` when you need to automatically capitalize
    /// words, sentences, or other text like proper nouns.
    ///
    /// In example below, as the user enters text each word is automatically
    /// capitalized:
    ///
    /// ```
    /// struct NameView: View {
    ///     @State var fullName = ""
    ///
    ///     var body: some View {
    ///         TextField("Last, First", text: $fullName)
    ///             .autocapitalization(UITextAutocapitalizationType.words)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a text field in which the user types "Blossom, Peach"
    /// and the autocapitalization view modifier renders each words with a capital
    /// letter as it is typed.](view-auto-cap-ex.gif)
    ///
    /// The
    /// [`UITextAutocapitalizationType`](https://developer.apple.com/documentation/uikit/uitextautocapitalizationtype)
    /// enumeration defines the available capitalization modes. The default is
    /// [`.sentences`](https://developer.apple.com/documentation/uikit/uitextautocapitalizationtype/sentences).
    ///
    /// - Parameter style: One of the autocapitalization modes defined in the
    /// `UITextAutocapitalizationType` enumeration.
    @available(iOS 13.0, tvOS 13.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public func autocapitalization(_ style: UITextAutocapitalizationType) -> some View { }

}

