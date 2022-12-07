/// A view that shows or hides another content view, based on the state of a
/// disclosure control.
///
/// A disclosure group view consists of a label to identify the contents, and a
/// control to show and hide the contents. Showing the contents puts the
/// disclosure group into the "expanded" state, and hiding them makes the
/// disclosure group "collapsed".
///
/// In the following example, a disclosure group contains two toggles and
/// an embedded disclosure group. The top level disclosure group exposes its
/// expanded state with the bound property, `topLevelExpanded`. By expanding
/// the disclosure group, the user can use the toggles to update the state of
/// the `toggleStates` structure.
///
///     struct ToggleStates {
///         var oneIsOn: Bool = false
///         var twoIsOn: Bool = true
///     }
///     @State private var toggleStates = ToggleStates()
///     @State private var topExpanded: Bool = true
///
///     var body: some View {
///         DisclosureGroup("Items", isExpanded: $topExpanded) {
///             Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
///             Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
///             DisclosureGroup("Sub-items") {
///                 Text("Sub-item 1")
///             }
///         }
///     }
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DisclosureGroup<Label, Content> : View where Label : View, Content : View {

    /// Creates a disclosure group with the given label and content views.
    ///
    /// - Parameters:
    ///   - content: The content shown when the disclosure group expands.
    ///   - label: A view that describes the content of the disclosure group.
    public init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder label: () -> Label) { }

    /// Creates a disclosure group with the given label and content views, and
    /// a binding to the expansion state (expanded or collapsed).
    ///
    /// - Parameters:
    ///   - isExpanded: A binding to a Boolean value that determines the group's
    ///    expansion state (expanded or collapsed).
    ///   - content: The content shown when the disclosure group expands.
    ///   - label: A view that describes the content of the disclosure group.
    public init(isExpanded: Binding<Bool>, @ViewBuilder content: @escaping () -> Content, @ViewBuilder label: () -> Label) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DisclosureGroup where Label == Text {

    /// Creates a disclosure group, using a provided localized string key to
    /// create a text view for the label.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized label of `self` that describes
    ///     the content of the disclosure group.
    ///   - content: The content shown when the disclosure group expands.
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: @escaping () -> Content) { }

    /// Creates a disclosure group, using a provided localized string key to
    /// create a text view for the label, and a binding to the expansion state
    /// (expanded or collapsed).
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized label of `self` that describes
    ///     the content of the disclosure group.
    ///   - isExpanded: A binding to a Boolean value that determines the group's
    ///    expansion state (expanded or collapsed).
    ///   - content: The content shown when the disclosure group expands.
    public init(_ titleKey: LocalizedStringKey, isExpanded: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) { }

    /// Creates a disclosure group, using a provided string to create a
    /// text view for the label.
    ///
    /// - Parameters:
    ///   - label: A description of the content of the disclosure group.
    ///   - content: The content shown when the disclosure group expands.
    public init<S>(_ label: S, @ViewBuilder content: @escaping () -> Content) where S : StringProtocol { }

    /// Creates a disclosure group, using a provided string to create a
    /// text view for the label, and a binding to the expansion state (expanded
    /// or collapsed).
    ///
    /// - Parameters:
    ///   - label: A description of the content of the disclosure group.
    ///   - isExpanded: A binding to a Boolean value that determines the group's
    ///    expansion state (expanded or collapsed).
    ///   - content: The content shown when the disclosure group expands.
    public init<S>(_ label: S, isExpanded: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) where S : StringProtocol { }
}

