/// The FetchedResults collection type represents the results of performing a
/// fetch request. Internally, it may use strategies such as batching and
/// transparent futures to minimize memory use and I/O.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct FetchedResults<Result> : RandomAccessCollection where Result : NSFetchRequestResult {

    /// The position of the first element in a nonempty collection.
    ///
    /// If the collection is empty, `startIndex` is equal to `endIndex`.
    public var startIndex: Int { get }

    /// The collection's "past the end" position---that is, the position one
    /// greater than the last valid subscript argument.
    ///
    /// When you need a range that includes the last element of a collection, use
    /// the half-open range operator (`..<`) with `endIndex`. The `..<` operator
    /// creates a range that doesn't include the upper bound, so it's always
    /// safe to use with `endIndex`. For example:
    ///
    ///     let numbers = [10, 20, 30, 40, 50]
    ///     if let index = numbers.firstIndex(of: 30) {
    ///         print(numbers[index ..< numbers.endIndex])
    ///     }
    ///     // Prints "[30, 40, 50]"
    ///
    /// If the collection is empty, `endIndex` is equal to `startIndex`.
    public var endIndex: Int { get }

    /// Accesses the element at the specified position.
    ///
    /// You can subscript a collection with any valid index other than the
    /// collection's end index. The end index refers to the position one past
    /// the last element of a collection, so it doesn't correspond with an
    /// element.
    ///
    /// The following example accesses an element of an array through its
    /// subscript to print its value:
    ///
    ///     struct ContentView: View {
    ///         var basicArray = ["First element", "Second element", "Third element"]
    ///
    ///         var body: some View {
    ///             Text("The element at index 1 is: \(basicArray[1])")
    ///         }
    ///     }
    ///
    /// ![A screenshot of a view displaying the text "The element at index 1 is: Second Element",
    /// where the element content has been called in the text view using a subscript.](subscript-position-ex.png)
    ///
    /// - Parameter position: The position of the element to access. `position`
    ///   must be a valid index of the collection that is not equal to the
    ///   `endIndex` property.
    ///
    /// - Complexity: O(1)
    public subscript(position: Int) -> Result { get }

    /// A type representing the sequence's elements.
    public typealias Element = Result

    /// A type that represents a position in the collection.
    ///
    /// Valid indices consist of the position of every element and a
    /// "past the end" position that's not valid for use as a subscript
    /// argument.
    public typealias Index = Int

    /// A type that provides the collection's iteration interface and
    /// encapsulates its iteration state.
    ///
    /// By default, a collection conforms to the `Sequence` protocol by
    /// supplying `IndexingIterator` as its associated `Iterator`
    /// type.
    public typealias Iterator = IndexingIterator<FetchedResults<Result>>

    /// A sequence that represents a contiguous subrange of the collection's
    /// elements.
    ///
    /// This associated type appears as a requirement in the `Sequence`
    /// protocol, but it is restated here with stricter constraints. In a
    /// collection, the subsequence should also conform to `Collection`.
    public typealias SubSequence = Slice<FetchedResults<Result>>

    /// A type that represents the indices that are valid for subscripting the
    /// collection, in ascending order.
    public typealias Indices = Range<Int>
}

