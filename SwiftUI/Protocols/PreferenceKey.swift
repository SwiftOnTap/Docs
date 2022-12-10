/// The `PreferenceKey` protocol enables a way to send data _up_ the view hierarchy.
///
/// `PreferenceKey` allows for a child view to communicate with a parent, similar to how an
/// ``Environment`` allows for data to be sent down the view hierarchy. An excellent
/// example of view preferences in action is Apple's ``NavigationView`` and ``View/navigationTitle(_:)-ee24d``.
/// The ``View/navigationTitle(_:)-ee24d`` does not modify the navigation view directly, but rather it
/// uses view preferences and the navigation view has a closure that is called when the title is updated.
///
/// While it is possible to achieve basic communication up the view hierarchy using a `@Binding`,
/// this can produce unintended effects as a result of modifying state during a view update. In
/// these scenarios, it may be better to use view preferences.
///
/// `PreferenceKey` requires a ``PreferenceKey/defaultValue`` and a ``PreferenceKey/reduce(value:nextValue:)``,
/// which defines the logic used to combine multiple outputted values into one.
///
/// For example, to set a preference key from a view and use it to change a state:
///
/// ```
/// struct ExampleView: View {
///     @State private var customPreferenceKey: String = ""
///
///     var body: some View {
///         VStack {
///             Text("View that sets a preference key when loaded")
///                 .preference(key: CustomPreferenceKey.self, value: "New value! 🤓")
///         }
///         .onPreferenceChange(CustomPreferenceKey.self) { (value: CustomPreferenceKey.Value) in
///             customPreferenceKey = value
///             print(customPreferenceKey) // Prints: "New value! 🤓"
///         }
///     }
/// }
///
/// struct CustomPreferenceKey: PreferenceKey {
///     static var defaultValue: String = ""
///
///     static func reduce(value: inout String, nextValue: () -> String) {
///         value = nextValue()
///     }
/// }
/// ```
///
/// ![A screenshot displaying a text view that reads "View that sets a
/// preference key when loaded."](48FAD8ED-F1A7-4BC2-B801-A5EB9C765728.png)
///
/// It is also possible to use more complicated data structures as a preference key
/// by changing the type of the ``PreferenceKey/defaultValue``. For example:
///
/// ```
/// struct ExampleView: View {
///     @State private var customPreferenceKey: CustomPreferenceKeyData? = nil
///
///     var body: some View {
///         VStack {
///             Text("View that sets a preference key when loaded")
///                 .preference(key: CustomPreferenceKey.self, value: CustomPreferenceKeyData(bananaBunch: "🍌🍌🍌", numberOfBananas: 3))
///         }
///         .onPreferenceChange(CustomPreferenceKey.self) { (value: CustomPreferenceKey.Value) in
///             customPreferenceKey = value
///             print(customPreferenceKey!) // Prints: "CustomPreferenceKeyData(bananaBunch: "🍌🍌🍌", numberOfBananas: 3)"
///         }
///     }
/// }
///
/// struct CustomPreferenceKey: PreferenceKey {
///     static var defaultValue: CustomPreferenceKeyData? = nil
///
///     static func reduce(value: inout CustomPreferenceKeyData?, nextValue: () -> CustomPreferenceKeyData?) {
///         value = nextValue()
///     }
/// }
///
/// struct CustomPreferenceKeyData: Equatable {
///     let bananaBunch: String
///     let numberOfBananas: Int
/// }
/// ```
///
/// ![A screenshot displaying a text view that reads "View that sets a
/// preference key when loaded."](1EDB1FAE-72D3-4B34-AD1F-F848987DF57B.png)
///
/// For a detailed explanation of how view preferences work, check out
/// [this article](https://medium.com/@crystalminds/introducing-view-preferences-in-swiftui-e193c346b68d)
///
/// Note:
///  - A view with multiple children automatically combines its values for a given
///  preference into a single value visible to its ancestors. This functionality
/// can be changed with the ``PreferenceKey/reduce(value:nextValue:)`` function.
///  - When using view preferences, keep in mind that it can be easy to create
///  an infinite loop by having the preference value dependent on the state that it is changing.
///  A few signs this may be happening is a spike in CPU usage, a flickering screen, or a crashing app.
///  - In order to pass information _down_ the View hierarchy, see ``Environment``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PreferenceKey { }

extension PreferenceKey {

