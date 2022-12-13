/// A UIKit view controller that manages a SwiftUI view hierarchy.
///
/// Create a `UIHostingController` object when you want to integrate SwiftUI
/// views into a UIKit view hierarchy. At creation time, specify the SwiftUI
/// view you want to use as the root view for this view controller; you can
/// change that view later using the ``UIHostingController/rootView``
/// property. Use the hosting controller like you would any other view
/// controller, by presenting it or embedding it as a child view controller
/// in your interface.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
open class UIHostingController<Content> : UIViewController where Content : View {

    /// The key commands that trigger actions on this responder.
    ///
    /// A responder object that supports hardware keyboard commands can redefine
    /// this property and use it to return an array of
    /// [`UIKeyCommand`](https://developer.apple.com/documentation/uikit/uikeycommand)
    /// objects that
    /// it supports. Each key command object represents the keyboard sequence to
    /// recognize and the action method of the responder to call in response.
    ///
    /// The key commands you return from this method are applied to the entire
    /// responder chain. When an key combination is pressed that matches a key
    /// command object, UIKit walks the responder chain looking for an object
    /// that implements the corresponding action method. It calls that method on
    /// the first object it finds and then stops processing the event.
    @objc override dynamic open var keyCommands: [UIKeyCommand]? { get }

    /// Creates a hosting controller object that wraps the specified SwiftUI
    /// view.
    ///
    /// - Parameter rootView: The root view of the SwiftUI view hierarchy that
    ///   you want to manage using the hosting view controller.
    ///
    /// - Returns: A ``UIHostingController`` object initialized with the
    ///   specified SwiftUI view.
    public init(rootView: Content) { }

    /// Creates a hosting controller object from an archive and the specified
    /// SwiftUI view.
    /// - Parameters:
    ///   - coder: The decoder to use during initialization.
    ///   - rootView: The root view of the SwiftUI view hierarchy that you want
    ///     to manage using this view controller.
    ///
    /// - Returns: A `UIViewController` object that you can present from your
    ///   interface.
    public init?(coder aDecoder: NSCoder, rootView: Content) { }

    /// Creates a hosting controller object from the contents of the specified
    /// archive.
    ///
    /// The default implementation of this method throws an exception. To create
    /// your view controller from an archive, override this method and
    /// initialize the superclass using the `init(coder:rootView:)` method
    /// instead.
    ///
    /// - Parameter coder: The decoder to use during initialization.
    @objc required dynamic public init?(coder aDecoder: NSCoder) { }

    /// Notifies the view controller that its view is about to be added to a
    /// view hierarchy.
    ///
    /// SwiftUI calls this method before adding the hosting controller's root
    /// view to the view hierarchy. You can override this method to perform
    /// custom tasks asssociated with the appearance of the view. If you
    /// override this method, you must call `super` at some point in your
    /// implementation.
    ///
    /// - Parameter animated: If `true`, the view is being added
    ///   using an animation.
    @objc override dynamic open func viewWillAppear(_ animated: Bool) { }

    /// Notifies the view controller that its view has been added to a
    /// view hierarchy.
    ///
    /// SwiftUI calls this method after adding the hosting controller's root
    /// view to the view hierarchy. You can override this method to perform
    /// custom tasks asssociated with the appearance of the view. If you
    /// override this method, you must call `super` at some point in your
    /// implementation.
    ///
    /// - Parameter animated: If `true`, the view is being added
    ///   using an animation.
    @objc override dynamic open func viewDidAppear(_ animated: Bool) { }

    /// Notifies the view controller that its view will be removed from a
    /// view hierarchy.
    ///
    /// SwiftUI calls this method before removing the hosting controller's root
    /// view from the view hierarchy. You can override this method to perform
    /// custom tasks asssociated with the disappearance of the view. If you
    /// override this method, you must call `super` at some point in your
    /// implementation.
    ///
    /// - Parameter animated: If `true`, the view is being removed
    ///   using an animation.
    @objc override dynamic open func viewWillDisappear(_ animated: Bool) { }

    /// Called to notify the view controller that its view is about to layout
    /// its subviews.
    ///
    /// When a view's bounds change, the view adjusts the position of its
    /// subviews. Your view controller can override this method to make changes
    /// before the view lays out its subviews. The default implementation of
    /// this method does nothing.
    @objc override dynamic open func viewWillLayoutSubviews() { }

    /// The root view of the SwiftUI view hierarchy managed by this view
    /// controller.
    public var rootView: Content

    /// Calculates and returns the most appropriate size for the current view.
    ///
    /// - Parameter size: The proposed new size for the view.
    ///
    /// - Returns: The size that offers the best fit for the root view and its
    ///   contents.
    public func sizeThatFits(in size: CGSize) -> CGSize { }

