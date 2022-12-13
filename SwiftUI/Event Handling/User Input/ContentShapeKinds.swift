/// A kind for the content shape of a view.
///
/// The kind is used by the system to influence various effects, hit-testing,
/// and more.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ContentShapeKinds : OptionSet {

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
    public var rawValue: Int

    /// Creates a content shape kind.
    public init(rawValue: Int)

    /// The kind for hit-testing and accessibility.
    ///
    /// Setting a content shape with this kind causes the view to hit-test
    /// using the specified shape.
    public static let interaction: ContentShapeKinds

    /// The kind for drag and drop previews.
    ///
    /// When using this kind, only the preview shape is affected. To control the
    /// shape used to hit-test and start the drag preview, use the `interaction`
    /// kind.
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public static let dragPreview: ContentShapeKinds

    /// The kind for context menu previews.
    ///
    /// When using this kind, only the preview shape will be affected. To
    /// control the shape used to hit-test and start the context menu
    /// presentation, use the `.interaction` kind.
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public static let contextMenuPreview: ContentShapeKinds

    /// The kind for hover effects.
    ///
    /// When using this kind, only the preview shape is affected. To control
    /// the shape used to hit-test and start the effect, use the `interaction`
    /// kind.
    ///
    /// This kind does not affect the `onHover` modifier.
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public static let hoverEffect: ContentShapeKinds

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = ContentShapeKinds

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = ContentShapeKinds

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int
}

