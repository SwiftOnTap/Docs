@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that connects a gesture to the view, with lower priority than existing gestures.
    ///
    /// Use this modifier to attach a gesture to a view.
    ///
    /// Make sure that your first parameter conforms to the ``Gesture`` protocol. For
    /// more information about the second parameter, check out ``GestureMask``.
    ///
    /// - Note: If the view already has gestures defined, they will override any
    /// gesture attached using this view modifier. To attach a gesture with a
    /// higher priority than gestures already attached to the view, use
    /// ``View/highPriorityGesture(_:including:)``. To attach
    /// a gesture with the same priority as gestures already attached to the view, use
    /// ``View/simultaneousGesture(_:including:)``.
    ///
    /// ```
    /// struct DoubleTapView: View {
    ///     @State var message = "Double tap me 👇"
    ///
    ///     var two: some Gesture {
    ///         TapGesture(count: 2)
    ///             .onEnded { message += "2️⃣" }
    ///     }
    ///
    ///     var body: some View {
    ///         Text(message)
    ///             .gesture(two)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a button in the center of the screen that reads "Double tap me"
    /// followed by a 2 emoji. When double tapped, the gesture view modifier adds
    /// another 2 emoji to the end of the string.](gesture-including-ex.gif)
    ///
    /// - Parameters:
    ///   - gesture: The gesture to connect to the view.
    ///   - mask: A value that controls how adding this gesture to the view
    ///   affects other gestures recognized by the view and its subviews.
    public func gesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture { }


    /// A view modifier that connects a gesture to the view, with higher priority than existing gestures.
    ///
    /// Use this method when you need to define a high priority gesture
    /// to take precedence over the view's existing gestures.
    ///
    /// Make sure that your first parameter conforms to the ``Gesture`` protocol. For
    /// more information about the second parameter, check out ``GestureMask``.
    ///
    /// - Note: This modifier will override any gestures already defined in
    /// the view. If you would prefer gestures already defined in the view override
    /// the gesture defined here, use
    /// ``View/gesture(_:including:)`` instead. If you would
    /// rather that all gestures be executed simultaneously, use
    /// ``View/simultaneousGesture(_:including:)``.
    ///
    /// ```
    /// struct DoubleTapView: View {
    ///     @State var message = "Double tap me 👇"
    ///
    ///     var one: some Gesture {
    ///         TapGesture(count: 1)
    ///             .onEnded { message += "1️⃣" }
    ///     }
    ///     var two: some Gesture {
    ///         TapGesture(count: 2)
    ///             .onEnded { message += "2️⃣" }
    ///     }
    ///
    ///     var body: some View {
    ///         ZStack {
    ///             Text(message)
    ///                 .gesture(two) //this never happens
    ///         }
    ///         .highPriorityGesture(one)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a button in the center of the screen that reads "Double tap me"
    /// followed by a 2 emoji. When double tapped, the gesture view modifier would
    /// like to add a 2 emoji to the end of the string, but the highPriorityGesture
    /// modifier makes it so that a 1 emoji is added with each single tap. Due to its
    /// priority, the 1 emoji will be added with each single tap and no 2 emoji is added.](high-priority-gesture-including-ex.gif)
    ///
    /// - Parameters:
    ///   - gesture: The gesture to connect to the view.
    ///   - mask: A value that controls how adding this gesture to the view
    ///   affects other gestures recognized by the view and its subviews.
    public func highPriorityGesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture { }


    /// A view modifier that connects a gesture to the view, with equal priority to existing gestures.
    ///
    /// Use this modifier to attach a gesture to a view. Using this modifier will ensure
    /// that the gesture is not overridden by any gestures already defined
    /// in the view.
    ///
    /// Make sure that your first parameter conforms to the ``Gesture`` protocol. For
    /// more information about the second parameter, check out ``GestureMask``.
    ///
    /// - Note: This modifier will not override any gestures already defined in
    /// the view. If you would prefer gestures already defined in the view override
    /// the gesture defined here, use
    /// ``View/gesture(_:including:)`` instead. If you would instead
    /// prefer that this gesture override gestures already defined in the view,
    /// use ``View/highPriorityGesture(_:including:)``.
    ///
    /// ```
    /// struct DoubleTapView: View {
    ///     @State var message = "Double tap me 👇"
    ///
    ///     var g: some Gesture {
    ///         TapGesture(count: 2)
    ///             .onEnded { message += "2️⃣" }
    ///     }
    ///
    ///     var body: some View {
    ///         ZStack {
    ///             Text(message)
    ///                 .onTapGesture { message += "1️⃣" }
    ///         }
    ///         .simultaneousGesture(g)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a button in the center of the screen that reads "Double tap me"
    /// followed by a 2 emoji. When double tapped, the gesture view modifier would
    /// like to add a 2 emoji to the end of the string. Since it is used in conjunction
    /// with the simultaneousGesture modifier, both the 1 and 2 emojis are added
    /// simultaneously. So, with each double tap, two 1 emojis are added, as well as one 2 emoji.](simultaneous-gesture-including-ex.gif)
    ///
    /// - Parameters:
    ///   - gesture: The gesture to connect to the view.
    ///   - mask: A value that controls how adding this gesture to the view
    ///   affects other gestures recognized by the view and its subviews.
    public func simultaneousGesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture { }

}

