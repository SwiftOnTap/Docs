/// Provides functionality for opening a URL.
///
/// The `OpenURLAction` instance in the app's ``Environment`` offers
/// a handler that you can use to open a URL in response to some action.
/// Use the ``EnvironmentValues/openURL`` environment value to get the handler.
/// Then call the action's handler when you need to open a URL. For example,
/// you can open a support URL in response to when a user taps a button:
///
///     struct OpenUrlActionView: View {
///         @Environment(\.openURL) var openURL
///
///         var body: some View {
///             Button(action: contactSupport) {
///                 Text("Email Support")
///                 Image(systemName: "envelope.open")
///             }
///         }
///
///         func contactSupport() {
///             guard let url = URL(string: "https://www.example.com") else {
///                 return
///             }
///             openURL(url)
///         }
///     }
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct OpenURLAction {

    /// Opens a URL, following system conventions.
    ///
    /// Use this method to attempt to open a URL. This function handles the
    /// calling of the platform specific URL handler contained in the
    /// `openURL` property stored the app's ``Environment``, and is used when
    /// you call the function `openURL(:_)`.
    ///
    /// - Parameters:
    ///   - url: The URL to open.
    public func callAsFunction(_ url: URL) { }

    /// Asynchronously opens a URL, following system conventions.
    ///
    /// Use this method when attempting to asynchronously open a URL; the
    /// result indicates whether the system was able open the URL.
    /// The completion runs after the system decides that it can open the URL,
    /// but the full opening of the URL may not yet be complete when calling the
    /// completion handler.
    ///
    /// - Parameters:
    ///   - url: The URL to open.
    ///   - completion: A closure the method calls after determining if
    ///     it is possible to open the URL, although possibly before fully
    ///     opening the URL. The closure takes a Boolean that indicates whether
    ///     the URL can be opened.
    @available(watchOS, unavailable)
    public func callAsFunction(_ url: URL, completion: @escaping (Bool) -> Void) { }
}

