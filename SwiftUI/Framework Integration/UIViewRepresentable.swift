/// A view to import a UIKit view into SwiftUI.
///
/// Use this protocol to port a
/// [`UIView`](https://developer.apple.com/documentation/uikit/uiview)
/// from [UIKit](https://developer.apple.com/documentation/uikit)
/// into SwiftUI.
///
/// ### Setup
///
/// To conform to ``UIViewRepresentable``, you must implement four main lifecycle
/// functions:
/// 1. ``UIViewRepresentable/makeUIView(context:)``: Create and return an
/// instance of your
/// ``UIViewRepresentable/UIViewType`` here.
/// 2. ``UIViewRepresentable/updateUIView(_:context:)``: This is immediately
/// called *once*
/// after the call to ``UIViewRepresentable/makeUIView(context:)``, then called
/// whenever any state changes.
/// 3. ``UIViewRepresentable/dismantleUIView(_:coordinator:)-77431``: Upon
/// destruction of the parent container, this gets called.
/// (This is **optional**. A default implementation is provided.)
/// 4. ``UIViewRepresentable/makeCoordinator()-0d1c6``: This creates a
/// ``UIViewRepresentable/Coordinator`` for the view.
/// (This is also **optional**.)
///
/// ### Port a simple `UIView`
///
/// To port a simple UIKit view, `UIActivityIndicatorView`, you could use the
/// following setup:
///
/// ```
/// struct ActivityIndicator: UIViewRepresentable {
///     typealias Context = UIViewRepresentableContext<Self>
///     typealias UIViewType = UIActivityIndicatorView
///
///     let isAnimated: Bool
///
///     public func makeUIView(context: Context) -> UIViewType {
///         UIActivityIndicatorView(style: .medium) // create the instance of the view
///     }
///
///     public func updateUIView(_ uiView: UIViewType, context: Context) {
///         // Check if isAnimated is true, and if the view is inactive.
///         if isAnimated && !uiView.isAnimating {
///             uiView.startAnimating() // Animate
///         }
///
///         // Check if isAnimated is false, and if the view is active.
///         if !isAnimated && uiView.isAnimating {
///             uiView.stopAnimating() // Stop animating
///         }
///     }
/// }
/// ```
///
/// Note:
/// - In ``UIViewRepresentable/updateUIView(_:context:)``, you must handle
/// `isAnimated` being either `true` or `false`.
/// - No redundant calls are made to `startAnimating` and `stopAnimating`.
/// Redundant calls are guarded against by checking whether
/// `uiView.isAnimating` is true or not. This is a general principle for
/// optimizing the performance of your ``UIViewRepresentable``.
///
/// Having implemented it as a `UViewRepresentable`, you could now use it in SwiftUI. For example:
///
/// ```
/// struct ContentView: View {
///     @State var isAnimating: Bool = false
///
///     var body: some View {
///         VStack {
///             Toggle("Animating", isOn: $isAnimating)
///             ActivityIndicator(isAnimated: isAnimating)
///         }
///     }
/// }
/// ```
///
/// ![A gif that displays a view with a VStack containing a toggle named "Animating" and an activity indicator; when the toggle is flipped on, the small gray rotating activity indicator appears.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/UIViewRepresentable-example-1.gif)
///
/// In this example, the `ActivityIndicator` from before is used and can be
/// toggled by passing a boolean to `ActivityIndicator.init(isAnimated:)`.
/// [uiviewrepresentable-context ->]
/// ### Context-aware ``UIViewRepresentable``s
///
/// SwiftUI heavily relies on the environment, by way of environment objects
/// (``View/environmentObject(_:)``) and environment values (``EnvironmentValues``).
/// Environment values are useful for creating intelligent
/// and context-aware UIKit ports.
///
/// For example, we can remove the `isAnimated` parameter from
/// `ActivityIndicator`, and use ``EnvironmentValues/isEnabled`` from the environment instead
/// via ``EnvironmentValues``'s ``EnvironmentValues/isEnabled``:
///
/// ```
/// struct ActivityIndicator: UIViewRepresentable {
///     typealias Context = UIViewRepresentableContext<Self>
///     typealias UIViewType = UIActivityIndicatorView
///
///     public func makeUIView(context: Context) -> UIViewType {
///         UIActivityIndicatorView(style: .medium)
///     }
///
///     public func updateUIView(_ uiView: UIViewType, context: Context) {
///         if context.environment.isEnabled && !uiView.isAnimating {
///             uiView.startAnimating()
///         }
///         if !context.environment.isEnabled && uiView.isAnimating {
///             uiView.stopAnimating()
///         }
///     }
/// }
/// ```
/// [<-]
/// In this example, `context` is used to access the view's current
/// ``environment`` (via `context.environment`), giving you access to the latest
/// `EnvironmentValues`. By reading ``EnvironmentValues/isEnabled``, we can get
/// rid of the `isAnimated` parameter in favor of reading it from the context.
/// This has the added advantage of being passed from any level at the top,
/// because environment values propagate down the view hierarchy.
///
/// The ``View/disabled(_:)`` modifier is responsible for modifying
/// ``EnvironmentValues/isEnabled``. The example usage must be updated to use
/// ``View/disabled(_:)`` instead of `isAnimated`:
///
/// ```
/// struct ContentView: View {
///     @State var isAnimating: Bool = false
///
///     var body: some View {
///         VStack {
///             Toggle("Animating", isOn: $isAnimating)
///
///             ActivityIndicator()
///                 .disabled(!isAnimating)
///         }
///     }
/// }
/// ```
///
/// ![A gif that displays a view with a VStack containing a toggle named "Animating" and an activity indicator; when the toggle is flipped on, the small gray rotating activity indicator appears.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/UIViewRepresentable-example-2.gif)
///
/// Using ``View/disabled(_:)``, the activity indicator can now be made active or inactive.
///
/// The benefits of using the environment and context become apparent when multiple views are used together. For example:
///
/// ```
/// struct ContentView: View {
///     @State var isAnimating: Bool = false
///
///     var body: some View {
///         VStack {
///             Toggle("Animating", isOn: $isAnimating)
///             VStack {
///                 ActivityIndicator()
///                 ActivityIndicator()
///                 ActivityIndicator()
///             }
///             .disabled(!isAnimating)
///         }
///     }
/// }
/// ```
///
/// ![A gif that displays a view with a VStack containing a toggle named "Animating" and three activity indicators; when the toggle is flipped on, the small gray rotating activity indicators appear.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/UIViewRepresentable-example-3.gif)
///
/// A single `View/disabled(_:)` modifier on the ``VStack`` can now become
/// responsible for enabling/disabling the activity indicators inside the stack.
/// This also allows parent views, that aren't aware of `ContentView`'s
/// implementation, to control whether views within it are enabled or disabled.
///
/// ### Implementing UIKit delegates for a ``UIViewRepresentable``
///
/// UIKit views often require **delegates** to communicate events and pass data
/// back and forth with their view controllers. Since SwiftUI is all about
/// modularity and componentization, there is no concept of a
/// *view controller*. ``UIViewRepresentable`` uses the concept of a *coordinator*
/// to port views reliant on the delegate pattern.
///
/// Learn more about **delegation** in Swift
/// [here](https://www.swiftbysundell.com/articles/delegation-in-swift/).
///
/// For example, here is an example port of `UISearchBar`:
///
/// ```
/// struct SearchBar: UIViewRepresentable {
///     let placeholder: String
///     @Binding var text: String
///
///     func makeCoordinator() -> Coordinator {
///         // Create an instance of Coordinator
///         Coordinator(self)
///     }
///
///     func makeUIView(context: Context) -> UISearchBar {
///         let searchBar = UISearchBar(frame: .zero)
///
///         searchBar.placeholder = placeholder
///         searchBar.delegate = context.coordinator
///
///         return searchBar
///     }
///
///     func updateUIView(_ uiView: UISearchBar, context: Context) {
///         // Set the search bar's text to the value of the binding
///         uiView.text = text
///     }
///
///
///     class Coordinator: NSObject, UISearchBarDelegate {
///         var parent: SearchBar
///
///         init(_ searchBar: SearchBar) {
///             parent = searchBar
///         }
///
///         func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
///             // Set the binding's value to the latest search bar text
///             parent.text = searchText
///         }
///     }
/// }
/// ```
///
/// A search bar is a good example of a complex UIKit view. It is a control
/// responsible for text input with multiple lifecycle events, and it uses
/// the delegate pattern to inform the observer whenever these events occur.
/// In SwiftUI, data is passed using bindings, and there is no concept of a
/// delegate.
///
/// The ``UIViewRepresentable/Coordinator`` is the glue between a
/// SwiftUI-style binding-pattern and a UIKit-style delegate-pattern.
/// A ``UIViewRepresentable/Coordinator`` is a state object created and maintained
/// for the lifetime of a ``UIViewRepresentable``, that typically implements the
/// primary delegate for the UIKit view being ported. In this case, the
/// `UIViewType` is `UISearchBar` and its primary delegate type is
/// `UISearchBarDelegate`.
///
/// Text input controls in SwiftUI often take a
/// [`String`](https://developer.apple.com/documentation/swift/string)
/// ``Binding`` in their
/// initializer, and use it to get/set the latest text entered by the user
/// via control. It's extremely important to note that bindings are
/// bidirectional, because SwiftUI ports of UIKit views must also **get** the
/// latest input from the ``Binding``. UIKit patterns typically only require
/// notifying the observer and thus setting the values, but in SwiftUI it is
/// imperative to handle both to be a good SwiftUI citizen.
///
/// Here is example of using the search part port:
///
/// ```
/// struct ContentView: View {
///     @State var searchText: String = ""
///
///     var body: some View {
///         VStack {
///             SearchBar(placeholder: "Enter something here", text: $searchText)
///             Text("Entered text: \(searchText)")
///         }
///     }
/// }
/// ```
///
/// ![A gif that displays a view with a VStack containing a search var with a placeholder that reads "Enter somethign here" and a text view that reads "Entered text:"; whne text is entered in the search bar, it is also displayed in the text view.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/UIViewRepresentable-example-4.gif)
///
/// In this example, `SearchBar` is bound to a state variable, `searchText`.
/// To confirm that values are being written as they are input, a ``Text``
/// reflects the latest value of the state variable.
///
/// - Note: If `searchText`'s initial value is used to set the initial
/// text of the` UISearchBar` represented by `SearchBar`. This means if the
/// initial value of `searchText` was set to `"Bananas 🍌🍌"`, `SearchBar`'
/// would have an initial search text of `"Bananas 🍌🍌"` already loaded.
///
/// ### Further notes
///
/// - Creating UIKit views are expensive. That is why they are done once per
/// lifetime of a ``UIViewRepresentable``.
/// - Because the *same* `UIViewType` instance is reused as much as possible,
/// ``UIViewRepresentable/updateUIView(_:context:)`` is responsible for making
/// sure that the parameters passed via the initializer, and the SwiftUI
/// environment, are always in sync with the UIKit view being managed by the
/// representable.
///
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public protocol UIViewRepresentable : View where Self.Body == Never { }
extension UIViewRepresentable : View where Self.Body == Never {

