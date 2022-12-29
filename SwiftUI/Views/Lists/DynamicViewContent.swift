/// A type of view that generates views from an underlying collection of data.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol DynamicViewContent : View { }
extension DynamicViewContent : View {

    /// The type of the underlying collection of data.
    associatedtype Data : Collection

    /// The collection of underlying data.
    var data: Self.Data { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicViewContent {

    /// Sets the deletion action for the dynamic view.
    ///
    /// [[list-deletable]]
    ///
    /// - Parameter action: The action that you want SwiftUI to perform when
    ///   elements in the view are deleted. SwiftUI passes a set of indices to the
    ///   closure that's relative to the dynamic view's underlying collection of
    ///   data.
    ///
    /// - Returns: A view that calls `action` when elements are deleted from the
    ///   original view.
    @inlinable public func onDelete(perform action: ((IndexSet) -> Void)?) -> some DynamicViewContent { }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicViewContent {

    /// Sets the move action for the dynamic view.
    ///
    /// - Parameters:
    ///   - action: A closure that SwiftUI invokes when elements in the dynamic
    ///     view are moved. The closure takes two arguments that represent the
    ///     offset relative to the dynamic view's underlying collection of data.
    ///     Pass `nil` to disable the ability to move items.
    ///
    /// - Returns: A view that calls `action` when elements are moved within the
    ///   original view.
    @inlinable public func onMove(perform action: ((IndexSet, Int) -> Void)?) -> some DynamicViewContent { }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicViewContent {

    /// Sets the insert action for the dynamic view.
    ///
    /// - Parameters:
    ///   - supportedContentTypes: An array of UTI types that the dynamic
    ///     view supports.
    ///   - action: A closure that SwiftUI invokes when elements are added to
    ///     the view. The closure takes two arguments: The first argument is the
    ///     offset relative to the dynamic view's underlying collection of data.
    ///     The second argument is an array of [`NSItemProvider`](https://developer.apple.com/documentation/foundation/nsitemprovider)
    ///     items that represents the data that you want to insert.
    ///
    /// - Returns: A view that calls `action` when elements are inserted into
    ///   the original view.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public func onInsert(of supportedContentTypes: [UTType], perform action: @escaping (Int, [NSItemProvider]) -> Void) -> some DynamicViewContent { }


    /// Sets the insert action for the dynamic view.
    ///
    /// - Parameters:
    ///   - acceptedTypeIdentifiers: An array of UTI types that the dynamic
    ///     view supports.
    ///   - action: A closure that SwiftUI invokes when elements are added to
    ///     the view. The closure takes two arguments: The first argument is the
    ///     offset relative to the dynamic view's underlying collection of data.
    ///     The second argument is an array of `NSItemProvider` that represents
    ///     the data that you want to insert.
    ///
    /// - Returns: A view that calls `action` when elements are inserted into
    ///   the original view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Provide `UTType`s as the `supportedContentTypes` instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Provide `UTType`s as the `supportedContentTypes` instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Provide `UTType`s as the `supportedContentTypes` instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Provide `UTType`s as the `supportedContentTypes` instead.")
    public func onInsert(of acceptedTypeIdentifiers: [String], perform action: @escaping (Int, [NSItemProvider]) -> Void) -> some DynamicViewContent { }

}

