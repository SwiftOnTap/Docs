@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Specifies a modifier indicating the Scene this View
    /// is in can handle matching incoming External Events.
    ///
    /// If no modifier is set in any Views within a Scene, the behavior
    /// is platform dependent. On macOS, a new Scene will be created to
    /// use for the External Event. On iOS, the system will choose an
    /// existing Scene to use.
    ///
    /// On platforms that only allow a single Window/Scene, this method is
    /// ignored, and incoming External Events are always routed to the
    /// existing single Scene.
    ///
    /// - Parameter preferring: A Set of Strings that are checked to see
    /// if they are contained in the targetContentIdenfifier to see if
    /// the Scene this View is in prefers to handle the Exernal Event.
    /// The empty Set and empty Strings never match. The String value
    /// "*" always matches. The String comparisons are case/diacritic
    /// insensitive
    ///
    /// - Parameter allowing: A Set of Strings that are checked to see
    /// if they are contained in the targetContentIdenfifier to see if
    /// the Scene this View is in allows handling the External Event.
    /// The empty Set and empty Strings never match. The String value
    /// "*" always matches.
    public func handlesExternalEvents(preferring: Set<String>, allowing: Set<String>) -> some View { }

}

