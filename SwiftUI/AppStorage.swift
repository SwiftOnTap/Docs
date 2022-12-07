/// A property wrapper type that reads from and writes to the device's storage.
///
/// Use this property wrapper to read to and write from permanent storage
/// on the user's device, also known as "UserDefaults".
///
/// Check out ``Scene/defaultAppStorage(_:)`` for ``Scene``s and
/// ``View/defaultAppStorage(_:)`` for ``View``s to learn more about
/// setting the default app storage location for a view.
///
///
/// Below shows a simple example using a [`String`](https://developer.apple.com/documentation/swift/string).
///
///     struct ContentView: View {
///         @AppStorage("name") var name: String = "Kanye"
///
///         var body: some View {
///         Text("Stored string: \(name)")
///               TextField(name, text: $name)
///         }
///     }
///
/// ![A gif displaying a view containing a textview reading "Stored string: \(name)"
/// and a textfield with default text "Kanye" and an input bound to the appstorage
/// string variable "name."; when the textfield input is changed to "John", so is
/// the stored string variable, as shown in the textview.](app-storage-ex.gif)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen @propertyWrapper public struct AppStorage<Value> : DynamicProperty {

    /// The user default value for the given key.
    ///
    /// This is rarely used directly. Instead, you normally use the property wrapper syntax:
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("name") var name: String = "Kanye"
    ///
    ///         var body: some View {
    ///             TextField(name, text: $name)
    ///         }
    ///     }
    public var wrappedValue: Value { get /*nonmutating set*/ }

    /// Provides a binding for the wrapped value.
    ///
    /// You can access this using the `$` prefix:
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("name") var name: String = "Kanye"
    ///
    ///         var body: some View {
    ///             TextField(name, text: $name)
    ///         }
    ///     }
    ///
    /// ![A gif displaying a textfield with default contents and text input
    /// bound to an AppStorage variable assigned the string "Kanye"; the text is
    /// deleted and "JOhn" is typed, which will now be stored even when the app
    /// is reloaded.](appstorage-projected-val-ex.gif)
    ///
    public var projectedValue: Binding<Value> { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension AppStorage {

    /// Creates a property that can read and write to a boolean user default.
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("airplane-mode") var on: Bool = false
    ///
    ///         var body: some View {
    ///             Toggle("Airplane Mode", isOn: $on)
    ///         }
    ///     }
    ///
    /// ![A view containing a toggle named "Airplane mode" where the isOn
    /// input is bound to the appstorage boolean variable "airplane-mode."](16.40.39.png)
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a boolean value is not specified
    ///     for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Bool { }

    /// Creates a property that can read and write to an integer user default.
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("donuts") var count: Int = 0
    ///
    ///         var body: some View {
    ///             Stepper("🍩 count: \(count)", value: $count)
    ///         }
    ///     }
    ///
    /// ![A view containing a stepper called "🍩 count: \(count)" where the value
    /// input is bound to the appstorage Int variable "count".]16.42.01.png)
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if an integer value is not specified
    ///     for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Int { }

    /// Creates a property that can read and write to a double user default.
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("brightness") var level: Double = 0
    ///
    ///         var body: some View {
    ///             Text("🔆 \(level)")
    ///             Slider(value: $level)
    ///         }
    ///     }
    ///
    /// ![A view containing a text view reading "🔆 \(level)" and a slider where the value
    /// input is bound to the appstorage Double variable "level".](16.42.46.png)
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a double value is not specified
    ///     for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Double { }

    /// Creates a property that can read and write to a string user default.
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("name") var name: String = "Kanye"
    ///
    ///         var body: some View {
    ///             TextField(name, text: $name)
    ///         }
    ///     }
    ///
    /// ![A view containing a textfield where the text input is bound to
    /// the appstorage Double variable "name".](16.34.17.png)
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a string value is not specified
    ///     for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == String { }

    /// Creates a property that can read and write to a url user default.
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("site") var url = URL(string: "https://swiftontap.com")!
    ///
    ///         var body: some View {
    ///             Text("Check out \(url)")
    ///         }
    ///     }
    ///
    /// ![A view containing a textview "Check out \(url)" where the text url is
    /// bound to the appstorage url variable "url".](16.44.14.png)
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a url value is not specified for
    ///     the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == URL { }

    /// Creates a property that can read and write to a user default as data.
    ///
    /// Avoid storing large data blobs in user defaults, such as image data,
    /// as it can negatively affect performance of your app. On tvOS, a
    /// `NSUserDefaultsSizeLimitExceededNotification` notification is posted
    /// if the total user default size reaches 512kB.
    ///
    ///     struct Human: Codable {
    ///         var name: String
    ///         var age: Int
    ///     }
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("goat") var person = Data()
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
    /// ![A view containing a button "Make Aaron the 🐐" where the name and age
    /// inputs are bound to the appstorage variables "name" and "age".](16.47.01.png)
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a data value is not specified for
    ///    the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Data { }

    /// Creates a property that can read and write to an integer user default,
    /// transforming that to `RawRepresentable` data type.
    ///
    /// A common usage is with enumerations:
    ///
    ///     enum MyEnum: Int {
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
    /// ![A view containing a picker titled whose text options "a", "b", and
    /// "c", are tagged to an enum bound to the appstorage variable "value",
    /// which is in turn used to populate the selection input of the picker.](16.58.02.png)
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if an integer value
    ///     is not specified for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value : RawRepresentable, Value.RawValue == Int { }

    /// Creates a property that can read and write to a string user default,
    /// transforming that to `RawRepresentable` data type.
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
    ///         var body: some View {
    ///             Picker("Choose!", selection: $value) {
    ///                 Text("a").tag(MyEnum.a)
    ///                 Text("b").tag(MyEnum.b)
    ///                 Text("c").tag(MyEnum.c)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A view containing a picker titled whose text options "a", "b", and
    /// "c", are tagged to an enum which is referenced by the appstorage variable "value",
    /// which is in turn used to populate the selection input of the picker.](16.58.02.png)
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a string value
    ///     is not specified for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value : RawRepresentable, Value.RawValue == String { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension AppStorage where Value : ExpressibleByNilLiteral {

    /// Creates a property that can read and write an Optional boolean user
    /// default.
    ///
    /// Defaults to `nil` if there is no restored value.
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("airplane-mode") var on: Bool?
    ///
    ///         var body: some View {
    ///             Button("on") { on = true }
    ///             Button("off") { on = false }
    ///         }
    ///     }
    ///
    /// ![A view containing two buttons, "on" and "off"; the appstorage boolean
    /// variable "airplane-mode" defaults to nil as there is no restored value.](17.15.34.png)
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Bool? { }

    /// Creates a property that can read and write an Optional integer user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("donuts") var count: Int?
    ///
    ///         var body: some View {
    ///             Button("none ☹️") { count = 0 }
    ///             Button("LOTS 🍩") { count = 100 }
    ///         }
    ///     }
    ///
    /// ![A view containing two buttons, "none ☹️" and "LOTS 🍩"; the appstorage
    /// Int optional variable "count" defaults to nil as there is no restored value.](17.16.17.png)
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Int? { }

    /// Creates a property that can read and write an Optional double user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("brightness") var level: Double?
    ///
    ///         var body: some View {
    ///             Button("MAX 🔆") { level = 1.0 }
    ///             Button("min 🔅") { level = 0.0 }
    ///         }
    ///     }
    ///
    /// ![A view containing two buttons, "MAX 🔆" and "min 🔅"; the appstorage
    /// Double optional variable "count" defaults to nil as there is no restored value.](17.18.26.png)
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Double? { }

    /// Creates a property that can read and write an Optional string user
    /// default.
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("name") var name: String?
    ///
    ///         var body: some View {
    ///             Button("Save 🐐") { name = "Kanye" }
    ///         }
    ///     }
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// ![A view containing a button "Save 🐐" with name = "Kanye"; the appstorage
    /// String optional variable "name" defaults to nil as there is no restored value.](17.19.59.png)
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == String? { }

    /// Creates a property that can read and write an Optional URL user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("site") var url: URL?
    ///
    ///         var body: some View {
    ///             Button("Save the 🍌") { url = URL(string: "https://swiftontap.com") }
    ///         }
    ///     }
    ///
    /// ![A view containing a button "Save the 🍌" with the SwiftOnTap website url; the appstorage
    /// url optional variable "url" defaults to nil as there is no restored value.](17.31.44.png)
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == URL? { }

    /// Creates a property that can read and write an Optional data user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    ///     struct Human: Codable {
    ///         var name: String
    ///         var age: Int
    ///     }
    ///
    ///     struct ContentView: View {
    ///         @AppStorage("goat") var person: Data?
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
    /// ![A view containing a button "Make Aaron the 🐐" with two static variables
    /// and a print statement; the appstorage Data optional variable "person"
    /// defaults to nil as there is no restored value.](17.33.08.png)
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Data? { }
}