    /// The type of view to present.
    associatedtype UIViewType : UIView

    /// Creates the view object and configures its initial state.
    ///
    /// You must implement this method and use it to create your view object.
    /// Configure the view using your app's current data and contents of the
    /// `context` parameter. The system calls this method only once, when it
    /// creates your view for the first time. For all subsequent updates, the
    /// system calls the ``UIViewRepresentable/updateUIView(_:context:)``
    /// method.
    ///
    /// - Parameter context: A context structure containing information about
    ///   the current state of the system.
    ///
    /// - Returns: Your UIKit view configured with the provided information.
    func makeUIView(context: Self.Context) -> Self.UIViewType { }

    /// Updates the state of the specified view with new information from
    /// SwiftUI.
    ///
    /// When the state of your app changes, SwiftUI updates the portions of your
    /// interface affected by those changes. SwiftUI calls this method for any
    /// changes affecting the corresponding UIKit view. Use this method to
    /// update the configuration of your view to match the new state information
    /// provided in the `context` parameter.
    ///
    /// - Parameters:
    ///   - uiView: Your custom view object.
    ///   - context: A context structure containing information about the current
    ///     state of the system.
    func updateUIView(_ uiView: Self.UIViewType, context: Self.Context) { }

    /// Cleans up the presented UIKit view (and coordinator) in anticipation of
    /// their removal.
    ///
    /// Use this method to perform additional clean-up work related to your
    /// custom view. For example, you might use this method to remove observers
    /// or update other parts of your SwiftUI interface.
    ///
    /// - Parameters:
    ///   - uiView: Your custom view object.
    ///   - coordinator: The custom coordinator instance you use to communicate
    ///     changes back to SwiftUI. If you do not use a custom coordinator, the
    ///     system provides a default instance.
    static func dismantleUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator) { }

    /// A type to coordinate with the view.
    associatedtype Coordinator = Void

    /// Creates the custom instance that you use to communicate changes from
    /// your view to other parts of your SwiftUI interface.
    ///
    /// Implement this method if changes to your view might affect other parts
    /// of your app. In your implementation, create a custom Swift instance that
    /// can communicate with other parts of your interface. For example, you
    /// might provide an instance that binds its variables to SwiftUI
    /// properties, causing the two to remain synchronized. If your view doesn't
    /// interact with other parts of your app, providing a coordinator is
    /// unnecessary.
    ///
    /// SwiftUI calls this method before calling the
    /// ``UIViewRepresentable/makeUIView(context:)`` method. The system provides
    /// your coordinator either directly or as part of a context structure when
    /// calling the other methods of your representable instance.
    func makeCoordinator() -> Self.Coordinator { }

    /// A type alias for the representable's context.
    ///
    /// - SeeAlso: UIViewRepresentableContext
    typealias Context = UIViewRepresentableContext<Self>
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewRepresentable where Self.Coordinator == Void {

    /// Creates the custom instance that you use to communicate changes from
    /// your view to other parts of your SwiftUI interface.
    ///
    /// Implement this method if changes to your view might affect other parts
    /// of your app. In your implementation, create a custom Swift instance that
    /// can communicate with other parts of your interface. For example, you
    /// might provide an instance that binds its variables to SwiftUI
    /// properties, causing the two to remain synchronized. If your view doesn't
    /// interact with other parts of your app, providing a coordinator is
    /// unnecessary.
    ///
    /// SwiftUI calls this method before calling the
    /// ``UIViewRepresentable/makeUIView(context:)`` method. The system provides
    /// your coordinator either directly or as part of a context structure when
    /// calling the other methods of your representable instance.
    public func makeCoordinator() -> Self.Coordinator { }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewRepresentable {

    /// Cleans up the presented UIKit view (and coordinator) in anticipation of
    /// their removal.
    ///
    /// Use this method to perform additional clean-up work related to your
    /// custom view. For example, you might use this method to remove observers
    /// or update other parts of your SwiftUI interface.
    ///
    /// - Parameters:
    ///   - uiView: Your custom view object.
    ///   - coordinator: The custom coordinator instance you use to communicate
    ///     changes back to SwiftUI. If you do not use a custom coordinator, the
    ///     system provides a default instance.
    public static func dismantleUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator) { }

    /// Declares the content and behavior of this view.
    public var body: Never { get }
}

