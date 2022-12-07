/// A view that subscribes to a publisher with an action.
///
/// This view produces basically the same thing as another
/// view with the ``View/onReceive(_:perform:)`` modifier applied to it.
/// Whenever possible, use ``View/onReceive(_:perform:)``, as it results
/// in cleaner code.
///
/// The following example shows `SubscriptionView` used to exactly reproduce
/// a view with ``View/onReceive(_:perform:)``.
///
/// ```
/// struct TimerView: View {
///     @State private var time1 = ""
///     @State private var time2 = ""
///
///     let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
///
///     var body: some View {
///         VStack {
///             SubscriptionView(content: Text(time1), publisher: timer) { t in
///                 time1 = String(describing: t)
///             }
///             Text(time2).onReceive(timer) { t in
///                 time2 = String(describing: t)
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying two identical timers in a VStack, the first rendered
/// with SubscriptionView and the second with onReceive. The timers read as
/// "2021-03-30 00:06:11 +0000". ](subscription-view-init-ex.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct SubscriptionView<PublisherType, Content> : View where PublisherType : Publisher, Content : View, PublisherType.Failure == Never {

    /// The content view.
    ///
    /// This is the content property component of a ``SubscriptionView``.
    ///
    /// In the following example, the ``SubscriptionView``'s content
    /// is a ``Text`` view:
    ///
    /// ```
    /// struct TimerView: View {
    ///     @State private var time = ""
    ///     let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    ///
    ///     var body: some View {
    ///         SubscriptionView(content: Text(time), publisher: timer) { t in
    ///             time = String(describing: t)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a running timer in the center of the screen, where
    /// the content passed to the SubscriptionView is a text view which displays
    /// the timer.](subscription-view-init-cpa.ex.gif)
    ///
    public var content: Content

    /// The `Publisher` that is being subscribed.
    ///
    /// This is the publisher instance that your ``SubscriptionView``
    /// listens to for executing its action parameter. You can declare
    /// a ``State`` variable in your view so that your
    /// ``SubscriptionView/content`` view can get updated when this publisher
    /// sends a change.
    ///
    /// See [`Publisher`](https://developer.apple.com/documentation/combine/publisher)
    /// for the Apple docs on what a publisher is and how to use it. Note
    /// that for a ``SubscriptionView``, the publisher's
    /// [`Failure`](https://developer.apple.com/documentation/combine/publisher/failure)
    /// type must be
    /// [`Never`](https://developer.apple.com/documentation/swift/never),
    /// meaning the publisher can never fail.
    ///
    /// If you're really interested in asynchronous event processing,
    /// check out Apple's documentation on their
    /// [Combine](https://developer.apple.com/documentation/combine)
    /// framework (or drop us a [line](mailto:ben@swiftontap.com) if
    /// you want to see it documented here 🙂).
    ///
    /// In the example below, the publisher is a
    /// [`Timer`](https://developer.apple.com/documentation/foundation/timer).
    ///
    /// ```
    /// struct TimerView: View {
    ///     @State private var time = ""
    ///     let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    ///
    ///     var body: some View {
    ///         SubscriptionView(content: Text(time), publisher: timer) { t in
    ///             time = String(describing: t)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a running timer in the center of the screen, where
    /// the publisher passed to the SubscriptionView is a timer which dictates
    /// the actions of the view.](subscription-view-init-cpa.ex.gif)
    ///
    public var publisher: PublisherType

    /// The `Action` executed when `publisher` emits an event.
    ///
    /// This function is called whenever the ``SubscriptionView``
    /// receives an event from the ``SubscriptionView/publisher``
    /// property. It takes in a parameter of the publisher's output,
    /// so you can read it and even update the view accordingly.
    ///
    /// In the example below, we update the time ``Text`` with the time
    /// string received from the publisher.
    ///
    /// ```
    /// struct TimerView: View {
    ///     @State private var time = ""
    ///     let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    ///
    ///     var body: some View {
    ///         SubscriptionView(content: Text(time), publisher: timer) { t in
    ///             time = String(describing: t)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a running timer in the center of the screen, where
    /// the action is called whenever the SubscriptionView receives a new time
    /// from the publisher property.](subscription-view-init-cpa.ex.gif)
    ///
    public var action: (PublisherType.Output) -> Void

    /// Create a view with content that subscribes to a publisher with an action.
    ///
    /// ```
    /// struct TimerView: View {
    ///     @State private var time = ""
    ///     let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    ///
    ///     var body: some View {
    ///         SubscriptionView(content: Text(time), publisher: timer) { t in
    ///             time = String(describing: t)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a running timer in the center of the screen, which
    /// has been initialized to create a view that subscribes to a timer.](subscription-view-init-cpa.ex.gif)
    ///
    /// - Parameters:
    ///   - content: The content that you want displayed in the view.
    ///   - publisher: The publisher to use for the subscription.
    ///   - action: The action you want performed in conjunction with the publisher.
    @inlinable public init(content: Content, publisher: PublisherType, action: @escaping (PublisherType.Output) -> Void) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

