/// Display a date picker in a compact, textual format.
///
/// This style is useful when space is constrained and users expect to make
/// specific date and time selections. Some variants may include rich editing
/// controls in a popup.
///
///     struct ExampleView: View {
///         @State var date: Date = Date()
///
///         var body: some View {
///             DatePicker("Date", selection: $date)
///                 .datePickerStyle(CompactDatePickerStyle())
///                 .padding()
///         }
///     }
///
/// ![A gif displaying the selection of a date using a calendar and time using a
/// text input and am/pm switch in a compact date picker.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/date-pickerstyle-compact-example-1.gif)
///
/// The difference between ``DefaultDatePickerStyle`` and `CompactDatePickerStyle`
/// can be seen more clearly here:
///
/// ```
/// struct ComparisonView: View {
///     @State var date: Date = Date()
///
///     var body: some View {
///         List {
///             Section (header: Text("To Do")) {
///                 HStack{
///                     Text("Laundry")
///                     DatePicker("Date", selection: $date)
///                         .datePickerStyle(CompactDatePickerStyle())
///                         .padding()
///                 }
///                 HStack{
///                     Text("Wash car")
///                     DatePicker("Date", selection: $date)
///                         .datePickerStyle(DefaultDatePickerStyle())
///                         .padding()
///                 }
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a list with the section header "To Do" containing two
/// items, each with HStack made up of a textview and a datepicker; the first
/// datepicker is of the CompactDatePickerStyle and fits the list row, while the
/// other is of the DefaultDatePickerStyle and is cut off slightly by the right
/// edge of the frame. ](compact-date-picker-style-ex2.gif)
///
@available(iOS 14.0, macCatalyst 13.4, macOS 10.15.4, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct CompactDatePickerStyle : DatePickerStyle {

    /// Creates a compact date picker style.
    public init() { }
}

