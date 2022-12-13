@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View where Self : Equatable {

    /// A view modifier that prevents the view from updating its child view when its new value is the
    /// same as its old value.
    ///
    /// Use this modifier as an easier way of creating an ``EquatableView``.
    ///
    /// This line:
    ///
    /// ```
    /// EquatableView(content: Text("☮️"))
    /// ```
    ///
    /// is equal to this line:
    ///
    /// ```
    /// Text("☮️").equatable()
    /// ```
    ///
    /// For more info on equatable views, check out ``EquatableView``.
    /// For an in-depth overview of when to use equatable views, check out this
    /// fantastic article: [The Mystery Behind View Equality](https://swiftui-lab.com/equatableview/).
    @inlinable public func equatable() -> EquatableView<Self> { }
}

