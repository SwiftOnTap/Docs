/// A property wrapper type that reads and writes to persisted, per-scene
/// storage.
///
/// You use `SceneStorage` when you need automatic state restoration of the
/// value.  `SceneStorage` works very similar to ``State``, except its initial
/// value is restored by the system if it was previously saved, and the value is·
/// shared with other `SceneStorage` variables in the same scene.
///
/// The system manages the saving and restoring of `SceneStorage` on your
/// behalf. The underlying data that backs `SceneStorage` is not available to
/// you, so you must access it via the `@SceneStorage` property wrapper. The
/// system makes no guarantees as to when and how often the data will be
/// persisted.
///
/// Each ``Scene`` has its own notion of `SceneStorage`, so data is not shared
/// between scenes.
///
/// Ensure that the data you use with `SceneStorage` is lightweight. Data of a
/// large size, such as model data, should not be stored in `SceneStorage`, as
/// poor performance may result.
///
/// If the ``Scene`` is explictly destroyed (e.g. the switcher snapshot is
/// destroyed on iPadOS or the window is closed on macOS), the data is also
/// destroyed. Do not use `SceneStorage` with sensitive data.
///
/// If you would like your data to be stored permanently in the device,
/// use ``AppStorage`` instead.
///
/// There are 6 possible scene storage types, and 6 corresponding initializers:
/// 1. `Bool`
/// 2. `Int`
/// 3. `Double`
/// 4. `String`
/// 5. `URL`
/// 6. `Data`
///
/// Here is a simple example using the common property wrapper syntax:
///
///     struct ContentView: View {
///         @SceneStorage("name") private var name = "Kanye"
///
///         var body: some View {
///             TextField(name, text: $name)
///         }
///     }
///
/// ![A screenshot displaying a keyboard view on a white background with a
/// text field above it that reads "Kanye."](scenestorage-1.png)
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen @propertyWrapper public struct SceneStorage<Value> : DynamicProperty {

    /// The underlying value referenced by the state variable.
    ///
    /// This works identically to `State.wrappedValue`.
    ///
    /// This is rarely used directly. Instead, you normally use the property wrapper syntax:
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("name") var name: String = "Kanye"
    ///
    ///         var body: some View {
    ///             TextField(name, text: $name)
    ///         }
    ///     }
    ///
    /// ![](scenestorage-1.png)
    ///
    /// - See also: ``State`` and ``State/projectedValue``.
    public var wrappedValue: Value { get /*nonmutating set*/ }

    /// A binding to the state value.
    ///
    /// This works identically to `State.projectedValue`.
    ///
    /// You can access this using the $ prefix:
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("name") var name: String = "Kanye"
    ///
    ///         var body: some View {
    ///             TextField(name, text: $name)
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a keyboard on the lower half of the screen
    /// and a text field above that reads "Kanye."](scenestorage-1.png)
    ///
    /// - See also: ``State`` and ``State/projectedValue``
    public var projectedValue: Binding<Value> { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneStorage {

    /// Creates a property that can save and restore a boolean.
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("airplane-mode") var on: Bool = false
    ///
    ///         var body: some View {
    ///             Toggle("Airplane Mode", isOn: $on)
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a toggle with the label "Airplane Mode"
    /// with the toggle switched to off.](scenestorage-2.png)
    ///
    /// - Parameter wrappedValue: The default value if a boolean is not
    ///   available for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == Bool { }

    /// Creates a property that can save and restore an integer.
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("donuts") var count: Int = 0
    ///
    ///         var body: some View {
    ///             Stepper("🍩 count: \(count)", value: $count)
    ///         }
    ///     }
    ///
    /// ![A gif displaying a stepper with a label that reads "count:" which
    /// increments or decrements by 1 in accordance with the user's actions.
    /// Scene storage stores the value of 0 for the view.](scene-storage-init-10da5-ex.gif)
    ///
    /// - Parameter wrappedValue: The default value if an integer is not
    ///   available for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == Int { }

    /// Creates a property that can save and restore a double.
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("brightness") var level: Double = 0
    ///
    ///         var body: some View {
    ///             Text("🔆 \(level)")
    ///             Slider(value: $level)
    ///         }
    ///     }
    ///
    /// ![A gif displaying a slider with a label above it that reads a value of the slider between
    /// 0 and 1.](scene-storage-init-70ae4-ex.gif)
    ///
    /// - Parameter wrappedValue: The default value if a double is not available
    ///   for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == Double { }

    /// Creates a property that can save and restore a string.
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("name") var name: String = "Kanye"
    ///
    ///         var body: some View {
    ///             TextField(name, text: $name)
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a keyboard on the lower half of the screen
    /// and a text field above that reads "Kanye."](scenestorage-1.png)
    ///
    /// - Parameter wrappedValue: The default value if a string is not available
    ///   for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == String { }

    /// Creates a property that can save and restore a URL.
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("site") var url = URL(string: "https://swiftontap.com")!
    ///
    ///         var body: some View {
    ///             Text("Check out \(url)")
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a plain text view that reads "Check out
    /// https://swiftontap.com"](scenestorage-3-fixed.png)
    ///
    /// - Parameter wrappedValue: The default value if a URL is not available
    ///   for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == URL { }

    /// Creates a property that can save and restore data.
    ///
    ///     struct Human: Codable {
    ///         var name: String
    ///         var age: Int
    ///     }
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("goat") var person = Data()
    ///
    ///         var body: some View {
    ///             Button("Make Aaron the 🐐") {
    ///                 let aaron = Human(name: "Aaron", age: 21)
    ///                 let aaronData = try! JSONEncoder().encode(aaron)
    ///
    ///                 person = aaronData
    ///                 print("success.")
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a button in the center of the screen that
    /// reads "Make Aaron the " followed by a goat emoji.](scenestorage-4.png)
    ///
    /// Avoid storing large data blobs, such as image data, as it can negatively
    /// affect performance of your app.
    ///
    /// - Parameter wrappedValue: The default value if data is not available
    ///   for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == Data { }

    /// Creates a property that can save and restore an integer, transforming it
    /// to a `RawRepresentable` data type.
    ///
    /// A common usage is with enumerations:
    ///
    ///     enum MyEnum: Int {
    ///         case a
    ///         case b
    ///         case c
    ///     }
    ///     struct MyView: View {
    ///         @SceneStorage("MyEnumValue") private var value = MyEnum.a
    ///
    ///         var body: some View {
    ///             Picker("Choose!", selection: $value) {
    ///                 Text("a").tag(MyEnum.a)
    ///                 Text("b").tag(MyEnum.b)
    ///                 Text("c").tag(MyEnum.c)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a picker with three options: a, b, or c. Scene
    /// storage sets the initial value in the enum to a for each new view.](scenestorage-5.png)
    ///
    /// - Parameter wrappedValue: The default value if an integer value is not
    ///   available for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value : RawRepresentable, Value.RawValue == Int { }

    /// Creates a property that can save and restore a string, transforming it
    /// to a `RawRepresentable` data type.
    ///
    /// A common usage is with enumerations:
    ///
    ///     enum MyEnum: String {
    ///         case a
    ///         case b
    ///         case c
    ///     }
    ///     struct MyView: View {
    ///         @AppStorage("MyEnumValue") private var value = MyEnum.a
    ///
    ///         var body: some View {
    ///             Picker("Choose!", selection: $value) {
    ///                 Text("a").tag(MyEnum.a)
    ///                 Text("b").tag(MyEnum.b)
    ///                 Text("c").tag(MyEnum.c)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a picker with three options: a, b, or c. Scene
    /// storage sets the initial value in the enum to a for each new view.](scenestorage-5.png)
    ///
    /// - Parameter wrappedValue: The default value if a String value is not
    ///   available for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value : RawRepresentable, Value.RawValue == String { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneStorage where Value : ExpressibleByNilLiteral {

    /// Creates a property that can save and restore an Optional boolean.
    ///
    /// Defaults to nil if there is no restored value
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("airplane-mode") var on: Bool?
    ///
    ///         var body: some View {
    ///             Button("on") { on = true }
    ///             Button("off") { on = false }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying two buttons in the center of the screen; the
    /// first reads "on" and the second reads "off."](scenestorage-6.png)
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == Bool? { }

    /// Creates a property that can save and restore an Optional integer.
    ///
    /// Defaults to nil if there is no restored value
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("donuts") var count: Int?
    ///
    ///         var body: some View {
    ///             Button("none ☹️") { count = 0 }
    ///             Button("LOTS 🍩") { count = 100 }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying two buttons in the center of the screen; the
    /// first reads "none" and the second reads "LOTS." The scene storage
    /// property saves and restores the optional integer, which has no effect on
    /// this view.](scenestorage-7.png)
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == Int? { }

    /// Creates a property that can save and restore an Optional double.
    ///
    /// Defaults to nil if there is no restored value
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("brightness") var level: Double?
    ///
    ///         var body: some View {
    ///             Button("MAX 🔆") { level = 1.0 }
    ///             Button("min 🔅") { level = 0.0 }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying two buttons in the center of the screen; the
    /// first reads "MAX" and the second reads "min." The scene storage
    /// property saves and restores the optional double, which has no effect on
    /// this view.](scenestorage-8.png)
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == Double? { }

    /// Creates a property that can save and restore an Optional string.
    ///
    /// Defaults to nil if there is no restored value
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("name") var name: String?
    ///
    ///         var body: some View {
    ///             Button("Save 🐐") { name = "Aaron" }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a single button in the center of the screen
    /// reading "Save" followed by the goat emoji. The scene storage
    /// property saves and restores the optional String "Aaron", which has no effect on
    /// this view.](scenestorage-9.png)
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == String? { }

    /// Creates a property that can save and restore an Optional URL.
    ///
    /// Defaults to nil if there is no restored value
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("site") var url: URL?
    ///
    ///         var body: some View {
    ///             Button("Save the 🍌") { url = URL(string: "https://swiftontap.com") }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a single button in the center of the screen
    /// reading "Save the" followed by the banana emoji. The scene storage
    /// property saves and restores the optional url, which has no effect on
    /// this view.](scenestorage-10.png)
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == URL? { }

    /// Creates a property that can save and restore an Optional data.
    ///
    /// Defaults to nil if there is no restored value
    ///
    ///     struct Human: Codable {
    ///         var name: String
    ///         var age: Int
    ///     }
    ///
    ///     struct ContentView: View {
    ///         @SceneStorage("goat") var person: Data?
    ///
    ///         var body: some View {
    ///             Button("Make Aaron the 🐐") {
    ///                 let aaron = Human(name: "Aaron", age: 21)
    ///                 let aaronData = try! JSONEncoder().encode(aaron)
    ///
    ///                 person = aaronData
    ///                 print("success.")
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a single button in the center of the screen
    /// reading "Make Aaron the" followed by the goat emoji. The scene storage
    /// property saves and restores the optional data, which has no effect on
    /// this view.](scenestorage-11.png)
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == Data? { }
}

