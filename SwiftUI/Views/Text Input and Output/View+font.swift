@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the default font for text in this view.
    ///
    /// Use `font(_:)` to apply a specific font to all of the text in a view.
    ///
    /// The example below shows the effects of applying fonts to individual
    /// views and to view hierarchies. Font information flows down the view
    /// hierarchy as part of the environment, and remains in effect unless
    /// overridden at the level of an individual view or view container.
    ///
    /// Here, the outermost ``VStack`` applies a 16-point system font as a
    /// default font to views contained in that ``VStack``. Inside that stack,
    /// the example applies a ``Font/largeTitle`` font to just the first text
    /// view; this explicitly overrides the default. The remaining stack and the
    /// views contained with it continue to use the 16-point system font set by
    /// their containing view:
    ///
    /// ```
    /// struct FontView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("Font applied to a text view.")
    ///                 .font(.largeTitle)
    ///
    ///             VStack {
    ///                 Text("These 2 text views have the same font")
    ///                 Text("applied to their parent hierarchy")
    ///             }
    ///         }
    ///         .font(.system(size: 16, weight: .light, design: .default))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying three text views arranged in a VStack; the
    /// first directly applies large title font using the font view modifier,
    /// which overrides the smaller default 16 pt font used for the succeeding
    /// two lines.](font-modifier.png)
    ///
    /// - Parameter font: The default font to use in this view.
    ///
    /// - Returns: A view with the default font set to the value you supply.
    @inlinable public func font(_ font: Font?) -> some View { }
    
    /// Modifies the fonts of all child views to use fixed-width digits, if
    /// possible, while leaving other characters proportionally spaced.
    ///
    /// Using fixed-width digits allows you to easily align numbers of the
    /// same size in a table-like arrangement. This feature is also known as
    /// "tabular figures" or "tabular numbers."
    ///
    /// This modifier only affects numeric characters, and leaves all other
    /// characters unchanged.
    ///
    /// The following example shows the effect of `monospacedDigit()` on
    /// multiple child views. The example consists of two ``VStack`` views
    /// inside an ``HStack``. Each `VStack` contains two ``Button`` views, with
    /// the second `VStack` applying the `monospacedDigit()` modifier to its
    /// contents. As a result, the digits in the buttons in the trailing
    /// `VStack` are the same width, which in turn gives the buttons equal widths.
    ///
    ///     var body: some View {
    ///         HStack(alignment: .top) {
    ///             VStack(alignment: .leading) {
    ///                 Button("Delete 111 messages") {}
    ///                 Button("Delete 222 messages") {}
    ///             }
    ///             VStack(alignment: .leading) {
    ///                 Button("Delete 111 messages") {}
    ///                 Button("Delete 222 messages") {}
    ///             }
    ///             .monospacedDigit()
    ///         }
    ///         .padding()
    ///         .navigationTitle("monospacedDigit() Child Views")
    ///     }
    ///
    /// ![A macOS window showing four buttons, arranged in two columns. Each
    /// column's buttons contain the same text: Delete 111 messages and Delete
    /// 222 messages. The right column's buttons have fixed width, or
    /// monospaced, digits, which make the 1 characters wider than they would be
    /// in a proportional font. Because the 1 and 2 characters are the same
    /// width in the right column, the buttons are the same
    /// width.](View-monospacedDigit-1)
    ///
    /// If a child view's base font doesn't support fixed-width digits, the font
    /// remains unchanged.
    ///
    /// - Returns: A view whose child views' fonts use fixed-width numeric
    /// characters, while leaving other characters proportionally spaced.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public func monospacedDigit() -> some View { }

    /// Modifies the fonts of all child views to use the fixed-width variant of
    /// the current font, if possible.
    ///
    /// If a child view's base font doesn't support fixed-width, the font
    /// remains unchanged.
    ///
    /// - Returns: A view whose child views' fonts use fixed-width characters,
    /// while leaving other characters proportionally spaced.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func monospaced(_ isActive: Bool = true) -> some View { }


    /// Sets the font weight of the text in this view.
    ///
    /// - Parameter weight: One of the available font weights.
    ///   Providing `nil` removes the effect of any font weight
    ///   modifier applied higher in the view hierarchy.
    ///
    /// - Returns: A view that uses the font weight you specify.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func fontWeight(_ weight: Font.Weight?) -> some View { }


    /// Sets the font width of the text in this view.
    ///
    /// - Parameter width: One of the available font widths.
    ///   Providing `nil` removes the effect of any font width
    ///   modifier applied higher in the view hierarchy.
    ///
    /// - Returns: A view that uses the font width you specify.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func fontWidth(_ width: Font.Width?) -> some View { }


    /// Applies a bold font weight to the text in this view.
    ///
    /// - Parameter isActive: A Boolean value that indicates
    ///   whether bold font styling is added. The default value is `true`.
    ///
    /// - Returns: A view with bold text.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func bold(_ isActive: Bool = true) -> some View { }


    /// Applies italics to the text in this view.
    ///
    /// - Parameter isActive: A Boolean value that indicates
    ///   whether italic styling is added. The default value is `true`.
    ///
    /// - Returns: A View with italic text.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func italic(_ isActive: Bool = true) -> some View { }


    /// Sets the font design of the text in this view.
    ///
    /// - Parameter design: One of the available font designs.
    ///   Providing `nil` removes the effect of any font design
    ///   modifier applied higher in the view hierarchy.
    ///
    /// - Returns: A view that uses the font design you specify.
    @available(iOS 16.1, macOS 13.0, tvOS 16.1, watchOS 9.1, *)
    public func fontDesign(_ design: Font.Design?) -> some View { }


    /// Sets the spacing, or kerning, between characters for the text in this view.
    ///
    /// - Parameter kerning: The spacing to use between individual characters in text.
    ///   Value of `0` sets the kerning to the system default value.
    ///
    /// - Returns: A view where text has the specified amount of kerning.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func kerning(_ kerning: CGFloat) -> some View { }


    /// Sets the tracking for the text in this view.
    ///
    /// - Parameter tracking: The amount of additional space, in points, that
    ///   the view should add to each character cluster after layout. Value of `0`
    ///   sets the tracking to the system default value.
    ///
    /// - Returns: A view where text has the specified amount of tracking.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func tracking(_ tracking: CGFloat) -> some View { }


    /// Sets the vertical offset for the text relative to its baseline
    /// in this view.
    ///
    /// - Parameter baselineOffset: The amount to shift the text
    ///   vertically (up or down) relative to its baseline.
    ///
    /// - Returns: A view where text is above or below its baseline.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func baselineOffset(_ baselineOffset: CGFloat) -> some View { }

}

