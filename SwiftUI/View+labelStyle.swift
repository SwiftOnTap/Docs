@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Sets the style for labels within this view.
    ///
    /// Use this modifier to set a specific style for all labels within a view.
    ///
    /// For example, if we create a custom label style called
    /// `MyLabelStyle`, we can apply it to a label using this modifier:
    ///
    /// ```
    /// struct MyLabelStyle: LabelStyle {
    ///     let color: Color
    ///
    ///     func makeBody(configuration: Configuration) -> some View {
    ///         VStack {
    ///             configuration.title
    ///             configuration.icon
    ///                 .foregroundColor(color)
    ///         }
    ///     }
    /// }
    ///
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Label("Banana", systemImage: "suit.heart.fill")
    ///                 .labelStyle(MyLabelStyle(color: .yellow))
    ///             Label("Apple", systemImage: "suit.heart.fill")
    ///                 .labelStyle(MyLabelStyle(color: .red))
    ///         }
    ///         .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two labels in a VStack with a custom label
    /// style applied. The labels read Banana and Apple and each has a heart
    /// icon beneath it, the color of which is dictated by the custom label style.](custom-labelstyle-comparison.png)
    ///
    /// This modifier also accepts the default label styles that ship with
    /// SwiftUI:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Label("Banana", systemImage: "suit.heart.fill")
    ///                 .labelStyle(DefaultLabelStyle())
    ///             Label("Banana", systemImage: "suit.heart.fill")
    ///                 .labelStyle(IconOnlyLabelStyle())
    ///             Label("Banana", systemImage: "suit.heart.fill")
    ///                 .labelStyle(TitleOnlyLabelStyle())
    ///         }
    ///         .font(.title)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying three labels reading "Banana" in a VStack with label
    /// styles applied. The first uses DefaultLabelStyle which pairs a black
    /// heart icon to the left of the text, while the second uses IconOnlyLabelStyle
    /// which shows only the heart, and the third uses TitleOnlyLabelStyle,
    /// showing the text by itself.](default-labelstyle-comparison.png)
    ///
    /// - Note: Creating label styles can be complex. See ``LabelStyle``
    /// for more.
    ///
    /// - Parameter style: The label style to use in the view hierarchy.
    ///
    public func labelStyle<S>(_ style: S) -> some View where S : LabelStyle { }

}

