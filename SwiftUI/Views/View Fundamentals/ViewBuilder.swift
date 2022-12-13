/// A property wrapper that lets you build views declaratively.
///
/// `ViewBuilder` is used extensively in SwiftUI to let you create new
/// on-screen views by just listing them out in a trailing closure.
/// It's a **property wrapper** applied to function parameter.
/// Usually, it's just working behind the scenes, so you don't have to
/// worry about it. But, you can also define your own functions
/// that are view builders, and also include them in your own custom views.
///
/// (A view builder is just specific type of
/// [result builder](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html#ID630)
/// that you can use with ``View``s. Check out that link to learn
/// more about using these to write clean code.)
///
/// ### Using a `ViewBuilder` as a trailing closure
///
/// `ViewBuilder` works behind the scenes of many common SwiftUI
/// views - like ``VStack`` and ``HStack``. For example, here
/// is the declaration of ``Group``'s **initializer**:
///
/// ```
/// public init(@ViewBuilder content: () -> Content) {
///     // Implementation here
/// }
/// ```
///
/// Since that last parameter is a `ViewBuilders`, you can easily create
/// a ``Group`` by passing it a
/// [trailing closure](https://docs.swift.org/swift-book/LanguageGuide/Closures.html#ID102)
/// stacking views:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Group {
///             Text("I'm in the group 😁")
///             Text("Me too 🥂")
///         }
///     }
/// }
/// ```
///
/// ![1F38B3B4-1BCC-426D-BEB1-D365A09E5C30](1F38B3B4-1BCC-426D-BEB1-D365A09E5C30.png)
///
/// ### Using a `ViewBuilder` as a function
///
/// You can also use `ViewBuilder` as a function. Just tag your
/// function with `@ViewBuilder`, and use it just like you would with a
/// trailing closure:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Group(content: contentBuilder)
///     }
///
///     @ViewBuilder
///     func contentBuilder() -> some View {
///         Text("This is another way to create a Group 👥")
///         Text("Just stack the views 🥞")
///     }
/// }
/// ```
///
/// ![5464434F-469F-4385-BFBE-C9B38C911F56](5464434F-469F-4385-BFBE-C9B38C911F56.png)
///
/// ### Using a `ViewBuilder` in your own ``View``s
///
/// Exactly like ``Group``, you can also use `ViewBuilder`s in your own custom
/// views. Just tag the parameter of your ``View``'s initializer with
/// `@ViewBuilder`, and anyone using your view will be able to easily
/// pass you views just by listing them.
///
/// In the example below, we use this technique to create a special
/// type of ``Group`` that makes everything green. Note that ``ViewBuilder``s
/// are actually functions, so in order to get the content they contain,
/// you have to call the function. Below, this is done with `content()`.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         GreenGroup {
///             Text("I am green 🤑")
///             Text("Hey same 🐲")
///         }
///     }
/// }
///
///
/// struct GreenGroup<Content>: View where Content: View {
///     var views: Content
///
///     init(@ViewBuilder content: () -> Content) {
///         self.views = content()
///     }
///
///     var body: some View {
///         Group {
///             views.foregroundColor(.green)
///         }
///     }
/// }
/// ```
///
/// ![79B81C88-83A4-47C2-B3E7-68BAFFB230E4](79B81C88-83A4-47C2-B3E7-68BAFFB230E4.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@_functionBuilder public struct ViewBuilder {

    /// Builds an empty view from a block containing no statements.
    ///
    /// Don't call this function directly
    /// This works behind the scenes whenever you pass no
    /// views to a ``ViewBuilder``. SwiftUI will automatically build
    /// an ``EmptyView`` when you pass no parameters.
    ///
    /// For example, in the following piece of code, we get nothing
    /// on screen. It still builds and runs though, since it interprets no
    /// views as an ``EmptyView``.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group { }
    ///     }
    /// }
    /// ```
    //
    /// ![A screenshot displaying an empty view.](buildblock-view.png)
    ///
    public static func buildBlock() -> EmptyView { }

    /// Passes a single view written as a child view through unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass one
    /// view to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a format that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get just the one
    /// view on screen.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("I am all alone 🙋‍♀️")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single text view that reads "I am all alone"
    /// in the center of the screen.](buildblock-1-view.png)
    ///
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass an if statement
    /// to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a format that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get the one
    /// view on screen whenever `showView` is `true`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var showView = true
    ///
    ///     var body: some View {
    ///         Group {
    ///             if showView {
    ///                 Text("Show me! 🙋‍♀️")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single text view that reads "Show me!"](buildif-view.png)
    public static func buildIf<Content>(_ content: Content?) -> Content? where Content : View { }

    /// Provides support for "if" statements in multi-statement closures,
    /// producing conditional content for the "then" branch.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass an if-else statement
    /// to a ``ViewBuilder``, and the condition is `true`.
    /// SwiftUI will automatically build
    /// this into a format that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get the one
    /// view on screen whenever `showView` is `true`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var showView = true
    ///
    ///     var body: some View {
    ///         Group {
    ///             if showView {
    ///                 Text("I am on screen! 🙋‍♀️")
    ///             } else {
    ///                 Text("Hey why aren't you showing me ☁️")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single text view that reads "I am on screen!"
    /// The second view is not displayed since showView is set to true.](buildeither-first-view.png)
    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View { }

    /// Provides support for "if-else" statements in multi-statement closures,
    /// producing conditional content for the "else" branch.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass an if-else statement
    /// to a ``ViewBuilder``, and the condition is `false`.
    /// SwiftUI will automatically build
    /// this into a format that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get the one
    /// view on screen whenever `showView` is `false`.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var showView = false
    ///
    ///     var body: some View {
    ///         Group {
    ///             if showView {
    ///                 Text("Hey why aren't you showing me ☁️")
    ///             } else {
    ///                 Text("I am on screen! 🙋‍♀️")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single text view that reads "I am on screen!"
    /// The first view is not displayed since showView is set to false.](buildeither-first-view.png)
    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ViewBuilder {

    /// Provides support for "if" statements with `#available()` clauses in
    /// multi-statement closures, producing conditional content for the "then"
    /// branch, i.e. the conditionally-available branch.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass a `#if` statement
    /// to a ``ViewBuilder``, and the condition is `true`.
    /// SwiftUI will automatically build
    /// this into a format that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get the one
    /// view on screen whenever we are running iOS.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var showView = false
    ///
    ///     var body: some View {
    ///         Group {
    ///             #if os(iOS)
    ///                 Text("I am on screen! 🙋‍♀️")
    ///             #endif
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single text view that reads "I am on screen!"](buildeither-first-view.png)
    public static func buildLimitedAvailability<Content>(_ content: Content) -> AnyView where Content : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Builds a tuple view for display from 2 views in a view builder.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass two
    /// views to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a ``TupleView`` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get two
    /// views on screen.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("I am on screen 🙋‍♀️")
    ///             Text("Me too 🥂")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a tuple view from two views in a ViewBuilder
    /// that read "I am on screen" and "Me too."](buildblock-2-view.png)
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)> where C0 : View, C1 : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Builds a tuple view for display from 3 views in a view builder.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass three
    /// views to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a ``TupleView`` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get three
    /// views on screen.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("I am on screen 🙋‍♀️")
    ///             Text("Me too 🥂")
    ///             Text("What a party 🎉")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a tuple view from three views in a ViewBuilder
    /// that read "I am on screen," "Me too," and "What a party."](buildblock-3-view.png)
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> TupleView<(C0, C1, C2)> where C0 : View, C1 : View, C2 : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Builds a tuple view for display from 4 views in a view builder.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass four
    /// views to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a ``TupleView`` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get four
    /// views on screen.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("I am on screen 🙋‍♀️")
    ///             Text("Me too 🥂")
    ///             Text("What a party 🎉")
    ///             Text("Lets go!! 🥳")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a tuple view from four views in a ViewBuilder
    /// that read "I am on screen," "Me too," "What a party," and "Lets go!!"](buildblock-4-view.png)
    ///
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> TupleView<(C0, C1, C2, C3)> where C0 : View, C1 : View, C2 : View, C3 : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Builds a tuple view for display from 5 views in a view builder.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass five
    /// views to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a ``TupleView`` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get five
    /// views on screen.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("I am on screen 🙋‍♀️")
    ///             Text("Me too 🥂")
    ///             Text("What a party 🎉")
    ///             Text("Lets go!! 🥳")
    ///             Text("Where's the food? 🍱")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a tuple view from five views in a ViewBuilder
    /// that read "I am on screen," "Me too," "What a party," "Lets go!!" and
    /// "Where's the food?"](buildblock-5-view.png)
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> TupleView<(C0, C1, C2, C3, C4)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Builds a tuple view for display from 6 views in a view builder.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass six
    /// views to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a ``TupleView`` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get six
    /// views on screen.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("I am on screen 🙋‍♀️")
    ///             Text("Me too 🥂")
    ///             Text("What a party 🎉")
    ///             Text("Lets go!! 🥳")
    ///             Text("Where's the food? 🍱")
    ///             Text("I am #6 6️⃣")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a tuple view from six views in a ViewBuilder
    /// that read "I am on screen," "Me too," "What a party," "Lets go!!"
    /// "Where's the food?" and "I am #6."](buildblock-6-view.png)
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> TupleView<(C0, C1, C2, C3, C4, C5)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Builds a tuple view for display from 7 views in a view builder.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass seven
    /// views to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a ``TupleView`` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get seven
    /// views on screen.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("I am on screen 🙋‍♀️")
    ///             Text("Me too 🥂")
    ///             Text("What a party 🎉")
    ///             Text("Lets go!! 🥳")
    ///             Text("Where's the food? 🍱")
    ///             Text("I am #6 6️⃣")
    ///             Text("This is getting crowded 🕺")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a tuple view from seven views in a ViewBuilder
    /// that read "I am on screen," "Me too," "What a party," "Lets go!!"
    /// "Where's the food?" "I am #6," and "This is getting crowded."](buildblock-7-view.png)
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> TupleView<(C0, C1, C2, C3, C4, C5, C6)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Builds a tuple view for display from 8 views in a view builder.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass eight
    /// views to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a ``TupleView`` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get eight
    /// views on screen.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("I am on screen 🙋‍♀️")
    ///             Text("Me too 🥂")
    ///             Text("What a party 🎉")
    ///             Text("Lets go!! 🥳")
    ///             Text("Where's the food? 🍱")
    ///             Text("I am #6 6️⃣")
    ///             Text("This is getting crowded 🕺")
    ///             Text("Nearing capacity! 🎊")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a tuple view from eight views in a ViewBuilder
    /// that read "I am on screen," "Me too," "What a party," "Lets go!!"
    /// "Where's the food?" "I am #6," "This is getting crowded," and "Nearing capacity!"](buildblock-8-view.png)
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Builds a tuple view for display from 9 views in a view builder.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass nine
    /// views to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a ``TupleView`` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get nine
    /// views on screen.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("I am on screen 🙋‍♀️")
    ///             Text("Me too 🥂")
    ///             Text("What a party 🎉")
    ///             Text("Lets go!! 🥳")
    ///             Text("Where's the food? 🍱")
    ///             Text("I am #6 6️⃣")
    ///             Text("This is getting crowded 🕺")
    ///             Text("Nearing capacity! 🎊")
    ///             Text("Room for one more? 🍻")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a tuple view from nine views in a ViewBuilder
    /// that read "I am on screen," "Me too," "What a party," "Lets go!!"
    /// "Where's the food?" "I am #6," "This is getting crowded," "Nearing
    /// capacity!" and "Room for one more?"](buildblock-9-view.png)
    ///
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Builds a tuple view for display from 10 views in a view builder.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass ten
    /// views to a ``ViewBuilder``. SwiftUI will automatically build
    /// this into a ``TupleView`` that can be handled by the initializer.
    ///
    /// This is the maximum number of views that can be passed in a view
    /// builder.
    ///
    /// For example, in the following piece of code, we get ten
    /// views on screen.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             Text("I am on screen 🙋‍♀️")
    ///             Text("Me too 🥂")
    ///             Text("What a party 🎉")
    ///             Text("Lets go!! 🥳")
    ///             Text("Where's the food? 🍱")
    ///             Text("I am #6 6️⃣")
    ///             Text("This is getting crowded 🕺")
    ///             Text("Nearing capacity! 🎊")
    ///             Text("Room for one more? 🍻")
    ///             Text("No more views!! 🛑")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a tuple view from ten views in a ViewBuilder
    /// that read "I am on screen," "Me too," "What a party," "Lets go!!"
    /// "Where's the food?" "I am #6," "This is getting crowded," "Nearing
    /// capacity!" "Room for one more?" and "No more views!!"](buildblock-10-view.png)
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View { }
}

