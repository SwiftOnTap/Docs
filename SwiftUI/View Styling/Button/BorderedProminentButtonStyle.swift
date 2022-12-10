/// A button style that applies standard border prominent artwork based
/// on the button's context.
///
/// You can also use ``borderedProminent`` to construct this style.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct BorderedProminentButtonStyle : PrimitiveButtonStyle {

    /// Creates a bordered prominent button style.
    public init() { }

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: BorderedProminentButtonStyle.Configuration) -> some View { }


    /// A view that represents the body of a button.
    public typealias Body = some View
}

