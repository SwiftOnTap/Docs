/// A collection of environment values propagated through a view hierarchy.
///
/// SwiftUI exposes a collection of values to your app's views in an
/// `EnvironmentValues` structure. To read a value from the structure,
/// declare a property using the ``Environment`` property wrapper and
/// specify the value's key path. For example, you can read the current locale:
///
///     @Environment(\.locale) var locale: Locale
///
/// Use the property you declare to dynamically control a view's layout.
/// SwiftUI automatically sets or updates many environment values, like
/// ``EnvironmentValues/pixelLength``, ``EnvironmentValues/scenePhase``, or
/// ``EnvironmentValues/locale``, based on device characteristics, system state,
/// or user settings. For others, like ``EnvironmentValues/lineLimit``, SwiftUI
/// provides a reasonable default value.
///
/// You can set or override some values using the ``View/environment(_:_:)``
/// view modifier:
///
///     struct ContentView: View {
///         var body: some View {
///             Text("This is some long, multiline text 💬, that just keeps going")
///                 .frame(width: 200)
///                 .environment(\.lineLimit, 2)
///         }
///     }
///
/// ![A white view containing text with a small frame width and an evironment modifier defining a line limit of two; the text displays as "This is some long,\n multiline text 💬, that ju...". ](enviornmentvalues-1.png)
///
/// The value that you set affects the environment for the view that you modify
/// --- including its descendants in the view hierarchy --- but only up to the
/// point where you apply a different environment modifier.
///
/// SwiftUI provides dedicated view modifiers for setting some values, which
/// typically makes your code easier to read. For example, rather than setting
/// the ``EnvironmentValues/lineLimit`` value directly, as in the previous
/// example, you should instead use the ``View/lineLimit(_:)`` modifier:
///
///     struct ContentView: View {
///         var body: some View {
///             Text("This is some long, multiline text 💬, that just keeps going")
///                 .frame(width: 200)
///                 .lineLimit(2)
///         }
///     }
///
/// ![A white view containing text with a small frame width and a line limit of two; the text displays as "This is some long,\n multiline text 💬, that ju...".](enviornmentvalues-1.png)
///
/// In some cases, using a dedicated view modifier provides additional
/// functionality. For example, you must use the
/// ``View/preferredColorScheme(_:)`` modifier rather than setting
/// ``EnvironmentValues/colorScheme`` directly to ensure that the new
/// value propagates up to the presenting container when presenting a view
/// like a popover:
///
///     struct ContentView: View {
///         @State var isPopped = false
///
///         var body: some View {
///             Button("Tap me for dark mode! 🌚🌙") { isPopped = true }
///                 .popover(isPresented: $isPopped) {
///                     Text("This is some dark 🌠🌉🌌 text")
///                         .preferredColorScheme(.dark)
///                 }
///         }
///     }
///
/// ![A gif displaying a white view with a default style button reading "Tap me for dark mode! 🌚🌙", which when clicked results in the appearance of a popover view with the preferred color scheme .dark.](eviron-vals-dark-mode.gif)
///
/// Create custom environment values by defining a type that
/// conforms to the ``EnvironmentKey`` protocol, and then extending the
/// environment values structure with a new property. Use your key to get and
/// set the value, and provide a dedicated modifier for clients to use when
/// setting the value:
///
///     private struct MyEnvironmentKey: EnvironmentKey {
///         static let defaultValue: String = "Default value"
///     }
///
///     extension EnvironmentValues {
///         var myCustomValue: String {
///             get { self[MyEnvironmentKey.self] }
///             set { self[MyEnvironmentKey.self] = newValue }
///         }
///     }
///
///     extension View {
///         func myCustomValue(_ myCustomValue: String) -> some View {
///             environment(\.myCustomValue, myCustomValue)
///         }
///     }
///
/// Clients of your value then access the value in the usual way, reading it
/// with the ``Environment`` property wrapper, and setting it with the
/// `myCustomValue` view modifier.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct EnvironmentValues : CustomStringConvertible {

    /// Creates an environment values instance.
    ///
    /// You don't typically create an instance of ``EnvironmentValues``
    /// directly. Doing so would provide access only to default values that
    /// don't update based on system settings or device characteristics.
    /// Instead, you rely on an environment values' instance
    /// that SwiftUI manages for you when you use the ``Environment``
    /// property wrapper and the ``View/environment(_:_:)`` view modifier.
    public init() { }

    /// Accesses the environment value associated with a custom key.
    ///
    /// Create custom environment values by defining a key
    /// that conforms to the ``EnvironmentKey`` protocol, and then using that
    /// key with the subscript operator of the ``EnvironmentValues`` structure
    /// to get and set a value for that key:
    ///
    ///     private struct MyEnvironmentKey: EnvironmentKey {
    ///         static let defaultValue: String = "Default value"
    ///     }
    ///
    ///     extension EnvironmentValues {
    ///         var myCustomValue: String {
    ///             get { self[MyEnvironmentKey.self] }
    ///             set { self[MyEnvironmentKey.self] = newValue }
    ///         }
    ///     }
    ///
    /// You use custom environment values the same way you use system-provided
    /// values, setting a value with the ``View/environment(_:_:)`` view
    /// modifier, and reading values with the ``Environment`` property wrapper.
    /// You can also provide a dedicated view modifier as a convenience for
    /// setting the value:
    ///
    ///     extension View {
    ///         func myCustomValue(_ myCustomValue: String) -> some View {
    ///             environment(\.myCustomValue, myCustomValue)
    ///         }
    ///     }
    ///
    public subscript<K>(key: K.Type) -> K.Value where K : EnvironmentKey

    /// A string that represents the contents of the environment values
    /// instance.
    public var description: String { get }
}

