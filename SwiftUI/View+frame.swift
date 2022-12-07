@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that positions this view within an invisible frame
    /// with the specified size.
    ///
    /// Use this method to specify a fixed size for a view's width, height, or
    /// both. If you only specify one of the dimensions, the resulting view
    /// assumes this view's sizing behavior in the other dimension.
    ///
    /// For example, the following code lays out an ellipse in a fixed 200 by
    /// 100 frame. Because a shape always occupies the space offered to it by
    /// the layout system, the first ellipse is 200 by 100 points. The second
    /// ellipse is laid out in a frame with only a fixed height, so it occupies
    /// that height, and whatever width the layout system offers to its parent.
    ///
    /// ```
    /// struct EllipseFrameView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Ellipse()
    ///                 .fill(Color.purple)
    ///                 .frame(width: 200, height: 100)
    ///             Ellipse()
    ///                 .fill(Color.blue)
    ///                 .frame(height: 100)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with two ellipses, the first with fill
    /// color purple and an invisible frame of width 200 and height 100, and the
    /// second with fill color blue and an invisible frame of height 100.](15.54.23.png)
    ///
    /// The `alignment` parameter specifies this view's alignment within the
    /// frame.
    ///
    /// ```
    /// struct TextFrameView: View {
    ///     var body: some View {
    ///         Text("Hello world!")
    ///             .frame(width: 200, height: 30, alignment: .topLeading)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gray bordered text view reading "Hello world!" with a frame of width
    /// 200 and a height of 30 and top leading alignment, pushing the text
    /// into the top left corner of the frame.](15.56.14.png)
    ///
    /// In the example above, the text is positioned at the top, leading corner
    /// of the frame. If the text is taller than the frame, its bounds may
    /// extend beyond the bottom of the frame's bounds.
    ///
    /// - Note: If a ``View``'s `frame` is already tight around the contents,
    /// specifying an ``Alignment`` won't change anything. This is not a bug!
    /// It's just because the frame is already tight.
    ///
    /// - Parameters:
    ///   - width: A fixed width for the resulting view. If `width` is `nil`,
    ///     the resulting view assumes this view's sizing behavior.
    ///   - height: A fixed height for the resulting view. If `height` is `nil`,
    ///     the resulting view assumes this view's sizing behavior.
    ///   - alignment: The alignment of this view inside the resulting view.
    ///     ``alignment`` applies if this view is smaller than the size given by
    ///     the resulting frame.
    ///
    /// - Returns: A view with fixed dimensions of `width` and `height`, for the
    ///   parameters that are non-`nil`.
    @inlinable public func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View { }


    /// Positions this view within an invisible frame.
    ///
    /// **This does nothing**. It was only implemented so people who
    /// don't know what they're doing don't have their programs
    /// always breaking.
    ///
    /// Use ``View/frame(width:height:alignment:)`` or
    /// ``View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)``
    /// instead.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("My frame is unaffected 🤷‍")
    ///             .frame() //does nothing
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single text view which reads "My frame
    /// is unaffected," demonstrating that the frame modifier has no effect on
    /// the text view's display.](frame.png)
    @available(*, deprecated, message: "Please pass one or more parameters.")
    @inlinable public func frame() -> some View { }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that positions this view within an invisible frame
    /// having the specified size constraints.
    ///
    /// Always specify at least one size characteristic when calling this
    /// method. Pass `nil` or leave out a characteristic to indicate that the
    /// frame should adopt this view's sizing behavior, constrained by the other
    /// non-`nil` arguments.
    ///
    /// The size proposed to this view is the size proposed to the frame,
    /// limited by any constraints specified, and with any ideal dimensions
    /// specified replacing any corresponding unspecified dimensions in the
    /// proposal.
    ///
    /// If no minimum or maximum constraint is specified in a given dimension,
    /// the frame adopts the sizing behavior of its child in that dimension. If
    /// both constraints are specified in a dimension, the frame unconditionally
    /// adopts the size proposed for it, clamped to the constraints. Otherwise,
    /// the size of the frame in either dimension is:
    ///
    /// - If a minimum constraint is specified and the size proposed for the
    ///   frame by the parent is less than the size of this view, the proposed
    ///   size, clamped to that minimum.
    /// - If a maximum constraint is specified and the size proposed for the
    ///   frame by the parent is greater than the size of this view, the
    ///   proposed size, clamped to that maximum.
    /// - Otherwise, the size of this view.
    ///
    /// The ideal width and height parameters can be enforced using the
    /// ``View/fixedSize()`` modifier.
    ///
    /// Play with the numbers in the following example to see how the
    /// child view responds.
    ///
    /// ```
    /// struct CustomFrameView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Rectangle()
    ///                 .frame(minWidth: 50.0, idealWidth: 100.0, maxWidth: 100.0,
    ///                        minHeight: 50.0, idealHeight: 100.0, maxHeight: 200.0)
    ///         }
    ///         .frame(width: 150.0, height: 150.0)
    ///         .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange frame surrounding a black rectangle
    /// in the center of the screen. There is empty space between the rectangle
    /// and the frame on either side.](frame-custom.png)
    ///
    /// - Parameters:
    ///   - minWidth: The minimum width of the resulting frame.
    ///   - idealWidth: The ideal width of the resulting frame.
    ///   - maxWidth: The maximum width of the resulting frame.
    ///   - minHeight: The minimum height of the resulting frame.
    ///   - idealHeight: The ideal height of the resulting frame.
    ///   - maxHeight: The maximum height of the resulting frame.
    ///   - alignment: The alignment of this view inside the resulting frame.
    ///     Note that most alignment values have no apparent effect when the
    ///     size of the frame happens to match that of this view.
    ///
    /// - Returns: A view with flexible dimensions given by the call's non-`nil`
    ///   parameters.
    @inlinable public func frame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> some View { }

}
