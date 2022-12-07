/// A custom attribute that constructs a widget bundle's body.
///
/// Use the `@WidgetBundleBuilder` attribute to group multiple widgets listed
/// in the `WidgetBundle/body-swift.property` property of a widget bundle.
/// For example, the following code defines a widget bundle that consists of
/// two widgets.
///
///     @main
///     struct GameWidgets: WidgetBundle {
///         @WidgetBundleBuilder
///         var body: some Widget {
///             GameStatusWidget()
///             CharacterDetailWidget()
///         }
///     }
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@_functionBuilder public struct WidgetBundleBuilder {

    /// Builds an empty Widget from an block containing no statements, `{ }`.
    public static func buildBlock() -> some Widget { }


    /// Builds a single Widget written as a child view (e..g, `{ MyWidget() }`)
    /// through unmodified.
    public static func buildBlock<Content>(_ content: Content) -> some Widget where Content : Widget { }

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WidgetBundleBuilder {

    /// Builds a new widget from a block containing 2 widgets.
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some Widget where C0 : Widget, C1 : Widget { }

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WidgetBundleBuilder {

    /// Builds a new widget from a block containing 3 widgets.
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some Widget where C0 : Widget, C1 : Widget, C2 : Widget { }

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WidgetBundleBuilder {

    /// Builds a new widget from a block containing 4 widgets.
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some Widget where C0 : Widget, C1 : Widget, C2 : Widget, C3 : Widget { }

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WidgetBundleBuilder {

    /// Builds a new widget from a block containing 5 widgets.
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some Widget where C0 : Widget, C1 : Widget, C2 : Widget, C3 : Widget, C4 : Widget { }

}

