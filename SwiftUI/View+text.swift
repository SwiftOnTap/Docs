@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the alignment of multiline text in this view.
    ///
    /// Use `multilineTextAlignment(_:)` to select an alignment for all of the
    /// text in this view or view hierarchy.
    ///
    /// In the example below, the contents of the ``Text`` view are center
    /// aligned. This also applies to the interpolated newline placed in the
    /// middle of the text since "multiple lines" refers to all of the text
    /// inside the view, regardless of any internal formatting or inclusion of
    /// interpolated text.
    ///
    /// ```
    /// struct MultilineTextView: View {
    ///     var body: some View {
    ///         Text("This is a block of text that will show up in a text element as multiple lines.\("\n") Here we have chosen to center this text.")
    ///             .frame(width: 200, height: 200, alignment: .leading)
    ///             .multilineTextAlignment(.center)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying multiline text that is center aligned on the
    /// screen.](multilinetextalignment.png)
    ///
    /// - Parameter alignment: A value that you use to left-, right-, or
    ///   center-align the text within a view.
    ///
    /// - Returns: A view that aligns the lines of multiline ``Text`` instances
    ///   it contains.
    @inlinable public func multilineTextAlignment(_ alignment: TextAlignment) -> some View { }


    /// A view modifier that sets the truncation mode for lines of text that are too long to fit in
    /// the available space.
    ///
    /// Use the `truncationMode(_:)` modifier to determine whether text in a
    /// long line is truncated at the beginning, middle, or end. Truncation is
    /// indicated by adding an ellipsis (…) to the line when removing text to
    /// indicate to readers that text is missing.
    ///
    /// In the example below, the bounds of text view constrains the amount of
    /// text that the view displays and the `truncationMode(_:)` specifies from
    /// which direction and where to display the truncation indicator:
    ///
    /// ```
    /// struct TruncatedTextView: View {
    ///     var body: some View {
    ///         Text("This is a block of text that will show up in a text element as multiple lines. The text will fill the available space, and then, eventually, be truncated.")
    ///             .frame(width: 150, height: 150)
    ///             .truncationMode(.tail)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a block of multiline text that is too long for
    /// its frame; the truncationMode view modifier cuts it off at the end of the
    /// frame, including an ellipses to denote the truncation.](truncationmode.png)
    ///
    /// - Parameter mode: The truncation mode that specifies where to truncate
    ///   the text within the text view, if needed. You can truncate at the
    ///   beginning, middle, or end of the text view.
    ///
    /// - Returns: A view that truncates text at different points in a line
    ///   depending on the mode you select.
    @inlinable public func truncationMode(_ mode: Text.TruncationMode) -> some View { }


    /// A view modifier that sets the amount of space between lines of text in this view.
    ///
    /// Use `lineSpacing(_:)` to set the amount of spacing from the bottom of
    /// one line to the top of the next for text elements in the view.
    ///
    /// In the ``Text`` view in the example below, 10 points separate the bottom
    /// of one line to the top of the next as the text field wraps inside this
    /// view. Applying `lineSpacing(_:)` to a view hierarchy applies the line
    /// spacing to all text elements contained in the view.
    ///
    /// ```
    /// struct SpacedTextView: View {
    ///     var body: some View {
    ///         Text("This is a string in a TextField with 10 point spacing applied between the bottom of one line and the top of the next.")
    ///             .frame(width: 200, height: 200, alignment: .leading)
    ///             .lineSpacing(10)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a block of multiline text with the lineSpacing
    /// view modifier applied, rendering the text with space between each line.](linespacing.png)
    ///
    /// - Parameter lineSpacing: The amount of space between the bottom of one
    ///   line and the top of the next line in points.
    @inlinable public func lineSpacing(_ lineSpacing: CGFloat) -> some View { }


    /// A view modifier whether text in this view can compress the space between characters
    /// when necessary to fit text in a line.
    ///
    /// Use `allowsTightening(_:)` to enable the compression of inter-character
    /// spacing of text in a view to try to fit the text in the view's bounds.
    ///
    /// You can also use ``EnvironmentValues/allowsTightening``
    /// to set the same effect in the environment.
    ///
    /// In the example below, two identically configured text views show the
    /// effects of `allowsTightening(_:)` on the compression of the spacing
    /// between characters:
    ///
    /// ```
    /// struct TightenedTextView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("This is a wiiiiide text element")
    ///                 .font(.body)
    ///                 .frame(width: 200, height: 50, alignment: .leading)
    ///                 .lineLimit(1)
    ///                 .allowsTightening(true)
    ///
    ///             Text("This is a wiiiiide text element")
    ///                 .font(.body)
    ///                 .frame(width: 200, height: 50, alignment: .leading)
    ///                 .lineLimit(1)
    ///                 .allowsTightening(false)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two text views in a VStack, each reading
    /// "This is a wiiiiide text element," but the first applies the allowsTightening
    /// view modifier and is therefore able to fit an extra character. Still,
    /// neither fits the whole string, but the view modifier renders a closer match.](allowstightening.png)
    ///
    /// - Parameter flag: A Boolean value that indicates whether the space
    ///   between characters compresses when necessary.
    ///
    /// - Returns: A view that can compress the space between characters when
    ///   necessary to fit text in a line.
    @inlinable public func allowsTightening(_ flag: Bool) -> some View { }


    /// A view modifier that sets the maximum number of lines that text can occupy in this view.
    ///
    /// Use `lineLimit(_:)` to cap the number of lines that an individual text
    /// element can display.
    ///
    /// The line limit applies to all ``Text`` instances within a hierarchy. For
    /// example, an ``HStack`` with multiple pieces of text longer than three
    /// lines caps each piece of text to three lines rather than capping the
    /// total number of lines across the ``HStack``.
    ///
    /// In the example below, the `lineLimit(_:)` operator limits the very long
    /// line in the ``Text`` element to the 2 lines that fit within the view's
    /// bounds:
    ///
    /// ```
    /// struct LimitedTextView: View {
    ///     var body: some View {
    ///         Text("This is a long string that demonstrates the effect of SwiftUI's lineLimit(_:) operator. 😲")
    ///             .frame(width: 200, height: 200, alignment: .leading)
    ///             .lineLimit(2)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a block of multiline text rendered as only
    /// two lines by the lineLimit view modifier. The result is a text view that
    /// reads "This is a long string that demonstrates the effect..."](linelimit.png)
    ///
    /// - Parameter number: The line limit. If `nil`, no line limit applies.
    ///
    /// - Returns: A view that limits the number of lines that ``Text``
    ///   instances display.
    @inlinable public func lineLimit(_ number: Int?) -> some View { }


    /// A view modifier that sets the minimum amount that text in this view scales down to fit in the
    /// available space.
    ///
    /// Use the `minimumScaleFactor(_:)` modifier if the text you place in a
    /// view doesn't fit and it's okay if the text shrinks to accommodate. For
    /// example, a label with a minimum scale factor of `0.5` draws its text in
    /// a font size as small as half of the actual font if needed.
    ///
    /// In the example below, the ``HStack`` contains a ``Text`` label with a
    /// line limit of `1`, that is next to a ``TextField``. To allow the label
    /// to fit into the available space, the `minimumScaleFactor(_:)` modifier
    /// shrinks the text as needed to fit into the available space.
    ///
    /// ```
    /// struct LimitedScaleTextView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Text("This is a long label that will be scaled to fit:")
    ///                 .lineLimit(1)
    ///                 .minimumScaleFactor(0.5)
    ///             TextField("My Long Text Field", text: $myTextField)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text view and a text field in an HStack;
    /// the view modifier renders the first text as small as half of the actual
    /// font size, but the line of text still doesn't fully fit in its frame. The
    /// text reads "This is a long label that will be scal..." before it runs
    /// into the text field.](minimumscalefactor.png)
    ///
    /// - Parameter factor: A fraction between 0 and 1 (inclusive) you use to
    ///   specify the minimum amount of text scaling that this view permits.
    ///
    /// - Returns: A view that limits the amount of text downscaling.
    @inlinable public func minimumScaleFactor(_ factor: CGFloat) -> some View { }


    /// A view modifier that sets a transform for the case of the text contained in this view when
    /// displayed.
    ///
    /// The default value is `nil`, displaying the text without any case
    /// changes.
    ///
    /// ```
    /// struct CapsView: View {
    ///     var body: some View {
    ///         Text("This is all caps text!")
    ///             .textCase(.uppercase)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a text field modified to present in all
    /// uppercase letters. The display reads "THIS IS ALL CAPS TEXT!" since
    /// the modifier is passed the .uppercase case.](textcase-uppercase.png)
    ///
    /// - Parameter textCase: One of the ``Text/Case`` enumerations; the
    ///   default is `nil`.
    /// - Returns: A view that transforms the case of the text.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @inlinable public func textCase(_ textCase: Text.Case?) -> some View { }

}

