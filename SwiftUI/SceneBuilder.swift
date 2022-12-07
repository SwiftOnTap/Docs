/// A property wrapper that lets you build scenes declaratively.
///
/// ``SceneBuilder`` is used primary in the ``App`` structure in SwiftUI to let you create
/// your app's scenes by just listing them out in a trailing closure.
/// It's a **property wrapper** applied to function parameter.
/// Usually, it's just working behind the scenes, so you don't have to
/// worry about it.
///
/// (A scene builder is just specific type of
/// [result builder](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html#ID630)
/// that you can use with ``Scene``s. Check out that link to learn
/// more about using these to write clean code.)
///
/// ### Using a ``SceneBuilder`` as a trailing closure
///
/// ``SceneBuilder`` works behind the scenes of many common SwiftUI
/// scenes - like ``WindowGroup`` and ``Settings``. For example, here
/// is the declaration of ``Group``'s initializer:
///
/// ```
/// public init(@SceneBuilder content: () -> Content) {
///     // Implementation here
/// }
/// ```
///
/// Since that parameter is a ``SceneBuilder``, you can easily create
/// a ``Group`` by passing it a [trailing closure](https://docs.swift.org/swift-book/LanguageGuide/Closures.html#ID102)
/// stacking views:
///
/// ```
/// @main
/// struct SampleApp: App {
///     var body: some Scene {
///         Group {
///             WindowGroup(id: "a") {
///                 Text("I'm in the group 😁")
///             }
///             WindowGroup(id: "b") {
///                 Text("Me too 🥂")
///             }
///         }
///     }
/// }
/// ```
///
/// ### Using a ``SceneBuilder`` as a function
///
/// You can also use ``SceneBuilder`` as a function. Just tag your
/// function with `@SceneBuilder`, and use it just like you would with a
/// trailing closure:
///
/// ```
/// @main
/// struct SampleApp: App {
///     var body: some Scene {
///         Group(content: contentBuilder)
///     }
///
///     @SceneBuilder
///     func contentBuilder() -> some Scene {
///         WindowGroup(id: "a") {
///             Text("I'm in the group 😁")
///         }
///         WindowGroup(id: "b") {
///             Text("Me too 🥂")
///         }
///     }
/// }
/// ```
///
/// ### Using a `SceneBuilder` in your own ``Scene``s
///
/// Exactly like ``Group``, you can also use `ScebeBuilder`s in your own custom
/// scenes. Just tag the parameter of your ``Scene``'s initializer with
/// `@SceneBuilder`, and anyone using your scene will be able to easily
/// pass you views just by listing them.
///
/// In the example below, we use this technique to create a special
/// type of ``Group`` that adds command-P to print bananas to everything.
/// Note that ``SceneBuilder``s
/// are actually functions, so in order to get the content they contain,
/// you have to call the function. Below, this is done with `content()`.
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         BananaPrintingGroup {
///             WindowGroup(id: "a") {
///                 Text("I print 🍌")
///             }
///             WindowGroup(id: "b") {
///                 Text("Hey same 🍌🍌🍌")
///             }
///         }
///     }
/// }
///
/// struct BananaPrintingGroup<Content>: Scene where Content: Scene {
///     var scenes: Content
///
///     init(@ViewBuilder content: () -> Content) {
///         self.scenes = content()
///     }
///
///     var body: some View {
///         Group {
///             views.commands { PrintCommand() }
///         }
///     }
/// }
///
/// struct PrintCommand: Commands {
///     var body: some Commands {
///         CommandMenu("Print") {
///             Button("Print", action: { print("🍌") })
///                 .keyboardShortcut(KeyboardShortcut(KeyEquivalent("p"), modifiers: [.command]))
///         }
///     }
/// }
/// ```
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@_functionBuilder public struct SceneBuilder {

    /// Passes a single scene written as a child scene through unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass one
    /// scene to a ``SceneBuilder``. SwiftUI will automatically build
    /// this into a format that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get just the one
    /// scene.
    ///
    /// ```
    /// @main
    /// struct SampleApp: App {
    ///     var body: some Scene {
    ///         Group {
    ///             WindowGroup {
    ///                 Text("I am all alone 🙋‍♀️")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : Scene { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    /// Passes 2 scenes unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass two
    /// views to a ``SceneBuilder``. SwiftUI will automatically build
    /// this into `some Scene` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get two
    /// scenes.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             WindowGroup(id: "a") {
    ///                 Text("I am on screen 🙋‍♀️")
    ///             }
    ///             WindowGroup(id: "b") {
    ///                 Text("Me too 🥂")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some Scene where C0 : Scene, C1 : Scene { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    /// Passes 3 scenes unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass three
    /// views to a ``SceneBuilder``. SwiftUI will automatically build
    /// this into `some Scene` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get three
    /// scenes.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             WindowGroup(id: "a") {
    ///                 Text("I am on screen 🙋‍♀️")
    ///             }
    ///             WindowGroup(id: "b") {
    ///                 Text("Me too 🥂")
    ///             }
    ///             WindowGroup(id: "c") {
    ///                 Text("What a party 🎉")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    /// Passes 4 scenes unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass four
    /// views to a ``SceneBuilder``. SwiftUI will automatically build
    /// this into `some Scene` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get four
    /// scenes.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             WindowGroup(id: "a") {
    ///                 Text("I am on screen 🙋‍♀️")
    ///             }
    ///             WindowGroup(id: "b") {
    ///                 Text("Me too 🥂")
    ///             }
    ///             WindowGroup(id: "c") {
    ///                 Text("What a party 🎉")
    ///             }
    ///             WindowGroup(id: "d") {
    ///                 Text("Lets go!! 🥳")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    /// Passes 5 scenes unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass five
    /// views to a ``SceneBuilder``. SwiftUI will automatically build
    /// this into `some Scene` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get five
    /// scenes.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             WindowGroup(id: "a") {
    ///                 Text("I am on screen 🙋‍♀️")
    ///             }
    ///             WindowGroup(id: "b") {
    ///                 Text("Me too 🥂")
    ///             }
    ///             WindowGroup(id: "c") {
    ///                 Text("What a party 🎉")
    ///             }
    ///             WindowGroup(id: "d") {
    ///                 Text("Lets go!! 🥳")
    ///             }
    ///             WindowGroup(id: "e") {
    ///                 Text("Where's the food? 🍱")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    /// Passes 6 scenes unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass six
    /// views to a ``SceneBuilder``. SwiftUI will automatically build
    /// this into `some Scene` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get six
    /// scenes.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             WindowGroup(id: "a") {
    ///                 Text("I am on screen 🙋‍♀️")
    ///             }
    ///             WindowGroup(id: "b") {
    ///                 Text("Me too 🥂")
    ///             }
    ///             WindowGroup(id: "c") {
    ///                 Text("What a party 🎉")
    ///             }
    ///             WindowGroup(id: "d") {
    ///                 Text("Lets go!! 🥳")
    ///             }
    ///             WindowGroup(id: "e") {
    ///                 Text("Where's the food? 🍱")
    ///             }
    ///             WindowGroup(id: "f") {
    ///                 Text("I am #6 6️⃣")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene, C5 : Scene { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    /// Passes 7 scenes unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass seven
    /// views to a ``SceneBuilder``. SwiftUI will automatically build
    /// this into `some Scene` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get seven
    /// scenes.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             WindowGroup(id: "a") {
    ///                 Text("I am on screen 🙋‍♀️")
    ///             }
    ///             WindowGroup(id: "b") {
    ///                 Text("Me too 🥂")
    ///             }
    ///             WindowGroup(id: "c") {
    ///                 Text("What a party 🎉")
    ///             }
    ///             WindowGroup(id: "d") {
    ///                 Text("Lets go!! 🥳")
    ///             }
    ///             WindowGroup(id: "e") {
    ///                 Text("Where's the food? 🍱")
    ///             }
    ///             WindowGroup(id: "f") {
    ///                 Text("I am #6 6️⃣")
    ///             }
    ///             WindowGroup(id: "g") {
    ///                 Text("This is getting crowded 🕺")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene, C5 : Scene, C6 : Scene { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    /// Passes 8 scenes unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass eight
    /// views to a ``SceneBuilder``. SwiftUI will automatically build
    /// this into `some Scene` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get eight
    /// scenes.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             WindowGroup(id: "a") {
    ///                 Text("I am on screen 🙋‍♀️")
    ///             }
    ///             WindowGroup(id: "b") {
    ///                 Text("Me too 🥂")
    ///             }
    ///             WindowGroup(id: "c") {
    ///                 Text("What a party 🎉")
    ///             }
    ///             WindowGroup(id: "d") {
    ///                 Text("Lets go!! 🥳")
    ///             }
    ///             WindowGroup(id: "e") {
    ///                 Text("Where's the food? 🍱")
    ///             }
    ///             WindowGroup(id: "f") {
    ///                 Text("I am #6 6️⃣")
    ///             }
    ///             WindowGroup(id: "g") {
    ///                 Text("This is getting crowded 🕺")
    ///             }
    ///             WindowGroup(id: "h") {
    ///                 Text("Nearing capacity! 🎊")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene, C5 : Scene, C6 : Scene, C7 : Scene { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    /// Passes 9 scenes unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass nine
    /// views to a ``SceneBuilder``. SwiftUI will automatically build
    /// this into `some Scene` that can be handled by the initializer.
    ///
    /// For example, in the following piece of code, we get nine
    /// scenes.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             WindowGroup(id: "a") {
    ///                 Text("I am on screen 🙋‍♀️")
    ///             }
    ///             WindowGroup(id: "b") {
    ///                 Text("Me too 🥂")
    ///             }
    ///             WindowGroup(id: "c") {
    ///                 Text("What a party 🎉")
    ///             }
    ///             WindowGroup(id: "d") {
    ///                 Text("Lets go!! 🥳")
    ///             }
    ///             WindowGroup(id: "e") {
    ///                 Text("Where's the food? 🍱")
    ///             }
    ///             WindowGroup(id: "f") {
    ///                 Text("I am #6 6️⃣")
    ///             }
    ///             WindowGroup(id: "g") {
    ///                 Text("This is getting crowded 🕺")
    ///             }
    ///             WindowGroup(id: "h") {
    ///                 Text("Nearing capacity! 🎊")
    ///             }
    ///             WindowGroup(id: "i") {
    ///                 Text("Is this COVID safe? 😷")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene, C5 : Scene, C6 : Scene, C7 : Scene, C8 : Scene { }

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    /// Passes 10 scenes unmodified.
    ///
    /// Don't call this function directly.
    /// This works behind the scenes whenever you pass ten
    /// views to a ``SceneBuilder``. SwiftUI will automatically build
    /// this into `some Scene` that can be handled by the initializer.
    ///
    /// This is the maximum number of scenes that can be passed in a scene
    /// builder.
    ///
    /// For example, in the following piece of code, we get ten
    /// scenes.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Group {
    ///             WindowGroup(id: "a") {
    ///                 Text("I am on screen 🙋‍♀️")
    ///             }
    ///             WindowGroup(id: "b") {
    ///                 Text("Me too 🥂")
    ///             }
    ///             WindowGroup(id: "c") {
    ///                 Text("What a party 🎉")
    ///             }
    ///             WindowGroup(id: "d") {
    ///                 Text("Lets go!! 🥳")
    ///             }
    ///             WindowGroup(id: "e") {
    ///                 Text("Where's the food? 🍱")
    ///             }
    ///             WindowGroup(id: "f") {
    ///                 Text("I am #6 6️⃣")
    ///             }
    ///             WindowGroup(id: "g") {
    ///                 Text("This is getting crowded 🕺")
    ///             }
    ///             WindowGroup(id: "h") {
    ///                 Text("Nearing capacity! 🎊")
    ///             }
    ///             WindowGroup(id: "i") {
    ///                 Text("Is this COVID safe? 😷")
    ///             }
    ///             WindowGroup(id: "j") {
    ///                 Text("No more scenes!! 🙅")
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene, C5 : Scene, C6 : Scene, C7 : Scene, C8 : Scene, C9 : Scene { }

}

