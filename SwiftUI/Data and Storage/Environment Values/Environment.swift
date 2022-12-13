/// A property wrapper that reads a value from a view's environment.
///
/// Use the ``Environment`` property wrapper to read a value
/// stored in a view's environment. Indicate the value to read using an
/// ``EnvironmentValues`` key path in the property declaration. For example, you
/// can create a property that reads the color scheme of the current
/// view using the key path of the ``EnvironmentValues/colorScheme``
/// property:
///
///     @Environment(\.colorScheme) var colorScheme: ColorScheme
///
/// You can condition a view's content on the associated value, which
/// you read from the declared property's `wrappedValue`. As with any property
/// wrapper, you access the wrapped value by directly referring to the property:
///
///     if colorScheme == .dark { // Checks the wrapped value.
///         DarkContent()
///     } else {
///         LightContent()
///     }
///
/// If the value changes, SwiftUI updates any parts of your view that depend on
/// the value. For example, that might happen in the above example if the user
/// changes the Appearance settings.
///
/// You can use this property wrapper to read --- but not set --- an environment
/// value. SwiftUI updates some environment values automatically based on system
/// settings and provides reasonable defaults for others. You can override some
/// of these, as well as set custom environment values that you define,
/// using the ``View/environment(_:_:)`` view modifier.
///
/// For the complete list of environment values provided by SwiftUI, see the
/// properties of the ``EnvironmentValues`` structure. For information about
/// creating custom environment values, see the ``EnvironmentKey`` protocol.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen @propertyWrapper public struct Environment<Value> : DynamicProperty {

    /// Creates an environment property to read the specified key path.
    ///
    /// Don’t call this initializer directly. Instead, declare a property
    /// with the ``Environment`` property wrapper, and provide the key path of
    /// the environment value that the property should reflect:
    ///
    ///     struct MyView: View {
    ///         @Environment(\.colorScheme) var colorScheme: ColorScheme
    ///
    ///         var body: some View {
    ///             if colorScheme == .dark {
    ///                 Text("This is ⬛️ content")
    ///             } else {
    ///                 Text("This is ⬜️ content")
    ///             }
    ///         }
    ///     }
    ///
    /// ![A view that displays the text view "This is ⬛️ content" when the
    /// colorscheme is dark and "This is  ⬜️ content" otherwise; the view uses
    /// an environment variable to determine the current colorscheme.](22.19.46.png)
    ///
    /// SwiftUI automatically updates any parts of `MyView` that depend on
    /// the property when the associated environment value changes.
    /// You can't modify the environment value using a property like this.
    /// Instead, use the ``View/environment(_:_:)`` view modifier on a view to
    /// set a value for a view hierarchy.
    ///
    /// - Parameter keyPath: A key path to a specific resulting value.
    @inlinable public init(_ keyPath: KeyPath<EnvironmentValues, Value>) { }

    /// The current value of the environment property.
    ///
    /// The wrapped value property provides primary access to the value's data.
    /// However, you don't access `wrappedValue` directly. Instead, you read the
    /// property variable created with the ``Environment`` property wrapper:
    ///
    ///     struct MyView: View {
    ///         @Environment(\.colorScheme) var colorScheme: ColorScheme
    ///
    ///         var body: some View {
    ///             if colorScheme == .dark {
    ///                 Text("This is ⬛️ content")
    ///             } else {
    ///                 Text("This is ⬜️ content")
    ///             }
    ///         }
    ///     }
    ///
    /// ![A view that displays the text view "This is ⬛️ content" when the
    /// colorscheme is dark and "This is  ⬜️ content" otherwise; the view uses
    /// an environment variable to determine the current colorscheme.](22.19.46.png)
    ///
    @inlinable public var wrappedValue: Value { get }
}
