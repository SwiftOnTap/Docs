/// Represents the context (or space) of a set of coordinates relative to the screen.
///
/// ``CoordinateSpace`` allows a set of X, Y coordinates to have context on if they
/// are relative to the frame's parent, or absolute to the device screen. It is also possible
/// to define a custom coordinate space on a view with ``View/coordinateSpace(name:)``. This custom
/// coordinate space can be checked with the `.named(AnyHashable)` case.
///
/// For example:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         HStack {
///             Rectangle()
///                 .fill(Color.red)
///
///             GeometryReader { geometryProxy in
///                 Button(action: {
///                     let globalFrame = geometryProxy.frame(in: CoordinateSpace.global)
///                     let localFrame = geometryProxy.frame(in: CoordinateSpace.local)
///
///                     print("Global center: \(globalFrame.midX) x \(globalFrame.midY)") //"Global center: 160.0 x 294.0"
///                     print("Local center: \(localFrame.midX) x \(localFrame.midY)") //"50.67 x 274.0"
///                 }, label: {
///                     Text("Button with coordinate spaces")
///                 })
///                 .background(Color.orange)
///             }
///
///             Rectangle()
///                 .fill(Color.red)
///         }
///     }
/// }
/// ```
///
/// ![A screenshot displaying two red rectangles spanning the height of the screen on either side of a white rectangle, also spanning the height of the screen. At the top of the white rectangle there is an orange button that reads "Button with coordinate spaces."](E708E01A-7F5B-4779-ABC8-2CD7CDA525AC.png)
///
/// In this example, the center of the Button coordinates is retrieved. The global center
/// means that the middle of the button is 160 pixels from the left of the screen, and 294 pixels
/// from the top of the screen. The local center means that the middle of the button is
/// ~50 pixels from the left edge of it's container (which is the ``GeometryReader``)
/// and the middle of the button is 274 pixels from the top of it's container.
///
/// There are two additional important things to note about this example:
///   - For illustrative purposes, the enum values were expanded in this example.
///   It would also be valid to use the shorthand, just specifying the values: `.global` or `.local`.
///   - The exact output of coordinates will differ depending on screen size, but
///   the local midX coordinate will always be smaller than the global midX since it's relative.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum CoordinateSpace {

    /// The absolute coordinate space representing the entire screen.
    case global

    /// The relative coordinate space representing the current view.
    case local

    /// A coordinate space chosen by the `Hashable` parameter.
    case named(AnyHashable)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CoordinateSpace {

    /// Whether or not the coordinate space is `CoordinateSpace.global`
    public var isGlobal: Bool { get }

    /// Whether or not the coordinate space is `CoordinateSpace.local`
    public var isLocal: Bool { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CoordinateSpace : Equatable, Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) { }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CoordinateSpace, rhs: CoordinateSpace) -> Bool { }

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

