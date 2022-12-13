@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Marks this view as searchable, which configures the display of a
    /// search field.
    ///
    /// For more information about using searchable modifiers, see
    /// <doc:Adding-Search-to-Your-App>.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit in the search field.
    ///   - placement: The preferred placement of the search field within the
    ///     containing view hierarchy.
    ///   - prompt: A ``Text`` view representing the prompt of the search field
    ///     which provides users with guidance on what to search for.
    public func searchable(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: Text? = nil) -> some View { }


    /// Marks this view as searchable, which configures the display of a
    /// search field.
    ///
    /// For more information about using searchable modifiers, see
    /// <doc:Adding-Search-to-Your-App>.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit in the search field.
    ///   - placement: The preferred placement of the search field within the
    ///     containing view hierarchy.
    ///   - prompt: The key for the localized prompt of the search field
    ///     which provides users with guidance on what to search for.
    public func searchable(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: LocalizedStringKey) -> some View { }


    /// Marks this view as searchable, which configures the display of a
    /// search field.
    ///
    /// For more information about using searchable modifiers, see
    /// <doc:Adding-Search-to-Your-App>.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit in the search field.
    ///   - placement: The preferred placement of the search field within the
    ///     containing view hierarchy.
    ///   - prompt: A string representing the prompt of the search field
    ///     which provides users with guidance on what to search for.
    public func searchable<S>(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: S) -> some View where S : StringProtocol { }

}

extension View {

    /// Marks this view as searchable, which configures the display of a
    /// search field.
    ///
    /// For more information about using searchable modifiers, see
    /// <doc:Adding-Search-to-Your-App>.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit in the search field.
    ///   - placement: Where the search field should attempt to be
    ///     placed based on the containing view hierarchy.
    ///   - prompt: A ``Text`` view representing the prompt of the search field
    ///     which provides users with guidance on what to search for.
    ///   - suggestions: A view builder that produces content that
    ///     populates a list of suggestions.
    @available(iOS, introduced: 15.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    @available(macOS, introduced: 12.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    @available(tvOS, introduced: 15.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    @available(watchOS, introduced: 8.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    public func searchable<S>(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: Text? = nil, @ViewBuilder suggestions: () -> S) -> some View where S : View


    /// Marks this view as searchable, which configures the display of a
    /// search field.
    ///
    /// For more information about using searchable modifiers, see
    /// <doc:Adding-Search-to-Your-App>.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit in the search field.
    ///   - placement: Where the search field should attempt to be
    ///     placed based on the containing view hierarchy.
    ///   - prompt: A key for the localized prompt of the search field
    ///     which provides users with guidance on what to search for.
    ///   - suggestions: A view builder that produces content that
    ///     populates a list of suggestions.
    @available(iOS, introduced: 15.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    @available(macOS, introduced: 12.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    @available(tvOS, introduced: 15.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    @available(watchOS, introduced: 8.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    public func searchable<S>(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: LocalizedStringKey, @ViewBuilder suggestions: () -> S) -> some View where S : View


    /// Marks this view as searchable, which configures the display of a
    /// search field.
    ///
    /// For more information about using searchable modifiers, see
    /// <doc:Adding-Search-to-Your-App>.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit in the search field.
    ///   - placement: Where the search field should attempt to be
    ///     placed based on the containing view hierarchy.
    ///   - prompt: A string representing the prompt of the search field
    ///     which provides users with guidance on what to search for.
    ///   - suggestions: A view builder that produces content that
    ///     populates a list of suggestions.
    @available(iOS, introduced: 15.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    @available(macOS, introduced: 12.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    @available(tvOS, introduced: 15.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    @available(watchOS, introduced: 8.0, deprecated: 100000.0, message: "Use the searchable modifier with the searchSuggestions modifier")
    public func searchable<V, S>(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: S, @ViewBuilder suggestions: () -> V) -> some View where V : View, S : StringProtocol

}
