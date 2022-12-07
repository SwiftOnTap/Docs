/// A view that represents a UIKit view controller.
///
/// Use a ``UIViewControllerRepresentable`` instance to create and manage a
/// [`UIViewController`](https://developer.apple.com/documentation/uikit/uiviewcontroller) object in your
/// SwiftUI interface. Adopt this protocol in one of your app's custom
/// instances, and use its methods to create, update, and tear down your view
/// controller. The creation and update processes parallel the behavior of
/// SwiftUI views, and you use them to configure your view controller with your
/// app's current state information. Use the teardown process to remove your
/// view controller cleanly from your SwiftUI. For example, you might use the
/// teardown process to notify other objects that the view controller is
/// disappearing.
///
/// To add your view controller into your SwiftUI interface, create your
/// ``UIViewControllerRepresentable`` instance and add it to your SwiftUI
/// interface. The system calls the methods of your custom instance at
/// appropriate times.
///
/// The system doesn't automatically communicate changes occurring within your
/// view controller to other parts of your SwiftUI interface. When you want your
/// view controller to coordinate with other SwiftUI views, you must provide a
/// `NSViewControllerRepresentable/Coordinator` instance to facilitate those
/// interactions. For example, you use a coordinator to forward target-action
/// and delegate messages from your view controller to any SwiftUI views.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public protocol UIViewControllerRepresentable : View where Self.Body == Never { }
extension UIViewControllerRepresentable : View where Self.Body == Never {

    /// The type of view controller to present.
    associatedtype UIViewControllerType : UIViewController

    /// Creates the view controller object and configures its initial state.
    ///
    /// You must implement this method and use it to create your view controller
    /// object. Create the view controller using your app's current data and
    /// contents of the `context` parameter. The system calls this method only
    /// once, when it creates your view controller for the first time. For all
    /// subsequent updates, the system calls the
    /// ``UIViewControllerRepresentable/updateUIViewController(_:context:)``
    /// method.
    ///
    /// - Parameter context: A context structure containing information about
    ///   the current state of the system.
    ///
    /// - Returns: Your UIKit view controller configured with the provided
    ///   information.
    func makeUIViewController(context: Self.Context) -> Self.UIViewControllerType { }

    /// Updates the state of the specified view controller with new information
    /// from SwiftUI.
    ///
    /// When the state of your app changes, SwiftUI updates the portions of your
    /// interface affected by those changes. SwiftUI calls this method for any
    /// changes affecting the corresponding AppKit view controller. Use this
    /// method to update the configuration of your view controller to match the
    /// new state information provided in the `context` parameter.
    ///
    /// - Parameters:
    ///   - uiViewController: Your custom view controller object.
    ///   - context: A context structure containing information about the current
    ///     state of the system.
    func updateUIViewController(_ uiViewController: Self.UIViewControllerType, context: Self.Context) { }

    /// Cleans up the presented view controller (and coordinator) in
    /// anticipation of their removal.
    ///
    /// Use this method to perform additional clean-up work related to your
    /// custom view controller. For example, you might use this method to remove
    /// observers or update other parts of your SwiftUI interface.
    ///
    /// - Parameters:
    ///   - uiViewController: Your custom view controller object.
    ///   - coordinator: The custom coordinator instance you use to communicate
    ///     changes back to SwiftUI. If you do not use a custom coordinator, the
    ///     system provides a default instance.
    static func dismantleUIViewController(_ uiViewController: Self.UIViewControllerType, coordinator: Self.Coordinator) { }

    /// A type to coordinate with the view controller.
    associatedtype Coordinator = Void

    /// Creates the custom instance that you use to communicate changes from
    /// your view controller to other parts of your SwiftUI interface.
    ///
    /// Implement this method if changes to your view controller might affect
    /// other parts of your app. In your implementation, create a custom Swift
    /// instance that can communicate with other parts of your interface. For
    /// example, you might provide an instance that binds its variables to
    /// SwiftUI properties, causing the two to remain synchronized. If your view
    /// controller doesn't interact with other parts of your app, providing a
    /// coordinator is unnecessary.
    ///
    /// SwiftUI calls this method before calling the
    /// ``UIViewControllerRepresentable/makeUIViewController(context:)`` method.
    /// The system provides your coordinator either directly or as part of a
    /// context structure when calling the other methods of your representable
    /// instance.
    func makeCoordinator() -> Self.Coordinator { }

    /// A type alias for the representable's context.
    ///
    /// - SeeAlso: UIViewControllerRepresentableContext
    typealias Context = UIViewControllerRepresentableContext<Self>
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewControllerRepresentable where Self.Coordinator == Void {

    /// Creates the custom instance that you use to communicate changes from
    /// your view controller to other parts of your SwiftUI interface.
    ///
    /// Implement this method if changes to your view controller might affect
    /// other parts of your app. In your implementation, create a custom Swift
    /// instance that can communicate with other parts of your interface. For
    /// example, you might provide an instance that binds its variables to
    /// SwiftUI properties, causing the two to remain synchronized. If your view
    /// controller doesn't interact with other parts of your app, providing a
    /// coordinator is unnecessary.
    ///
    /// SwiftUI calls this method before calling the
    /// ``UIViewControllerRepresentable/makeUIViewController(context:)`` method.
    /// The system provides your coordinator either directly or as part of a
    /// context structure when calling the other methods of your representable
    /// instance.
    public func makeCoordinator() -> Self.Coordinator { }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewControllerRepresentable {

    /// Cleans up the presented view controller (and coordinator) in
    /// anticipation of their removal.
    ///
    /// Use this method to perform additional clean-up work related to your
    /// custom view controller. For example, you might use this method to remove
    /// observers or update other parts of your SwiftUI interface.
    ///
    /// - Parameters:
    ///   - uiViewController: Your custom view controller object.
    ///   - coordinator: The custom coordinator instance you use to communicate
    ///     changes back to SwiftUI. If you do not use a custom coordinator, the
    ///     system provides a default instance.
    public static func dismantleUIViewController(_ uiViewController: Self.UIViewControllerType, coordinator: Self.Coordinator) { }

    /// Declares the content and behavior of this view.
    public var body: Never { get }
}

