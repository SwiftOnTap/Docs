/// A configuration for a navigation bar that represents a view at the top of a
/// navigation stack.
///
/// Use this structure's members to configure the appearance of a
/// navigation bar. Currently, there is only one member:
/// ``NavigationBarItem/TitleDisplayMode``. Below is a simple example,
/// but see ``NavigationBarItem/TitleDisplayMode`` for more on when
/// and how to use the options.
///
/// ```
/// struct ContentView: View {
///     let mode = NavigationBarItem.TitleDisplayMode.large
///
///     var body: some View {
///         NavigationView {
///             Text("Hello Bananas🍌🍌")
///                 .navigationTitle("Home")
///                 .navigationBarTitleDisplayMode(mode)
///         }
///     }
/// }
/// ```
///
/// ![A navigation view displaying the plain text "Hello Bananas🍌🍌" under a
/// navigation title with display mode .large that reads "Home".](538F7154-7B14-41AD-B913-2391A4D850CB.png)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
public struct NavigationBarItem {

    /// A style for displaying the title of a navigation bar.
    ///
    /// Use this enumeration with
    /// ``NavigationView`` and the ``View/navigationBarTitleDisplayMode(_:)``
    /// view modifier to set the size and style of the navigation bar title.
    ///
    /// There are currently 3 options:
    /// - ``NavigationBarItem/TitleDisplayMode/automatic`` - Use the system default, either
    /// `inline` or `large` depending on the context.
    /// - ``NavigationBarItem/TitleDisplayMode/inline`` - Centered, smaller title font.
    /// - ``NavigationBarItem/TitleDisplayMode/large`` - Large, left-aligned title font.
    ///
    /// Here is an example of specifying `automatic` display mode:
    ///
    /// ```
    /// struct ContentView: View {
    ///     let mode = NavigationBarItem.TitleDisplayMode.automatic
    ///
    ///     var body: some View {
    ///         NavigationView {
    ///             Text("My title is large! 👣")
    ///                 .navigationTitle("Title")
    ///                 .navigationBarTitleDisplayMode(mode)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A white navigation view displaying the centered body text "My title is large! 👣" with a left aligned title "Title" in automatic display mode.](displaymode.png)
    public enum TitleDisplayMode {

        /// Inherit the display mode from the previous navigation item.
        ///
        /// Use this case with
        /// ``NavigationView`` and the ``View/navigationBarTitleDisplayMode(_:)``
        /// view modifier to specify automatic title size. Automatic size tends to be
        /// `large` by default, and then after that, views inherit from their
        /// parent unless overridden.
        ///
        /// Here is an example of specifying `automatic` display mode:
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         NavigationView {
        ///             Text("My title is large! 👣")
        ///                 .navigationTitle("Title")
        ///                 .navigationBarTitleDisplayMode(.automatic)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![NavigationView Example 3](displaymode.png)
        ///
        /// - Note: You don't need to specify `automatic` title display
        /// mode. If no other mode is specified, it is the default.
        case automatic

        /// Display the title within the standard bounds of the navigation bar.
        ///
        /// Use this case with
        /// ``NavigationView`` and the ``View/navigationBarTitleDisplayMode(_:)``
        /// view modifier to specify inline, or smaller, title size. This
        /// is especially useful for overriding the default `large` title
        /// size for root views in a ``NavigationView``.
        ///
        /// Here is an example of specifying `inline` display mode:
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         NavigationView {
        ///             Text("My title is inline ➿")
        ///                 .navigationTitle("Inline Title")
        ///                 .navigationBarTitleDisplayMode(.inline)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![NavigationView Example 3](displaymode-inline.png)
        case inline

        /// Display a large title within an expanded navigation bar.
        ///
        /// Use this case with
        /// ``NavigationView`` and the ``View/navigationBarTitleDisplayMode(_:)``
        /// view modifier to specify large size. Large titles are the
        /// default for root views, but they must be specified explicitly
        /// for deeper-level views.
        ///
        /// Here is an example of specifying `large` display mode:
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         NavigationView {
        ///             Text("My title is large! 👣")
        ///                 .navigationTitle("Large")
        ///                 .navigationBarTitleDisplayMode(.large)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A white navigation view displaying the centered body text "My title is large! 👣" with a left aligned title "Large" in large display mode.](displaymode-large.png)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        case large

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: NavigationBarItem.TitleDisplayMode, b: NavigationBarItem.TitleDisplayMode) -> Bool { }

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
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension NavigationBarItem.TitleDisplayMode : Equatable {
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension NavigationBarItem.TitleDisplayMode : Hashable {
}

