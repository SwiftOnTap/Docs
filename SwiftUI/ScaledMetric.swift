/// Scale a float given the system font size.
///
/// ``ScaledMetric`` is a property wrapper that scales a number conforming to
/// the `BinaryFloatingPoint` protocol in accordance with the user's
/// `Dynamic Type` setting.
///
/// The purpose of ``ScaledMetric`` is to allow your app views – not just your
/// fonts – to scale given the user's `Dynamic Type` settings.
///
/// `Scaled Metric` can be declared in two ways:
///
/// 1. From a `CGFloat`. For example, `@ScaledMetric var scaledHeight: CGFloat = 32`
/// 2. From a `Font.TextStyle`. For example,
/// `@ScaledMetric(relativeTo: .title) var scaledHeight: CGFloat = 32`
///
/// ### Declaring ``ScaledMetric`` from a float
/// This code scaled a ``RoundedRectangle`` view given the user's font size.
/// Notice that both `scaledHeight` and `defaultHeight` are `CGFloat`s set to 32.
///
/// Given default font settings, this code renders as expected.
///
/// ![Scaled Metric](scaledmetric-example-6.png)
///
///     struct ExampleView: View {
///         @ScaledMetric var scaledHeight: CGFloat = 32
///         var defaultHeight: CGFloat = 32
///
///         var body: some View {
///             VStack {
///                 Text("Scaled Metric Height \(scaledHeight)")
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: scaledHeight)
///
///                 Text("Default Height \(defaultHeight)")
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: defaultHeight)
///             }
///             .font(.caption)
///             .foregroundColor(.pink)
///             .padding()
///         }
///     }
///
/// However, when the user adjusts the font size:
///
/// ![Large Font](scaledmetric-large.png)
///
/// The rectangle view changes accordingly while the code stays constant:
///
/// ![Large View](scaledmetric-example-5.png)
///
///     struct ExampleView: View {
///         @ScaledMetric var scaledHeight: CGFloat = 32
///         var defaultHeight: CGFloat = 32
///
///         var body: some View {
///             VStack {
///                 Text("Scaled Metric Height \(scaledHeight)")
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: scaledHeight)
///
///                 Text("Default Height \(defaultHeight)")
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: defaultHeight)
///             }
///             .font(.caption)
///             .foregroundColor(.pink)
///             .padding()
///         }
///     }
///
/// Similarly, when the user adjusts to a smaller font size:
///
/// ![Small Font](scaledmetric-small.png)
///
/// The ``RoundedRectangle`` shrinks while the code still has note changed:
///
/// ![Small View](scaledmetric-example-4.png)
///
///     struct ExampleView: View {
///         @ScaledMetric var scaledHeight: CGFloat = 32
///         var defaultHeight: CGFloat = 32
///
///         var body: some View {
///             VStack {
///                 Text("Scaled Metric Height \(scaledHeight)")
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: scaledHeight)
///
///                 Text("Default Height \(defaultHeight)")
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: defaultHeight)
///             }
///             .font(.caption)
///             .foregroundColor(.pink)
///             .padding()
///         }
///     }
///
///
/// ### Declaring a ``ScaledMetric`` from a font
/// Font sizes do not adjust as a continuous function given the `Dynamic Type`
/// setting. Instead, explicit integer font sizes are declared given the
/// different `Dynamic Type` options. Find these font sizes
/// [here](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/).
///
/// Now, assume an element in your view is meant to correspond to an exact
/// text size regardless of a user's `Dynamic Type` settings. This behavior
/// can be achieved by initializing ``ScaledMetric`` relative to a
/// ``Font/TextStyle``.
///
/// Given default font settings, this code renders as expected.
///
/// ![Scaled Metric](scaledmetric-example-1.png)
///
///     struct ExampleView: View {
///         @ScaledMetric(relativeTo: .title) var scaledHeight: CGFloat = 32
///         var defaultHeight: CGFloat = 32
///
///         var body: some View {
///             HStack {
///                 Text("My Title")
///                     .font(.title)
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: scaledHeight)
///                     .foregroundColor(.pink)
///             }
///
///             Text("\(scaledHeight)")
///         }
///     }
///
/// However, when the user adjusts the font size:
///
/// ![Large Font](scaledmetric-large.png)
///
/// The view changes accordingly while the code stays constant.
///
/// - Note: The scaled float generated from this font initialier is `36.00`,
/// whereas the scaled float generated from the `CGFloat` was `42.00`.
///
/// ![Large View](scaledmetric-example-3.png)
///
///     struct ExampleView: View {
///         @ScaledMetric var scaledHeight: CGFloat = 32
///         var defaultHeight: CGFloat = 32
///
///         var body: some View {
///             VStack {
///                 Text("Scaled Metric Height \(scaledHeight)")
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: scaledHeight)
///
///                 Text("Default Height \(defaultHeight)")
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: defaultHeight)
///             }
///             .font(.caption)
///             .foregroundColor(.pink)
///             .padding()
///         }
///     }
///
/// Similarly, when the user adjusts to a smaller font size:
///
/// ![Small Font](scaledmetric-small.png)
///
/// The ``RoundedRectangle`` shrinks while the code still has note changed.
///
/// - Note: The scaled float generated from this font initialier is `31.00`,
/// whereas the scaled float generated from the `CGFloat` was `27.50`.
///
/// ![Small View](scaledmetric-example-2.png)
///
///     struct ExampleView: View {
///         @ScaledMetric var scaledHeight: CGFloat = 32
///         var defaultHeight: CGFloat = 32
///
///         var body: some View {
///             VStack {
///                 Text("Scaled Metric Height \(scaledHeight)")
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: scaledHeight)
///
///                 Text("Default Height \(defaultHeight)")
///                 RoundedRectangle(cornerRadius: 10)
///                     .frame(height: defaultHeight)
///             }
///             .font(.caption)
///             .foregroundColor(.pink)
///             .padding()
///         }
///     }
///
/// ### More
/// By default, font sizes scale with `Dynamic Types`. However, if your app
/// declares a custom font size, it will not scale by default.
///
/// For example, the follow view will not scale when the user's font is set to large:
///
///     struct ContentView: View {
///         var body: some View {
///             Text("Banana 🍌")
///                 .font(.system(size: 34, weight: .bold, design: .rounded))
///         }
///     }
///
/// However, by setting a font size to a scaled value, the text will scale accordingly:
///
/// ![Font Example](scaledmetric-example-7.png)
///
///     struct ContentView: View {
///         @ScaledMetric(relativeTo: .largeTitle) var dynamicFontSize: CGFloat = 34
///
///         var body: some View {
///             Text("Banana 🍌")
///                 .font(.system(size: dynamicFontSize, weight: .bold, design: .rounded))
///         }
///     }
///
/// Learn more about `Dynamic Type` on Apple's
/// ["Human Interface Guidlines" typography page](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/).
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@propertyWrapper public struct ScaledMetric<Value> : DynamicProperty where Value : BinaryFloatingPoint {

    /// Creates the scaled metric with an unscaled value and a text style to
    /// scale relative to.
    public init(wrappedValue: Value, relativeTo textStyle: Font.TextStyle) { }

    /// Creates the scaled metric with an unscaled value using the default
    /// scaling.
    public init(wrappedValue: Value) { }

    /// The value scaled based on the current environment.
    public var wrappedValue: Value { get }
}

