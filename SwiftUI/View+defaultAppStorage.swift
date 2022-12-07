@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Use this modifier to change a scene's default storage for the @AppStorage property wrapper.
    ///
    /// Whenever the `@AppStorage` property wrapper is used, it defaults its location to
    /// `UserDefaults.standard`. Override this default location for all of your
    /// scene's views by using this modifier.
    ///
    /// If unspecified, the default store for a view hierarchy is
    /// `UserDefaults.standard`, but can be set a to a custom one. For example,
    /// sharing defaults between an app and an extension can override the
    /// default store to one created with `UserDefaults.init(suiteName:_)`.
    ///
    /// There is a similar method for `Scene` called ``Scene/defaultAppStorage(_:)``
    ///
    /// Check out `UserDefaults` and ``AppStorage`` for more info on how in-app storage
    /// works.
    ///
    ///     @main
    ///     struct StorageExampleApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 StorageExampleView()
    ///                     .defaultAppStorage(UserDefaults(suiteName: "com.yoursite.your-suite")!)
    ///             }
    ///         }
    ///     }
    ///
    ///     struct StorageExampleView: View {
    ///         //Looks for "key" in "com.yoursite.your-suite"
    ///         @AppStorage("key") var name = "Kanye West"
    ///
    ///         var body: some View {
    ///             TextField("Enter your name", text: $name)
    ///         }
    ///     }
    ///
    /// ![A screenshot with a text field on the left hand side of the center
    /// of the screen that reads "Kanye West."](defaultappstorage.png)
    ///
    /// - Parameter store: The user defaults to use as the default store for `@AppStorage`.
    public func defaultAppStorage(_ store: UserDefaults) -> some View { }

}

