/// A schedule for updating a timeline view at regular intervals.
///
/// You can also use ``TimelineSchedule/periodic(from:by:)`` to construct this
/// schedule.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct PeriodicTimelineSchedule : TimelineSchedule {

    /// The sequence of dates in periodic schedule.
    ///
    /// The ``PeriodicTimelineSchedule/entries(from:mode:)`` method returns
    /// a value of this type, which is a
    /// <doc://com.apple.documentation/documentation/Swift/Sequence>
    /// of periodic dates in ascending order. A ``TimelineView`` that you
    /// create updates its content at the moments in time corresponding to the
    /// dates included in the sequence.
    public struct Entries : Sequence, IteratorProtocol {

        /// Advances to the next element and returns it, or `nil` if no next element
        /// exists.
        ///
        /// Repeatedly calling this method returns, in order, all the elements of the
        /// underlying sequence. As soon as the sequence has run out of elements, all
        /// subsequent calls return `nil`.
        ///
        /// You must not call this method if any other copy of this iterator has been
        /// advanced with a call to its `next()` method.
        ///
        /// The following example shows how an iterator can be used explicitly to
        /// emulate a `for`-`in` loop. First, retrieve a sequence's iterator, and
        /// then call the iterator's `next()` method until it returns `nil`.
        ///
        ///     let numbers = [2, 3, 5, 7]
        ///     var numbersIterator = numbers.makeIterator()
        ///
        ///     while let num = numbersIterator.next() {
        ///         print(num)
        ///     }
        ///     // Prints "2"
        ///     // Prints "3"
        ///     // Prints "5"
        ///     // Prints "7"
        ///
        /// - Returns: The next element in the underlying sequence, if a next element
        ///   exists; otherwise, `nil`.
        public mutating func next() -> Date? { }

        /// A type representing the sequence's elements.
        public typealias Element = Date

        /// A type that provides the sequence's iteration interface and
        /// encapsulates its iteration state.
        public typealias Iterator = PeriodicTimelineSchedule.Entries
    }

    /// Creates a periodic update schedule.
    ///
    /// Use the ``PeriodicTimelineSchedule/entries(from:mode:)`` method
    /// to get the sequence of dates.
    ///
    /// - Parameters:
    ///   - startDate: The date on which to start the sequence.
    ///   - interval: The time interval between successive sequence entries.
    public init(from startDate: Date, by interval: TimeInterval) { }

    /// Provides a sequence of periodic dates starting from around a given date.
    ///
    /// A ``TimelineView`` that you create with a schedule calls this method
    /// to ask the schedule when to update its content. The method returns
    /// a sequence of equally spaced dates in increasing order that represent
    /// points in time when the timeline view should update.
    ///
    /// The schedule defines its periodicity and phase aligment based on the
    /// parameters you pass to its ``init(from:by:)`` initializer.
    /// For example, for a `startDate` and `interval` of `10:09:30` and
    /// `60` seconds, the schedule prepares to issue dates half past each
    /// minute. The `startDate` that you pass to the `entries(from:mode:)`
    /// method then dictates the first date of the sequence as the beginning of
    /// the interval that the start date overlaps. Continuing the example above,
    /// a start date of `10:34:45` causes the first sequence entry to be
    /// `10:34:30`, because that's the start of the interval in which the
    /// start date appears.
    public func entries(from startDate: Date, mode: TimelineScheduleMode) -> PeriodicTimelineSchedule.Entries { }
}

