/// A date style that displays components as columns in a scrollable wheel.
///
///     struct ExampleView: View {
///         @State var date: Date = Date()
///
///         var body: some View {
///             DatePicker("Date",selection: $date)
///                 .datePickerStyle(WheelDatePickerStyle())
///                 .padding()
///         }
///     }
///
/// ![A gif displaying a wheel style date picker, in which the week day month
/// and date, the hour time, the minute time, and meridiam (am/pm) can be
/// selected separately by scrolling around a wheel; a light gray box highlights
/// the current selections.](wheel-date-picker-ex.gif)
///
///
@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WheelDatePickerStyle : DatePickerStyle {

    /// Creates a wheel date picker style.
    public init() { }
}

