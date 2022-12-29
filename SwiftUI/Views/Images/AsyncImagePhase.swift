/// The current phase of the asynchronous image loading operation.
///
/// When you create an ``AsyncImage`` instance with the
/// ``AsyncImage/init(url:scale:transaction:content:)`` initializer, you define
/// the appearance of the view using a `content` closure. SwiftUI calls the
/// closure with a phase value at different points during the load operation
/// to indicate the current state. Use the phase to decide what to draw.
/// For example, you can draw the loaded image if it exists, a view that
/// indicates an error, or a placeholder:
///
///     AsyncImage(url: URL(string: "https://example.com/icon.png")) { phase in
///         if let image = phase.image {
///             image // Displays the loaded image.
///         } else if phase.error != nil {
///             Color.red // Indicates an error.
///         } else {
///             Color.blue // Acts as a placeholder.
///         }
///     }
///
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public enum AsyncImagePhase {

    /// No image is loaded.
    case empty

    /// An image succesfully loaded.
    case success(Image)

    /// An image failed to load with an error.
    case failure(Error)

    /// The loaded image, if any.
    ///
    /// If this value isn't `nil`, the image load operation has finished,
    /// and you can use the image to update the view. You can use the image
    /// directly, or you can modify it in some way. For example, you can add
    /// a ``Image/resizable(capInsets:resizingMode:)`` modifier to make the
    /// image resizable.
    public var image: Image? { get }

    /// The error that occurred when attempting to load an image, if any.
    public var error: Error? { get }
}

