/// An interactive calendar or clock.
///
/// This style is useful when you want to allow browsing through days in a calendar, or when the look of a clock face is appropriate.
///
///     struct ExampleView: View {
///         @State var date: Date = Date()
///
///         var body: some View {
///             DatePicker("Date",selection: $date)
///                 .datePickerStyle(GraphicalDatePickerStyle())
///                 .padding()
///         }
///     }
///
/// ![Gif displays a graphical date picker view consisting of a calendar in
/// which a date is selected and a time selector in which an hour and minute
/// can be entered and a toggle flips between AM and PM.](graphical-date-picker-style-ex.gif)
///
@available(iOS 14.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct GraphicalDatePickerStyle : DatePickerStyle {

    /// Creates an instance of the graphical date picker style.
    public init() { }
}

