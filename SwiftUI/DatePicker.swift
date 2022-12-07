/// A picker control for selecting dates.
///
/// You create a picker by providing 3 things:
/// 1. a `selection` binding
/// 2. a `label`
/// 3. the editable parts of the `Date`
///
/// There are four types of pickers, and three types of labels, making 12 total initializers.
///
/// Picker types:
///
/// 1. **Unlimited** range
/// 2. **Closed** range (maximum and minimum)
/// 3. **From** range (minimum only)
/// 4. **Through** range (maximum only)
///
/// Label types:
/// 1. [`String`](https://developer.apple.com/documentation/swift/string)
/// 2. ``LocalizedStringKey``
/// 3. ``View``
///
/// A simple example looks like this:
///
/// ```
/// struct DatePickerView: View {
///     @State private var date = Date()
///
///     var body: some View {
///         DatePicker("Date", selection: $date)
///     }
/// }
/// ```
///
/// ![Gif displays a date picker view consisting of a calendar in
/// which a date is selected and a time selector in which an hour and minute
/// can be entered and a toggle flips between AM and PM.](date-picker-ex1.gif)
///
/// You can limit the `DatePicker` to specific ranges of dates, allowing
/// selections only before or after a certain date, or between two dates. The
/// following example shows a date-and-time picker that only permits selections
/// within the year 2021 (in the `UTC` time zone).
///
/// struct ContentView: View {
///     @State private var date = Date()
///
///     let dateRange: ClosedRange<Date> = {
///         let calendar = Calendar.current
///         let startComponents = DateComponents(year: 2021, month: 1, day: 1)
///         let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
///         return calendar.date(from:startComponents)!
///             ...
///             calendar.date(from:endComponents)!
///     }()
///
///     var body: some View {
///         DatePicker(
///             "Start Date",
///              selection: $date,
///              in: dateRange,
///              displayedComponents: [.date, .hourAndMinute]
///         )
///     }
/// }
///
/// ![A gif displaying a SwiftUI standard date picker on iOS, with the label Start Date, and
/// buttons for the time 9:58 AM and the date April 12,
/// 2021. The user can only pick within the set range year 2021, so when another
/// year is selected, the picker defaults back to 2021.](datepicker-selectrange.gif)
///
/// ### Styling Date Pickers
///
/// You can customize the appearance and interaction of date pickers using one of the
/// ``DatePickerStyle``s provided by SwiftUI. The full list of styles is:
/// - ``DefaultDatePickerStyle`` (iOS and macOS)
/// - ``WheelDatePickerStyle`` (iOS)
/// - ``GraphicalDatePickerStyle`` (iOS and macOS)
/// - ``CompactDatePickerStyle`` (iOS and macOS)
/// - `FieldDatePickerStyle` (macOS)
/// - `StepperFieldDatePickerStyle` (macOS)
///
/// Currently, you cannot create your own custom ``DatePickerStyle``.
///
/// To set a specific style for all picker instances within a view, use the
/// ``View/datePickerStyle(_:)`` modifier.
///
/// ```
/// struct StyledDatePickerView: View {
///     @State private var date = Date()
///
///     var body: some View {
///         DatePicker(selection: $date, label: { Text("Date") })
///             .datePickerStyle(WheelDatePickerStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a wheel style date picker, in which the week day month
/// and date, the hour time, the minute time, and meridiam (am/pm) can be
/// selected separately by scrolling around a wheel; a light gray box highlights
/// the current selections.](date-picker-ex2.gif)
///
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DatePicker<Label> : View where Label : View {

    /// A type alias for the `DatePickerComponents` option set used in ``DatePicker``.
    public typealias Components = DatePickerComponents

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DatePicker {

    /// Creates a date picker with unlimited range and a View label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker(selection: $date,
    ///                    displayedComponents: [.hourAndMinute, .date],
    ///                    label: { HStack { Image(systemName: "calendar"); Image(systemName: "clock") } })
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current data and a date picker
    /// labelled by two symbols, a calendar and a clock; once clicked, the picker
    /// displays a calendar with a time input and AM/PM switch.](date-picker-init-sdcl-ex.gif)
    ///
    /// - Parameters:
    ///   - selection: The binding Date value of the date picker.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///   - label: A closure that returns a label view.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label) { }

    /// Creates a date picker with closed range and a View label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker(selection: $date,
    ///                    in: Date()...Date().advanced(by: 3600 * 90),
    ///                    displayedComponents: [.hourAndMinute, .date],
    ///                    label: { HStack { Image(systemName: "calendar"); Image(systemName: "clock") } })
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current data and a date picker
    /// labelled by two symbols, a calendar and a clock; once clicked, the picker
    /// displays a calendar with a closed date range available and a time input
    /// with an AM/PM switch.](date-picker-init-closed-range-ex.gif)
    ///
    /// - Parameters:
    ///   - selection: The binding Date value of the date picker.
    ///   - range: The maximum and minimum dates.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///   - label: A closure that returns a label view.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label) { }

    /// Creates a date picker with "from" range and a View label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker(selection: $date,
    ///                    in: Date()...,
    ///                    displayedComponents: [.hourAndMinute, .date],
    ///                    label: { HStack { Image(systemName: "calendar"); Image(systemName: "clock") } })
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current data and a date picker
    /// labelled by two symbols, a calendar and a clock; once clicked, the picker
    /// displays a calendar with a date range that has a defined starting point
    /// available and a time input with an AM/PM switch.](date-picker-init-from-range-ex.gif)
    ///
    /// - Parameters:
    ///   - selection: The binding Date value of the date picker.
    ///   - range: The range of selectable dates, with only a minimum specified.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///   - label: A closure that returns a label view.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label) { }

    /// Creates a date picker with "through" range and a View label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker(selection: $date,
    ///                    in: ...Date(),
    ///                    displayedComponents: [.hourAndMinute, .date],
    ///                    label: { HStack { Image(systemName: "calendar"); Image(systemName: "clock") } })
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current data and a date picker
    /// labelled by two symbols, a calendar and a clock; once clicked, the picker
    /// displays a calendar with a date range that has a defined end point
    /// available and a time input with an AM/PM switch.](date-picker-init-through-range-ex.gif)
    ///
    /// - Parameters:
    ///   - selection: The binding Date value of the date picker.
    ///   - range: The range of selectable dates, with only a maximum specified.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///   - label: A closure that returns a label view.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label) { }
}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DatePicker where Label == Text {

    /// Creates a date picker with unlimited range and a localized string key label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker(LocalizedStringKey("Date"),
    ///                    selection: $date,
    ///                    displayedComponents: [.hourAndMinute, .date])
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current date and a date picker
    /// titled "Date" by a localized string key; once clicked, the picker
    /// displays a calendar and a time input with an AM/PM switch.](date-picker-init-localized-label-ex.gif)
    ///
    /// - Parameters:
    ///   - titleKey: The date picker label as a localized string key.
    ///   - selection: The binding Date value of the date picker.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) { }

    /// Creates a date picker with closed range and a localized string key label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker(LocalizedStringKey("Date and time"),
    ///                    selection: $date,
    ///                    in: Date()...Date().advanced(by: 3600 * 90),
    ///                    displayedComponents: [.hourAndMinute, .date])
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current date in number format and
    /// a date picker titled "Date and time" by a localized string key; once clicked,
    /// the picker displays a calendar with a closed date range and a time input
    /// with an AM/PM switch.](date-picker-init-closed-localized-ex.gif)
    ///
    /// - Parameters:
    ///   - titleKey: The date picker label as a localized string key.
    ///   - selection: The binding Date value of the date picker.
    ///   - range: The maximum and minimum dates.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) { }

    /// Creates a date picker with "from" range and a localized string key label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker(LocalizedStringKey("Date and time"),
    ///                    selection: $date,
    ///                    in: Date()...,
    ///                    displayedComponents: [.hourAndMinute, .date])
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current date and a date picker titled
    /// "Date and time" by a localized string key; once clicked, the picker
    /// displays a calendar with a date range that has a defined start point
    /// and a time input with an AM/PM switch.](date-picker-init-from-localized-ex.gif)
    ///
    /// - Parameters:
    ///   - titleKey: The date picker label as a localized string key.
    ///   - selection: The binding Date value of the date picker.
    ///   - range: The range of selectable dates, with only a minimum specified.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) { }

    /// Creates a date picker with "through" range and a localized string key label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker(LocalizedStringKey("Date and time"),
    ///                    selection: $date,
    ///                    in: ...Date(),
    ///                    displayedComponents: [.hourAndMinute, .date])
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current date and a date picker titled
    /// "Date and time" by a localized string key; once clicked, the picker
    /// displays a calendar with a date range that has a defined end point
    /// and a time input with an AM/PM switch.](date-picker-init-through-localized-ex.gif)
    ///
    /// - Parameters:
    ///   - titleKey: The date picker label as a localized string key.
    ///   - selection: The binding Date value of the date picker.
    ///   - range: The range of selectable dates, with only a maximum specified.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) { }

    /// Creates a date picker with unlimited range and a string label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker("Date 📆 and time ⏰",
    ///                    selection: $date,
    ///                    displayedComponents: [.hourAndMinute, .date])
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current date and a date picker
    /// with the string label "Date 📆 and time ⏰"; once clicked, the picker
    /// displays a calendar with an unlimited date range and a time input with
    /// an AM/PM switch.](date-picker-init-unlim-str-ex.gif)
    ///
    /// - Parameters:
    ///   - title: The date picker label as a string.
    ///   - selection: The binding Date value of the date picker.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol { }

    /// Creates a date picker with closed range and a string label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker("Date 📆 and time ⏰",
    ///                    selection: $date,
    ///                    in: Date()...Date().advanced(by: 3600 * 90),
    ///                    displayedComponents: [.hourAndMinute, .date])
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current date and a date picker
    /// with the string label "Date 📆 and time ⏰"; once clicked, the picker
    /// displays a calendar with a closed date range and a time input with an
    /// AM/PM switch.](date-picker-init-closed-str-ex.gif)
    ///
    /// - Parameters:
    ///   - title: The date picker label as a string.
    ///   - selection: The binding Date value of the date picker.
    ///   - range: The maximum and minimum dates.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol { }

    /// Creates a date picker with "from" range and a string label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker("Date 📆 and time ⏰",
    ///                    selection: $date,
    ///                    in: Date()...,
    ///                    displayedComponents: [.hourAndMinute, .date])
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current date and a date picker
    /// with the string label "Date 📆 and time ⏰"; once clicked, the picker
    /// displays a calendar with a date range that has a defined start-point and
    /// a time input with an AM/PM switch.](date-picker-init-from-str-ex.gif)
    ///
    /// - Parameters:
    ///   - title: The date picker label as a string.
    ///   - selection: The binding Date value of the date picker.
    ///   - range: The range of selectable dates, with only a minimum specified.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol { }

    /// Creates a date picker with "through" range and a string label.
    ///
    /// ```
    /// struct DateView: View {
    ///     @State private var date = Date()
    ///
    ///     var body: some View {
    ///         Text("\(date)")
    ///         DatePicker("Date 📆 and time ⏰",
    ///                    selection: $date,
    ///                    in: ...Date(),
    ///                    displayedComponents: [.hourAndMinute, .date])
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a textview with the current date and a date picker
    /// with the string label "Date 📆 and time ⏰"; once clicked, the picker
    /// displays a calendar with a date range that has a defined end-point and
    /// a time input with an AM/PM switch.](date-picker-init-through-str-ex.gif)
    ///
    /// - Parameters:
    ///   - title: The date picker label as a string.
    ///   - selection: The binding Date value of the date picker.
    ///   - range: The range of selectable dates, with only a maximum specified.
    ///   - displayedComponents: The components of the date that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol { }
}

