/// A mode of operation for timeline schedule updates.
///
/// A ``TimelineView`` provides a mode when calling its schedule's
/// ``TimelineSchedule/entries(from:mode:)`` method.
/// The view chooses a mode based on the state of the system.
/// For example, a watchOS view might request a lower frequency
/// of updates, using the ``lowFrequency`` mode, when the user
/// lowers their wrist.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public enum TimelineScheduleMode {

    /// A mode that produces schedule updates at the schedule's natural cadence.
    case normal

    /// A mode that produces schedule updates at a reduced rate.
    ///
    /// In this mode, the schedule should generate only
    /// "major" updates, if possible. For example, a timeline providing
    /// updates to a timer might restrict updates to once a minute while in
    /// this mode.
    case lowFrequency

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension TimelineScheduleMode : Equatable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension TimelineScheduleMode : Hashable { }

