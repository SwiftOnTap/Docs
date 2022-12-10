/// The properties of a toggle instance.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ToggleStyleConfiguration {

    /// A type-erased label of a toggle.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A view that describes the effect of switching the toggle between its
    /// on and off states.
    public let label: ToggleStyleConfiguration.Label

    /// A binding to a state property that indicates whether the toggle is on or
    /// off.
    public var isOn: Bool { get /*nonmutating set*/ }

    /// A binding to let you listen to changes in the toggle's "is on" property.
    public var $isOn: Binding<Bool> { get }
}

