/// A View created from a swift tuple of View values.
///
/// `TupleView` is mainly used with ``ViewBuilder``, so you don't really
/// need to worry about it unless you're making your own view builders.
///
/// In the example below, we use this type to create a new kind of ``View``
/// that only displays the first view it is passed. The second view is ignored.
/// Kind of useless? Yes. Instructive? You tell me.
///
///     struct ContentView: View {
///         var body: some View {
///             FirstView {
///                 Text("I am first 🥇")
///                 Text("Hey stop ignoring me ☹️")
///             }
///         }
///     }
///
///     struct FirstView<First: View, Second: View>: View {
///         let first: First
///
///         init(@ViewBuilder content: () -> TupleView<(First, Second)>) {
///             let views = content().value
///             first = views.0
///         }
///
///         var body: some View {
///             first
///         }
///     }
///
/// ![A screenshot displaying a single text view that reads "I am first" in
/// the center of the screen. The display should show two text views, but the
/// view created only displays the first view it's passed.](tupleview.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct TupleView<T> : View {

    /// The tuple of views in the ``TupleView``.
    ///
    /// A ``TupleView`` stores a real life tuple of views in this property.
    /// Its type is a generic, `T`, which can have a tuple type.
    ///
    /// See how in the example below, we extract the value parameter from
    /// the tuple view returned by the view builder. This allows us to
    /// take the first element of the type from the tuple view.
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             FirstView {
    ///                 Text("I am first 🥇")
    ///                 Text("Hey stop ignoring me ☹️")
    ///             }
    ///         }
    ///     }
    ///
    ///     struct FirstView<First: View, Second: View>: View {
    ///         let first: First
    ///
    ///         init(@ViewBuilder content: () -> TupleView<(First, Second)>) {
    ///             let views = content().value
    ///             first = views.0
    ///         }
    ///
    ///         var body: some View {
    ///             first
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a single text view that reads "I am first" in
    /// the center of the screen. The value parameter is extracted from the tuple
    /// view returned by the view builder.](tupleview.png)
    ///
    public var value: T

    /// Creates a tuple view.
    ///
    /// You usually won't use this initializer directly. Instead, if you are
    /// working with ``TupleView``s, the tuple view will usually be
    /// constructed behind the scenes using the ``ViewBuilder`` property
    /// wrapper. See that page for more info.
    ///
    /// See below for how to extract a tuple view from a view builder.
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             FirstView {
    ///                 Text("I am first 🥇")
    ///                 Text("Hey stop ignoring me ☹️")
    ///             }
    ///         }
    ///     }
    ///
    ///     struct FirstView<First: View, Second: View>: View {
    ///         let first: First
    ///
    ///         init(@ViewBuilder content: () -> TupleView<(First, Second)>) {
    ///             let views = content().value
    ///             first = views.0
    ///         }
    ///
    ///         var body: some View {
    ///             first
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a single text view that reads "I am first" in
    /// the center of the screen. The display should show two text views, but the
    /// view created only displays the first view it's passed due to constraints
    /// imposed in the initializer.](tupleview.png)
    ///
    /// - Parameter value: A tuple of any number of views.
    @inlinable public init(_ value: T) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

