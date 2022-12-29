/// The orientation of the interface from the user's perspective.
///
/// By default, device previews appear right side up, using orientation
/// ``InterfaceOrientation/portrait``. You can change the orientation
/// with a call to the ``View/previewInterfaceOrientation(_:)`` modifier:
///
///     struct CircleImage_Previews: PreviewProvider {
///         static var previews: some View {
///             CircleImage()
///                 .previewInterfaceOrientation(.landscapeRight)
///         }
///     }
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct InterfaceOrientation : CaseIterable, Identifiable, Equatable {

    /// The stable identity of the entity associated with this instance.
    public var id: String { get }

    /// The device is in portrait mode, with the top of the device on top.
    public static let portrait: InterfaceOrientation

    /// The device is in portrait mode, but is upside down.
    public static let portraitUpsideDown: InterfaceOrientation

    /// The device is in landscape mode, with the top of the device on the left.
    public static let landscapeLeft: InterfaceOrientation

    /// The device is in landscape mode, with the top of the device on the right.
    public static let landscapeRight: InterfaceOrientation

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    public typealias ID = String
}
