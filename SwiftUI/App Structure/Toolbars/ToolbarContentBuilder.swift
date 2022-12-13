/// Constructs a toolbar item set from multi-expression closures.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@_functionBuilder public struct ToolbarContentBuilder {

    /// Builds a new toolbar contents structure from a block containing a single toolbar content.
    public static func buildBlock<Content>(_ content: Content) -> some ToolbarContent where Content : ToolbarContent { }

    /// Builds a new coustom toolbar contents structure from a block containing a single custom toolbar content.
    public static func buildBlock<Content>(_ content: Content) -> some CustomizableToolbarContent where Content : CustomizableToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new toolbar contents structure from a block containing 2 toolbar contents.
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new toolbar contents structure from a block containing 3 toolbar contents.
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new toolbar contents structure from a block containing 4 toolbar contents.
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new toolbar contents structure from a block containing 5 toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new toolbar contents structure from a block containing 6 toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent, C5 : ToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new toolbar contents structure from a block containing 7 toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent, C5 : ToolbarContent, C6 : ToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new toolbar contents structure from a block containing 8 toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent, C5 : ToolbarContent, C6 : ToolbarContent, C7 : ToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new toolbar contents structure from a block containing 9 toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent, C5 : ToolbarContent, C6 : ToolbarContent, C7 : ToolbarContent, C8 : ToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new toolbar contents structure from a block containing 10 toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent, C5 : ToolbarContent, C6 : ToolbarContent, C7 : ToolbarContent, C8 : ToolbarContent, C9 : ToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new custom toolbar contents structure from a block containing 2 custom toolbar contents.
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new custom toolbar contents structure from a block containing 3 custom toolbar contents.
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new custom toolbar contents structure from a block containing 4 custom toolbar contents.
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new custom toolbar contents structure from a block containing 5 custom toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new custom toolbar contents structure from a block containing 6 custom toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent, C5 : CustomizableToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new custom toolbar contents structure from a block containing 7 custom toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent, C5 : CustomizableToolbarContent, C6 : CustomizableToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new custom toolbar contents structure from a block containing 8 custom toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent, C5 : CustomizableToolbarContent, C6 : CustomizableToolbarContent, C7 : CustomizableToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new custom toolbar contents structure from a block containing 9 custom toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent, C5 : CustomizableToolbarContent, C6 : CustomizableToolbarContent, C7 : CustomizableToolbarContent, C8 : CustomizableToolbarContent { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    /// Builds a new custom toolbar contents structure from a block containing 10 custom toolbar contents.
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent, C5 : CustomizableToolbarContent, C6 : CustomizableToolbarContent, C7 : CustomizableToolbarContent, C8 : CustomizableToolbarContent, C9 : CustomizableToolbarContent { }

}

