/// A set of view types that may be pinned to the bounds of a scroll view.
///
/// Use this option set with the initializer of one of the 4 lazy grid/stacks
/// and the ``Section`` structure to pin
/// a view to the top or bottom of the screen while scrolling:
/// 1. ``LazyVStack``
/// 2. ``LazyHStack``
/// 3. ``LazyVGrid``
/// 4. ``LazyHGrid``
///
/// This structure has 2 static properties: ``PinnedScrollableViews/sectionHeaders``
/// and ``PinnedScrollableViews/sectionFooters``. You can specify either one
/// of them, or both.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         ScrollView {
///             LazyVStack(pinnedViews: .sectionHeaders) {
///                 Section(header: Text("**Top half**")) {
///                     ForEach(1...50, id: \.self) { number in
///                         Text("Row \(number)")
///                     }
///                 }
///                 Section(header: Text("**Bottom half**")) {
///                     ForEach(51...100, id: \.self) { number in
///                         Text("Row \(number)")
///                     }
///                 }
///             }
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying 100 rows in a scrollable view, each of which is labeled
/// with its row number. As the user scrolls through the top half, a label that reads
/// "**Top Half**" is pinned to the top of the screen. Once the user passes row 50,
/// the label switches to read "**Bottom Half**"](pinned-scroll-headers-ex.gif)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct PinnedScrollableViews : OptionSet {

    /// The corresponding value of the raw type.
    ///
    /// A new instance initialized with `rawValue` will be equivalent to this
    /// instance. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     let selectedSize = PaperSize.Letter
    ///     print(selectedSize.rawValue)
    ///     // Prints "Letter"
    ///
    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
    ///     // Prints "true"
    public let rawValue: UInt32

    /// Creates a new option set from the given raw value.
    ///
    /// This initializer always succeeds, even if the value passed as `rawValue`
    /// exceeds the static properties declared as part of the option set. This
    /// example creates an instance of `ShippingOptions` with a raw value beyond
    /// the highest element, with a bit mask that effectively contains all the
    /// declared static members.
    ///
    ///     let extraOptions = ShippingOptions(rawValue: 255)
    ///     print(extraOptions.isStrictSuperset(of: .all))
    ///     // Prints "true"
    ///
    /// - Parameter rawValue: The raw value of the option set to create. Each bit
    ///   of `rawValue` potentially represents an element of the option set,
    ///   though raw values may include bits that are not defined as distinct
    ///   values of the `OptionSet` type.
    public init(rawValue: UInt32) { }

    /// The header view of each ``Section`` will be pinned.
    ///
    /// Use this option with the initializer of one of the 4 lazy grid/stacks
    /// and the ``Section`` structure to pin
    /// a view to the top of the screen while scrolling:
    ///
    /// 1. ``LazyVStack``
    /// 2. ``LazyHStack``
    /// 3. ``LazyVGrid``
    /// 4. ``LazyHGrid``
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView {
    ///             LazyVStack(pinnedViews: .sectionHeaders) {
    ///                 Section(header: Text("**Top half**").background(Color.white)) {
    ///                     ForEach(1...50, id: \.self) { number in
    ///                         Text("Row \(number)")
    ///                     }
    ///                 }
    ///                 Section(header: Text("**Bottom half**").background(Color.white)) {
    ///                     ForEach(51...100, id: \.self) { number in
    ///                         Text("Row \(number)")
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying 100 rows in a scrollable view, each of which is labeled
    /// with its row number. As the user scrolls through the top half, a label that reads
    /// "**Top Half**" is pinned to the top of the screen. Once the user passes row 50,
    /// the label switches to read "**Bottom Half**"](pinned-scroll-headers-ex.gif)
    ///
    public static let sectionHeaders: PinnedScrollableViews

    /// The footer view of each ``Section`` will be pinned.
    ///
    /// Use this option with the initializer of one of the 4 lazy grid/stacks
    /// and the ``Section`` structure to pin
    /// a view to the top of the screen while scrolling:
    ///
    /// 1. ``LazyVStack``
    /// 2. ``LazyHStack``
    /// 3. ``LazyVGrid``
    /// 4. ``LazyHGrid``
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         ScrollView {
    ///             LazyVStack(pinnedViews: .sectionFooters) {
    ///                 Section(footer: Text("**Top half**").background(Color.white)) {
    ///                     ForEach(1...50, id: \.self) { number in
    ///                         Text("Row \(number)")
    ///                     }
    ///                 }
    ///                 Section(footer: Text("**Bottom half**").background(Color.white)) {
    ///                     ForEach(51...100, id: \.self) { number in
    ///                         Text("Row \(number)")
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying 100 rows in a scrollable view, each of which is labeled
    /// with its row number. As the user scrolls through the top half, a label that reads
    /// "**Top Half**" is pinned to the bottom of the screen. Once the user passes row 50,
    /// the label switches to read "**Bottom Half**" and continues to be pinned
    /// to the bottom of the screen.](pinned-scroll-footers-ex.gif)
    ///
    public static let sectionFooters: PinnedScrollableViews

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = PinnedScrollableViews

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = PinnedScrollableViews

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = UInt32
}

