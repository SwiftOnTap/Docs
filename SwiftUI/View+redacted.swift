@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// A view modifier that replaces content with a smart placeholder.
    ///
    /// Use this modifier to add a redaction reason to a view hierarchy. Redaction
    /// reasons often update the appearance of the view. Currently,
    /// there is only 1 redaction reason: ``RedactionReasons/placeholder``.
    /// Adding this reason to the view will replace the view with a placeholder graphic.
    ///
    /// Adding a redaction is an additive process: any redaction
    /// provided will be added to the reasons provided by the parent.
    ///
    /// ```
    /// struct RedactedView: View {
    ///     var body: some View {
    ///         Label("Taylor Swift", systemImage: "person.fill")
    ///         Label("Kanye West", systemImage: "person.fill")
    ///             .redacted(reason: .placeholder)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with two labels in the center of the screen; the first
    /// reads "Taylor Swift" with a person icon to the left of it, while the second
    /// below it is redacted and replaced by a gray box and a gray rectangle.](redacted-1.png)
    ///
    /// Your child view can also read the redacted reason from its environment:
    ///
    /// ```
    /// struct RedactedView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("There's nothing down there 👇")
    ///             ChildView()
    ///                 .redacted(reason: .placeholder)
    ///         }
    ///     }
    /// }
    ///
    /// struct ChildView: View {
    ///     @Environment(\.redactionReasons) var redactionReasons
    ///
    ///     var redacted: Bool {
    ///         redactionReasons.contains(.placeholder)
    ///     }
    ///
    ///     var body: some View {
    ///         if !redacted {
    ///             Text("If you're reading this I'm not redacted")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with text in the center of the screen that reads
    /// "There is nothing down there" to demonstrate that the redacted code produces
    /// nothing in this case.](redacted-2.png)
    ///
    /// - Parameter reason: The reason for redacting the content.
    public func redacted(reason: RedactionReasons) -> some View { }


    /// A view modifier that removes all redaction reasons from a view.
    ///
    /// Use this modifier to unredact a ``View``. See
    /// ``View/redacted(reason:)`` for an overview of redaction,
    /// what it is, and why you might want to use it.
    ///
    /// ```
    /// struct UnredactedView: View {
    ///     var body: some View {
    ///         ChildView()
    ///             .redacted(reason: .placeholder)
    ///     }
    /// }
    ///
    /// struct ChildView: View {
    ///     var body: some View {
    ///         Text("You can't redact me 😎")
    ///             .unredacted()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with text in the center of the screen that reads
    /// "You can't redact me" to demonstrate how the view modifier removes
    /// redaction reasons for the ChildView and unredacts its text.](unredacted.png)
    ///
    public func unredacted() -> some View { }

}

