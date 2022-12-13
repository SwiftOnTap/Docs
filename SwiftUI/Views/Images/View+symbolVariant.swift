@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Makes symbols within the view show a particular variant.
    ///
    /// When you want all the
    /// [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/)
    /// in a part of your app's user interface to use the same variant, use the
    /// `symbolVariant(_:)` modifier with a ``SymbolVariants`` value, like
    /// ``SymbolVariants/fill-swift.type.property``:
    ///
    ///     VStack(spacing: 20) {
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "person")
    ///             Image(systemName: "folder")
    ///             Image(systemName: "gearshape")
    ///             Image(systemName: "list.bullet")
    ///         }
    ///
    ///         HStack(spacing: 20) {
    ///             Image(systemName: "person")
    ///             Image(systemName: "folder")
    ///             Image(systemName: "gearshape")
    ///             Image(systemName: "list.bullet")
    ///         }
    ///         .symbolVariant(.fill) // Shows filled variants, when available.
    ///     }
    ///
    /// A symbol that doesn't have the specified variant remains unaffected.
    /// In the example above, the `list.bullet` symbol doesn't have a filled
    /// variant, so the `symbolVariant(_:)` modifer has no effect.
    ///
    /// ![A screenshot showing two rows of four symbols. Both rows contain a
    /// person, a folder, a gear, and a bullet list. The symbols in the first
    /// row are outlined. The symbols in the second row are filled, except the
    /// list, which is the same in both rows.](View-symbolVariant-1)
    ///
    /// If you apply the modifier more than once, its effects accumulate.
    /// Alternatively, you can apply multiple variants in one call:
    ///
    ///     Label("Airplane", systemImage: "airplane.circle.fill")
    ///
    ///     Label("Airplane", systemImage: "airplane")
    ///         .symbolVariant(.circle)
    ///         .symbolVariant(.fill)
    ///
    ///     Label("Airplane", systemImage: "airplane")
    ///         .symbolVariant(.circle.fill)
    ///
    /// All of the labels in the code above produce the same output:
    ///
    /// ![A screenshot of a label that shows an airplane in a filled circle
    /// beside the word Airplane.](View-symbolVariant-2)
    ///
    /// You can apply all these variants in any order, but
    /// if you apply more than one shape variant, the one closest to the
    /// symbol takes precedence. For example, the following image uses the
    /// ``SymbolVariants/square-swift.type.property`` shape:
    ///
    ///     Image(systemName: "arrow.left")
    ///         .symbolVariant(.square) // This shape takes precedence.
    ///         .symbolVariant(.circle)
    ///         .symbolVariant(.fill)
    ///
    /// ![A screenshot of a left arrow symbol in a filled
    /// square.](View-symbolVariant-3)
    ///
    /// To cause a symbol to ignore the variants currently in the environment,
    /// directly set the ``EnvironmentValues/symbolVariants`` environment value
    /// to ``SymbolVariants/none`` using the ``View/environment(_:_:)`` modifer.
    ///
    /// - Parameter variant: The variant to use for symbols. Use the values in
    ///   ``SymbolVariants``.
    /// - Returns: A view that applies the specified symbol variant or variants
    ///   to itself and its child views.
    public func symbolVariant(_ variant: SymbolVariants) -> some View { }

}

