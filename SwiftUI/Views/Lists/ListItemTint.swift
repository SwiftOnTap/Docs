/// The configuration of a tint effect applied to content within a List.
///
/// Use this structure with the ``View/listItemTint(_:)-a71e4`` view
/// modifier to change the tint of an item in a list.
///
/// This structure has 3 options:
///
/// 1. ``ListItemTint/fixed(_:)``: A tint ``Color`` that cannot be
/// overriden by the system.
/// 2. ``ListItemTint/preferred(_:)``: A tint ``Color`` that can be
/// overriden by the system.
/// 3. ``ListItemTint/monochrome``: The standard gray tint effect.
///
/// See each of those pages for more details on the options.
///
/// Below is a simple example.
///
/// ```
/// struct SettingsView: View {
///     var body: some View {
///         List {
///             Label("Airplane Mode", systemImage: "airplane.circle.fill")
///                 .listItemTint(ListItemTint.fixed(Color.orange))
///         }
///     }
/// }
/// ```
///
/// ![A screenshot displaying a single list item that reads "Airplane Mode"
/// with a circular airplane icon to its left. The view modifier renders the
/// icon as orange.](5E2E8D9E-6DB2-459B-A171-F3F614F21682.png)
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ListItemTint {

    /// An explicit tint color.
    ///
    /// This tint effect is fixed and not overridable by other
    /// system effects.
    ///
    /// Use this property with the ``View/listItemTint(_:)-a71e4`` view
    /// modifier to change the tint of an item in a list.
    ///
    /// ```
    /// struct SettingsView: View {
    ///     var body: some View {
    ///         List {
    ///             Label("Airplane Mode", systemImage: "airplane.circle.fill")
    ///                 .listItemTint(.fixed(Color.orange))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single list item that reads "Airplane Mode"
    /// with a circular airplane icon to its left. The view modifier renders the
    /// icon as orange.](5E2E8D9E-6DB2-459B-A171-F3F614F21682.png)
    ///
    public static func fixed(_ tint: Color) -> ListItemTint { }

    /// An explicit tint color that is overridable.
    ///
    /// This tint effect is overridable by system effects, for
    /// example when the system has a custom user accent
    /// color on macOS.
    ///
    /// Use this property with the ``View/listItemTint(_:)-a71e4`` view
    /// modifier to change the tint of an item in a list.
    ///
    /// ```
    /// struct SettingsView: View {
    ///     var body: some View {
    ///         List {
    ///             Label("Airplane Mode", systemImage: "airplane.circle.fill")
    ///                 .listItemTint(.preferred(Color.orange))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single list item that reads "Airplane Mode"
    /// with a circular airplane icon to its left. The view modifier renders the
    /// icon as orange.](5E2E8D9E-6DB2-459B-A171-F3F614F21682.png)
    ///

    public static func preferred(_ tint: Color) -> ListItemTint { }

    /// A standard grayscale tint effect.
    ///
    /// Monochrome tints are not overridable.
    ///
    /// Use this property with the ``View/listItemTint(_:)-a71e4`` view
    /// modifier to change the tint of an item in a list.
    ///
    /// ```
    /// struct SettingsView: View {
    ///     var body: some View {
    ///         Label("General", systemImage: "gearshape.fill")
    ///             .listItemTint(.monochrome)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a single label in the center of the screen
    /// that reads "General" with a gear icon to its left with a monochrome tint
    /// applied. The label appears as a dark gray on screen.](list-item-tint-monochrome-ex.png)
    ///
    public static let monochrome: ListItemTint
}