extension EnvironmentValues {

    /// A Boolean value that determines whether the view hierarchy has
    /// auto-correction enabled.
    ///
    /// When the value is `nil`, SwiftUI uses the system default. The default
    /// value is `nil`.
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
    @available(watchOS, unavailable)
    public var disableAutocorrection: Bool?
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The preferred size of the content.
    ///
    /// The default value is ``ContentSizeCategory/large``.
    public var sizeCategory: ContentSizeCategory
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The object space that you use to manipulate and track changes to
    /// the environment values.
    public var managedObjectContext: NSManagedObjectContext
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The undo manager used to register a view's undo operations.
    ///
    /// This value is `nil` when the environment represents a context that
    /// doesn't support undo and redo operations. You can skip registration of
    /// an undo operation when this value is `nil`.
    public var undoManager: UndoManager? { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The layout direction associated with the current environment.
    ///
    /// Use this value to determine whether the environment uses a left-to-right
    /// or right-to-left orientation.
    public var layoutDirection: LayoutDirection
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {

    /// The current redaction reasons applied to the view hierarchy.
    public var redactionReasons: RedactionReasons
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {

    /// The current phase of the scene.
    ///
    /// The system sets this value to provide an indication of the
    /// operational state of a scene or collection of scenes. The exact
    /// meaning depends on where you access the value. For more information,
    /// see ``ScenePhase``.
    public var scenePhase: ScenePhase
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The default minimum height of a row in a list.
    public var defaultMinListRowHeight: CGFloat

    /// The default minimum height of a header in a list.
    ///
    /// When this value is `nil`, the system chooses the appropriate height. The
    /// default is `nil`.
    public var defaultMinListHeaderHeight: CGFloat?
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// A Boolean value that indicates whether the view associated with this
    /// environment allows user interaction.
    ///
    /// The default value is `true`.
    public var isEnabled: Bool
}

extension EnvironmentValues {

    /// Returns whether the nearest focusable ancestor has focus.
    ///
    /// If there is no focusable ancestor, the value is `false`.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public var isFocused: Bool { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The default font of this environment.
    public var font: Font?

    /// The display scale of this environment.
    public var displayScale: CGFloat

    /// The image scale for this environment.
    @available(macOS 11.0, *)
    public var imageScale: Image.Scale

    /// The size of a pixel on the screen.
    ///
    /// This value is equal to `1` divided by
    /// ``EnvironmentValues/displayScale``.
    public var pixelLength: CGFloat { get }

    /// The font weight to apply to text.
    ///
    /// This value reflects the value of the Bold Text display setting found in
    /// the Accessibility settings.
    public var legibilityWeight: LegibilityWeight?

    /// The current locale that views should use.
    public var locale: Locale

    /// The current calendar that views should use when handling dates.
    public var calendar: Calendar

    /// The current time zone that views should use when handling dates.
    public var timeZone: TimeZone

    /// The color scheme of this environment.
    ///
    /// When writing custom drawing code that depends on the current color
    /// scheme, you should also consider the
    /// ``EnvironmentValues/colorSchemeContrast`` property. You can specify
    /// images and colors in asset catalogs according to either the
    /// `ColorScheme/light` or ``ColorScheme/dark`` color scheme, as well as
    /// standard or increased contrast. The correct image or color displays
    /// automatically for the current environment.
    ///
    /// You only need to check ``colorScheme`` and
    /// ``EnvironmentValues/colorSchemeContrast`` for custom drawing if the
    /// differences go beyond images and colors.
    ///
    /// Setting the ``colorScheme`` environment value directly is an advanced use
    /// case, as it changes the color scheme of the contained views but *not* of
    /// the container. Instead, consider using the
    /// ``View/preferredColorScheme(_:)`` modifier, which propagates to the
    /// presentation containing the view.
    public var colorScheme: ColorScheme

    /// The contrast associated with the color scheme of this environment.
    public var colorSchemeContrast: ColorSchemeContrast { get }
}

@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {

    /// The horizontal size class of this environment.
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var horizontalSizeClass: UserInterfaceSizeClass?

    /// The vertical size class of this environment.
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var verticalSizeClass: UserInterfaceSizeClass?
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// A Boolean value that indicates whether the user has enabled an assistive
    /// technology.
    public var accessibilityEnabled: Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// Whether the system preference for Differentiate without Color is enabled.
    ///
    /// If this is true, UI should not convey information using color alone
    /// and instead should use shapes or glyphs to convey information.
    public var accessibilityDifferentiateWithoutColor: Bool { get }

    /// Whether the system preference for Reduce Transparency is enabled.
    ///
    /// If this property's value is true, UI (mainly window) backgrounds should
    /// not be semi-transparent; they should be opaque.
    public var accessibilityReduceTransparency: Bool { get }

    /// Whether the system preference for Reduce Motion is enabled.
    ///
    /// If this property's value is true, UI should avoid large animations,
    /// especially those that simulate the third dimension.
    public var accessibilityReduceMotion: Bool { get }

    /// Whether the system preference for Invert Colors is enabled.
    ///
    /// If this property's value is true then the display will be inverted.
    /// In these cases it may be needed for UI drawing to be adjusted to in
    /// order to display optimally when inverted.
    public var accessibilityInvertColors: Bool { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {

    /// Whether the system preference for Show Button Shapes is enabled.
    ///
    /// If this property's value is true, interactive custom controls
    /// such as buttons should be drawn in such a way that their edges
    /// and borders are clearly visible.
    public var accessibilityShowButtonShapes: Bool { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {

    /// Opens a URL using the appropriate system service.
    public var openURL: OpenURLAction { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// A value that indicates how text instance aligns its lines when the
    /// content wraps or contains newlines.
    ///
    /// Use alignment parameters on a parent view to align ``Text`` with respect
    /// to its parent. Because the horizontal bounds of ``TextField`` never
    /// exceed its graphical extent, this value has little to no effect on
    /// single-line text.
    public var multilineTextAlignment: TextAlignment

    /// A value that indicates how the layout truncates the last line of text to
    /// fit into the available space.
    ///
    /// The default value is ``Text/TruncationMode/tail``.
    public var truncationMode: Text.TruncationMode

    /// The distance in points between the bottom of one line fragment and the
    /// top of the next.
    ///
    /// This value is always nonnegative.
    public var lineSpacing: CGFloat

    /// A Boolean value that indicates whether inter-character spacing should
    /// tighten to fit the text into the available space.
    ///
    /// The default value is `false`.
    public var allowsTightening: Bool

    /// The maximum number of lines that text can occupy in a view.
    ///
    /// The maximum number of lines is `1` if the value is less than `1`. If the
    /// value is `nil`, the text uses as many lines as required. The default is
    /// `nil`.
    public var lineLimit: Int?

    /// The minimum permissible proportion to shrink the font size to fit
    /// the text into the available space.
    ///
    /// In the example below, a label with a `minimumScaleFactor` of `0.5`
    /// draws its text in a font size as small as half of the actual font if
    /// needed to fit into the space next to the text input field:
    ///
    ///     HStack {
    ///         Text("This is a very long label:")
    ///             .lineLimit(1)
    ///             .minimumScaleFactor(0.5)
    ///         TextField("My Long Text Field", text: $myTextField)
    ///             .frame(width: 250, height: 50, alignment: .center)
    ///     }
    ///
    /// ![A screenshot showing the effects of setting the minimumScaleFactor on
    ///   the text in a view](SwiftUI-view-minimumScaleFactor.png)
    ///
    /// You can set the minimum scale factor to any value greater than `0` and
    /// less than or equal to `1`. The default value is `1`.
    ///
    /// SwiftUI uses this value to shrink text that doesn't fit in a view when
    /// it's okay to shrink the text. For example, a label with a
    /// `minimumScaleFactor` of `0.5` draws its text in a font size as small as
    /// half the actual font if needed.
    public var minimumScaleFactor: CGFloat

    /// A stylistic override to transform the case of ``Text`` when displayed,
    /// using the environment's locale.
    ///
    /// The default value is `nil`, displaying the ``Text`` without any case
    /// changes.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public var textCase: Text.Case?
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {

    /// The mode indicating whether the user can edit the contents of a view
    /// associated with this environment.
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public var editMode: Binding<EditMode>?
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// A binding to the current presentation mode of the view associated with
    /// this environment.
    ///
    /// Use this environment value to programmatically interact with the
    /// view currently presented.
    ///
    /// This is useful for 4 types of views:
    /// 1. ``NavigationView``
    /// 2. ``View/sheet(isPresented:onDismiss:content:)``
    /// 3. ``View/popover(isPresented:attachmentAnchor:arrowEdge:content:)``
    /// 4. ``View/fullScreenCover(isPresented:onDismiss:content:)``
    ///
    /// See ``Environment`` for more on environment values and how to use
    /// the property wrapper.
    ///
    /// While this is a ``Binding`` environment value, most often
    /// the wrapped value will be accessed. The wrapped value
    /// is of type ``PresentatinMode``. See that structure for more info
    /// on its properties.
    ///
    /// Below is a simple example of programmatically dismissing a
    /// sheet using this environment value.
    ///
    ///     struct ExampleView: View {
    ///         @State private var showSheet = false
    ///
    ///         var body: some View {
    ///             Button("Open sesame 📬") {
    ///                 showSheet = true
    ///             }
    ///             .sheet(isPresented: $showSheet,
    ///                    onDismiss: { print("dismissed!") },
    ///                    content: { ExampleSheet() })
    ///         }
    ///     }
    ///
    ///     struct ExampleSheet: View {
    ///         @Environment(\.presentationMode) var presentationMode
    ///
    ///         var body: some View {
    ///             Button("CLOSE 📪") {
    ///                 presentationMode.wrappedValue.dismiss()
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a view with a button reading "Open sesame 📬" which
    /// triggers the presentation of a sheet with a button reading "CLOSE 📪";
    /// upon dismissal of the sheet with the close button, the console prints
    /// "dismissed!" and the sheet slides back down until hidden.](eviron-vals-presentation-mode.gif)
    ///
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public var presentationMode: Binding<PresentationMode> { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EnvironmentValues {

    /// The symbol variant to use in this environment.
    ///
    /// You set this environment value indirectly by using the
    /// ``View/symbolVariant(_:)`` view modifier. However, you access the
    /// environment variable directly using the ``View/environment(_:_:)``
    /// modifier. Do this when you want to use the ``SymbolVariants/none``
    /// variant to ignore the value that's already in the environment:
    ///
    ///     HStack {
    ///         Image(systemName: "heart")
    ///         Image(systemName: "heart")
    ///             .environment(\.symbolVariants, .none)
    ///     }
    ///     .symbolVariant(.fill)
    ///
    /// ![A screenshot of two heart symbols. The first is filled while the
    /// second is outlined.](SymbolVariants-none-1)
    public var symbolVariants: SymbolVariants
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EnvironmentValues {

    /// The prominence to apply to section headers within a view.
    ///
    /// The default is ``Prominence/standard``.
    public var headerProminence: Prominence
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {

    /// The menu indicator visibility to apply to controls within a view.
    public var menuIndicatorVisibility: Visibility
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EnvironmentValues {

    /// A Boolean value that indicates whether the VoiceOver screen reader is in use.
    ///
    /// The state changes as the user turns on or off the VoiceOver screen reader.
    public var accessibilityVoiceOverEnabled: Bool { get }

    /// A Boolean value that indicates whether the Switch Control motor accessibility feature is in use.
    ///
    /// The state changes as the user turns on or off the Switch Control feature.
    public var accessibilitySwitchControlEnabled: Bool { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EnvironmentValues {

    /// The current Dynamic Type size.
    ///
    /// This value changes as the user's chosen Dynamic Type size changes. The
    /// default value is device-dependent.
    ///
    /// When limiting the Dynamic Type size, consider if adding a
    /// large content view with ``View/accessibilityShowsLargeContentViewer()``
    /// would be appropriate.
    ///
    /// On macOS, this value cannot be changed by users and does not affect the
    /// text size.
    public var dynamicTypeSize: DynamicTypeSize
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EnvironmentValues {

    /// The current symbol rendering mode, or `nil` denoting that the
    /// mode is picked automatically using the current image and
    /// foreground style as parameters.
    public var symbolRenderingMode: SymbolRenderingMode?
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EnvironmentValues {

    /// A Boolean value that indicates when the user is searching.
    ///
    /// You can read this value like any of the other ``EnvironmentValues``,
    /// by creating a property with the ``Environment`` property wrapper:
    ///
    ///     @Environment(\.isSearching) private var isSearching
    ///
    /// Get the value to find out when the user interacts with a search
    /// field that's produced by one of the searchable modifiers, like
    /// ``View/searchable(text:placement:prompt:)-18a8f``:
    ///
    ///     struct SearchingExample: View {
    ///         @State private var text = ""
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 SearchedView()
    ///                     .searchable(text: $text)
    ///             }
    ///         }
    ///     }
    ///
    ///     struct SearchedView: View {
    ///         @Environment(\.isSearching) private var isSearching
    ///
    ///         var body: some View {
    ///             Text(isSearching ? "Searching!" : "Not searching.")
    ///         }
    ///     }
    ///
    /// When the user first taps or clicks in a search field, the
    /// `isSearching` property becomes `true`. When the user cancels the
    /// search operation, the property becomes `false`. To programmatically
    /// set the value to `false` and dismiss the search operation, use
    /// ``EnvironmentValues/dismissSearch``.
    public var isSearching: Bool { get }

    /// An action that ends the current search interaction.
    ///
    /// Use this environment value to get the ``DismissSearchAction`` instance
    /// for the current ``Environment``. Then call the instance to dismiss
    /// the current search interaction. You call the instance directly because
    /// it defines a ``DismissSearchAction/callAsFunction()`` method that Swift
    /// calls when you call the instance.
    ///
    /// When you dismiss search, SwiftUI:
    ///
    /// * Sets ``EnvironmentValues/isSearching`` to `false`.
    /// * Clears any text from the search field.
    /// * Removes focus from the search field.
    ///
    /// > Note: Calling this instance has no effect if the user isn't
    /// interacting with a search field.
    ///
    /// Use this action to dismiss a search operation based on
    /// another user interaction. For example, consider a searchable
    /// view with a ``Button`` that presents more information about the first
    /// matching item from a collection:
    ///
    ///     struct ContentView: View {
    ///         @State private var text = ""
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 SearchResults(searchText: text)
    ///                     .searchable(text: $text)
    ///             }
    ///         }
    ///     }
    ///
    ///     private struct SearchResults: View {
    ///         let searchText: String
    ///
    ///         let items = ["a", "b", "c"]
    ///         var filteredItems: [String] { items.filter { $0 == searchText.lowercased() } }
    ///
    ///         @State private var isPresented = false
    ///
    ///         var body: some View {
    ///             if let item = filteredItems.first {
    ///                 Button("Details about \(item)") {
    ///                     isPresented = true
    ///                 }
    ///                 .sheet(isPresented: $isPresented) {
    ///                     NavigationView {
    ///                         DetailView(item: item)
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// The button becomes visible only after the user enters search text
    /// that produces a match. When the user taps the button, SwiftUI shows
    /// a sheet that provides more information about the item, including
    /// an Add button for adding the item to a stored list of items:
    ///
    ///     private struct DetailView: View {
    ///         let item: String
    ///
    ///         @Environment(\.dismiss) private var dismiss
    ///         @Environment(\.dismissSearch) private var dismissSearch
    ///
    ///         var body: some View {
    ///             Text("Information about \(item).")
    ///                 .toolbar {
    ///                     Button("Add") {
    ///                         // Store the item here...
    ///
    ///                         dismiss()
    ///                         dismissSearch()
    ///                     }
    ///                 }
    ///         }
    ///     }
    ///
    /// The user can dismiss the sheet by dragging it down, effectively
    /// canceling the operation, leaving the in-progress search interaction
    /// intact. Alternatively, the user can tap the Add button to store the
    /// item. Because the user is likely to be done with both the detail view
    /// and the search interaction at this point, the button's closure also
    /// uses the ``EnvironmentValues/dismiss`` property to dismiss the sheet,
    /// and the `dismissSearch` property to reset the search field.
    public var dismissSearch: DismissSearchAction { get }

    /// The current placement of search suggestions.
    ///
    /// Search suggestions render based on the platform and surrounding context
    /// in which you place the searchable modifier containing suggestions.
    /// You can render search suggestions in two ways:
    ///
    /// * In a menu attached to the search field.
    /// * Inline with the main content of the app.
    ///
    /// You find the current search suggestion placement by querying the
    /// ``EnvironmentValues/searchSuggestionsPlacement`` in your
    /// search suggestions.
    ///
    ///     enum FruitSuggestion: String, Identifiable {
    ///         case apple, banana, orange
    ///         var id: Self { self }
    ///     }
    ///
    ///     @State private var text: String = ""
    ///     @State private var suggestions: [FruitSuggestion] = []
    ///
    ///     var body: some View {
    ///         MainContent()
    ///             .searchable(text: $text) {
    ///                 FruitSuggestions(suggestions: suggestions)
    ///             }
    ///     }
    ///
    ///     struct FruitSuggestions: View {
    ///         var suggestions: [FruitSuggestion]
    ///
    ///         @Environment(\.searchSuggestionsPlacement)
    ///         private var placement
    ///
    ///         var body: some View {
    ///             if shouldRender {
    ///                 ForEach(suggestions) { suggestion in
    ///                     Text(suggestion.rawValue.capitalized)
    ///                         .searchCompletion(suggestion.rawValue)
    ///                 }
    ///             }
    ///         }
    ///
    ///         var shouldRender: Bool {
    ///             #if os(iOS)
    ///             placement == .menu
    ///             #else
    ///             true
    ///             #endif
    ///         }
    ///     }
    ///
    /// In the above example, search suggestions only render in iOS
    /// if the searchable modifier displays them in a menu. You might want
    /// to do this to render suggestions in your own list alongside
    /// your own search results when they would render in a list.
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public var searchSuggestionsPlacement: SearchSuggestionsPlacement { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EnvironmentValues {

    /// A refresh action stored in a view's environment.
    ///
    /// When this environment value contains an instance of the
    /// ``RefreshAction`` structure, certain built-in views in the corresponding
    /// ``Environment`` begin offering a refresh capability. They apply the
    /// instance's handler to any refresh operation that the user initiates.
    /// By default, the environment value is `nil`, but you can use the
    /// ``View/refreshable(action:)`` modifier to create and store a new
    /// refresh action that uses the handler that you specify:
    ///
    ///     List(mailbox.conversations) { conversation in
    ///         ConversationCell(conversation)
    ///     }
    ///     .refreshable {
    ///         await mailbox.fetch()
    ///     }
    ///
    /// On iOS and iPadOS, the ``List`` in the example above offers a
    /// pull to refresh gesture because it detects the refresh action. When
    /// the user drags the list down and releases, the list calls the action's
    /// handler. Because SwiftUI declares the handler as asynchronous, it can
    /// safely make long-running asynchronous calls, like fetching network data.
    ///
    /// ### Refreshing custom views
    ///
    /// You can also offer refresh capability in your custom views.
    /// Read the `refresh` environment value to get the ``RefreshAction``
    /// instance for a given ``Environment``. If you find
    /// a non-`nil` value, change your view's appearance or behavior to offer
    /// the refresh to the user, and call the instance to conduct the
    /// refresh. You can call the refresh instance directly because it defines
    /// a ``RefreshAction/callAsFunction()`` method that Swift calls
    /// when you call the instance:
    ///
    ///     struct RefreshableView: View {
    ///         @Environment(\.refresh) private var refresh
    ///
    ///         var body: some View {
    ///             Button("Refresh") {
    ///                 Task {
    ///                     await refresh?()
    ///                 }
    ///             }
    ///             .disabled(refresh == nil)
    ///         }
    ///     }
    ///
    /// Be sure to call the handler asynchronously by preceding it
    /// with `await`. Because the call is asynchronous, you can use
    /// its lifetime to indicate progress to the user. For example,
    /// you can reveal an indeterminate ``ProgressView`` before
    /// calling the handler, and hide it when the handler completes.
    ///
    /// If your code isn't already in an asynchronous context, create a
    /// <doc://com.apple.documentation/documentation/Swift/Task> for the
    /// method to run in. If you do this, consider adding a way for the
    /// user to cancel the task. For more information, see
    /// [Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)
    /// in *The Swift Programming Language*.
    public var refresh: RefreshAction? { get }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {

    /// The keyboard shortcut that buttons in this environment will be triggered
    /// with.
    ///
    /// This is particularly useful in button styles when a button's appearance
    /// depends on the shortcut associated with it. On macOS, for example, when
    /// a button is bound to the Return key, it is typically drawn with a
    /// special emphasis. This happens automatically when using the built-in
    /// button styles, and can be implemented manually in custom styles using
    /// this environment key:
    ///
    ///     private struct MyButtonStyle: ButtonStyle {
    ///         @Environment(\.keyboardShortcut)
    ///         private var shortcut: KeyboardShortcut?
    ///
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             let labelFont = Font.body
    ///                 .weight(shortcut == .defaultAction ? .bold : .regular)
    ///             configuration.label
    ///                 .font(labelFont)
    ///         }
    ///     }
    ///
    /// If no keyboard shortcut has been applied to the view or its ancestor,
    /// then the environment value will be `nil`.
    public var keyboardShortcut: KeyboardShortcut? { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EnvironmentValues {

    /// An action that dismisses the current presentation.
    ///
    /// Use this environment value to get the ``DismissAction`` instance
    /// for the current ``Environment``. Then call the instance
    /// to perform the dismissal. You call the instance directly because
    /// it defines a ``DismissAction/callAsFunction()``
    /// method that Swift calls when you call the instance.
    ///
    /// For example, you can create a button that calls the ``DismissAction``:
    ///
    ///     private struct SheetContents: View {
    ///         @Environment(\.dismiss) private var dismiss
    ///
    ///         var body: some View {
    ///             Button("Done") {
    ///                 dismiss()
    ///             }
    ///         }
    ///     }
    ///
    /// If you present the `SheetContents` view in a sheet, the user can dismiss
    /// the sheet by tapping or clicking the sheet's button:
    ///
    ///     private struct DetailView: View {
    ///         @State private var isSheetPresented = false
    ///
    ///         var body: some View {
    ///             Button("Show Sheet") {
    ///                 isSheetPresented = true
    ///             }
    ///             .sheet(isPresented: $isSheetPresented) {
    ///                 SheetContents()
    ///             }
    ///         }
    ///     }
    ///
    /// Be sure that you define the action in the appropriate environment.
    /// For example, don't reorganize the `DetailView` in the example above
    /// so that it creates the `dismiss` property and calls it from the
    /// ``View/sheet(item:onDismiss:content:)`` view modifier's `content`
    /// closure:
    ///
    ///     private struct DetailView: View {
    ///         @State private var isSheetPresented = false
    ///         @Environment(\.dismiss) private var dismiss // Applies to DetailView.
    ///
    ///         var body: some View {
    ///             Button("Show Sheet") {
    ///                 isSheetPresented = true
    ///             }
    ///             .sheet(isPresented: $isSheetPresented) {
    ///                 Button("Done") {
    ///                     dismiss() // Fails to dismiss the sheet.
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// If you do this, the sheet fails to dismiss because the action applies
    /// to the environment where you declared it, which is that of the detail
    /// view, rather than the sheet. In fact, if you've presented the detail
    /// view in a ``NavigationView``, the dismissal pops the detail view
    /// the navigation stack.
    ///
    /// The dismiss action has no effect on a view that isn't currently
    /// presented. If you need to query whether SwiftUI is currently presenting
    /// a view, read the ``EnvironmentValues/isPresented`` environment value.
    public var dismiss: DismissAction { get }

    /// A Boolean value that indicates whether the view associated with this
    /// environment is currently presented.
    ///
    /// You can read this value like any of the other ``EnvironmentValues``
    /// by creating a property with the ``Environment`` property wrapper:
    ///
    ///     @Environment(\.isPresented) private var isPresented
    ///
    /// Read the value inside a view if you need to know when SwiftUI
    /// presents that view. For example, you can take an action when SwiftUI
    /// presents a view by using the ``View/onChange(of:perform:)``
    /// modifier:
    ///
    ///     .onChange(of: isPresented) { isPresented in
    ///         if isPresented {
    ///             // Do something when first presented.
    ///         }
    ///     }
    ///
    /// This behaves differently than ``View/onAppear(perform:)``, which
    /// SwiftUI can call more than once for a given presentation, like
    /// when you navigate back to a view that's already in the
    /// navigation hierarchy.
    ///
    /// To dismiss the currently presented view, use
    /// ``EnvironmentValues/dismiss``.
    public var isPresented: Bool { get }
}

@available(iOS 15.0, macOS 10.15, watchOS 9.0, *)
@available(tvOS, unavailable)
extension EnvironmentValues {

    /// The size to apply to controls within a view.
    ///
    /// The default is ``ControlSize/regular``.
    @available(tvOS, unavailable)
    public var controlSize: ControlSize
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EnvironmentValues {

    /// The material underneath the current view.
    ///
    /// This value is `nil` if the current background isn't one of the standard
    /// materials. If you set a material, the standard content styles enable
    /// their vibrant rendering modes.
    ///
    /// You set this value by calling one of the background modifiers that takes
    /// a ``ShapeStyle``, like ``View/background(_:ignoresSafeAreaEdges:)``
    /// or ``View/background(_:in:fillStyle:)-89n7j``, and passing in a
    /// ``Material``. You can also set the value manually, using
    /// `nil` to disable vibrant rendering, or a ``Material`` instance to
    /// enable the vibrancy style associated with the specified material.
    public var backgroundMaterial: Material?
}

