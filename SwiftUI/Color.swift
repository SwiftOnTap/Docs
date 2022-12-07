/// An environment-dependent color.
///
/// `Color` represents an environment-dependent color that conforms to ``View``.
/// Colors conformance to ``View`` means that a color can be used as a view
/// itself.
///
/// For example:
///
///     struct ExampleView: View {
///         var body: some View {
///             Color.yellow
///         }
///     }
///
/// ![A yellow view in which the color conforms to view and hence is
/// used as a view itself.](color-example-one.png)
///
/// `Color` also conforms to ``ShapeStyle`` which allows it to serve as a fill
/// or stroke on a shape.
///
/// For example, as a fill:
///
///     struct ExampleView: View {
///         var body: some View {
///             Circle()
///                 .fill(Color.yellow)
///         }
///     }
///
/// ![A view containing a large yellow-filled circle in which the color conforms
/// to ShapeStyle and serves as the fill on the circle shape.](color-example-two.png)
///
/// And as a stroke:
///
///     struct ExampleView: View {
///         var body: some View {
///             Circle()
///                 .stroke(Color.yellow)
///         }
///     }
///
/// ![A view containing a large circle with a yellow outline in which the color conforms
/// to ShapeStyle and serves as the stroke on the circle shape.](color-example-three.png)
///
/// - Note: A ``Color`` is a late-binding token: SwiftUI only resolves it to a concrete
/// value just before using it in a given environment.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Color : Hashable, CustomStringConvertible {

    /// Returns a `CGColor` that represents this color if one can be constructed
    /// that accurately represents this color.
    @available(iOS 14.0, macOS 11, tvOS 14.0, watchOS 7.0, *)
    public var cgColor: CGColor? { get }

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

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Color, rhs: Color) -> Bool { }

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `description` property for types that conform to
    /// `CustomStringConvertible`:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    ///
    /// To call this property directly, try:
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Text(Color.yellow.description)
    ///         }
    ///     }
    ///
    ///
    /// ![A text view populated by the description property of the color
    /// yellow, resulting in the centered text "yellow."](color-description.png)
    ///
    public var description: String { get }

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Color {

    /// Creates a color from an instance of `CGColor`.
    ///
    ///     struct ExampleView: View {
    ///         let cgColor = CGColor(red: 1.00, green: 0.60, blue: 0.60, alpha: 1.0)
    ///
    ///         var body: some View {
    ///             Color(cgColor)
    ///         }
    ///     }
    ///
    /// ![A view displaying a light pink color created from an instance of CGColor.](19.17.28.png)
    ///
    public init(_ cgColor: CGColor) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// The common ways of organizing RGB colors for a screen.
    public enum RGBColorSpace {

        /// Standard RGB, which is what is normally used for apps and web browsers.
        case sRGB

        /// Linear standard RGB colors don't have the gamma curve of sRGB
        /// applied to them, hence "linear."
        case sRGBLinear

        /// Display P3 is a colorspace created by Apple for their devices.
        case displayP3

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Color.RGBColorSpace, b: Color.RGBColorSpace) -> Bool { }

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

    /// Create a ``Color`` from RGB and opacity values along with an optional colorspace.
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color(red: 1.0, green: 0.6, blue: 0.6, opacity: 0.5)
    ///         }
    ///     }
    ///
    /// ![A view displaying a light pink color created from a RGB and opacity
    /// value.](color-rgb-init.png)
    ///
    /// - Note: The colorspace value defaults to sRGB, which is standard for apps. Note
    /// also that red, green, blue, and opacity are all specified in values from
    /// 0.0 to 1.0, so if your numbers are given from 0-255, you will need to
    /// divide them by 255 in order to use this initializer.
    ///
    /// - Parameters:
    ///   - colorSpace: The `RGBColorSpace` of the specified color.
    ///   - red: The red value of the color.
    ///   - green: The green value of the color.
    ///   - blue: The blue value of the color.
    ///   - opacity: The opacity of the color. Defaults to 1.0.
    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1) { }

    /// Create a ``Color`` from grayscale and opacity.
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color(white: 0.2, opacity: 0.5)
    ///         }
    ///     }
    ///
    /// ![A view displaying a gray color created from a grayscale value and opacity
    /// value.](color-white-opacity.png)
    ///
    /// - Note: Both the white and the opacity must be specified from 0.0 to 1.0. If
    /// either of these values are given to you as integers, they will need to
    /// be divided by their maximum value.
    ///
    /// - Parameters:
    ///   - colorSpace: The `RGBColorSpace` of the specified color.
    ///   - white: The grayscale value of the color, from 0.0 to 1.0.
    ///   - opacity: The opacity of the color. Defaults to 1.0.
    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1) { }

    /// Creates a ``Color`` from hue, saturation, brightness, and opacity values.
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color(hue: 0.5, saturation: 0.60, brightness: 0.90)
    ///         }
    ///     }
    ///
    /// ![A view displaying a bright teal color as defined by hue, saturation,
    /// brightness, and opacity values.](color-hue-init.png)
    ///
    /// - Note: Apple's HSB scale is not the traditional 360, 100, 100. Instead all HSB values are from 0 to 1.
    ///
    /// - Parameters:
    ///   - hue: The hue of the color.
    ///   - saturation: The saturation of the color.
    ///   - brightness: The brightness of the color.
    ///   - opacity: The opacity of the color.
    public init(hue: Double, saturation: Double, brightness: Double, opacity: Double = 1) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// A color that represents the system or application accent color.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Link("Banana🍌 Docs", destination: URL(string: "https://swiftontap.com")!)
    ///                 .accentColor(Color.accentColor)
    ///         }
    ///     }
    ///
    /// ![A view containing a link that reads "Banana🍌 Docs", with the type
    /// showing in blue as defined by the default accent color.](19.20.57.png)
    ///
    /// The accent color reflects the broad theme color that can be applied to
    /// views and controls. If an explicit value hasn't been set, the default
    /// application or system accent color will be used.
    ///
    /// On macOS, customization of the accent color is only used if the
    /// "Multicolor" accent color is selected in System Preferences.
    public static var accentColor: Color { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// A clear color ``View``, equivalent to an empty view.
    ///
    /// Though seemingly useless, `Color.clear` is actually used
    /// widely throughout SwiftUI in two main ways:
    /// - As a substitue for ``EmptyView``
    /// - In situations where a ``Color`` on screen is changing, and
    /// you need a placeholder.
    ///
    /// To demonstrate the first use, consider this example of a
    /// ``Text``, aligned to the top left, within a ``ZStack``:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .topLeading) {
    ///             Text("I'm inside a ZStack 📚")
    ///         }
    ///         .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with topleading alignment and the text
    /// "I'm inside a ZStack" showing within a fitted orange border.](color-clear-1.png)
    ///
    /// Even though we said `alignment: .topLeading`, the ``Text`` is still
    /// in the middle of the screen. This is because, as you can
    /// see from the border, the ``ZStack`` fits snugly around the ``Text``.
    ///
    /// To expand the ``ZStack`` to the entire space of the screen,
    /// allowing the ``Text`` to move to the top left corner,
    /// we can use `Color.clear`:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ZStack(alignment: .topLeading) {
    ///             Color.clear
    ///             Text("I'm inside a ZStack 📚")
    ///         }
    ///         .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a ZStack with topleading alignment, clear color, and the text
    /// "I'm inside a ZStack" showing in the upper left corner of an orange bordered page.](color-clear-2.png)
    ///
    /// A second use for `Color.clear` is as a placeholder
    /// when the ``Color`` on screen is changing. For example, below
    /// we want to set a background color based on which ``Button``
    /// is tapped. But to start, we just make it `Color.clear`!
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State var color = Color.clear
    ///
    ///     var body: some View {
    ///         ZStack {
    ///             color
    ///
    ///             VStack {
    ///                 Button("Tap me for 🟠🍑🎃") {
    ///                     color = Color.orange
    ///                 }
    ///                 .padding()
    ///                 Button("Press me for 🟨🌕🍋") {
    ///                     color = Color.yellow
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a view containing a ZStack with a color variable and
    /// a VStack with two buttons, "Tap me for 🟠🍑🎃" and "Press me for 🟨🌕🍋";
    /// when the first button is pressed, the screen background turns orange, and
    /// when the second is pressed it turns yellow, by way of the color variable
    ///  being updated.](color-clear-ex3.gif)
    ///
    public static let clear: Color

    /// A true black color ``View``.
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color.black
    ///         }
    ///     }
    ///
    /// ![A view displaying the color black.](19.22.27.png)
    ///
    public static let black: Color

    /// A true white color ``View``.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color.white
    ///         }
    ///     }
    ///
    /// ![A view displaying the color white.](19.22.43.png)
    ///
    public static let white: Color

    /// A gray color ``View``.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color.gray
    ///         }
    ///     }
    ///
    /// ![A view displaying the color gray.](19.22.56.png)
    ///
    public static let gray: Color

    /// A stylized red color ``View``.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color.red
    ///         }
    ///     }
    ///
    /// ![A view displaying the color red.](19.23.07.png)
    ///
    public static let red: Color

    /// A stylized green color ``View``.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color.green
    ///         }
    ///     }
    ///
    /// ![A view displaying the color green.](19.23.20.png)
    ///
    public static let green: Color

    /// A stylized blue color ``View``.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color.blue
    ///         }
    ///     }
    ///
    /// ![A view displaying the color blue.](19.23.36.png)
    ///
    public static let blue: Color

    /// An orange color ``View``.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color.orange
    ///         }
    ///     }
    ///
    /// ![A view displaying the color orange.](19.23.49.png)
    ///
    public static let orange: Color

    /// A stylized yellow color ``View``.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color.yellow
    ///         }
    ///     }
    ///
    /// ![A view displaying the color yellow.](19.24.14.png)
    ///
    public static let yellow: Color

    /// A pink color ``View``.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color.pink
    ///         }
    ///     }
    ///
    /// ![A view displaying the color pink.](19.24.29.png)
    ///
    public static let pink: Color

    /// A purple color ``View``.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color.purple
    ///         }
    ///     }
    ///
    /// ![A view displaying the color purple.](19.24.41.png)
    ///
    public static let purple: Color

    /// The default color of text, based on the environment.
    ///
    /// Code:
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Text("Bananas 🍌🍌")
    ///                 .accentColor(.primary)
    ///         }
    ///     }
    ///
    /// Light Mode:
    /// ![A view within a light mode simulator with the text "Bananas 🍌🍌" and
    /// the accent color set to primary; the view displays as a white Background
    /// with black text.](color-primary-light.png)
    ///
    /// Dark Mode:
    /// ![A view within a dark mode simulator with the text "Bananas 🍌🍌" and
    /// the accent color set to primary; the view displays as a black background
    /// with white text.](color-primary-dark.png)
    ///
    /// If you are in light mode, this will be black. If, on the other hand, you
    /// are in dark mode, this will be white. It is automatically updated for
    /// you.
    public static let primary: Color

    /// The default color of text, with a little bit of transparency.
    ///
    /// If you are in light mode, this will be black with some transparency.
    /// If the device switches to dark mode, on the other hand, the text will
    /// dynamically shift to white with a little bit of transparency.
    public static let secondary: Color
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color : ShapeStyle {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// Creates a named color.
    ///
    /// To declare a color with a `name` create your color in the
    /// `Assets.xcassets` folder.
    ///
    /// ![A screenshot of the Assets.xcassets folder within an XCode project
    /// containing a custom color named pink.](color-name-showcase.png)
    ///
    /// Create a light theme and dark theme color to adjust your view depending
    /// on the user's environment.
    ///
    /// Next, run your app in both light theme and dark theme. Your color will
    /// automatically change.
    ///
    /// Code:
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Color("Pink")
    ///         }
    ///     }
    ///
    /// Light theme:
    /// ![A view within a light mode simulator with a light pink background,
    /// as defined by color "Pink".](color-name-light.png)
    ///
    /// Dark theme:
    /// ![A view within a dark mode simulator with a dark pink, almost maroon,
    /// background, as defined by color "Pink".](color-name-dark.png)
    ///
    /// - Parameters:
    ///   - name: the name of the color resource to lookup.
    ///   - bundle: the bundle to search for the color resource in.
    public init(_ name: String, bundle: Bundle? = nil) { }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension Color {

    /// Creates a color from an instance of `UIColor`.
    ///
    ///     struct ExampleView: View {
    ///         let uiColor = UIColor.yellow
    ///
    ///         var body: some View {
    ///             Color(uiColor)
    ///         }
    ///     }
    ///
    /// ![A view displaying a bright, highlighter yellow color as created from
    /// an instance of UIColor.](color-uicolor-init.png)
    ///
    public init(_ color: UIColor) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// Updates the transparency channel of a ``Color``, returning a ``Color``
    /// back.
    ///
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             ZStack {
    ///                 Text("Banana 🍌🍌")
    ///                 Color.pink.opacity(0.80)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A view displaying the text "Banana 🍌🍌", shrouded by a pink
    /// background, as defined by the instance method opacity being set to 0.80.](color-opacity.png)
    ///
    /// This is different from the ``View/opacity(_:)`` modifier because it
    /// returns a ``Color`` object rather than `some View`.
    public func opacity(_ opacity: Double) -> Color { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color.RGBColorSpace : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color.RGBColorSpace : Hashable {
}

