/// A standard label, consisting of an icon with a title.
///
/// One of the most common and recognizable user interface components is the
/// combination of an icon and a label. This idiom appears across many kinds of
/// apps and shows up in collections, lists, menus of action items, and
/// disclosable lists, just to name a few.
///
/// You create a label, in its simplest form, by providing a title and the name
/// of an image, such as an icon from the
/// [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/)
/// collection:
///
/// ```
/// struct BoltView: View {
///     var body: some View {
///         Label("Lightning", systemImage: "bolt.fill")
///     }
/// }
/// ```
///
/// ![A view containing a label with the title "Lightning" preceded by a
/// black-filled lightning bolt symbol from the SF symbols collection.](AAF70423-43CB-4A9F-8640-C9485C5EF390.png)
///
/// You can also apply styles to labels in several ways. In the case of dynamic
/// changes to the view after device rotation or change to a window size you
/// might want to show only the text portion of the label using the title-only
/// label style:
///
/// ```
/// struct TitleOnlyBoltView: View {
///     var body: some View {
///         Label("Lightning", systemImage: "bolt.fill")
///             .labelStyle(TitleOnlyLabelStyle())
///     }
/// }
/// ```
///
/// ![A view containing a title only label with the title "Lightning".](922B50FC-5FEC-4F61-A07E-AB579F1B726E.png)
///
/// Conversely, there's also an icon-only label style:
///
/// ```
/// struct IconOnlyBoltView: View {
///     var body: some View {
///     Label("Lightning", systemImage: "bolt.fill")
///         .labelStyle(IconOnlyLabelStyle())
///     }
/// }
/// ```
///
/// ![A view containing an icon only label with no visible title and a
/// black-filled lightning bolt symbol from the SF symbols collection.](D12AC27C-00DC-4F00-A4F1-B72735084CA4.png)
///
/// You can also create a customized label style by modifying an existing
/// style; this example adds a red border to the default label style:
///
/// ```
/// struct RedBorderedLabelStyle: LabelStyle {
///     func makeBody(configuration: Configuration) -> some View {
///         Label(configuration)
///             .padding()
///             .border(Color.red)
///     }
/// }
///
/// struct RedBorderedBoltView: View {
///     var body: some View {
///         Label("Lightning", systemImage: "bolt.fill")
///             .labelStyle(RedBorderedLabelStyle())
///     }
/// }
/// ```
///
/// ![A view containing a bordered label with the title "Lightning" preceded by a
/// black-filled lightning bold symbol from the SF symbols collection surrounded
/// red border with padding between.](491B486D-0E3C-450A-9FD3-74BB847D19FE.png)
///
/// For more extensive customization or to create a completely new label style,
/// you'll need to adopt the ``LabelStyle`` protocol and implement a
/// ``LabelStyleConfiguration`` for the new style.
///
/// To apply a common label style to a group of labels, apply the style
/// to the view hierarchy that contains the labels:
///
/// ```
/// struct WeatherView: View {
///     var body: some View {
///         VStack {
///             Label("Rain", systemImage: "cloud.rain")
///             Label("Snow", systemImage: "snow")
///             Label("Sun", systemImage: "sun.max")
///         }
///         .labelStyle(IconOnlyLabelStyle())
///     }
/// }
/// ```
///
/// ![A view containing a VStack with three icon only labels, each with a different
/// icon from the SF symbols collection: a rain cloud, a snowflake, and a shining sun.](9F864CBF-1FA1-4989-9F8B-8ED0515E1C56.png)
///
/// It's also possible to make labels using views to compose the label's icon
/// programmatically, rather than using a pre-made image. In this example, the
/// icon portion of the label uses a filled ``Circle`` overlaid
/// with the user's initials:
///
/// ```
/// struct CustomPersonView: View {
///     var body: some View {
///         Label {
///             Text("Aaron")
///                 .font(.body)
///                 .foregroundColor(.primary)
///             Text("GOAT")
///                 .font(.subheadline)
///                 .foregroundColor(.secondary)
///         } icon: {
///             Circle()
///                 .fill(Color.purple)
///                 .frame(width: 44, height: 44, alignment: .center)
///                 .overlay(Text("AG"))
///         }
///     }
/// }
/// ```
///
/// ![A view containing a label with two text views, "Aaron" with body style font and
/// primary coloring and "Goat" with subheadline style font and secondary coloring;
/// the label icon is a purple-filled circle with a width of 44, hieght of 44,
/// center alignmnet, and an overlay with the text "AG".the former.](BFE30CE7-C088-4B03-A564-0A1B8D272BCF.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct Label<Title, Icon> : View where Title : View, Icon : View {

    /// Creates a label with a with a view title and a view icon.
    ///
    /// ```
    /// struct EverythingView: View {
    ///     var body: some View {
    ///         Label {
    ///             Text("Meaning of life")
    ///                 .border(Color.green)
    ///         } icon: {
    ///             Image(systemName: "42.circle")
    ///                 .foregroundColor(.green)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing label with the text "Meaning of life" with a green
    /// border and a green system icon rendering a 42 within a circle to left
    /// of it.](label-title-icon-ex.png)
    ///
    /// - Parameters:
    ///   - title: A view builder for the label's title view.
    ///   - icon: A view builder for the label's icon view.
    public init(@ViewBuilder title: () -> Title, @ViewBuilder icon: () -> Icon) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Label where Title == Text, Icon == Image {

    /// Creates a label with a localized string title and image name icon.
    ///
    /// ```
    /// struct EverythingView: View {
    ///     var body: some View {
    ///         Label(LocalizedStringKey("Meaning of life"),
    ///               image: "earth")
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///    - titleKey: A title generated from a localized string.
    ///    - image: The name of the image resource to lookup.
    public init(_ titleKey: LocalizedStringKey, image name: String) { }

    /// Creates a label with a localized string title and system image name icon.
    ///
    /// ```
    /// struct EverythingView: View {
    ///     var body: some View {
    ///         Label(LocalizedStringKey("Meaning of life"),
    ///               systemImage: "42.circle")
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///    - titleKey: A title generated from a localized string.
    ///    - systemImage: The name of the image resource to lookup.
    public init(_ titleKey: LocalizedStringKey, systemImage name: String) { }

    /// Creates a label with a string title and image name icon.
    ///
    /// ```
    /// struct EverythingView: View {
    ///     var body: some View {
    ///         Label("Meaning of life", image: "earth")
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///    - title: A string to used as the label's title.
    ///    - image: The name of the image resource to lookup.
    public init<S>(_ title: S, image name: String) where S : StringProtocol { }

    /// Creates a label with a string title and system image name icon.
    ///
    /// ```
    /// struct EverythingView: View {
    ///     var body: some View {
    ///         Label("Meaning of life", systemImage: "42.circle")
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///    - title: A string to used as the label's title.
    ///    - systemImage: The name of the image resource to lookup.
    public init<S>(_ title: S, systemImage name: String) where S : StringProtocol { }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Label where Title == LabelStyleConfiguration.Title, Icon == LabelStyleConfiguration.Icon {

    /// Creates a label representing the configuration of a style.
    ///
    /// You can use this initializer within the ``LabelStyle/makeBody(configuration:)``
    /// method of a ``LabelStyle`` instance to create an instance of the label
    /// that's being styled. This is useful for custom label styles that only
    /// wish to modify the current style, as opposed to implementing a brand new
    /// style.
    ///
    /// For example, the following style adds a red border around the label,
    /// but otherwise preserves the current style:
    ///
    /// ```
    /// struct RedBorderedLabelStyle: LabelStyle {
    ///     func makeBody(configuration: Configuration) -> some View {
    ///         Label(configuration)
    ///             .border(Color.red)
    ///     }
    /// }
    ///
    /// struct RedBorderedBoltView: View {
    ///     var body: some View {
    ///         Label("Lightning", systemImage: "bolt.fill")
    ///             .labelStyle(RedBorderedLabelStyle())
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a bordered label with the title "Lightning" preceded by a
    /// black-filled lightning bold symbol from the SF symbols collection surrounded
    /// red border with padding between.](18.04.32.png)
    ///
    /// - Parameter configuration: The label style to use.
    public init(_ configuration: LabelStyleConfiguration) { }
}