    @objc override dynamic open func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) { }

    /// The preferred status bar style for the view controller.
    @objc override dynamic open var preferredStatusBarStyle: UIStatusBarStyle { get }

    /// A Boolean value that indicates whether the view controller prefers the
    /// status bar to be hidden or shown.
    @objc override dynamic open var prefersStatusBarHidden: Bool { get }

    /// The animation style to use when hiding or showing the status bar for
    /// this view controller.
    @objc override dynamic open var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { get }

    /// Called when the system needs the view controller to use for determining
    /// status bar hidden/unhidden state.
    ///
    /// If your container view controller derives the hidden state of the status
    /// bar from one of its child view controllers, implement this method to
    /// specify which child view controller you want to control the hidden/
    /// unhidden state. If you return `nil` or do not override this method, the
    /// status bar hidden/unhidden state for `self` is used.
    ///
    /// If you change the return value from this method, call the
    /// `setNeedsStatusBarAppearanceUpdate()` method.
    ///
    /// - Returns The view controller whose status bar hidden/unhidden status
    /// should be used. Default return value is `nil`.
    @objc override dynamic open var childForStatusBarHidden: UIViewController? { get }

    /// Notifies the container that the size of its view is about to change.
    ///
    /// This  method is called before changing the size of a presented view
    /// controller’s view. You can override this method in your own objects and
    /// use it to perform additional tasks related to the size change. For
    /// example, a container view controller might use this method to override
    /// the traits of its embedded child view controllers. Use the provided
    /// `coordinator` object to animate any changes you make.

    /// If you override this method in your custom view controllers, always call
    /// super at some point in your implementation so that UIKit can forward the
    /// size change message appropriately. View controllers forward the size
    /// change message to their views and child view controllers. Presentation
    /// controllers forward the size change to their presented view controller.
    ///
    /// - Parameters:
    ///   - size: The new size for the container’s view.
    ///   - coordinator: The transition coordinator object managing the size
    ///   change. You can use this object to animate your changes or get
    ///   information about the transition that is in progress.
    @objc override dynamic open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) { }

    /// Called just before the hosting controller is added or removed from a
    /// container view controller.
    ///
    /// Your hosting controller can override this method when it needs to know
    /// that it has been added to a container.
    ///
    /// If you are implementing your own container view controller, it must call
    /// the `willMove(toParent:)` method of the child view controller before
    /// calling the `removeFromParent()` method, passing in a parent value of
    /// `nil`.
    ///
    /// When your custom container calls the `addChild(_:)` method, it
    /// automatically calls the `willMove(toParent:)` method of the view
    /// controller to be added as a child before adding it.
    ///
    /// - Parameter parent: The parent view controller, or `nil` if there is no
    /// parent.
    @objc override dynamic open func willMove(toParent parent: UIViewController?) { }

    /// Called after the hosting controller is added or removed from a container
    /// view controller.
    ///
    /// Your hosting controller can override this method when it wants to react to
    /// being added to a container.
    ///
    /// If you are implementing your own container view controller, it must call
    /// the `didMove(toParent:)` method of the child view controller after the
    /// transition to the new controller is complete or, if there is no
    /// transition, immediately after calling the `addChild(_:)` method.
    ///
    /// The `removeFromParent()` method automatically calls the
    /// `didMove(toParent:)` method of the child view controller after it
    /// removes the child.
    ///
    /// - Parameter parent: The parent view controller, or `nil` if there is no
    /// parent.
    @objc override dynamic open func didMove(toParent parent: UIViewController?) { }

    /// Returns the target object that responds to an action.
    ///
    /// This method is called whenever an action needs to be invoked by the
    /// object. The default implementation calls the
    /// `canPerformAction(_:withSender:)` method to determine whether it can
    /// invoke the action. If the object can invoke the action, it returns
    /// itself, otherwise it passes the request up the responder chain. Your app
    /// should override this method if it wants to override how a target is
    /// selected.
    ///
    /// - Parameters:
    ///      - action: A selector that identifies a method associated with a command.
    ///   - sender: The object calling this method. For the editing menu
    ///   commands, this is the shared `UIKit/UIApplication` object. Depending on the
    ///   context, you can query the sender for information to help you determine
    ///   the target of the command.
    ///
    /// - Returns: The object whose action method is invoked to execute the command.
    @objc override dynamic open func target(forAction action: Selector, withSender sender: Any?) -> Any? { }

    /// Returns a newly initialized view controller with the nib file in the specified bundle.
    ///
    /// This is the designated initializer for this class. When using a
    /// storyboard to define your hosting controller and its associated views,
    /// you never initialize your view controller class directly. Instead, view
    /// controllers are instantiated by the storyboard either automatically when
    /// a segue is triggered or programmatically when your app calls the
    /// `instantiateViewController(withIdentifier:)` method of a storyboard
    /// object. When instantiating a view controller from a storyboard, iOS
    /// initializes the new view controller by calling its `init(coder:)`
    /// method instead of this method and sets the `nibName` property to a nib
    /// file stored inside the storyboard.
    ///
    /// The nib file you specify is not loaded right away. It is loaded the
    /// first time the view controller's view is accessed. If you want to
    /// perform additional initialization after the nib file is loaded, override
    /// the `viewDidLoad()` method and perform your tasks there.
    ///
    /// If you specify `nil` for the `nibName` parameter and you do not override
    /// the `loadView()` method, the view controller searches for a nib file
    /// as described in the `nibName` property.
    ///
    /// For more information about how a view controller loads its view, see
    /// [View Controller Programming Guide for iOS](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/index.html#//apple_ref/doc/uid/TP40007457).
    ///
    /// - Parameters:
    ///   - nibNameOrNil: The name of the nib file to associate with the view
    ///   controller. The nib file name should not contain any leading path
    ///   information. If you specify `nil`, the `nibName` property is set to `nil`.
    ///   - nibBundleOrNil: The bundle in which to search for the nib file.
    ///   This method looks for the nib file in the bundle's language-specific
    ///   project directories first, followed by the Resources directory.
    ///
    /// - Returns: A newly initialized ``UIHostingController`` object.
    @objc override dynamic public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) { }
}

