/// A font.
///
/// This structure defines a ``Font`` in SwiftUI. ``Font`` offers shorthands
/// for varying styles of the system font via static properties, such as
/// `Font.body` or `Font.title`.  ``Font`` also includes many modifiers,
/// including ways to compare & modify fonts.
///
/// Fonts can be applied to your view with the ``View/font(_:)`` modifier.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Text("Banana🍌🍌")
///             .font(.largeTitle)
///     }
/// }
/// ```
///
/// ![A view displaying the text "Banana🍌🍌" in large title font.](D0E11E53-F994-4D76-BEE9-FB617380BEB1.png)
///
/// In addition to standard system font types like ``Font/TextStyle/largeTitle``
/// and ``Font/body``, you can customize the size, weight and design of your
/// `Font` with the ``Font/system(size:weight:design:)`` modifier.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Text("Banana🍌🍌")
///             .font(.system(size: 32.0, weight: .bold, design: .rounded))
///     }
/// }
/// ```
///
/// ![A view displaying the text "Banana🍌🍌" in bolded, rounded, 32 point font.](0C3CED07-2FD4-40E5-904D-8D1CD833E1F6.png)
///
/// Non system-fonts can be applied using ``Font/custom(_:size:)``
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Text("Banana🍌🍌")
///             .font(Font.custom("American Typewriter", size: 32.0))
///     }
/// }
/// ```
///
/// ![A view displaying the text "Banana🍌🍌" in the non-system font "American Typewriter."](E683BBEB-8DE2-412D-9A3F-BB3C7E658764.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Font : Hashable { }

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {

    /// A font with the large title text style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    public static let largeTitle: Font

    /// A font with the title text style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    public static let title: Font

    /// Create a font for second level hierarchical headings.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static let title2: Font

    /// Create a font for third level hierarchical headings.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static let title3: Font

    /// A font with the headline text style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    public static let headline: Font

    /// A font with the subheadline text style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    public static let subheadline: Font

    /// A font with the body text style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    public static let body: Font

    /// A font with the callout text style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    public static let callout: Font

    /// A font with the footnote text style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    public static let footnote: Font

    /// A font with the caption text style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    public static let caption: Font

    /// Create a font with the alternate caption text style.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("LargeTitle 🍌🍌")
    ///                 .font(.largeTitle)
    ///             Text("Title 🍌🍌")
    ///                 .font(.title)
    ///             Text("Title2 🍌🍌")
    ///                 .font(.title2)
    ///             Text("Title3 🍌🍌")
    ///                 .font(.title3)
    ///             Text("Headline 🍌🍌")
    ///                 .font(.headline)
    ///             Text("Subheadline 🍌🍌")
    ///                 .font(.subheadline)
    ///         }
    ///         Group {
    ///             Text("Body 🍌🍌")
    ///                 .font(.body)
    ///             Text("Callout 🍌🍌")
    ///                 .font(.callout)
    ///             Text("Caption 🍌🍌")
    ///                 .font(.caption)
    ///             Text("Caption2 🍌🍌")
    ///                 .font(.caption2)
    ///             Text("Footnote 🍌🍌")
    ///                 .font(.footnote)
    ///
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied to the font;
    /// the text item for each example reads "_ 🍌🍌" where the blank is the name of
    /// the applied text style.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/font-types.png)
    ///
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static let caption2: Font

    /// Gets a system font with the given style and design.
    ///
    /// Font's `system(_:design:)` is an easy way to modify standard fonts.
    ///
    /// For example, basic usage would be:
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Text("Bananas 🍌🍌")
    ///                 .font(Font.system(.title))
    ///         }
    ///     }
    ///
    /// ![A view containing the text view "Bananas 🍌🍌" in the system font
    /// style title.](22.54.51.png)
    ///
    /// Your app can easily modify the system font by providing an alternate `design`. For example:
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             Text("Bananas 🍌🍌")
    ///                 .font(Font.system(.title, design: .monospaced))
    ///         }
    ///     }
    ///
    /// ![A view containing the text view "Bananas 🍌🍌" in the system font
    /// style title and with monospaced design, which creates smnall gaps
    /// between the letters of the word.](22.55.10.png)
    ///
    /// - Parameters:
    ///   - style: The ``Font/TextStyle`` of the font.
    ///   - design: The ``Font/Design`` of the font.
    public static func system(_ style: Font.TextStyle, design: Font.Design = .default) -> Font { }

    /// A dynamic text style to use for fonts.
    ///
    /// There are 11 font styles that SwiftUI provides
    ///
    /// - ``font/textstyle/largetitle``
    /// - ``font/textstyle/title``
    /// -  ``font/textstyle/title2``
    /// - ``font/textstyle/title3``
    /// - ``font/textstyle/headline``
    /// - ``font/textstyle/subheadline``
    /// - ``font/textstyle/body``
    /// - ``font/textstyle/callout``
    /// - ``font/textstyle/footnote``
    /// - ``font/textstyle/caption``
    /// - ``font/textstyle/caption2``
    ///
    /// ```
    /// struct TextStyleView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("Large Title")
    ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
    ///             Text("Title")
    ///                 .font(.system(Font.TextStyle.title, design: .rounded))
    ///             Text("Title 2")
    ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
    ///             Text("Title 3")
    ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
    ///             Text("Headline")
    ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
    ///             Text("SubHeadline")
    ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
    ///         }
    ///         Group {
    ///             Text("Body")
    ///                 .font(.system(Font.TextStyle.body, design: .rounded))
    ///             Text("Callout")
    ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
    ///             Text("Footnote")
    ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
    ///             Text("Caption")
    ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
    ///             Text("Caption2")
    ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with two groups, one containing text views with the text
    /// styles largeTitle, title, title, title2, title3, headline, and subheadline
    /// applied to the font, and the other containing text views with the text
    /// styles body, callout, caption, caption2, and footnote applied through
    /// a custom system font with rounded design; the text item for each example reads as the
    /// applied text styles name.](text-style-example.png)
    ///
    public enum TextStyle : CaseIterable {

        /// The font style for large titles.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        case largeTitle

        /// The font used for first level hierarchical headings.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        case title

        /// The font used for second level hierarchical headings.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        case title2

        /// The font used for third level hierarchical headings.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        case title3

        /// The font used for headings.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        case headline

        /// The font used for subheadings.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        case subheadline

        /// The font used for body text.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        case body

        /// The font used for callouts.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        case callout

        /// The font used in footnotes.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        case footnote

        /// The font used for standard captions.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        case caption

        /// The font used for alternate captions.
        ///
        /// ```
        /// struct TextStyleView: View {
        ///     var body: some View {
        ///         Group {
        ///             Text("Large Title")
        ///                 .font(.system(Font.TextStyle.largeTitle, design: .rounded))
        ///             Text("Title")
        ///                 .font(.system(Font.TextStyle.title, design: .rounded))
        ///             Text("Title 2")
        ///                 .font(.system(Font.TextStyle.title2, design: .rounded))
        ///             Text("Title 3")
        ///                 .font(.system(Font.TextStyle.title3, design: .rounded))
        ///             Text("Headline")
        ///                 .font(.system(Font.TextStyle.headline, design: .rounded))
        ///             Text("SubHeadline")
        ///                 .font(.system(Font.TextStyle.subheadline, design: .rounded))
        ///         }
        ///         Group {
        ///             Text("Body")
        ///                 .font(.system(Font.TextStyle.body, design: .rounded))
        ///             Text("Callout")
        ///                 .font(.system(Font.TextStyle.callout, design: .rounded))
        ///             Text("Footnote")
        ///                 .font(.system(Font.TextStyle.caption, design: .rounded))
        ///             Text("Caption")
        ///                 .font(.system(Font.TextStyle.caption2, design: .rounded))
        ///             Text("Caption2")
        ///                 .font(.system(Font.TextStyle.footnote, design: .rounded))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view with two groups, one containing text views with the text
        /// styles largeTitle, title, title, title2, title3, headline, and subheadline
        /// applied to the font, and the other containing text views with the text
        /// styles body, callout, caption, caption2, and footnote applied through
        /// a custom system font with rounded design; the text item for each example reads as the
        /// applied text styles name.](text-style-example.png)
        ///
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        case caption2

    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {

    /// Adds italics to the font.
    ///
    /// Use this modifier to add *italic* styling to a ``Font``.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("I'm italicized text")
    ///                 .font(Font.system(size: 36).italic())
    ///             Text("And I'm bold")
    ///                 .font(Font.system(size: 36).bold())
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying two text lines in a VStack: "I'm italicized text"
    /// in italic text font and "And I'm bold" in bold text font.](font-bold-italic.png)
    ///
    /// There is a related ``Text`` modifier called ``Text/italic()`` that
    /// gets applied directly to the text view:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("We are the same 👯‍")
    ///                 .font(Font.system(size: 24).italic())
    ///             Text("We are the same 👯‍")
    ///                 .font(Font.system(size: 24))
    ///                 .italic()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying two italicized text lines in a VStack both reading
    /// "We are the same 👯‍," one using the italic property and one using the
    /// Font modifier called italic().](font-text-italic.png)
    ///
    public func italic() -> Font { }

    /// Adjusts the font to enable all small capitals.
    ///
    /// See ``Font/lowercaseSmallCaps()`` and ``Font/uppercaseSmallCaps()`` for
    /// more details.
    ///
    /// ```
    /// struct FontView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("My Text Is Small Caps")
    ///                 .font(Font.system(size: 20).smallCaps())
    ///             Text("Mine's Lowercase Small Caps")
    ///                 .font(Font.system(size: 20).lowercaseSmallCaps())
    ///             Text("And Mine's Uppercase Small Caps")
    ///                 .font(Font.system(size: 20).uppercaseSmallCaps())
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with three text views, "My Text Is Small
    /// Caps" in all small capitals, "Mine's Lowercase Small Caps" in lowercase
    /// small capitals, and "And Mine's Uppercase Small Caps" in uppercase small
    /// capitals, as defined in the system font.](font-smallcaps.png)
    ///
    public func smallCaps() -> Font { }

    /// Adjusts the font to enable lowercase small capitals.
    ///
    /// This function turns lowercase characters into small capitals for the
    /// font. It is generally used for display lines set in large and small
    /// caps, such as titles. It may include forms related to small capitals,
    /// such as old-style figures.
    ///
    /// ```
    /// struct FontView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("My Text Is Small Caps")
    ///                 .font(Font.system(size: 20).smallCaps())
    ///             Text("Mine's Lowercase Small Caps")
    ///                 .font(Font.system(size: 20).lowercaseSmallCaps())
    ///             Text("And Mine's Uppercase Small Caps")
    ///                 .font(Font.system(size: 20).uppercaseSmallCaps())
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with three text views, "My Text Is Small
    /// Caps" in all small capitals, "Mine's Lowercase Small Caps" in lowercase
    /// small capitals, and "And Mine's Uppercase Small Caps" in uppercase small
    /// capitals, as defined in the system font.](font-smallcaps.png)
    ///
    public func lowercaseSmallCaps() -> Font { }

    /// Adjusts the font to enable uppercase small capitals.
    ///
    /// This feature turns capital characters into small capitals. It is
    /// generally used for words which would otherwise be set in all caps, such
    /// as acronyms, but which are desired in small-cap form to avoid disrupting
    /// the flow of text.
    ///
    /// ```
    /// struct FontView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("My Text Is Small Caps")
    ///                 .font(Font.system(size: 20).smallCaps())
    ///             Text("Mine's Lowercase Small Caps")
    ///                 .font(Font.system(size: 20).lowercaseSmallCaps())
    ///             Text("And Mine's Uppercase Small Caps")
    ///                 .font(Font.system(size: 20).uppercaseSmallCaps())
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with three text views, "My Text Is Small
    /// Caps" in all small capitals, "Mine's Lowercase Small Caps" in lowercase
    /// small capitals, and "And Mine's Uppercase Small Caps" in uppercase small
    /// capitals, as defined in the system font.](font-smallcaps.png)
    ///
    public func uppercaseSmallCaps() -> Font { }

    /// Adjusts the font to use monospace digits.
    ///
    /// For example, to adjust a ``Text`` to use monospaced digits:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State private var toggleStatus: Bool = false
    ///
    ///     var body: some View {
    ///         Text("Some monospaced digits: 0123456789")
    ///             .font(Font.system(size: 15).monospacedDigit())
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing the text "Some monospaced digits: 0123456789" with
    /// the monospaced system font, which ensuring a fixed width for each digit.](monospaced-digit-example-1.png)
    ///
    /// Note that this does not actually update the font to use the `.monospace` design.
    /// Rather, it updates digits to have a "fixed" width. For an example of the difference
    /// between a normal proportional font and a monospaced font on digits see:
    ///
    /// Proportional font:
    /// !["0123456789" with proportional font spacing.](monospaced-digit-proportional-font.png)
    ///
    /// Monospaced font:
    ///
    /// !["0123456789" with monospacing.](monospaced-digit-mono-font.png)
    ///
    ///
    /// [Image credits to Lior Azi](https://blog.usejournal.com/proportional-vs-monospaced-numbers-when-to-use-which-one-in-order-to-avoid-wiggling-labels-e31b1c83e4d0)
    public func monospacedDigit() -> Font { }

    /// Sets the weight of the font.
    ///
    /// Use this function to change the weight of a ``Font`` object.
    ///
    /// Alternatively, you can change the weight of a ``Text`` view
    /// directly by using the
    /// ``Text/fontWeight(_:)``
    ///
    /// See ``Font/Weight`` for the different possible of weights.
    ///
    /// ```
    /// struct FontView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("This is black text")
    ///                 .font(Font.system(size: 20).weight(.black))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a Vstack with the text "This is black text" set to
    /// black weight by the system font modifier.](23.06.26.png)
    ///
    public func weight(_ weight: Font.Weight) -> Font { }

    /// Adds bold styling to the font.
    ///
    /// Use this modifier to add **bold** styling to a ``Font``.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("I'm italicized text")
    ///                 .font(Font.system(size: 36).italic())
    ///             Text("And I'm bold")
    ///                 .font(Font.system(size: 36).bold())
    ///         }
    ///         .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying two text lines in a VStack: "I'm italicized text"
    /// in italic text font and "And I'm bold" in bold text font.](font-bold-italic.png)
    ///
    /// This is slightly different than using the ``Font`` modifier ``Font/weight(_:)``
    /// and passing the ``Font/Weight/bold`` property. See the difference:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("I use the `.bold()` modifier")
    ///                 .font(Font.system(size: 24).bold())
    ///             Text("I use the `.bold` property")
    ///                 .font(Font.system(size: 24).weight(.bold))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying two text lines in a VStack: "I use the `.bold()`
    /// modifier", bolded using the .bold() modifier, and "I use the `.bold`
    /// property" bolded using the .bold property.](font-bold-comparison.png)
    ///
    /// There is a related ``Text`` modifier called ``Text/bold()`` that
    /// gets applied directly to the text view:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("We are the same 👯‍")
    ///                 .font(Font.system(size: 24).bold())
    ///             Text("We are the same 👯‍")
    ///                 .font(Font.system(size: 24))
    ///                 .bold()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying two bolded text lines in a VStack both reading
    /// "We are the same 👯‍," one using the bold property and one using the
    /// Font modifier called bold().](font-bold-twins.png)
    ///
    public func bold() -> Font { }

    /// Create a version of `self` that uses leading (line spacing) adjustment.
    ///
    /// Use this modifier to change the spacing between lines in a ``Text``
    /// view. See ``Font.Leading`` for the options.
    ///
    /// ```
    /// struct LeadingView: View {
    ///     var body: some View {
    ///         HStack(alignment: .top) {
    ///             Text("This is loose text that keeps going onto many lines to illustrate leading.")
    ///                 .font(Font.body.leading(.loose))
    ///             Text("This is standard text that keeps going onto many lines to illustrate leading.")
    ///                 .font(Font.body.leading(.standard))
    ///             Text("This is tight text that keeps going onto many lines to illustrate leading.")
    ///                 .font(Font.body.leading(.tight))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing an HStack with three text views, "This is loose text
    /// that keeps going onto many lines to illustrate leading." with loose
    /// leading / line spacing, "This is standard text that keeps going onto
    /// many lines to illustrate leading." with standard leading / line spacing,
    /// and "This is tight text that keeps going onto many lines to illustrate
    /// leading." with tight leading / line spacing.](font-leading.png)
    ///
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public func leading(_ leading: Font.Leading) -> Font { }

    /// A weight to use for fonts.
    ///
    /// Use this structure to change the font weight of some onscreen
    /// text. It has 9 static members:
    ///
    /// 1. ``Weight/ultraLight``
    /// 2. ``Weight/thin``
    /// 3. ``Weight/light``
    /// 4. ``Weight/regular``
    /// 5. ``Weight/medium``
    /// 6. ``Weight/semibold``
    /// 7. ``Weight/bold``
    /// 8. ``Weight/heavy``
    /// 9. ``Weight/black``
    ///
    ///     struct ExampleView: View {
    ///         var body: some View {
    ///             VStack {
    ///                 Text("ultraLight 🍌")
    ///                     .fontWeight(Font.Weight.ultraLight)
    ///                 Text("thin🍌")
    ///                     .fontWeight(Font.Weight.thin)
    ///                 Text("light🍌")
    ///                     .fontWeight(Font.Weight.light)
    ///                 Text("regular🍌")
    ///                     .fontWeight(Font.Weight.regular)
    ///                 Text("medium🍌")
    ///                     .fontWeight(Font.Weight.medium)
    ///                 Text("semibold🍌")
    ///                     .fontWeight(Font.Weight.semibold)
    ///                 Text("bold🍌")
    ///                     .fontWeight(Font.Weight.bold)
    ///                 Text("heavy🍌")
    ///                     .fontWeight(Font.Weight.heavy)
    ///                 Text("black🍌")
    ///                     .fontWeight(Font.Weight.black)
    ///             }
    ///             .font(.title)
    ///         }
    ///     }
    ///
    /// ![A view with a VStack containing 9 text items, each with a different
    /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
    /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
    /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
    @frozen public struct Weight : Hashable {

        /// A font weight of ultra light.
        ///
        ///     struct ExampleView: View {
        ///         var body: some View {
        ///             VStack {
        ///                 Text("ultraLight 🍌")
        ///                     .fontWeight(Font.Weight.ultraLight)
        ///                 Text("thin🍌")
        ///                     .fontWeight(Font.Weight.thin)
        ///                 Text("light🍌")
        ///                     .fontWeight(Font.Weight.light)
        ///                 Text("regular🍌")
        ///                     .fontWeight(Font.Weight.regular)
        ///                 Text("medium🍌")
        ///                     .fontWeight(Font.Weight.medium)
        ///                 Text("semibold🍌")
        ///                     .fontWeight(Font.Weight.semibold)
        ///                 Text("bold🍌")
        ///                     .fontWeight(Font.Weight.bold)
        ///                 Text("heavy🍌")
        ///                     .fontWeight(Font.Weight.heavy)
        ///                 Text("black🍌")
        ///                     .fontWeight(Font.Weight.black)
        ///             }
        ///             .font(.title)
        ///         }
        ///     }
        ///
        /// ![A view with a VStack containing 9 text items, each with a different
        /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
        /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
        /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
        ///
        public static let ultraLight: Font.Weight

        /// A font weight of thin.
        ///
        ///     struct ExampleView: View {
        ///         var body: some View {
        ///             VStack {
        ///                 Text("ultraLight 🍌")
        ///                     .fontWeight(Font.Weight.ultraLight)
        ///                 Text("thin🍌")
        ///                     .fontWeight(Font.Weight.thin)
        ///                 Text("light🍌")
        ///                     .fontWeight(Font.Weight.light)
        ///                 Text("regular🍌")
        ///                     .fontWeight(Font.Weight.regular)
        ///                 Text("medium🍌")
        ///                     .fontWeight(Font.Weight.medium)
        ///                 Text("semibold🍌")
        ///                     .fontWeight(Font.Weight.semibold)
        ///                 Text("bold🍌")
        ///                     .fontWeight(Font.Weight.bold)
        ///                 Text("heavy🍌")
        ///                     .fontWeight(Font.Weight.heavy)
        ///                 Text("black🍌")
        ///                     .fontWeight(Font.Weight.black)
        ///             }
        ///             .font(.title)
        ///         }
        ///     }
        ///
        /// ![A view with a VStack containing 9 text items, each with a different
        /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
        /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
        /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
        public static let thin: Font.Weight

        /// A font weight of light.
        ///
        ///     struct ExampleView: View {
        ///         var body: some View {
        ///             VStack {
        ///                 Text("ultraLight 🍌")
        ///                     .fontWeight(Font.Weight.ultraLight)
        ///                 Text("thin🍌")
        ///                     .fontWeight(Font.Weight.thin)
        ///                 Text("light🍌")
        ///                     .fontWeight(Font.Weight.light)
        ///                 Text("regular🍌")
        ///                     .fontWeight(Font.Weight.regular)
        ///                 Text("medium🍌")
        ///                     .fontWeight(Font.Weight.medium)
        ///                 Text("semibold🍌")
        ///                     .fontWeight(Font.Weight.semibold)
        ///                 Text("bold🍌")
        ///                     .fontWeight(Font.Weight.bold)
        ///                 Text("heavy🍌")
        ///                     .fontWeight(Font.Weight.heavy)
        ///                 Text("black🍌")
        ///                     .fontWeight(Font.Weight.black)
        ///             }
        ///             .font(.title)
        ///         }
        ///     }
        ///
        /// ![A view with a VStack containing 9 text items, each with a different
        /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
        /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
        /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
        public static let light: Font.Weight

        /// A font weight of regular.
        ///
        ///     struct ExampleView: View {
        ///         var body: some View {
        ///             VStack {
        ///                 Text("ultraLight 🍌")
        ///                     .fontWeight(Font.Weight.ultraLight)
        ///                 Text("thin🍌")
        ///                     .fontWeight(Font.Weight.thin)
        ///                 Text("light🍌")
        ///                     .fontWeight(Font.Weight.light)
        ///                 Text("regular🍌")
        ///                     .fontWeight(Font.Weight.regular)
        ///                 Text("medium🍌")
        ///                     .fontWeight(Font.Weight.medium)
        ///                 Text("semibold🍌")
        ///                     .fontWeight(Font.Weight.semibold)
        ///                 Text("bold🍌")
        ///                     .fontWeight(Font.Weight.bold)
        ///                 Text("heavy🍌")
        ///                     .fontWeight(Font.Weight.heavy)
        ///                 Text("black🍌")
        ///                     .fontWeight(Font.Weight.black)
        ///             }
        ///             .font(.title)
        ///         }
        ///     }
        ///
        /// ![A view with a VStack containing 9 text items, each with a different
        /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
        /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
        /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
        public static let regular: Font.Weight

        /// A font weight of medium.
        ///
        ///     struct ExampleView: View {
        ///         var body: some View {
        ///             VStack {
        ///                 Text("ultraLight 🍌")
        ///                     .fontWeight(Font.Weight.ultraLight)
        ///                 Text("thin🍌")
        ///                     .fontWeight(Font.Weight.thin)
        ///                 Text("light🍌")
        ///                     .fontWeight(Font.Weight.light)
        ///                 Text("regular🍌")
        ///                     .fontWeight(Font.Weight.regular)
        ///                 Text("medium🍌")
        ///                     .fontWeight(Font.Weight.medium)
        ///                 Text("semibold🍌")
        ///                     .fontWeight(Font.Weight.semibold)
        ///                 Text("bold🍌")
        ///                     .fontWeight(Font.Weight.bold)
        ///                 Text("heavy🍌")
        ///                     .fontWeight(Font.Weight.heavy)
        ///                 Text("black🍌")
        ///                     .fontWeight(Font.Weight.black)
        ///             }
        ///             .font(.title)
        ///         }
        ///     }
        ///
        /// ![A view with a VStack containing 9 text items, each with a different
        /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
        /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
        /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
        public static let medium: Font.Weight

        /// A font weight of semibold.
        ///
        ///     struct ExampleView: View {
        ///         var body: some View {
        ///             VStack {
        ///                 Text("ultraLight 🍌")
        ///                     .fontWeight(Font.Weight.ultraLight)
        ///                 Text("thin🍌")
        ///                     .fontWeight(Font.Weight.thin)
        ///                 Text("light🍌")
        ///                     .fontWeight(Font.Weight.light)
        ///                 Text("regular🍌")
        ///                     .fontWeight(Font.Weight.regular)
        ///                 Text("medium🍌")
        ///                     .fontWeight(Font.Weight.medium)
        ///                 Text("semibold🍌")
        ///                     .fontWeight(Font.Weight.semibold)
        ///                 Text("bold🍌")
        ///                     .fontWeight(Font.Weight.bold)
        ///                 Text("heavy🍌")
        ///                     .fontWeight(Font.Weight.heavy)
        ///                 Text("black🍌")
        ///                     .fontWeight(Font.Weight.black)
        ///             }
        ///             .font(.title)
        ///         }
        ///     }
        ///
        /// ![A view with a VStack containing 9 text items, each with a different
        /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
        /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
        /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.c](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
        public static let semibold: Font.Weight

        /// A font weight of bold.
        ///
        ///     struct ExampleView: View {
        ///         var body: some View {
        ///             VStack {
        ///                 Text("ultraLight 🍌")
        ///                     .fontWeight(Font.Weight.ultraLight)
        ///                 Text("thin🍌")
        ///                     .fontWeight(Font.Weight.thin)
        ///                 Text("light🍌")
        ///                     .fontWeight(Font.Weight.light)
        ///                 Text("regular🍌")
        ///                     .fontWeight(Font.Weight.regular)
        ///                 Text("medium🍌")
        ///                     .fontWeight(Font.Weight.medium)
        ///                 Text("semibold🍌")
        ///                     .fontWeight(Font.Weight.semibold)
        ///                 Text("bold🍌")
        ///                     .fontWeight(Font.Weight.bold)
        ///                 Text("heavy🍌")
        ///                     .fontWeight(Font.Weight.heavy)
        ///                 Text("black🍌")
        ///                     .fontWeight(Font.Weight.black)
        ///             }
        ///             .font(.title)
        ///         }
        ///     }
        ///
        /// ![A view with a VStack containing 9 text items, each with a different
        /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
        /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
        /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
        public static let bold: Font.Weight

        /// A font weight of heavy.
        ///
        ///     struct ExampleView: View {
        ///         var body: some View {
        ///             VStack {
        ///                 Text("ultraLight 🍌")
        ///                     .fontWeight(Font.Weight.ultraLight)
        ///                 Text("thin🍌")
        ///                     .fontWeight(Font.Weight.thin)
        ///                 Text("light🍌")
        ///                     .fontWeight(Font.Weight.light)
        ///                 Text("regular🍌")
        ///                     .fontWeight(Font.Weight.regular)
        ///                 Text("medium🍌")
        ///                     .fontWeight(Font.Weight.medium)
        ///                 Text("semibold🍌")
        ///                     .fontWeight(Font.Weight.semibold)
        ///                 Text("bold🍌")
        ///                     .fontWeight(Font.Weight.bold)
        ///                 Text("heavy🍌")
        ///                     .fontWeight(Font.Weight.heavy)
        ///                 Text("black🍌")
        ///                     .fontWeight(Font.Weight.black)
        ///             }
        ///             .font(.title)
        ///         }
        ///     }
        ///
        /// ![A view with a VStack containing 9 text items, each with a different
        /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
        /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
        /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
        public static let heavy: Font.Weight

        /// A font weight of black.
        ///
        ///     struct ExampleView: View {
        ///         var body: some View {
        ///             VStack {
        ///                 Text("ultraLight 🍌")
        ///                     .fontWeight(Font.Weight.ultraLight)
        ///                 Text("thin🍌")
        ///                     .fontWeight(Font.Weight.thin)
        ///                 Text("light🍌")
        ///                     .fontWeight(Font.Weight.light)
        ///                 Text("regular🍌")
        ///                     .fontWeight(Font.Weight.regular)
        ///                 Text("medium🍌")
        ///                     .fontWeight(Font.Weight.medium)
        ///                 Text("semibold🍌")
        ///                     .fontWeight(Font.Weight.semibold)
        ///                 Text("bold🍌")
        ///                     .fontWeight(Font.Weight.bold)
        ///                 Text("heavy🍌")
        ///                     .fontWeight(Font.Weight.heavy)
        ///                 Text("black🍌")
        ///                     .fontWeight(Font.Weight.black)
        ///             }
        ///             .font(.title)
        ///         }
        ///     }
        ///
        /// ![A view with a VStack containing 9 text items, each with a different
        /// font weight; "ultraLight 🍌" in ultraLight, "thin🍌" in thin, "light🍌"
        /// in light, "regular🍌" in regular, "medium🍌" in medium, "semibold🍌" in semibold,
        /// "bold🍌" in bold, "heavy🍌" in heavy, and "black🍌" in black.](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/text-fontWeight-example-1.png)
        public static let black: Font.Weight

    }

    /// The different types of line spacing.
    ///
    /// Use this enumeration with the ``Font/leading(_:)`` modifier to
    /// change the spacing between lines in a ``Text`` view.
    ///
    /// ```
    /// struct LeadingView: View {
    ///     var body: some View {
    ///         HStack(alignment: .top) {
    ///             Text("This is loose text that keeps going onto many lines to illustrate leading.")
    ///                 .font(Font.body.leading(.loose))
    ///             Text("This is standard text that keeps going onto many lines to illustrate leading.")
    ///                 .font(Font.body.leading(.standard))
    ///             Text("This is tight text that keeps going onto many lines to illustrate leading.")
    ///                 .font(Font.body.leading(.tight))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing an HStack with three text views, "This is loose text
    /// that keeps going onto many lines to illustrate leading." with loose
    /// leading / line spacing, "This is standard text that keeps going onto
    /// many lines to illustrate leading." with standard leading / line spacing,
    /// and "This is tight text that keeps going onto many lines to illustrate
    /// leading." with tight leading / line spacing.](font-leading.png)
    ///
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public enum Leading {

        /// Normal, medium line spacing.
        ///
        /// Use this enumeration case with the ``Font/leading(_:)`` modifier to
        /// specify normal spacing between lines in a ``Text`` view.
        ///
        /// This is the default line spacing.
        ///
        /// ```
        /// struct LeadingView: View {
        ///     var body: some View {
        ///         HStack(alignment: .top) {
        ///             Text("This is loose text that keeps going onto many lines to illustrate leading.")
        ///                 .font(Font.body.leading(.loose))
        ///             Text("This is standard text that keeps going onto many lines to illustrate leading.")
        ///                 .font(Font.body.leading(.standard))
        ///             Text("This is tight text that keeps going onto many lines to illustrate leading.")
        ///                 .font(Font.body.leading(.tight))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing an HStack with three text views, "This is loose text
        /// that keeps going onto many lines to illustrate leading." with loose
        /// leading / line spacing, "This is standard text that keeps going onto
        /// many lines to illustrate leading." with standard leading / line spacing,
        /// and "This is tight text that keeps going onto many lines to illustrate
        /// leading." with tight leading / line spacing.](font-leading.png)
        ///
        case standard

        /// Tight, small line spacing.
        ///
        /// Use this enumeration case with the ``Font/leading(_:)`` modifier to
        /// specify tight spacing between lines in a ``Text`` view.
        ///
        /// ```
        /// struct LeadingView: View {
        ///     var body: some View {
        ///         HStack(alignment: .top) {
        ///             Text("This is loose text that keeps going onto many lines to illustrate leading.")
        ///                 .font(Font.body.leading(.loose))
        ///             Text("This is standard text that keeps going onto many lines to illustrate leading.")
        ///                 .font(Font.body.leading(.standard))
        ///             Text("This is tight text that keeps going onto many lines to illustrate leading.")
        ///                 .font(Font.body.leading(.tight))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing an HStack with three text views, "This is loose text
        /// that keeps going onto many lines to illustrate leading." with loose
        /// leading / line spacing, "This is standard text that keeps going onto
        /// many lines to illustrate leading." with standard leading / line spacing,
        /// and "This is tight text that keeps going onto many lines to illustrate
        /// leading." with tight leading / line spacing.](font-leading.png)
        ///
        case tight

        /// Loose, large line spacing.
        ///
        /// Use this enumeration case with the ``Font/leading(_:)`` modifier to
        /// specify tight spacing between lines in a ``Text`` view.
        ///
        /// ```
        /// struct LeadingView: View {
        ///     var body: some View {
        ///         HStack(alignment: .top) {
        ///             Text("This is loose text that keeps going onto many lines to illustrate leading.")
        ///                 .font(Font.body.leading(.loose))
        ///             Text("This is standard text that keeps going onto many lines to illustrate leading.")
        ///                 .font(Font.body.leading(.standard))
        ///             Text("This is tight text that keeps going onto many lines to illustrate leading.")
        ///                 .font(Font.body.leading(.tight))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing an HStack with three text views, "This is loose text
        /// that keeps going onto many lines to illustrate leading." with loose
        /// leading / line spacing, "This is standard text that keeps going onto
        /// many lines to illustrate leading." with standard leading / line spacing,
        /// and "This is tight text that keeps going onto many lines to illustrate
        /// leading." with tight leading / line spacing.](font-leading.png)
        ///
        case loose
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {

    /// Specifies a system font to use, along with the style, weight, and any
    /// design parameters you want applied to the text.
    ///
    /// Use this function to create a system font by specifying the size and
    /// weight, and a type design together. The following styles the system font
    /// as 48 point, ``Font/Weight/semibold`` text:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("Hello")
    ///             .font(.system(size: 48, weight: .semibold))
    ///     }
    /// }
    /// ```
    ///
    /// ![A text view reading "Hello" where the system font has been styled with
    /// a 48 point size and semibold weight.](font-system-1.png)
    ///
    /// The following styles the text as 48 point
    /// and applies a `serif` ``Font/Design`` to the system font:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("Hello")
    ///             .font(.system(size: 48, weight: .semibold, design: .serif))
    ///     }
    /// }
    /// ```
    ///
    /// ![A text view reading "Hello" where the system font has been styled with
    /// a 48 point size, semibold weight, and the serif design.](font-system-2.png)
    ///
    /// If you want to use the default ``Font/Weight``
    /// (``Font/Weight/regular``), you don't need to specify the `weight` in the
    /// method. The following example styles the text as 48 point
    /// ``Font/Weight/regular``, and uses a ``Font/Design/rounded`` system font:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("Hello")
    ///             .font(.system(size: 48, design: .rounded))
    ///     }
    /// }
    /// ```
    ///
    /// ![A text view reading "Hello" where the system font has been styled with
    /// a 48 point size and the rounded design.](font-system-3.png)
    ///
    /// Interestingly, this function works well with
    /// [SF Symbols](https://developer.apple.com/sf-symbols/)
    /// as well:
    ///
    /// ```
    /// struct ContentView: View {
    ///     let image = Image(systemName: "pencil")
    ///
    ///     var body: some View {
    ///         VStack {
    ///             image
    ///                 .font(.system(size: 30, weight: .ultraLight))
    ///             image
    ///                 .font(.system(size: 30, weight: .black))
    ///             image
    ///                 .font(.system(size: 100, weight: .ultraLight))
    ///             image
    ///                 .font(.system(size: 100, weight: .black))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view with a VStack containing four of the same SF symbol / image
    /// styled in different ways: the first with a system font of size 30 and
    /// ultraLight weight, the second with a system font of size 20 and black weight,
    /// the third with a system font of size 100 and ultraLight weight, and the
    /// fourth with a system font of size 100 and black weight.](font-system-sfsymbols.png)
    ///
    public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font { }

    /// A design to use for fonts.
    ///
    /// Use this enumeration with the ``Font/system(size:weight:design:)``
    /// static function of ``Font`` to change a font design while remaining
    /// within the system fonts.
    ///
    /// There are 4 different font designs:
    ///
    /// 1. ``Font/Design/default``
    /// 2. ``Font/Design/serif``
    /// 3. ``Font/Design/rounded``
    /// 4. ``Font/Design/monospaced``
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("default")
    ///                 .font(.system(size: 48, design: .default))
    ///             Text("serif")
    ///                 .font(.system(size: 48, design: .serif))
    ///             Text("rounded")
    ///                 .font(.system(size: 48, design: .rounded))
    ///             Text("monospaced")
    ///                 .font(.system(size: 48, design: .monospaced))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with four text items, "default" in default
    /// system font design, "serif" in serif system font design, "rounded" in
    /// rounded system font design, and "monospaced" in monospaced system font
    /// design.](font-design.png)
    ///
    public enum Design : Hashable {

        /// The standard sans-serif font design.
        ///
        /// Use this enumeration case with the ``Font/system(size:weight:design:)``
        /// static function of ``Font`` to specify the sans serif system font.
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         VStack {
        ///             Text("default")
        ///                 .font(.system(size: 48, design: .default))
        ///             Text("serif")
        ///                 .font(.system(size: 48, design: .serif))
        ///             Text("rounded")
        ///                 .font(.system(size: 48, design: .rounded))
        ///             Text("monospaced")
        ///                 .font(.system(size: 48, design: .monospaced))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing a VStack with four text items, "default" in default
        /// system font design, "serif" in serif system font design, "rounded" in
        /// rounded system font design, and "monospaced" in monospaced system font
        /// design.](font-design.png)
        ///
        case `default`

        /// A font design with serifs, or small strokes attached to the end of letters.
        ///
        /// Use this enumeration case with the ``Font/system(size:weight:design:)``
        /// static function of ``Font`` to specify the serif system font.
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         VStack {
        ///             Text("default")
        ///                 .font(.system(size: 48, design: .default))
        ///             Text("serif")
        ///                 .font(.system(size: 48, design: .serif))
        ///             Text("rounded")
        ///                 .font(.system(size: 48, design: .rounded))
        ///             Text("monospaced")
        ///                 .font(.system(size: 48, design: .monospaced))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing a VStack with four text items, "default" in default
        /// system font design, "serif" in serif system font design, "rounded" in
        /// rounded system font design, and "monospaced" in monospaced system font
        /// design.](font-design.png)
        ///
        @available(watchOS 7.0, *)
        case serif

        /// A rounded font design.
        ///
        /// Use this enumeration case with the ``Font/system(size:weight:design:)``
        /// static function of ``Font`` to specify the rounded system font.
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         VStack {
        ///             Text("default")
        ///                 .font(.system(size: 48, design: .default))
        ///             Text("serif")
        ///                 .font(.system(size: 48, design: .serif))
        ///             Text("rounded")
        ///                 .font(.system(size: 48, design: .rounded))
        ///             Text("monospaced")
        ///                 .font(.system(size: 48, design: .monospaced))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing a VStack with four text items, "default" in default
        /// system font design, "serif" in serif system font design, "rounded" in
        /// rounded system font design, and "monospaced" in monospaced system font
        /// design.](font-design.png)
        ///
        case rounded

        /// A monospaced font design.
        ///
        /// Use this enumeration case with the ``Font/system(size:weight:design:)``
        /// static function of ``Font`` to specify the monospaced system font.
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         VStack {
        ///             Text("default")
        ///                 .font(.system(size: 48, design: .default))
        ///             Text("serif")
        ///                 .font(.system(size: 48, design: .serif))
        ///             Text("rounded")
        ///                 .font(.system(size: 48, design: .rounded))
        ///             Text("monospaced")
        ///                 .font(.system(size: 48, design: .monospaced))
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing a VStack with four text items, "default" in default
        /// system font design, "serif" in serif system font design, "rounded" in
        /// rounded system font design, and "monospaced" in monospaced system font
        /// design.](font-design.png)
        ///
        @available(watchOS 7.0, *)
        case monospaced
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {

    /// Create a custom font with the given `name` and `size` that scales with
    /// the body text style.
    ///
    /// Use this static function to create a non-system font.
    ///
    /// Note that this font will scale based on the body text size. If
    /// you instead wanted a fixed size, see
    /// ``Font/custom(_:fixedSize:)``. If you want your custom font
    /// to scale based on a different style, see
    /// ``Font/custom(_:size:relativeTo:)``.
    ///
    /// ![Font Example 3](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Font-example-3.png)
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Text("Banana🍌🍌")
    ///             .font(.custom("American Typewriter", size: 32.0))
    ///     }
    /// }
    /// ```
    public static func custom(_ name: String, size: CGFloat) -> Font { }

    /// Create a custom font with the given `name` and `size` that scales
    /// relative to the given `textStyle`.
    ///
    /// Use this static function to create a non-system font.
    ///
    /// Note that this font will scale based on the `relativeTo` parameter text style. If
    /// you instead wanted a fixed size, see
    /// ``Font/custom(_:fixedSize:)``. If you want your custom font
    /// to scale based on the body style, see
    /// ``Font/custom(_:size:)``.
    ///
    /// ![Font Example 3](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Font-example-3.png)
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Text("Banana🍌🍌")
    ///             .font(.custom("American Typewriter", size: 32.0, relativeTo: .title))
    ///     }
    /// }
    /// ```
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func custom(_ name: String, size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font { }

    /// Create a custom font with the given `name` and a fixed `size` that does
    /// not scale with Dynamic Type.
    ///
    /// Use this static function to create a non-system font.
    ///
    /// Note that this font will be a fixed size. If
    /// you instead wanted your font to scale based on the body size, see
    /// ``Font/custom(_:size:)``. If you want your custom font
    /// to scale based on a different style, see
    /// ``Font/custom(_:size:relativeTo:)``.
    ///
    /// ![Font Example 3](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/Font-example-3.png)
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Text("Banana🍌🍌")
    ///             .font(.custom("American Typewriter", fixedSize: 32.0))
    ///     }
    /// }
    /// ```
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func custom(_ name: String, fixedSize: CGFloat) -> Font { }

    /// Creates a custom font from a platform font instance.
    ///
    /// Initializing ``Font`` with platform font instance
    /// ([`CTFont`](https://developer.apple.com/documentation/coretext/ctfont-q6r)) can bridge SwiftUI
    /// ``Font`` with [`NSFont`](https://developer.apple.com/documentation/appkit/nsfont) or
    /// [`UIFont`](https://developer.apple.com/documentation/uikit/uifont), both of which are
    /// toll-free bridged to
    /// [`CTFont`](https://developer.apple.com/documentation/coretext/ctfont-q6r). For example:
    ///
    /// ```
    /// struct ContentView: View {
    ///     // Use native Core Text API to create desired ctFont.
    ///     let ctFont = CTFontCreateUIFontForLanguage(.system, 36, nil)!
    ///
    ///     var body: some View {
    ///         Text("I'm a big CT font 🦑")
    ///             .font(Font(ctFont))
    ///     }
    /// }
    /// ```
    ///
    /// ![A white view displaying the text "I'm a big CT font 🦑" in a large, custom font made using the native Core Text API.](font-init.png)
    public init(_ font: CTFont) { }
}

