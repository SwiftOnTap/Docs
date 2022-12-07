/// A color gradient represented as an array of color stops, each having a
/// parametric location value.
///
/// Use this structure along with one of the gradient views
/// to display a visual gradient. There are 3 types of gradients:
/// - ``AngularGradient``
/// - ``LinearGradient``
/// - ``RadialGradient``
///
/// Those gradients are actual ``View``s. This structure, on the other
/// hand, is just the list of colors and spacings associated with a gradient.
///
/// See the example below for a simple gradient being passed to a
/// ``LinearGradient`` view.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         RoundedRectangle(cornerRadius: 10)
///             .fill(LinearGradient(
///                     gradient: Gradient(colors: [.green, .blue, .purple]),
///                     startPoint: .leading,
///                     endPoint: .trailing))
///             .padding()
///     }
/// }
/// ```
///
/// ![A view containing a rounded rectangle wit corner radius 10, padding, and a
/// linear gradient fill; the linear gradient goes from green to blue to purple
/// with a leading startPoint and trailing endPoint.](B1E517B3-0F3F-49F7-ABEC-F4C609FC166C.png)
///
/// A gradient is made up of a list of ``Gradient/Stop``s
/// A stop contains a color along with the a value from 0 to 1 indicating
/// where the color should be spaced.
///
/// Use the ``Gradient/init(stops:)`` initializer to specify the array
/// of ``Gradient/Stop``s.
///
/// To quickly create a gradient with evenly spaced colors, use
/// ``Gradient/init(colors:)``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Gradient : Equatable {

    /// One color stop in the gradient.
    ///
    /// Create a list of stops to make a ``Gradient``.
    /// Use your ``Gradient`` to create visual gradient displays by
    /// passing it to one of the 3 gradient views:
    /// - ``AngularGradient``
    /// - ``LinearGradient``
    /// - ``RadialGradient``
    ///
    /// A stop consists of 2 things:
    /// 1. A ``Color``
    /// 2. A location from 0 to 1 specifying where the along the gradient
    /// the color should be located.
    ///
    /// See the example below for how to create a stop, then use that
    /// stop to create a gradient, then use that gradient to create
    /// a linear gradient.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     let stop1 = Gradient.Stop(color: .blue, location: 0.8)
    ///     let stop2 = Gradient.Stop(color: .purple, location: 1.0)
    ///
    ///     var body: some View {
    ///         RoundedRectangle(cornerRadius: 10)
    ///             .fill(LinearGradient(
    ///                     gradient: Gradient(stops: [stop1, stop2]),
    ///                     startPoint: .leading,
    ///                     endPoint: .trailing))
    ///             .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rounded rectangle with corner radius 10, padding, and a
    /// linear gradient fill; the linear gradient goes from blue to purple
    /// 80% across the page, as defined by the gradient stop properties color
    /// and location, with a leading startPoint and trailing endPoint.](gradient-stop-ex.png)
    ///
    @frozen public struct Stop : Equatable {

        /// The color for the stop.
        ///
        /// Use this property to specify the color of a gradient stop.
        /// See ``Gradient`` for more on what a gradient is.
        /// See ``Gradient/Stop`` for more on how to create the
        /// stops that make up a gradient.
        ///
        /// This property is usually specified directly via the
        /// ``Gradient/Stop/init(color:location)``
        /// initializer.
        ///
        /// In the following example, we create two stops, the first one
        /// has a ``Color/blue`` color, and the second one has a
        /// ``Color/purple`` color.
        ///
        /// ```
        /// struct ExampleView: View {
        ///     let stop1 = Gradient.Stop(color: .blue, location: 0.8)
        ///     let stop2 = Gradient.Stop(color: .purple, location: 1.0)
        ///
        ///     var body: some View {
        ///         RoundedRectangle(cornerRadius: 10)
        ///             .fill(LinearGradient(
        ///                     gradient: Gradient(stops: [stop1, stop2]),
        ///                     startPoint: .leading,
        ///                     endPoint: .trailing))
        ///             .padding()
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing a rounded rectangle with corner radius 10, padding, and a
        /// linear gradient fill; the linear gradient goes from blue to purple
        /// 80% across the page, as defined by the gradient stop properties color
        /// and location, with a leading startPoint and trailing endPoint.](gradient-stop-ex.png)
        ///
        public var color: Color

        /// The parametric location of the stop.
        ///
        /// Use this property to sepcify the location of a gradient stop.
        /// See ``Gradient`` for more on what a gradient is.
        /// See ``Gradient/Stop`` for more on how to create the
        /// stops that make up a gradient.
        ///
        /// This property is usually specified directly via the
        /// ``Gradient/Stop/init(color:location)``
        /// initializer.
        ///
        /// This value must be in the range `[0, 1]`.
        ///
        /// In the following example, we create two stops, the first one
        /// is located 80% along the gradient, and the second is located
        /// all the way at the end.
        ///
        /// ```
        /// struct ExampleView: View {
        ///     let stop1 = Gradient.Stop(color: .blue, location: 0.8)
        ///     let stop2 = Gradient.Stop(color: .purple, location: 1.0)
        ///
        ///     var body: some View {
        ///         RoundedRectangle(cornerRadius: 10)
        ///             .fill(LinearGradient(
        ///                     gradient: Gradient(stops: [stop1, stop2]),
        ///                     startPoint: .leading,
        ///                     endPoint: .trailing))
        ///             .padding()
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing a rounded rectangle with corner radius 10, padding, and a
        /// linear gradient fill; the linear gradient goes from blue to purple
        /// 80% across the page, as defined by the gradient stop properties color
        /// and location, with a leading startPoint and trailing endPoint.](gradient-stop-ex.png)
        ///
        public var location: CGFloat

        /// Creates a color stop with a color and location.
        ///
        /// Use this property to sepcify the location and color of a gradient stop.
        /// See ``Gradient`` for more on what a gradient is.
        /// See ``Gradient/Stop`` for more on how to create the
        /// stops that make up a gradient.
        ///
        /// In the following example, we create two stops, the first one
        /// is blue and
        /// located 80% along the gradient, and the second is
        /// purple and located
        /// all the way at the end.
        ///
        /// ```
        /// struct ExampleView: View {
        ///     let stop1 = Gradient.Stop(color: .blue, location: 0.8)
        ///     let stop2 = Gradient.Stop(Color.purple, location: 1.0)
        ///
        ///     var body: some View {
        ///         RoundedRectangle(cornerRadius: 10)
        ///             .fill(LinearGradient(
        ///                     gradient: Gradient(stops: [stop1, stop2]),
        ///                     startPoint: .leading,
        ///                     endPoint: .trailing))
        ///             .padding()
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing a rounded rectangle with corner radius 10, padding, and a
        /// linear gradient fill; the linear gradient goes from blue to purple
        /// 80% across the page, as defined by the gradient stop properties color
        /// and location, with a leading startPoint and trailing endPoint.](gradient-stop-ex.png)
        ///
        /// - Parameters:
        ///   - color: The color for the stop.
        ///   - location: The parametric location of the stop.
        public init(color: Color, location: CGFloat) { }

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Gradient.Stop, b: Gradient.Stop) -> Bool { }
    }

    /// The array of color stops.
    ///
    /// Use this property to specify the colors and their locations in a
    /// gradient. Essentially, this property is all a ``Gradient``
    /// structure is.
    ///
    /// This property is usually specified directly via the
    /// ``Gradient/init(stops:)`` initializer, but it can also be
    /// specified directly:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         var gradient = Gradient(stops: [])
    ///
    ///         let stop1 = Gradient.Stop(color: .blue, location: 0.8)
    ///         let stop2 = Gradient.Stop(color: .purple, location: 1.0)
    ///
    ///         gradient.stops.append(stop1)
    ///         gradient.stops.append(stop2)
    ///
    ///         return RoundedRectangle(cornerRadius: 10)
    ///             .fill(LinearGradient(
    ///                     gradient: gradient,
    ///                     startPoint: .leading,
    ///                     endPoint: .trailing))
    ///             .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rounded rectangle with corner radius 10, padding, and a
    /// linear gradient fill; the linear gradient goes from blue to purple
    /// 80% across the page, as defined by an array of gradient stops with color
    /// and location properties and the leading startPoint and trailing endPoint.](gradient-stops-ex.png)
    ///
    public var stops: [Gradient.Stop]

    /// Creates a gradient from an array of color stops.
    ///
    /// Use this initializer to create a gradient directly from an array
    /// of its colors and where they are located.
    ///
    /// See the page on ``Gradient/Stop`` for more info on how to create
    /// a gradient stop.
    ///
    /// While using this initializer has the benefit of being able to specify
    /// where the colors are located, you can also use the
    /// ``Gradient/init(colors:)`` initializer
    /// to easily specify an evenly spaced gradient from a list of colors.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     let stop1 = Gradient.Stop(color: .blue, location: 0.8)
    ///     let stop2 = Gradient.Stop(color: .purple, location: 1.0)
    ///
    ///     var body: some View {
    ///         RoundedRectangle(cornerRadius: 10)
    ///             .fill(LinearGradient(
    ///                     gradient: Gradient(stops: [stop1, stop2]),
    ///                     startPoint: .leading,
    ///                     endPoint: .trailing))
    ///             .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rounded rectangle with corner radius 10, padding, and a
    /// linear gradient fill; the linear gradient goes from blue to purple
    /// 80% across the page, as defined by an array of gradient stops with color
    /// and location properties and the leading startPoint and trailing endPoint.](gradient-stop-ex.png)
    ///
    /// - Parameter stops: The list of gradient stops.
    public init(stops: [Gradient.Stop]) { }

    /// Creates a gradient from an array of colors.
    ///
    /// The gradient synthesizes its location values to evenly space the colors
    /// along the gradient.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         RoundedRectangle(cornerRadius: 10)
    ///             .fill(LinearGradient(
    ///                     gradient: Gradient(colors: [.green, .blue, .purple]),
    ///                     startPoint: .leading,
    ///                     endPoint: .trailing))
    ///             .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rounded rectangle with corner radius 10, padding, and a
    /// linear gradient fill; the linear gradient goes from blue to purple
    /// 80% across the page, as defined by an array of gradient stops with color
    /// and location properties and the leading startPoint and trailing endPoint.](gradient-init-colors-ex.png)
    ///
    /// - Parameter colors: The list of colors to evenly space in the gradient.
    public init(colors: [Color]) { }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Gradient, b: Gradient) -> Bool { }
}

