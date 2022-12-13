/// A view that updates according to a schedule that you provide.
///
/// A timeline view acts as a container with no appearance of its own. Instead,
/// it redraws the content it contains at scheduled points in time.
/// For example, you can update the face of an analog timer once per second:
///
///     TimelineView(.periodic(from: startDate, by: 1)) { context in
///         AnalogTimerView(date: context.date)
///     }
///
/// The closure that creates the content receives an input of type ``Context``
/// that you can use to customize the content's appearance. The context includes
/// the ``Context/date`` that triggered the update. In the example above,
/// the timeline view sends that date to an analog timer that you create so the
/// timer view knows how to draw the hands on its face.
///
/// The context also includes a ``Context/cadence-swift.property``
/// property that you can use to hide unnecessary detail. For example, you
/// can use the cadence to decide when it's appropriate to display the
/// timer's second hand:
///
///     TimelineView(.periodic(from: startDate, by: 1.0)) { context in
///         AnalogTimerView(
///             date: context.date,
///             showSeconds: context.cadence <= .seconds)
///     }
///
/// The system might use a cadence that's slower than the schedule's
/// update rate. For example, a view on watchOS might remain visible when the
/// user lowers their wrist, but update less frequently, and thus require
/// less detail.
///
/// You can define a custom schedule by creating a type that conforms to the
/// ``TimelineSchedule`` protocol, or use one of the built-in schedule types:
/// * Use an ``TimelineSchedule/everyMinute`` schedule to update at the
///   beginning of each minute.
/// * Use a ``TimelineSchedule/periodic(from:by:)`` schedule to update
///   periodically with a custom start time and interval between updates.
/// * Use an ``TimelineSchedule/explicit(_:)`` schedule when you need a finite number, or
///   irregular set of updates.
///
/// For a schedule containing only dates in the past,
/// the timeline view shows the last date in the schedule.
/// For a schedule containing only dates in the future,
/// the timeline draws its content using the current date
/// until the first scheduled date arrives.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct TimelineView<Schedule, Content> where Schedule : TimelineSchedule {

    /// Information passed to a timeline view's content callback.
    ///
    /// The context includes both the ``date`` from the schedule that triggered
    /// the callback, and a ``cadence-swift.property`` that you can use
    /// to customize the appearance of your view. For example, you might choose
    /// to display the second hand of an analog clock only when the cadence is
    /// ``Cadence-swift.enum/seconds`` or faster.
    public struct Context {

        /// A rate at which timeline views can receive updates.
        ///
        /// Use the cadence presented to content in a ``TimelineView`` to hide
        /// information that updates faster than the view's current update rate.
        /// For example, you could hide the millisecond component of a digital
        /// timer when the cadence is ``seconds`` or ``minutes``.
        ///
        /// Because this enumeration conforms to the
        /// <doc://com.apple.documentation/documentation/Swift/Comparable>
        /// protocol, you can compare cadences with relational operators.
        /// Slower cadences have higher values, so you could perform the check
        /// described above with the following comparison:
        ///
        ///     let hideMilliseconds = cadence > .live
        ///
        public enum Cadence : Comparable {

            /// Updates the view continuously.
            case live

            /// Updates the view approximately once per second.
            case seconds

            /// Updates the view approximately once per minute.
            case minutes

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: TimelineView<Schedule, Content>.Context.Cadence, b: TimelineView<Schedule, Content>.Context.Cadence) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
            ///   compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// Returns a Boolean value indicating whether the value of the first
            /// argument is less than that of the second argument.
            ///
            /// This function is the only requirement of the `Comparable` protocol. The
            /// remainder of the relational operator functions are implemented by the
            /// standard library for any type that conforms to `Comparable`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func < (a: TimelineView<Schedule, Content>.Context.Cadence, b: TimelineView<Schedule, Content>.Context.Cadence) -> Bool

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            public var hashValue: Int { get }
        }

        /// The date from the schedule that triggered the current view update.
        ///
        /// The first time a ``TimelineView`` closure receives this date, it
        /// might be in the past. For example, if you create an
        /// ``TimelineSchedule/everyMinute`` schedule at `10:09:55`, the
        /// schedule creates entries `10:09:00`, `10:10:00`, `10:11:00`, and so
        /// on. In response, the timeline view performs an initial update
        /// immediately, at `10:09:55`, but the context contains the `10:09:00`
        /// date entry. Subsequent entries arrive at their corresponding times.
        public let date: Date

        /// The rate at which the timeline updates the view.
        ///
        /// Use this value to hide information that updates faster than the
        /// view's current update rate. For example, you could hide the
        /// millisecond component of a digital timer when the cadence is
        /// anything slower than ``Cadence-swift.enum/live``.
        ///
        /// Because the ``Cadence-swift.enum`` enumeration conforms to the
        /// <doc://com.apple.documentation/documentation/Swift/Comparable>
        /// protocol, you can compare cadences with relational operators.
        /// Slower cadences have higher values, so you could perform the check
        /// described above with the following comparison:
        ///
        ///     let hideMilliseconds = cadence > .live
        ///
        public let cadence: TimelineView<Schedule, Content>.Context.Cadence
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension TimelineView : View where Content : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    /// Creates a new timeline view that uses the given schedule.
    ///
    /// - Parameters:
    ///   - schedule: A schedule that produces a sequence of dates that
    ///     indicate the instances when the view should update.
    ///     Use a type that conforms to ``TimelineSchedule``, like
    ///     ``TimelineSchedule/everyMinute``, or a custom timeline schedule
    ///     that you define.
    ///   - content: A closure that generates view content at the moments
    ///     indicated by the schedule. The closure takes an input of type
    ///     ``Context`` that includes the date from the schedule that
    ///     prompted the update, as well as a ``Context/Cadence-swift.enum``
    ///     value that the view can use to customize its appearance.
    public init(_ schedule: Schedule, @ViewBuilder content: @escaping (TimelineView<Schedule, Content>.Context) -> Content) { }
}

@available(iOS 16.0, watchOS 8.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
extension TimelineView.Context {

    /// Resets any pre-rendered views the system has from the timeline.
    ///
    /// When entering Always On Display, the system might pre-render frames. If the
    /// content of these frames must change in a way that isn't reflected by
    /// the schedule or the timeline view's current bindings --- for example, because
    /// the user changes the title of a future calendar event --- call this method to
    /// request that the frames be regenerated.
    public func invalidateTimelineContent() { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension TimelineView.Context.Cadence : Hashable { }

