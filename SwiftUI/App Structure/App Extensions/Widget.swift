/// The configuration and content of a widget to display on the Home screen or
/// in Notification Center.
///
/// Widgets show glanceable and relevant content from your app right on the iOS
/// Home screen or in Notification Center on macOS. Users can add, configure, and
/// arrange widgets to suit their individual needs. You can provide multiple
/// types of widgets, each presenting a specific kind of information. When
/// users want more information, like to read the full article for a headline
/// or to see the details of a package delivery, the widget lets them get to
/// the information in your app quickly.
///
/// There are three key components to a widget:
///
/// * A configuration. This configuration determines whether the widget is configurable,
///   identifies the widget, and defines the SwiftUI views that show the
///   widget's content.
/// * A timeline provider that drives the process of updating the widget's view
///   over time.
/// * SwiftUI views used by WidgetKit to display the widget.
///
/// To add a widget to your app go to: `File -> New -> Target`. Name your widget
/// "Banana Widget" to use code from this tutorial.
///
/// Next, from the options, select "Widget"
///
/// ![All options](widget-1.png)
///
/// Select "Widget".
///
/// ![Widget](widget-2.png)
///
/// Your widget can now be styled similar to a standard SwiftUI view. For
/// example, modify `Banana_WidgetEntryView` to create:
///
/// ![A screenshot of the home screen with a yellow filled widget roughly four times the size of a standard widget, overlayed with two banana emojis.](widget-3.png)
///
/// ```
/// struct Banana_WidgetEntryView : View {
///     var entry: Provider.Entry
///
///     var body: some View {
///         RoundedRectangle(cornerRadius: 10)
///             .fill(Color.yellow)
///             .overlay(Text("🍌🍌"))
///     }
/// }
/// ```
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol Widget { }

extension Widget {

    /// The type of configuration representing the content of the widget.
    ///
    /// When you create a custom widget, Swift infers this type from your
    /// implementation of the required `Widget/body-swift.property` property.
    associatedtype Body : WidgetConfiguration

    /// Creates a widget using `body` as its content.
    init() { }

    /// The content and behavior of the widget.
    ///
    /// For any widgets that you create, provide a computed `body` property that
    /// defines the widget as a composition of SwiftUI views.
    ///
    /// Swift infers the widget's ``Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    var body: Self.Body { get }
}

