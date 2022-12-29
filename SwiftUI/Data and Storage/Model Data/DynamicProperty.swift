/// An interface for a stored variable that updates an external property of a
/// view.
///
/// This protocol is the one that all the data property wrappers implement:
/// - ``State``
/// - ``Binding``
/// - ``ObservedObject``
/// - ``EnvironmentObject``
/// - ``Environment``
/// - ``FetchRequest``
/// - ``GestureState``
///
/// The view gives values to these properties prior to recomputing the view's
/// ``View/body-swift.variable``.
///
/// You will rarely implement this protocol yourself. However, if you do,
/// It would look something like this:
///
///     var globalLoadCount = 0
///
///     struct CustomProperty: DynamicProperty {
///         var localLoadCount = 0
///         mutating func update() {
///             globalLoadCount += 1
///             localLoadCount = globalLoadCount
///         }
///     }
///
///     struct ContentView: View {
///         @State private var reloadSwitch = false
///         var customProperty = CustomProperty()
///
///         var body: some View {
///             Text("Load count: \(customProperty.localLoadCount)")
///                 .font(reloadSwitch ? .title : .body)
///             Button("RELOAD ❗️") { reloadSwitch.toggle() }
///         }
///     }
///
/// ![A gif displaying a text view that reads "Load count: " with a button
/// underneath that reads "RELOAD." When pressed, the load count is incremented by
/// 1 and the text toggles from body text to title text, growing in size. This
/// update is rendered with each click by the dynamic property.](dynamic-prop-ex1.gif)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol DynamicProperty { }
extension DynamicProperty {

    /// Updates the underlying value of the stored value.
    ///
    /// SwiftUI calls this function before rending a view's
    /// ``View/body-swift.variable`` to ensure the view has the most recent
    /// value.
    ///
    /// You will rarely implement this protocol yourself. However, if you do,
    /// It would look something like this:
    ///
    ///     var globalLoadCount = 0
    ///
    ///     struct CustomProperty: DynamicProperty {
    ///         var localLoadCount = 0
    ///         mutating func update() {
    ///             globalLoadCount += 1
    ///             localLoadCount = globalLoadCount
    ///         }
    ///     }
    ///
    ///     struct ContentView: View {
    ///         @State private var reloadSwitch = false
    ///         var customProperty = CustomProperty()
    ///
    ///         var body: some View {
    ///             Text("Load count: \(customProperty.localLoadCount)")
    ///                 .font(reloadSwitch ? .title : .body)
    ///             Button("RELOAD ❗️") { reloadSwitch.toggle() }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a text view that reads "Load count: " with a button
    /// underneath that reads "RELOAD." When pressed, the load count is incremented by
    /// 1 and the text toggles from body text to title text, growing in size. This
    /// update is rendered with each click by the dynamic property update function.](dynamic-prop-ex1.gif)
    ///
    mutating func update() { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicProperty {

    /// Updates the underlying value of the stored value.
    ///
    /// SwiftUI calls this function before rending a view's
    /// ``View/body-swift.variable`` to ensure the view has the most recent
    /// value.
    ///
    /// You will rarely implement this protocol yourself. However, if you do,
    /// It would look something like this:
    ///
    ///     var globalLoadCount = 0
    ///
    ///     struct CustomProperty: DynamicProperty {
    ///         var localLoadCount = 0
    ///         mutating func update() {
    ///             globalLoadCount += 1
    ///             localLoadCount = globalLoadCount
    ///         }
    ///     }
    ///
    ///     struct ContentView: View {
    ///         @State private var reloadSwitch = false
    ///         var customProperty = CustomProperty()
    ///
    ///         var body: some View {
    ///             Text("Load count: \(customProperty.localLoadCount)")
    ///                 .font(reloadSwitch ? .title : .body)
    ///             Button("RELOAD ❗️") { reloadSwitch.toggle() }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a text view that reads "Load count: " with a button
    /// underneath that reads "RELOAD." When pressed, the load count is incremented by
    /// 1 and the text toggles from body text to title text, growing in size. This
    /// update is rendered with each click by the dynamic property update function.](dynamic-prop-ex1.gif)
    ///
    public mutating func update() { }
}

