/// The properties of a label.
///
/// Use this structure to access the properties of a ``Label`` when
/// creating your own ``LabelStyle``s. A `LabelStyleConfiguration` has
/// two properties:
/// 1. ``LabelStyleConfiguration/title``: The ``Label``'s ``Text`` part.
/// 2. ``LabelStyleConfiguration/icon``: The ``Label``'s ``Image`` part.
///
/// A parameter of this type called `configuration` is passed to the
/// one required function of the ``LabelStyle`` protocol:
/// ``LabelStyle/makeBody(configuration:)``.
///
/// In the example below, we use the `configuration` parameter in the
/// ``LabelStyle/makeBody(configuration:)`` function to create
/// our own custom ``LabelStyle``
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
/// ```
///
/// We can then reuse that custom label style:
///
/// ```
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
/// ![A view containing a VStack with two labels, the first with the title
/// "Banana" and a yellow filled heart icon and the second with the title
/// "Apple" and a red filled heart icon.](custom-labelstyle-comparison.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LabelStyleConfiguration {

    /// A type-erased title view of a label.
    ///
    /// This is the type of a ``LabelStyleConfiguration``'s
    /// ``LabelStyleConfiguration/title`` property. You get access
    /// to a ``LabelStyleConfiguration`` called `configuration` when you
    /// implement the ``LabelStyle/makeBody(configuration:)`` function - the
    /// one requirement of
    /// conforming to the ``LabelStyle`` protocol.
    ///
    /// Here is an example of a custom ``LabelStyle``, which uses a
    /// `Title` property called `configuration.title`:
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
    /// ```
    ///
    /// We can then reuse that custom label style:
    ///
    /// ```
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
    /// ![Custom Label Style](custom-labelstyle-comparison.png)
    public struct Title {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A type-erased icon view of a label.
    ///
    /// This is the type of a ``LabelStyleConfiguration``'s
    /// ``LabelStyleConfiguration/icon`` property. You get access
    /// to a ``LabelStyleConfiguration`` called `configuration` when you
    /// implement the ``LabelStyle/makeBody(configuration:)`` function - the
    /// one requirement of
    /// conforming to the ``LabelStyle`` protocol.
    ///
    /// Here is an example of a custom ``LabelStyle``, which uses an
    /// `Icon` property called `configuration.icon`:
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
    /// ```
    ///
    /// We can then reuse that custom label style:
    ///
    /// ```
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
    /// ![Custom Label Style](custom-labelstyle-comparison.png)
    public struct Icon {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A description of the labeled item.
    ///
    /// This is one of two properties in a ``LabelStyleConfiguration``. You get access
    /// to a ``LabelStyleConfiguration`` called `configuration` when you
    /// implement the ``LabelStyle/makeBody(configuration:)`` function - the
    /// one requirement of
    /// conforming to the ``LabelStyle`` protocol.
    ///
    /// Here is an example of a custom ``LabelStyle``, which uses the
    /// `configuration.title` property:
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
    /// ```
    ///
    /// We can then reuse that custom label style:
    ///
    /// ```
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
    /// ![Custom Label Style](custom-labelstyle-comparison.png)
    public var title: LabelStyleConfiguration.Title { get }

    /// A symbolic representation of the labeled item.
    ///
    /// This is one of two properties in a ``LabelStyleConfiguration``. You get access
    /// to a ``LabelStyleConfiguration`` called `configuration` when you
    /// implement the ``LabelStyle/makeBody(configuration:)`` function - the
    /// one requirement of
    /// conforming to the ``LabelStyle`` protocol.
    ///
    /// Here is an example of a custom ``LabelStyle``, which uses the
    /// `configuration.icon` property:
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
    /// ```
    ///
    /// We can then reuse that custom label style:
    ///
    /// ```
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
    /// ![Custom Label Style](custom-labelstyle-comparison.png)
    public var icon: LabelStyleConfiguration.Icon { get }
}

