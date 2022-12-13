/// A variant of a symbol.
///
/// Many of the
/// [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/)
/// that you can add to your app using an ``Image`` or a ``Label`` instance
/// have common variants, like a filled version or a version that's
/// contained within a circle. The symbol's name indicates the variant:
///
///     VStack(alignment: .leading) {
///         Label("Default", systemImage: "heart")
///         Label("Fill", systemImage: "heart.fill")
///         Label("Circle", systemImage: "heart.circle")
///         Label("Circle Fill", systemImage: "heart.circle.fill")
///     }
///
/// ![A screenshot showing an outlined heart, a filled heart, a heart in
/// a circle, and a filled heart in a circle, each with a text label
/// describing the symbol.](SymbolVariants-1)
///
/// You can configure a part of your view hierarchy to use a particular variant
/// for all symbols in that view and its child views using `SymbolVariants`.
/// Add the ``View/symbolVariant(_:)`` modifier to a view to set a variant
/// for that view's environment. For example, you can use the modifier to
/// create the same set of labels as in the example above, using only the
/// base name of the symbol in the label declarations:
///
///     VStack(alignment: .leading) {
///         Label("Default", systemImage: "heart")
///         Label("Fill", systemImage: "heart")
///             .symbolVariant(.fill)
///         Label("Circle", systemImage: "heart")
///             .symbolVariant(.circle)
///         Label("Circle Fill", systemImage: "heart")
///             .symbolVariant(.circle.fill)
///     }
///
/// Alternatively, you can set the variant in the environment directly by
/// passing the ``EnvironmentValues/symbolVariants`` environment value to the
/// ``View/environment(_:_:)`` modifier:
///
///     Label("Fill", systemImage: "heart")
///         .environment(\.symbolVariants, .fill)
///
/// SwiftUI sets a variant for you in some environments. For example, SwiftUI
/// automatically applies the ``SymbolVariants/fill-swift.type.property``
/// symbol variant for items that appear in the `content` closure of the
/// ``View/swipeActions(edge:allowsFullSwipe:content:)``
/// method, or as the tab bar items of a ``TabView``.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct SymbolVariants : Hashable {

    /// No variant for a symbol.
    ///
    /// Using this variant with the ``View/symbolVariant(_:)`` modifier doesn't
    /// have any effect. Instead, to show a symbol that ignores the current
    /// variant, directly set the ``EnvironmentValues/symbolVariants``
    /// environment value to `none` using the ``View/environment(_:_:)``
    /// modifer:
    ///
    ///     HStack {
    ///         Image(systemName: "heart")
    ///         Image(systemName: "heart")
    ///             .environment(\.symbolVariants, .none)
    ///     }
    ///     .symbolVariant(.fill)
    ///
    /// ![A screenshot of two heart symbols. The first is filled while the
    /// second is outlined.](SymbolVariants-none-1)
    public static let none: SymbolVariants

    /// A variant that encapsulates the symbol in a circle.
    ///
    /// Use this variant with a call to the ``View/symbolVariant(_:)`` modifier
    /// to draw symbols in a circle, for those symbols that have a circle
    /// variant:
    ///
    ///     VStack(spacing: 20) {
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "flag")
    ///             Image(systemName: "heart")
    ///             Image(systemName: "bolt")
    ///             Image(systemName: "star")
    ///         }
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "flag")
    ///             Image(systemName: "heart")
    ///             Image(systemName: "bolt")
    ///             Image(systemName: "star")
    ///         }
    ///         .symbolVariant(.circle)
    ///     }
    ///
    /// ![A screenshot showing two rows of four symbols each. Both rows contain
    /// a flag, a heart, a bolt, and a star. The symbols in the second row are
    /// versions of the symbols in the first row, but each is enclosed in a
    /// circle.](SymbolVariants-circle-1)
    public static let circle: SymbolVariants

    /// A variant that encapsulates the symbol in a square.
    ///
    /// Use this variant with a call to the ``View/symbolVariant(_:)`` modifier
    /// to draw symbols in a square, for those symbols that have a square
    /// variant:
    ///
    ///     VStack(spacing: 20) {
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "flag")
    ///             Image(systemName: "heart")
    ///             Image(systemName: "bolt")
    ///             Image(systemName: "star")
    ///         }
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "flag")
    ///             Image(systemName: "heart")
    ///             Image(systemName: "bolt")
    ///             Image(systemName: "star")
    ///         }
    ///         .symbolVariant(.square)
    ///     }
    ///
    /// ![A screenshot showing two rows of four symbols each. Both rows contain
    /// a flag, a heart, a bolt, and a star. The symbols in the second row are
    /// versions of the symbols in the first row, but each is enclosed in a
    /// square.](SymbolVariants-square-1)
    public static let square: SymbolVariants

    /// A variant that encapsulates the symbol in a rectangle.
    ///
    /// Use this variant with a call to the ``View/symbolVariant(_:)`` modifier
    /// to draw symbols in a rectangle, for those symbols that have a rectangle
    /// variant:
    ///
    ///     VStack(spacing: 20) {
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "plus")
    ///             Image(systemName: "minus")
    ///             Image(systemName: "xmark")
    ///             Image(systemName: "checkmark")
    ///         }
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "plus")
    ///             Image(systemName: "minus")
    ///             Image(systemName: "xmark")
    ///             Image(systemName: "checkmark")
    ///         }
    ///         .symbolVariant(.rectangle)
    ///     }
    ///
    /// ![A screenshot showing two rows of four symbols each. Both rows contain
    /// a plus sign, a minus sign, a multiplication sign, and a check mark.
    /// The symbols in the second row are versions of the symbols in the first
    /// row, but each is enclosed in a rectangle.](SymbolVariants-rectangle-1)
    public static let rectangle: SymbolVariants

    /// A version of the variant that's encapsulated in a circle.
    ///
    /// Use this property to modify a variant like ``fill-swift.property``
    /// so that it's also contained in a circle:
    ///
    ///     Label("Fill Circle", systemImage: "bolt")
    ///         .symbolVariant(.fill.circle)
    ///
    /// ![A screenshot of a label that shows a bolt in a filled circle
    /// beside the words Fill Circle.](SymbolVariants-circle-2)
    public var circle: SymbolVariants { get }

    /// A version of the variant that's encapsulated in a square.
    ///
    /// Use this property to modify a variant like ``fill-swift.property``
    /// so that it's also contained in a square:
    ///
    ///     Label("Fill Square", systemImage: "star")
    ///         .symbolVariant(.fill.square)
    ///
    /// ![A screenshot of a label that shows a star in a filled square
    /// beside the words Fill Square.](SymbolVariants-square-2)
    public var square: SymbolVariants { get }

    /// A version of the variant that's encapsulated in a rectangle.
    ///
    /// Use this property to modify a variant like ``fill-swift.property``
    /// so that it's also contained in a rectangle:
    ///
    ///     Label("Fill Rectangle", systemImage: "plus")
    ///         .symbolVariant(.fill.rectangle)
    ///
    /// ![A screenshot of a label that shows a plus sign in a filled rectangle
    /// beside the words Fill Rectangle.](SymbolVariants-rectangle-2)
    public var rectangle: SymbolVariants { get }

    /// A variant that fills the symbol.
    ///
    /// Use this variant with a call to the ``View/symbolVariant(_:)`` modifier
    /// to draw filled symbols, for those symbols that have a filled variant:
    ///
    ///     VStack(spacing: 20) {
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "flag")
    ///             Image(systemName: "heart")
    ///             Image(systemName: "bolt")
    ///             Image(systemName: "star")
    ///         }
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "flag")
    ///             Image(systemName: "heart")
    ///             Image(systemName: "bolt")
    ///             Image(systemName: "star")
    ///         }
    ///         .symbolVariant(.fill)
    ///     }
    ///
    /// ![A screenshot showing two rows of four symbols each. Both rows contain
    /// a flag, a heart, a bolt, and a star. The symbols in the second row are
    /// filled version of the symbols in the first row.](SymbolVariants-fill-1)
    public static let fill: SymbolVariants

    /// A filled version of the variant.
    ///
    /// Use this property to modify a shape variant like
    /// ``circle-swift.type.property`` so that it's also filled:
    ///
    ///     Label("Circle Fill", systemImage: "flag")
    ///         .symbolVariant(.circle.fill)
    ///
    /// ![A screenshot of a label that shows a flag in a filled circle
    /// beside the words Circle Fill.](SymbolVariants-fill-2)
    public var fill: SymbolVariants { get }

    /// A variant that draws a slash through the symbol.
    ///
    /// Use this variant with a call to the ``View/symbolVariant(_:)`` modifier
    /// to draw symbols with a slash, for those symbols that have such a
    /// variant:
    ///
    ///     VStack(spacing: 20) {
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "flag")
    ///             Image(systemName: "heart")
    ///             Image(systemName: "bolt")
    ///             Image(systemName: "star")
    ///         }
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "flag")
    ///             Image(systemName: "heart")
    ///             Image(systemName: "bolt")
    ///             Image(systemName: "star")
    ///         }
    ///         .symbolVariant(.slash)
    ///     }
    ///
    /// ![A screenshot showing two rows of four symbols each. Both rows contain
    /// a flag, a heart, a bolt, and a star. A slash is superimposed over
    /// all the symbols in the second row.](SymbolVariants-slash-1)
    public static let slash: SymbolVariants

    /// A slashed version of the variant.
    ///
    /// Use this property to modify a shape variant like
    /// ``circle-swift.type.property`` so that it's also covered by a slash:
    ///
    ///     Label("Circle Slash", systemImage: "flag")
    ///         .symbolVariant(.circle.slash)
    ///
    /// ![A screenshot of a label that shows a flag in a circle with a
    /// slash over it beside the words Circle Slash.](SymbolVariants-slash-2)
    public var slash: SymbolVariants { get }

    /// Returns a Boolean value that indicates whether the current variant
    /// contains the specified variant.
    ///
    /// - Parameter other: A variant to look for in this variant.
    /// - Returns: `true` if this variant contains `other`; otherwise,
    ///   `false`.
    public func contains(_ other: SymbolVariants) -> Bool

}
