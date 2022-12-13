/// A type indicating the prominence of a view hierarchy.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public enum Prominence {

    /// The standard prominence.
    case standard

    /// An increased prominence.
    ///
    /// - Note: Not all views will react to increased prominence.
    case increased

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Prominence : Equatable { }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Prominence : Hashable { }