    /// The type of value produced by this preference.
    ///
    /// The `Value` associated with a particular preference is set
    /// within the ``PreferenceKey`` struct.
    ///
    /// ```
    /// struct CustomPreferenceKey: PreferenceKey {
    ///     typealias Value = Int
    ///     static var defaultValue: Int = 0
    ///     static func reduce(value: inout Int, nextValue: () -> Int) {
    ///         value = nextValue()
    ///     }
    /// }
    ///
    /// struct ContentView: View {
    ///     @State private var customPreferenceKey: Int = 0
    ///
    ///     var body: some View {
    ///         Text("I set a preference key when I load😃")
    ///             .preference(key: CustomPreferenceKey.self, value: 1)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of a text view reading "I set a preference key when I
    /// load😃", with the preference modifier applied.](pref-key-value-ex1.png)
    ///
    /// You can also set a `Value` using a custom ``Equatable``:
    ///
    /// ```
    /// struct CustomData: Equatable {
    ///     let var1: String
    ///     let var2: Int
    /// }
    /// ```
    ///
    /// Furthermore, this typealias need not be stated explicitly as the
    /// ``PreferenceKey/defaultValue`` states the type in its declaration.
    /// The following ``PreferenceKey`` uses the `CustomData` ``Equatable``
    /// for `Value` and defines a ``PreferenceKey/reduce(value:nextvalue:)``
    /// function that replaces any old ouput with the new preference value.
    ///
    /// ```
    /// struct CustomPreferenceKey: PreferenceKey {
    ///     static var defaultValue = CustomData(var1: "", var2: 0)
    ///     static func reduce(value: inout CustomData, nextValue: () -> CustomData) {
    ///         value = nextValue()
    ///     }
    /// }
    /// ```
    ///
    /// This ``PreferenceKey`` can now be used within a view and set with the
    /// `.preference(key:value:)` modifier:
    ///
    /// ```
    /// struct ContentView: View {
    ///     let key = CustomPreferenceKey.Self
    ///     let value = CustomData(var1: "Hello", var2: 1)
    ///
    ///     var body: some View {
    ///         Text("I set a preference key with a custom value when I load😎")
    ///             .preference(key, value)
    ///     }
    /// ```
    ///
    /// [A screenshot of a text view reading "I set a preference key with a
    /// custom value when I load😎", with the preference modifier applied; the
    /// preference key's value is set with a custom equatable.](pref-key-value-ex2.png)
    ///
    associatedtype Value

    /// The default value of the preference if none is explicitly set.
    ///
    /// Views that have no explicit value for the key produce this default
    /// value. Combining child views may remove an implicit value produced by
    /// using the default. This means that `reduce(value: &x, nextValue:
    /// {defaultValue})` shouldn't change the meaning of `x`.
    static var defaultValue: Self.Value { get }

    /// Combines a sequence of values by modifying the previously-accumulated
    /// value with the result of a closure that provides the next value.
    ///
    /// If multiple values are outputted by multiple different views, all using the same
    /// ``PreferenceKey``, this function allows for logic to reduce all those
    /// preferences to a single value.
    ///
    /// For example, if there are two views at the same level that both output a preference:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State private var customPreferenceKey: String = ""
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text("First view that sets a preference")
    ///                 .preference(key: CustomPreferenceKey.self, value: "The first preference value")
    ///
    ///             Text("Second view that sets a preference")
    ///                 .preference(key: CustomPreferenceKey.self, value: "The second preference value")
    ///         }
    ///         .onPreferenceChange(CustomPreferenceKey.self) { (value: CustomPreferenceKey.Value) in
    ///             customPreferenceKey = value
    ///             print(customPreferenceKey) // Prints: "The first preference value & The second preference value"
    ///         }
    ///     }
    /// }
    ///
    /// struct CustomPreferenceKey: PreferenceKey {
    ///     static var defaultValue: String = ""
    ///
    ///     static func reduce(value: inout String, nextValue: () -> String) {
    ///         value = "\(value) & \(nextValue())"
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two text views in a VStack that read "First
    /// view that sets a preference" and "Second view that sets a preference"
    /// which are combined via the reduce function.](preferencekey-reduce.png)
    ///
    /// For additional details on how the reduce function works, see
    /// [this Medium article](https://medium.com/swlh/dissecting-the-reduce-method-on-preferencekey-8a3571cfbc2b).
    ///
    /// - Parameters:
    ///   - value: The value accumulated through previous calls to this method.
    ///     The implementation should modify this value.
    ///   - nextValue: A closure that returns the next value in the sequence.
    static func reduce(value: inout Self.Value, nextValue: () -> Self.Value) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreferenceKey where Self.Value : ExpressibleByNilLiteral {

    /// Let nil-expressible values default-initialize to nil.
    public static var defaultValue: Self.Value { get }
}
