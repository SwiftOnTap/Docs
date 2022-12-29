/// A schedule for updating a timeline view at explicit points in time.
///
/// You can also use ``TimelineSchedule/explicit(_:)`` to construct this
/// schedule.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ExplicitTimelineSchedule<Entries> : TimelineSchedule where Entries : Sequence, Entries.Element == Date {

    /// Creates a schedule composed of an explicit sequence of dates.
    ///
    /// Use the ``ExplicitTimelineSchedule/entries(from:mode:)`` method
    /// to get the sequence of dates.
    ///
    /// - Parameter dates: The sequence of dates at which a timeline view
    ///   updates. Use a monotonically increasing sequence of dates,
    ///   and ensure that at least one is in the future.
    public init(_ dates: Entries) { }

    /// Provides the sequence of dates with which you initialized the schedule.
    ///
    /// A ``TimelineView`` that you create with a schedule calls this
    /// ``TimelineSchedule`` method to ask the schedule when to update its
    /// content. The explicit timeline schedule implementation
    /// of this method returns the unmodified sequence of dates that you
    /// provided when you created the schedule with
    /// ``TimelineSchedule/explicit(_:)``. As a result, this particular
    /// implementation ignores the `startDate` and `mode` parameters.
    ///
    /// - Parameters:
    ///   - startDate: The date from which the sequence begins. This
    ///     particular implementation of the protocol method ignores the start
    ///     date.
    ///   - mode: The mode for the update schedule. This particular
    ///     implementation of the protocol method ignores the mode.
    /// - Returns: The sequence of dates that you provided at initialization.
    public func entries(from startDate: Date, mode: TimelineScheduleMode) -> Entries { }
}
