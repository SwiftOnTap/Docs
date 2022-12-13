/// The default ``DatePicker`` style.
///
///     struct ExampleView: View {
///         @State var date: Date = Date()
///
///         var body: some View {
///             DatePicker("Date", selection: $date)
///                 .datePickerStyle(DefaultDatePickerStyle())
///                 .padding()
///         }
///     }
///
/// ![A gif displaying the selection of a date using a calendar and time using a
/// text input and am/pm switch in a default date picker.](default-date-picker-style-ex.gif)
///
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultDatePickerStyle : DatePickerStyle {

    /// Creates a default date picker style.
    ///
    /// - SeeAlso: DatePicker
    public init() { }
}

