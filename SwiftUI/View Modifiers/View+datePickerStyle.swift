@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// A view modifier to change a date picker style.
    ///
    /// Use this modifier to change the style of a view hierarchy's date pickers.
    ///
    /// There are currently 6 date picker styles:
    /// - ``WheelDatePickerStyle`` on iOS
    /// - ``DefaultDatePickerStyle`` on iOS and macOS
    /// - ``GraphicalDatePickerStyle`` on iOS and macOS
    /// - ``CompactDatePickerStyle`` on iOS and macOS
    /// - `FieldDatePickerStyle` on macOS
    /// - `StepperFieldDatePickerStyle` on macOS
    ///
    /// See ``DatePicker`` and ``DatePickerStyle`` for more.
    ///
    /// Use the modifier like this:
    ///
    ///     struct ExampleView: View {
    ///         @State private var selectedDate = Date()
    ///
    ///         var body: some View {
    ///             DatePicker(selection: $selectedDate) {
    ///                 Text("Date")
    ///             }
    ///             .datePickerStyle(WheelDatePickerStyle())
    ///         }
    ///     }
    ///
    /// ![A gif displaying a wheel style date picker, labelled with the text
    /// "Date" on the lefthand side, in which the week day month and date, the
    /// hour time, the minute time, and meridiam (am/pm) can be selected
    /// separately by scrolling around a wheel; a light gray box highlights the
    /// current selections.](date-picker-style-ex.gif)
    ///
    /// - Parameters:
    ///   - style: The desired date picker style, conforming to ``DatePickerStyle``.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func datePickerStyle<S>(_ style: S) -> some View where S : DatePickerStyle { }

}

