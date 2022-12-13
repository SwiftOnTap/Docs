/// An action that initiates a refresh operation.
///
/// When the ``EnvironmentValues/refresh`` environment value contains an
/// instance of this structure, certain built-in views in the corresponding
/// ``Environment`` begin offering a refresh capability. They apply the
/// instance's handler to any refresh operation that the user initiates.
/// By default, the environment value is `nil`, but you can use the
/// ``View/refreshable(action:)`` modifier to create and store a new
/// refresh action that uses the handler that you specify:
///
///     List(mailbox.conversations) { conversation in
///         ConversationCell(conversation)
///     }
///     .refreshable {
///         await mailbox.fetch()
///     }
///
/// On iOS and iPadOS, the ``List`` in the example above offers a
/// pull to refresh gesture because it detects the refresh action. When
/// the user drags the list down and releases, the list calls the action's
/// handler. Because SwiftUI declares the handler as asynchronous, it can
/// safely make long-running asynchronous calls, like fetching network data.
///
/// ### Refreshing custom views
///
/// You can also offer refresh capability in your custom views.
/// Read the ``EnvironmentValues/refresh`` environment value to get the
/// `RefreshAction` instance for a given ``Environment``. If you find
/// a non-`nil` value, change your view's appearance or behavior to offer
/// the refresh to the user, and call the instance to conduct the
/// refresh. You can call the refresh instance directly because it defines
/// a ``RefreshAction/callAsFunction()`` method that Swift calls
/// when you call the instance:
///
///     struct RefreshableView: View {
///         @Environment(\.refresh) private var refresh
///
///         var body: some View {
///             Button("Refresh") {
///                 Task {
///                     await refresh?()
///                 }
///             }
///             .disabled(refresh == nil)
///         }
///     }
///
/// Be sure to call the handler asynchronously by preceding it
/// with `await`. Because the call is asynchronous, you can use
/// its lifetime to indicate progress to the user. For example,
/// you might reveal an indeterminate ``ProgressView`` before
/// calling the handler, and hide it when the handler completes.
///
/// If your code isn't already in an asynchronous context, create a
/// <doc://com.apple.documentation/documentation/Swift/Task> for the
/// method to run in. If you do this, consider adding a way for the
/// user to cancel the task. For more information, see
/// [Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)
/// in *The Swift Programming Language*.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct RefreshAction {

    /// Initiates a refresh action.
    ///
    /// Don't call this method directly. SwiftUI calls it when you
    /// call the ``RefreshAction`` structure that you get from the
    /// ``Environment``:
    ///
    ///     struct RefreshableView: View {
    ///         @Environment(\.refresh) private var refresh
    ///
    ///         var body: some View {
    ///             Button("Refresh") {
    ///                 Task {
    ///                     await refresh?()  // Implicitly calls refresh.callAsFunction()
    ///                 }
    ///             }
    ///             .disabled(refresh == nil)
    ///         }
    ///     }
    ///
    /// For information about how Swift uses the `callAsFunction()` method to
    /// simplify call site syntax, see
    /// [Methods with Special Names](https://docs.swift.org/swift-book/ReferenceManual/Declarations.html#ID622)
    /// in *The Swift Programming Language*.
    /// For information about asynchronous operations in Swift, see
    /// [Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html).
    public func callAsFunction() async { }
}

