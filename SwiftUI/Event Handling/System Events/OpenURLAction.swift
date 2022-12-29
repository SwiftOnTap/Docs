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
    
    /// The result of a custom open URL action.
    ///
    /// If you declare a custom ``OpenURLAction`` in the ``Environment``,
    /// return one of the result values from its handler.
    ///
    /// * Use ``handled`` to indicate that the handler opened the URL.
    /// * Use ``discarded`` to indicate that the handler discarded the URL.
    /// * Use ``systemAction`` without an argument to ask SwiftUI
    ///   to open the URL with the system handler.
    /// * Use ``systemAction(_:)`` with a URL argument to ask SwiftUI
    ///   to open the specified URL with the system handler.
    ///
    /// You can use the last option to transform URLs, while
    /// still relying on the system to open the URL. For example,
    /// you could append a path component to every URL:
    ///
    ///     .environment(\.openURL, OpenURLAction { url in
    ///         .systemAction(url.appendingPathComponent("edit"))
    ///     })
    ///
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public struct Result {

        /// The handler opened the URL.
        ///
        /// The action invokes its completion handler with `true` when your
        /// handler returns this value.
        public static let handled: OpenURLAction.Result

        /// The handler discarded the URL.
        ///
        /// The action invokes its completion handler with `false` when your
        /// handler returns this value.
        public static let discarded: OpenURLAction.Result

        /// The handler asks the system to open the original URL.
        ///
        /// The action invokes its completion handler with a value that
        /// depends on the outcome of the system's attempt to open the URL.
        public static let systemAction: OpenURLAction.Result

        /// The handler asks the system to open the modified URL.
        ///
        /// The action invokes its completion handler with a value that
        /// depends on the outcome of the system's attempt to open the URL.
        ///
        /// - Parameter url: The URL that the handler asks the system to open.
        public static func systemAction(_ url: URL) -> OpenURLAction.Result { }
    }
    
    /// Creates an action that opens a URL.
    ///
    /// Use this initializer to create a custom action for opening URLs.
    /// Provide a handler that takes a URL and returns an
    /// ``OpenURLAction/Result``. Place your handler in the environment
    /// using the ``View/environment(_:_:)`` view modifier:
    ///
    ///     Text("Visit [Example Company](https://www.example.com) for details.")
    ///         .environment(\.openURL, OpenURLAction { url in
    ///             handleURL(url) // Define this method to take appropriate action.
    ///             return .handled
    ///         })
    ///
    /// Any views that read the action from the environment, including the
    /// built-in ``Link`` view and ``Text`` views with markdown links, or
    /// links in attributed strings, use your action.
    ///
    /// SwiftUI translates the value that your custom action's handler
    /// returns into an appropriate Boolean result for the action call.
    /// For example, a view that uses the action declared above
    /// receives `true` when calling the action, because the
    /// handler always returns ``OpenURLAction/Result/handled``.
    ///
    /// - Parameter handler: The closure to run for the given URL.
    ///   The closure takes a URL as input, and returns a ``Result``
    ///   that indicates the outcome of the action.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public init(handler: @escaping (URL) -> OpenURLAction.Result) { }

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

