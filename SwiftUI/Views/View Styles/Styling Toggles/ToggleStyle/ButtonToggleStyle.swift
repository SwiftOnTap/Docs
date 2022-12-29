/// A toggle style that displays as a button with its label as the title.
///
/// You can also use ``ToggleStyle/button`` to construct this style.
///
///     Toggle(isOn: $isFlagged) {
///         Label("Flag", systemImage: "flag.fill")
///     }
///     .toggleStyle(.button)
///
@available(iOS 15.0, macOS 12.0, watchOS 9.0, *)
@available(tvOS, unavailable)
public struct ButtonToggleStyle : ToggleStyle {

    /// Creates a button toggle style.
    ///
    /// Don't call this initializer directly. Instead, use the
    /// ``ToggleStyle/button`` static variable to create this style:
    ///
    ///     Toggle(isOn: $isFlagged) {
    ///         Label("Flag", systemImage: "flag.fill")
    ///     }
    ///     .toggleStyle(.button)
    ///
    public init() { }

    /// Creates a view that represents the body of a toggle button.
    ///
    /// SwiftUI implements this required method of the ``ToggleStyle``
    /// protocol to define the behavior and appearance of the
    /// ``ToggleStyle/button`` toggle style. Don't call this method
    /// directly; the system calls this method for each
    /// ``Toggle`` instance in a view hierarchy that's styled as
    /// a button.
    ///
    /// - Parameter configuration: The properties of the toggle, including a
    ///   label and a binding to the toggle's state.
    /// - Returns: A view that acts as a button that controls a Boolean state.
    public func makeBody(configuration: ButtonToggleStyle.Configuration) -> some View { }


    /// A view that represents the appearance and interaction of a toggle.
    ///
    /// SwiftUI infers this type automatically based on the ``View``
    /// instance that you return from your implementation of the
    /// ``makeBody(configuration:)`` method.
    public typealias Body = some View
}

