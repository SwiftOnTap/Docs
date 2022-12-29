///  A button that opens a URL
///
/// A ``Link`` opens a URL when the user clicks. There are three initializers:
/// - [`String`](https://developer.apple.com/documentation/swift/string)
/// - ``LocalizedStringKey``
/// - ``View``
///
/// For example:
///
///     struct ExampleView: View {
///         let urlString = "https://swiftontap.com"
///
///         var body: some View {
///             Group {
///                 if let url = URL(string: urlString) {
///                     // Creates a Link
///                     Link("View SwiftOnTap", destination: url)
///                 }
///             }
///         }
///     }
///
/// ![A gif displaying a view containing a static string variable set to the SwiftOnTap
/// url and a Group with an if statement creating a link from the url string and
/// a link "View SwiftOnTap" that brings the user to the SwiftOnTap website once clicked.](link.gif)
///
/// ### Creating a `Link` with a ``View``
/// [[link-view]]
///
/// ### Background on ``Link`` in SwiftUI
///
/// Before `Link` was added to SwiftUI, there was no equivalent of a hyperlink
/// outside of a [`WKWebView`](https://developer.apple.com/documentation/webkit/wkwebview).
///
/// It was possible to create a button with blue text that opens a URL, but this
/// requires the logic to be added manually each time. For example:
///
/// ```
/// struct ContentView: View {
///     let urlString = "https://swiftontap.com"
///
///     var body: some View {
///         if URL(string: urlString) != nil {
///
///             //The old way to create a Link-style Button
///             Button("Read more") {
///                 if let url = URL(string: urlString) {
///                     UIApplication.shared.open(url, options: [:], completionHandler: {_ in })
///                 }
///             }
///         } else {
///             EmptyView()
///                 .onAppear { assertionFailure("URL was nil") }
///         }
///     }
/// }
/// ```
///
/// In iOS 14 there is the option of `Link`, which does the action part of the
/// ``Button`` above for us. Apple’s documentation unsafely unwraps a URL
/// using the ‘!’ operator, but this is bad practice. You may know that
/// this particular URL is created successfully because it links to
/// `example.com/TOS.html`, a site owned by the Internet Assigned
/// Numbers Authority (IANA) that convert URLs to IP addresses. But it's a
/// mistake to assume that a URL string is valid and force unwrap the optional.
///
/// This example is held back by the lack of optional binding (if let or
/// guard let) in the first version of SwiftUI, as it is instead restricted
/// to comparing the URL to nil to ensure it exists. When this comparison
/// confirms that the URL is not nil, this still doesn’t mean I can use it in
/// the Button without unwrapping it first. This is why there is a slightly
/// confusing additional step in the Button action, which optionally binds the
/// URL to ensure that it is not nil.
///
/// The assertionFailure could have been in an else statement after the if
/// let in the ``Button`` action, but the ``EmptyView`` has been added
/// for consistency with the above `Link` example. An `else` statement
/// containing ``EmptyView`` is not required, as any if statement around the
/// only occupant of a ``ViewBuilder`` closure will return `EmptyView` when
/// the if condition is `false`. If the URL was nil the user would see nothing,
/// but an assertion would be triggered for the developer in debug mode.
///
/// This would allow us to be aware that the URL was `nil`, but without
/// causing a crash for the end-user.
///
/// With updates to SwiftUI, the old code would roughly translate to the code
/// below:
///
///     struct ExampleView: View {
///         let urlString = "https://swiftontap.com"
///
///         var body: some View {
///             Group {
///                 if let url = URL(string: urlString) {
///
///                     // The new way to create a Link
///                     Link("View SwiftOnTap", destination: url)
///                 }
///             }
///         }
///     }
///
/// ![A gif displaying a view containing a static string variable set to the SwiftOnTap
/// url and a Group with an if statement creating a link from the url string and
/// a link "View SwiftOnTap" that brings the user to the SwiftOnTap website once clicked.](link.gif)
///
/// Now that SwiftUI supports `if let`, it is possible to directly create
/// properties like the `URL` and create ``View``s that use that data. Just as
/// before, the link is only shown when the `URL` can be created, but it is
/// not necessary to do multiple checks just to make sure that this is the case.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct Link<Label> : View where Label : View {

    /// A ``Link`` initializer that opens a link when a view is clicked.
    ///
    /// [link-view ->]
    ///
    /// ```
    /// struct ExampleView: View {
    ///     let url: String = "https://swiftontap.com"
    ///
    ///     var body: some View {
    ///         Group {
    ///             if let url = URL(string: url) {
    ///                 Link(destination: url) {
    ///                     RoundedRectangle(cornerRadius: 10)
    ///                         .fill(Color.pink)
    ///                         .padding()
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a static string variable set to the SwiftOnTap
    /// url and a Group with an if statement creating a link from the url string and
    /// a link that brings the user to the SwiftOnTap website once clicked in the form
    /// of a pink filled rounded rectangle with padding.](link-view.gif)
    ///
    /// [<-]
    ///
    /// - Parameters:
    ///     - destination: The URL for the link.
    ///     - label: A view that describes the destination of URL.
    public init(destination: URL, @ViewBuilder label: () -> Label) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Link where Label == Text {

    /// A ``Link`` initializer that opens a link when text is clicked.
    ///
    /// The example below creates a link to `swiftontap.com` and uses
    /// `"View SwiftOnTap"` as the title key to generate a link-styled
    /// view in your app:
    ///
    ///     struct ExampleView: View {
    ///         let urlString = "https://swiftontap.com"
    ///
    ///         var body: some View {
    ///             Group {
    ///                 if let url = URL(string: urlString) {
    ///                     // Creates a Link
    ///                     Link("View SwiftOnTap", destination: url)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![Link](link.gif)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title that describes the
    ///       purpose of this link.
    ///     - destination: The URL for the link.
    public init(_ titleKey: LocalizedStringKey, destination: URL) { }

    /// A ``Link`` initializer that opens a link when a title conforming to
    /// `StringProtocol` is clicked.
    ///
    /// Per Apple's documentation: Use ``Link`` to create a control that your
    /// app uses to navigate to a
    /// `URL` that you provide. The example below creates a link to
    /// `example.com` and displays the title string you provide as a
    /// link-styled view in your app:
    ///
    ///     func marketingLink(_ callToAction: String) -> Link {
    ///         Link(callToAction,
    ///             destination: URL(string: "https://www.example.com/")!)
    ///     }
    ///
    /// - Parameters:
    ///     - title: A text string used as the title for describing the
    ///       underlying `destination` URL.
    ///     - destination: The URL for the link.
    public init<S>(_ title: S, destination: URL) where S : StringProtocol { }
}

