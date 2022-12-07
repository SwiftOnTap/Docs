/// The operating system on which to run the preview.
///
/// By default, Xcode can infer the platform for a preview based on the
/// target of the current file. However, you can also use this enumeration
/// along with the
/// ``PreviewProvider/platform-b6bd6``
/// property to change the way a view is displayed in a preview.
///
/// *Author's note: I tried to use this to change the preview platform, but I couldn't get anything
/// to work. It seems right now that the only way to change your preview
/// device is by actually changing your build target.*
///
/// This enumeration has 4 different cases:
/// 1. ``PreviewPlatform/iOS``
/// 2. ``PreviewPlatform/macOS``
/// 3. ``PreviewPlatform/tvOS``
/// 4. ``PreviewPlatform/watchOS``
///
/// In the following example, we change the preview platform to macOS.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Text("I should be in a Mac 🖥")
///     }
/// }
///
/// struct ContentView_Previews: PreviewProvider {
///     static var previews: some View {
///         ContentView()
///     }
///
///     static var platform: PreviewPlatform? { .macOS }
/// }
/// ```
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum PreviewPlatform {

	/// The iOS preview platform.
    ///
    /// By default, Xcode can infer the platform for a preview based on the
    /// target of the current file. However, you can also use this enumeration
    /// along with the
    /// ``PreviewProvider/platform-b6bd6``
    /// property to change the way a view is displayed in a preview.
    ///
    /// *Author's note: I tried to use this to change the preview platform, but I couldn't get anything
    /// to work. It seems right now that the only way to change your preview
    /// device is by actually changing your build target.*
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("I should be in a phone 📲")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///     }
    ///
    ///     static var platform: PreviewPlatform? { .iOS }
    /// }
    /// ```
    ///
    case iOS

    /// The macOS preview platform.
    ///
    /// By default, Xcode can infer the platform for a preview based on the
    /// target of the current file. However, you can also use this enumeration
    /// along with the
    /// ``PreviewProvider/platform-b6bd6``
    /// property to change the way a view is displayed in a preview.
    ///
    /// *Author's note: I tried to use this to change the preview platorm, but I couldn't get anything
    /// to work. It seems right now that the only way to change your preview
    /// device is by actually changing your build target.*
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("I should be in a Mac 🖥")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///     }
    ///
    ///     static var platform: PreviewPlatform? { .macOS }
    /// }
    /// ```
    ///
    case macOS

    /// The tvOS preview platform.
    ///
    /// By default, Xcode can infer the platform for a preview based on the
    /// target of the current file. However, you can also use this enumeration
    /// along with the
    /// ``PreviewProvider/platform-b6bd6``
    /// property to change the way a view is displayed in a preview.
    ///
    /// *Author's note: I tried to use this to change the preview platform, but I couldn't get anything
    /// to work. It seems right now that the only way to change your preview
    /// device is by actually changing your build target.*
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("I should be in a TV 📺")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///     }
    ///
    ///     static var platform: PreviewPlatform? { .tvOS }
    /// }
    /// ```
    case tvOS

    /// The watchOS preview platform.
    ///
    /// By default, Xcode can infer the platform for a preview based on the
    /// target of the current file. However, you can also use this enumeration
    /// along with the
    /// ``PreviewProvider/platform-b6bd6``
    /// property to change the way a view is displayed in a preview.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("I should be in a watch! ⌚️")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///     }
    ///
    ///     static var platform: PreviewPlatform? { .watchOS }
    /// }
    /// ```
    ///
    /// Note: Currently, it seems that the only way to change your preview
    /// device is by actually changing your build target.
    case watchOS

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: PreviewPlatform, b: PreviewPlatform) -> Bool { }

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) { }
}
