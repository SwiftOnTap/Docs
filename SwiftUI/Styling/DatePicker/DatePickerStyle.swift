/// A type that specifies the appearance and interaction of all date pickers
/// within a view hierarchy.
///
/// Use this protocol with the ``View/datePickerStyle(_:)`` view modifier
/// to set a ``DatePicker``'s style.
///
/// Though you cannot currently create your own date picker style,
/// there are 6 date picker pre-made styles to choose from:
/// - ``WheelDatePickerStyle`` on iOS
/// - ``DefaultDatePickerStyle`` on iOS and macOS
/// - ``GraphicalDatePickerStyle`` on iOS and macOS
/// - ``CompactDatePickerStyle`` on iOS and macOS
/// - `FieldDatePickerStyle` on macOS
/// - `StepperFieldDatePickerStyle` on macOS
///
/// You can use the pre-defined styles like this:
///
/// ```
/// struct ContentView: View {
///     @State var date = Date()
///
///     var body: some View {
///         DatePicker("Choose a date 📆", selection: $date)
///             .datePickerStyle(WheelDatePickerStyle())
///     }
/// }
/// ```
///
/// ![A gif displaying a wheel style date picker, in which the week day month
/// and date, the hour time, the minute time, and meridiam (am/pm) can be
/// selected separately by scrolling around a wheel; a light gray box highlights
/// the current selections.](wheel-date-picker-ex.gif)
///
/// Check out ``DatePicker`` for more on how to make date pickers. Or see
/// [`Date`](https://developer.apple.com/documentation/foundation/date)
/// for more on making and using date objects.
///
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol DatePickerStyle { }

extension DatePickerStyle { }

