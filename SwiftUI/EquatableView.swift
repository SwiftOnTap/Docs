/// A view type that compares itself against its previous value and prevents its
/// child updating if its new value is the same as its old value.
///
/// To achieve this same effect, use the ``View/equatable()`` modifier.
///
/// Two great articles on equatable views are here:
/// - [Swift with Majid](https://swiftwithmajid.com/2020/01/22/optimizing-views-in-swiftui-using-equatableview/)
/// - [The SwiftUI Lab](https://swiftui-lab.com/equatableview/)
///
/// ```
/// struct ContentView: View {
///     @State private var bodyDoesntDependOnMe = false
///     var body: some View {
///         EquatableView(content: ConformingToEquatableView())
///     }
/// }
///
/// struct ConformingToEquatableView: View, Equatable {
///     var body: some View {
///         Text("I can be optimized using equatable! ⚖️")
///     }
/// }
/// ```
///
/// ![An EquitableView containing a call to a view with the text
/// "I can be optimized using equatable! ⚖️".](4A467FF0-5515-40A4-88FF-E2DEC025836D.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EquatableView<Content> : View where Content : Equatable, Content : View {

    /// The current content view that appears in the equatable view.
    ///
    /// If you update this value but it's just the same thing as the old version, then the view
    /// won't update. That's the "equatable" part of equatable view.
    ///
    /// Two great articles on equatable views are here:
    /// - [Swift with Majid](https://swiftwithmajid.com/2020/01/22/optimizing-views-in-swiftui-using-equatableview/)
    /// - [The SwiftUI Lab](https://swiftui-lab.com/equatableview/)
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State private var bodyDoesntDependOnMe = false
    ///     var body: some View {
    ///         // EquatableView holds onto a var called content
    ///         EquatableView(content: ConformingToEquatableView())
    ///     }
    /// }
    ///
    /// struct ConformingToEquatableView: View, Equatable {
    ///     var body: some View {
    ///         Text("I can be optimized using equatable! ⚖️")
    ///     }
    /// }
    /// ```
    ///
    /// ![An EquitableView containing a call to a view with the text
    /// "I can be optimized using equatable! ⚖️".](4A467FF0-5515-40A4-88FF-E2DEC025836D.png)
    ///
    public var content: Content

    /// Creates a new equatable view from a view.
    ///
    /// To achieve this same effect, use the ``View/equatable()`` modifier.
    ///
    /// Two great articles on equatable views are here:
    /// - [Swift with Majid](https://swiftwithmajid.com/2020/01/22/optimizing-views-in-swiftui-using-equatableview/)
    /// - [The SwiftUI Lab](https://swiftui-lab.com/equatableview/)
    ///
    /// ```
    /// struct ContentView: View {
    ///     @State private var bodyDoesntDependOnMe = false
    ///     var body: some View {
    ///         // EquatableView holds onto a var called content
    ///         EquatableView(content: ConformingToEquatableView())
    ///     }
    /// }
    ///
    /// struct ConformingToEquatableView: View, Equatable {
    ///     var body: some View {
    ///         Text("I can be optimized using equatable! ⚖️")
    ///     }
    /// }
    /// ```
    ///
    /// ![An EquitableView containing a call to a view with the text
    /// "I can be optimized using equatable! ⚖️".](4A467FF0-5515-40A4-88FF-E2DEC025836D.png)
    ///
    /// - Parameter content: The view you want to use as the body of the equatable view.
    @inlinable public init(content: Content) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

