/// Executes a closure with the specified transaction and returns the result.
///
/// - Parameters:
///   - transaction : An instance of a transaction, set as the thread's current
///     transaction.
///   - body: A closure to execute.
///
/// - Returns: The result of executing the closure with the specified
///   transaction.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public func withTransaction<Result>(_ transaction: Transaction, _ body: () throws -> Result) rethrows -> Result { }

