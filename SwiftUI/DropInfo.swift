/// The current state of a drop.
///
/// ```
/// struct ExampleView: View {
///     @State var text: String = "🍌🍌"
///
///     var body: some View {
///         HStack {
///             // Text to drag
///             Text(text)
///                 .font(.title)
///                 .onDrag { NSItemProvider(object: self.text as NSString) }
///
///             // Area to drop
///             RoundedRectangle(cornerRadius: 10)
///                 .frame(width: 150, height: 150)
///                 .onDrop(of: ["text"], delegate: MyDropDelegate(text: $text))
///         }
///     }
/// }
///
/// struct MyDropDelegate: DropDelegate {
///     @Binding var text: String
///
///     func performDrop(info: DropInfo) -> Bool {
///         self.text = "Dropped My Bananas 🍌🍌!"
///         return true
///     }
/// }
/// ```
///
/// ![A gif displaying a view containing an HStack with two components, a text
/// view "🍌🍌", derived from a state variable, and a rounded rectangle with an
/// onDrop condition; once the text is dragged into the rectangle, onDrop is
/// triggered and the text object is switched out with another reading
/// "Dropped My Bananas 🍌🍌!"](https://bananadocs-documentation-assets.s3-us-west-2.amazonaws.com/dropdelegate-example-1.gif)
///
@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DropInfo {

    /// The location of the drag in the coordinate space of the drop view.
    public var location: CGPoint { get }

    /// Indicates whether at least one item conforms to at least one of the
    /// specified uniform type identifiers.
    ///
    /// - Parameter contentTypes: The uniform type identifiers to query for.
    /// - Returns: Whether at least one item conforms to one of `contentTypes`.
    @available(iOS 14.0, macOS 11.0, *)
    public func hasItemsConforming(to contentTypes: [UTType]) -> Bool { }

    /// Finds item providers that conform to at least one of the specified
    /// uniform type identifiers.
    ///
    /// This function is only valid during the `performDrop()` action.
    ///
    /// - Parameter contentTypes: The uniform type identifiers to query for.
    /// - Returns: The item providers that conforms to `contentTypes`.
    @available(iOS 14.0, macOS 11.0, *)
    public func itemProviders(for contentTypes: [UTType]) -> [NSItemProvider] { }
}

@available(iOS, introduced: 13.4, deprecated: 100000.0, message: "Provide `UTType`s as the `types` instead.")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Provide `UTType`s as the `types` instead.")
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DropInfo {

    /// Returns whether at least one item conforms to at least one of the
    /// specified uniform type identifiers.
    public func hasItemsConforming(to types: [String]) -> Bool { }

    /// Returns an Array of items that each conform to at least one of the
    /// specified uniform type identifiers.
    ///
    /// This function is only valid during the performDrop() action.
    public func itemProviders(for types: [String]) -> [NSItemProvider] { }
}

