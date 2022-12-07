/// A structure that groups other structure together.
///
/// Use this structure to group together structures of different types.
/// There are five different types of groups. Each groups together
/// a type of content.
/// 1. ``ToolbarContent``
/// 2. ``CustomizableToolbarContent``
/// 3. ``Scene``
/// 4. ``View``
/// 5. ``Commands``
///
/// There are 2 main reasons to use a ``Group``:
/// - To exceed the 10 struct limitation of a function builder
/// - To improve code readability.
///
/// Here is an example creating a `Group` of ``View``s:
///
///     struct ExampleView: View {
///         var body: some View {
///             Group {
///                 Text("1")
///                 Text("2")
///                 Text("3")
///                 Text("4")
///                 Text("5")
///             }
///         }
///     }
///
/// ![](group-ex1.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Group<Content> {

    /// The type of content representing the body of this toolbar content.
    public typealias Body = Never
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Group : ToolbarContent where Content : ToolbarContent {

    /// Creates a ``Group`` from toolbar content.
    ///
    /// Groups are particularly useful when you want several toolbar items to act
    /// together.
    ///
    /// Another time when ``Group`` is useful is when trying to return more than
    /// 10 toolbar items to a toolbar content builder at once. For technical reasons, a toolbar content
    /// builder can generally only take 10 toolbar items at once. So if you try to do
    /// this, you'll get an error:
    ///
    /// ```
    /// struct ErrorView: View {
    ///     var body: some View {
    ///         EmptyView()
    ///             .toolbar {
    ///                 ToolbarItem { Text("1") }
    ///                 ToolbarItem { Text("2") }
    ///                 ToolbarItem { Text("3") }
    ///                 ToolbarItem { Text("4") }
    ///                 ToolbarItem { Text("5") }
    ///                 ToolbarItem { Text("6") }
    ///                 ToolbarItem { Text("7") }
    ///                 ToolbarItem { Text("8") }
    ///                 ToolbarItem { Text("9") }
    ///                 ToolbarItem { Text("10") }
    ///                 ToolbarItem { Text("11") } //ERROR!
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// Instead, you should put your toolbar items into ``Group``s:
    ///
    ///
    /// ```
    /// struct NoErrorView: View {
    ///     var body: some View {
    ///         EmptyView()
    ///             .toolbar {
    ///                 Group {
    ///                     ToolbarItem { Text("1") }
    ///                     ToolbarItem { Text("2") }
    ///                     ToolbarItem { Text("3") }
    ///                     ToolbarItem { Text("4") }
    ///                     ToolbarItem { Text("5") }
    ///                 }
    ///                 Group {
    ///                     ToolbarItem { Text("6") }
    ///                     ToolbarItem { Text("7") }
    ///                     ToolbarItem { Text("8") }
    ///                     ToolbarItem { Text("9") }
    ///                     ToolbarItem { Text("10") }
    ///                     ToolbarItem { Text("11") } //No error 😎
    ///                 }
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameter content: A toolbar content builder.
    public init(@ToolbarContentBuilder content: () -> Content) { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Group : CustomizableToolbarContent where Content : CustomizableToolbarContent {

    /// Creates a ``Group`` from a customizable toolbar content.
    ///
    /// Groups are particularly useful when you want several customizable toolbar items to act
    /// together.
    ///
    /// Another time when ``Group`` is useful is when trying to return more than
    /// 10 customizable toolbar items to a toolbar content builder at once. For technical reasons, a toolbar content
    /// builder can generally only take 10 customizable toolbar items at once. So if you try to do
    /// this, you'll get an error:
    ///
    /// ```
    /// struct ErrorView: View {
    ///     var body: some View {
    ///         EmptyView()
    ///             .toolbar(id: "customizabletoolbar") {
    ///                 ToolbarItem(id: "1", placement: .automatic) { Text("1") }
    ///                 ToolbarItem(id: "2", placement: .automatic) { Text("2") }
    ///                 ToolbarItem(id: "3", placement: .automatic) { Text("3") }
    ///                 ToolbarItem(id: "4", placement: .automatic) { Text("4") }
    ///                 ToolbarItem(id: "5", placement: .automatic) { Text("5") }
    ///                 ToolbarItem(id: "6", placement: .automatic) { Text("6") }
    ///                 ToolbarItem(id: "7", placement: .automatic) { Text("7") }
    ///                 ToolbarItem(id: "8", placement: .automatic) { Text("8") }
    ///                 ToolbarItem(id: "9", placement: .automatic) { Text("9") }
    ///                 ToolbarItem(id: "10", placement: .automatic) { Text("10") }
    ///                 ToolbarItem(id: "11", placement: .automatic) { Text("11") } //ERROR!
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// Instead, you should put your toolbar items into ``Group``s:
    ///
    ///
    /// ```
    /// struct NoErrorView: View {
    ///     var body: some View {
    ///         EmptyView()
    ///             .toolbar(id: "customizabletoolbar") {
    ///                 Group {
    ///                     ToolbarItem(id: "1", placement: .automatic) { Text("1") }
    ///                     ToolbarItem(id: "2", placement: .automatic) { Text("2") }
    ///                     ToolbarItem(id: "3", placement: .automatic) { Text("3") }
    ///                     ToolbarItem(id: "4", placement: .automatic) { Text("4") }
    ///                     ToolbarItem(id: "5", placement: .automatic) { Text("5") }
    ///                 }
    ///                 Group {
    ///                     ToolbarItem(id: "6", placement: .automatic) { Text("6") }
    ///                     ToolbarItem(id: "7", placement: .automatic) { Text("7") }
    ///                     ToolbarItem(id: "8", placement: .automatic) { Text("8") }
    ///                     ToolbarItem(id: "9", placement: .automatic) { Text("9") }
    ///                     ToolbarItem(id: "10", placement: .automatic) { Text("10") }
    ///                     ToolbarItem(id: "11", placement: .automatic) { Text("11") } //No error 😎
    ///                 }
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameter content: A toolbar content builder.
    public init(@ToolbarContentBuilder content: () -> Content) { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Group : Scene where Content : Scene {

    /// Creates a ``Group`` from component scenes.
    ///
    /// Groups are particularly useful when you want several scenes to act
    /// together.
    ///
    /// Another time when ``Group`` is useful is when trying to return more than
    /// 10 scenes to a scene builder at once. For technical reasons, a scene
    /// builder can generally only take 10 scenes at once. So if you try to do
    /// this, you'll get an error:
    ///
    /// ```
    /// @main
    /// struct ErrorApp: App {
    ///     var body: some Scene {
    ///         WindowGroup(id: "id1") { ContentView() }
    ///         WindowGroup(id: "id2") { ContentView() }
    ///         WindowGroup(id: "id3") { ContentView() }
    ///         WindowGroup(id: "id4") { ContentView() }
    ///         WindowGroup(id: "id5") { ContentView() }
    ///         WindowGroup(id: "id6") { ContentView() }
    ///         WindowGroup(id: "id7") { ContentView() }
    ///         WindowGroup(id: "id8") { ContentView() }
    ///         WindowGroup(id: "id9") { ContentView() }
    ///         WindowGroup(id: "id10") { ContentView() }
    ///         WindowGroup(id: "id11") { ContentView() } //ERROR!
    ///     }
    /// }
    /// ```
    ///
    /// Instead, you should put your scenes into ``Group``s:
    ///
    /// ```
    /// @main
    /// struct NoErrorApp: App {
    ///     var body: some Scene {
    ///         Group {
    ///             WindowGroup(id: "id1") { ContentView() }
    ///             WindowGroup(id: "id2") { ContentView() }
    ///             WindowGroup(id: "id3") { ContentView() }
    ///             WindowGroup(id: "id4") { ContentView() }
    ///             WindowGroup(id: "id5") { ContentView() }
    ///             WindowGroup(id: "id6") { ContentView() }
    ///         }
    ///         Group {
    ///             WindowGroup(id: "id7") { ContentView() }
    ///             WindowGroup(id: "id8") { ContentView() }
    ///             WindowGroup(id: "id9") { ContentView() }
    ///             WindowGroup(id: "id10") { ContentView() }
    ///             WindowGroup(id: "id11") { ContentView() } //No error 😎
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameter content: A scene builder.
    @inlinable public init(@SceneBuilder content: () -> Content) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Group : View where Content : View {

    /// Creates a ``Group`` from view content.
    ///
    /// Groups are particularly useful when you want several views to act
    /// together, like for example, in transitions.
    ///
    /// Another time when ``Group`` is useful is when trying to return more than
    /// 10 views to a view builder at once. For technical reasons, a view
    /// builder can generally only take 10 views at once. So if you try to do
    /// this, you'll get an error:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Text("1")
    ///             Text("2")
    ///             Text("3")
    ///             Text("4")
    ///             Text("5")
    ///             Text("6")
    ///             Text("7")
    ///             Text("8")
    ///             Text("9")
    ///             Text("10")
    ///             Text("11") // ERROR!
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// Instead, you should put your text into ``Group``s:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Group {
    ///                 Text("1")
    ///                 Text("2")
    ///                 Text("3")
    ///                 Text("4")
    ///                 Text("5")
    ///             }
    ///                Group {
    ///                    Text("6")
    ///                 Text("7")
    ///                 Text("8")
    ///                 Text("9")
    ///                 Text("10")
    ///                 Text("11") //No error 😎
    ///                }
    ///         }
    ///     }
    /// }
    /// ```
  ///
  /// ![A view containing a VStack with two groups, othe first with the text views
  /// "1", "2", "3", "4", and "5", and the next with the text views "6", "7", "8",
  /// "9", and "10"; the two sets of text views are split because a view builder
  /// can generally only take 10 views at once.](group-init-content-97249.png)
    ///
    /// - Parameter content: A view content builder.
    @inlinable public init(@ViewBuilder content: () -> Content) { }
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Group : Commands where Content : Commands {

    /// Creates a ``Group`` from command content.
    ///
    /// Groups are particularly useful when you want several commands to act
    /// together.
    ///
    /// Another time when ``Group`` is useful is when trying to return more than
    /// 10 commands to a command builder at once. For technical reasons, a command
    /// builder can generally only take 10 commands at once. So if you try to do
    /// this, you'll get an error:
    ///
    /// ```
    /// @main
    /// struct ErrorApp: App {
    ///     var body: some Scene {
    ///         WindowGroup {
    ///             ContentView()
    ///         }
    ///         .commands {
    ///             EmptyCommands() //1
    ///             EmptyCommands() //2
    ///             EmptyCommands() //3
    ///             EmptyCommands() //4
    ///             EmptyCommands() //5
    ///             EmptyCommands() //6
    ///             EmptyCommands() //7
    ///             EmptyCommands() //8
    ///             EmptyCommands() //9
    ///             EmptyCommands() //10
    ///             EmptyCommands() //11 - ERROR!
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// Instead, you should put your commands into ``Group``s:
    ///
    /// ```
    /// @main
    /// struct NoErrorApp: App {
    ///     var body: some Scene {
    ///         WindowGroup {
    ///             ContentView()
    ///         }
    ///         .commands {
    ///             Group {
    ///                 EmptyCommands() //1
    ///                 EmptyCommands() //2
    ///                 EmptyCommands() //3
    ///                 EmptyCommands() //4
    ///                 EmptyCommands() //5
    ///                 EmptyCommands() //6
    ///             }
    ///             Group {
    ///                 EmptyCommands() //7
    ///                 EmptyCommands() //8
    ///                 EmptyCommands() //9
    ///                 EmptyCommands() //10
    ///                 EmptyCommands() //11 - No error 😎
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameter content: A command content builder.
    @inlinable public init(@CommandsBuilder content: () -> Content) { }
}

