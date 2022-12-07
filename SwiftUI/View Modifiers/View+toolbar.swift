@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Populates the toolbar or navigation bar with items
    /// whose content is the specified views.
    ///
    /// - Parameter content: The views representing the content of the toolbar.
    public func toolbar<Content>(@ViewBuilder content: () -> Content) -> some View where Content : View { }


    /// Populates the toolbar or navigation bar.
    ///
    /// - Parameters:
    ///   - items: The items representing the content of the toolbar.
    ///
    /// ``View/toolbar(content:)-64493`` populates the toolbar or navigation bar. For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         NavigationView {
    ///             Text("Hello, World!")
    ///                 .toolbar {
    ///                     ToolbarItem(id: "bananas") {
    ///                         Text("🍌🍌")
    ///                     }
    ///
    ///                     ToolbarItem(id: "apples") {
    ///                         Text("🍏🍏")
    ///                     }
    ///
    ///                     ToolbarItem(id: "peaches") {
    ///                         Text("🍑🍑")
    ///                     }
    ///                 }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A navigation view displaying the text "Hello, World!" and a toolbar along the top edge of the frame containing the right-aligned item "🍌🍌".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/toolbar-example-1.png)
    ///
    /// ### Aligning a toolbar item
    ///
    /// Think of a toolbar in terms of spacers and items.
    ///
    /// For example, this is how a single toolbar item is aligned to the right:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         NavigationView {
    ///             Text("Hello, World!")
    ///                 .toolbar {
    ///                     ToolbarItem(placement: .bottomBar) {
    ///                         Spacer()
    ///                     }
    ///
    ///                     ToolbarItem(placement: .bottomBar) {
    ///                         Text("🍌🍌")
    ///                     }
    ///                 }
    ///         }
    ///     }
    /// }
    /// ```
    /// ![A navigation view displaying the text "Hello, World!" and a gray toolbar along the botton of the frame containing the right-aligned item "🍌🍌".](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/toolbar-example-2.png)
    ///
    public func toolbar<Content>(@ToolbarContentBuilder content: () -> Content) -> some View where Content : ToolbarContent { }


    /// Populates the toolbar or navigation bar.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for this toolbar.
    ///   - content: The content representing the content of the toolbar.
    ///
    /// For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         NavigationView {
    ///             Text("Hello, World!")
    ///                 .toolbar(id: "fruitItems") {
    ///                     ToolbarItem(id: "bananas") {
    ///                         Text("🍌🍌")
    ///                     }
    ///                 }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![toolbar Example 3](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/toolbar-example-3.png)
    ///
    public func toolbar<Content>(id: String, @ToolbarContentBuilder content: () -> Content) -> some View where Content : CustomizableToolbarContent { }

}

