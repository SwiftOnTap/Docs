@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Advertises a user activity type.
    ///
    /// You can use `userActivity(_:isActive:_:)` to start, stop, or modify the
    /// advertisement of a specific type of user activity.
    ///
    /// The scope of the activity applies only to the scene or window the
    /// view is in.
    ///
    /// - Parameters:
    ///   - activityType: The type of activity to advertise.
    ///   - isActive: When `false`, avoids advertising the activity. Defaults
    ///     to `true`.
    ///   - update: A function that modifies the passed-in activity for
    ///     advertisement.
    public func userActivity(_ activityType: String, isActive: Bool = true, _ update: @escaping (NSUserActivity) -> ()) -> some View { }


    /// Advertises a user activity type.
    ///
    /// The scope of the activity applies only to the scene or window the
    /// view is in.
    ///
    /// - Parameters:
    ///   - activityType: The type of activity to advertise.
    ///   - element: If the element is `nil`, the handler will not be
    ///     associated with the activity (and if there are no handlers, no
    ///     activity is advertised). The method passes the non-`nil` element to
    ///     the handler as a convenience so the handlers don't all need to
    ///     implement an early exit with
    ///     `guard element = element else { return }`.
    ///    - update: A function that modifies the passed-in activity for
    ///    advertisement.
    public func userActivity<P>(_ activityType: String, element: P?, _ update: @escaping (P, NSUserActivity) -> ()) -> some View { }


    /// Registers a handler to invoke when the view receives the specified
    /// activity type for the scene or window the view is in.
    ///
    /// - Parameters:
    ///   - activityType: The type of activity to handle.
    ///   - action: A function to call that takes a
    ///     [`NSUserActivity`](https://developer.apple.com/documentation/foundation/nsuseractivity)
    ///     object as its parameter
    ///     when delivering the activity to the scene or window the view is in.
    public func onContinueUserActivity(_ activityType: String, perform action: @escaping (NSUserActivity) -> ()) -> some View { }


    /// Registers a handler to invoke when the view receives a url for the
    /// scene or window the view is in.
    ///
    /// - Note: This method handles the reception of Universal Links,
    ///   rather than a
    ///   [`NSUserActivity`](https://developer.apple.com/documentation/foundation/nsuseractivity).
    ///
    /// - Parameter action: A function that takes a
    ///  [URL](https://developer.apple.com/documentation/foundation/url)
    ///  object as its parameter when delivering the URL to the scene or window
    ///  the view is in.
    public func onOpenURL(perform action: @escaping (URL) -> ()) -> some View { }

}

