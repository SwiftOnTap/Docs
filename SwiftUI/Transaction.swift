/// The context of the current state-processing update.
///
/// Use a transaction to pass an animation between views in a view hierarchy.
///
/// The root transaction for a state change comes from the binding that changed,
/// plus any global values set by calling ``withTransaction(_:_:)`` or
/// ``withAnimation(_:_:)``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Transaction {

    /// Creates a transaction.
    @inlinable public init() { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Transaction {

    /// Creates a transaction and assigns its animation property.
    ///
    /// - Parameter animation: The animation to perform when the current state
    ///   changes.
    public init(animation: Animation?) { }

    /// The animation, if any, associated with the current state change.
    public var animation: Animation?

    /// A Boolean value that indicates whether views should disable animations.
    ///
    /// This value is `true` during the initial phase of a two-part transition
    /// update, to prevent ``View/animation(_:)`` from inserting new animations
    /// into the transaction.
    public var disablesAnimations: Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Transaction {

    /// A Boolean value that indicates whether the transaction originated from
    /// an action that produces a sequence of values.
    ///
    /// This value is `true` if a continuous action created the transaction, and
    /// is `false` otherwise. Continuous actions include things like dragging a
    /// slider or pressing and holding a stepper, as opposed to tapping a
    /// button.
    public var isContinuous: Bool
}

