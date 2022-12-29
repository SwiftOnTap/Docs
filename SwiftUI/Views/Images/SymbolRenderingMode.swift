/// A symbol rendering mode.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct SymbolRenderingMode {

    /// A mode that renders symbols as a single layer filled with the
    /// foreground style.
    ///
    /// For example, you can render a filled exclamation mark triangle in
    /// purple:
    ///
    ///     Image(systemName: "exclamationmark.triangle.fill")
    ///         .symbolRenderingMode(.monochrome)
    ///         .foregroundStyle(Color.purple)
    public static let monochrome: SymbolRenderingMode

    /// A mode that renders symbols as multiple layers with their inherit
    /// styles.
    ///
    /// The layers may be filled with their own inherent styles, or the
    /// foreground style. For example, you can render a filled exclamation
    /// mark triangle in its inherent colors, with yellow for the triangle and
    /// white for the exclamation mark:
    ///
    ///     Image(systemName: "exclamationmark.triangle.fill")
    ///         .symbolRenderingMode(.multicolor)
    public static let multicolor: SymbolRenderingMode

    /// A mode that renders symbols as multiple layers, with different opacities
    /// applied to the foreground style.
    ///
    /// SwiftUI fills the first layer with the foreground style, and the others
    /// the secondary, and tertiary variants of the foreground style. You can
    /// specify these styles explicitly using the ``View/foregroundStyle(_:_:)``
    /// and ``View/foregroundStyle(_:_:_:)`` modifiers. If you only specify
    /// a primary foreground style, SwiftUI automatically derives
    /// the others from that style. For example, you can render a filled
    /// exclamation mark triangle with purple as the tint color for the
    /// exclamation mark, and lower opacity purple for the triangle:
    ///
    ///     Image(systemName: "exclamationmark.triangle.fill")
    ///         .symbolRenderingMode(.hierarchical)
    ///         .foregroundStyle(Color.purple)
    public static let hierarchical: SymbolRenderingMode

    /// A mode that renders symbols as multiple layers, with different styles
    /// applied to the layers.
    ///
    /// In this mode SwiftUI maps each successively defined layer in the image
    /// to the next of the primary, secondary, and tertiary variants of the
    /// foreground style. You can specify these styles explicitly using the
    /// ``View/foregroundStyle(_:_:)`` and ``View/foregroundStyle(_:_:_:)``
    /// modifiers. If you only specify a primary foreground style, SwiftUI
    /// automatically derives the others from that style. For example, you can
    /// render a filled exclamation mark triangle with yellow as the tint color
    /// for the exclamation mark, and fill the triangle with cyan:
    ///
    ///     Image(systemName: "exclamationmark.triangle.fill")
    ///         .symbolRenderingMode(.palette)
    ///         .foregroundStyle(Color.yellow, Color.cyan)
    ///
    /// You can also omit the symbol rendering mode, as specifying multiple
    /// foreground styles implies switching to palette rendering mode:
    ///
    ///     Image(systemName: "exclamationmark.triangle.fill")
    ///         .foregroundStyle(Color.yellow, Color.cyan)
    public static let palette: SymbolRenderingMode
}

