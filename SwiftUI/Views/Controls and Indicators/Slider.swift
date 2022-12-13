/// A control for selecting a value from a bounded range.
///
/// A slider is a circle on a track. The user can move the circle from left to right to pick between
/// values. The slider takes a binding that the user updates.
///
/// The most basic example looks like this:
///
/// ```
/// struct SliderView: View {
///     @State private var value: Double = 0
///
///     var body: some View {
///         Slider(value: $value)
///     }
/// }
/// ```
///
/// ![A gif displaying a light gray slider on a white background where the
/// controlling point is being slid all the way from the edge of left side to
/// that of the right and back again; blue color fills the slider to the left
/// of the controlling point, shifting as the value changes.](slider-ex.gif)
///
/// In general, a slider has these four options:
/// 1. Add a **label**
/// 2. Change **maximum** and **minimum** values
/// 3. Create a **step** size
/// 4. Call a **function** when slider editing changes.
///
/// The slider's different initializers use different combinations of these options.
@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct Slider<Label, ValueLabel> : View where Label : View, ValueLabel : View {

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension Slider {

    /// Creates a slider with a label and max/min labels.
    ///
    /// ```
    /// struct LabeledSliderView: View {
    ///     @State private var value: Double = 50
    ///
    ///     var body: some View {
    ///         Slider(value: $value,
    ///                in: 0...100,
    ///                onEditingChanged: { began in print("began? \(began)") },
    ///                minimumValueLabel: Text("🐣"),
    ///                maximumValueLabel: Text("🐔"),
    ///                label: { Text("Age") })
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a slider starting at half capacity sliding back and
    /// forth with minimumValueLabel and maximumValueLabel set to be a chick
    /// emoji and a rooster emoji, respectively. The left hand side of the slide
    /// is the minimum label and the right side is the max. The slider itself is
    /// also labeled "Age" which is not visible in this view.](slider-init-vioecmvll-ex.gif)
    ///
    /// - Parameters:
    ///   - value: A binding connected to the slider value.
    ///   - bounds: A range of possible values. Defaults to `0...1`.
    ///   - onEditingChanged: A function called when editing begins and ends, which takes a boolean
    ///   parameter equal to `true` when editing begins, and `false` when it ends.
    ///   - minimumValueLabel: A view used as a label on the minimum value side of the slider.
    ///   - maximumValueLabel: A view used as a label on the maximum value side of the slider.
    ///   - label: A view used as a label for the slider. Mainly used for accessibility on iOS.
    @available(tvOS, unavailable)
    @available(iOS, deprecated: 100000.0, renamed: "Slider(value:in:label:minimumValueLabel:maximumValueLabel:onEditingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "Slider(value:in:label:minimumValueLabel:maximumValueLabel:onEditingChanged:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Slider(value:in:label:minimumValueLabel:maximumValueLabel:onEditingChanged:)")
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, minimumValueLabel: ValueLabel, maximumValueLabel: ValueLabel, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint { }

    /// Creates a slider with a label, max/min labels, and a step size.
    ///
    /// ```
    /// struct LabeledSliderView: View {
    ///     @State private var value: Double = 50
    ///
    ///     var body: some View {
    ///         Slider(value: $value,
    ///                in: 0...100,
    ///                step: 10,
    ///                onEditingChanged: { began in print("began? \(began)") },
    ///                minimumValueLabel: Text("🐣"),
    ///                maximumValueLabel: Text("🐔"),
    ///                label: { Text("Age") })
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a slider starting at half capacity sliding back and
    /// forth with minimumValueLabel and maximumValueLabel set to be a chick emoji
    /// and a rooster emoji, respectively. The left hand side of the slide is the
    /// minimum label and the right side is the max. The slider itself is also labeled
    /// "Age" which is not visible in this view. In this case, a step size is also
    /// specified in the initializer which makes the movement of the slider discrete,
    /// rather than a smooth movement from side to side.](slider-init-visoecmvll-ex.gif)
    ///
    /// - Parameters:
    ///   - value: A binding connected to the slider value.
    ///   - bounds: A range of possible values. Defaults to `0...1`.
    ///   - step: The distance between values on the slider. Defaults to 1.
    ///   - onEditingChanged: A function called when editing begins and ends, which takes a boolean
    ///   parameter equal to true when editing begins, and false when it ends. For
    ///   example, on iOS, editing begins when the user starts to drag the thumb
    ///   along the slider's track.
    ///   - minimumValueLabel: A view used as a label on the minimum value side of the slider.
    ///   - maximumValueLabel: A view used as a label on the maximum value side of the slider.
    ///   - label: A view used as a label for the slider. Mainly used for accessibility on iOS.
    @available(tvOS, unavailable)
    @available(iOS, deprecated: 100000.0, renamed: "Slider(value:in:step:label:minimumValueLabel:maximumValueLabel:onEditingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "Slider(value:in:step:label:minimumValueLabel:maximumValueLabel:onEditingChanged:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Slider(value:in:step:label:minimumValueLabel:maximumValueLabel:onEditingChanged:)")
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, minimumValueLabel: ValueLabel, maximumValueLabel: ValueLabel, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint { }
}

@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension Slider where ValueLabel == EmptyView {

    /// Creates a slider with a label.
    ///
    /// ```
    /// struct LabeledSliderView: View {
    ///     @State private var value: Double = 50
    ///
    ///     var body: some View {
    ///         Slider(value: $value,
    ///                in: 0...100,
    ///                onEditingChanged: { began in print("began? \(began)") },
    ///                label: { Text("Age") })
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a slider starting at half capacity sliding back and
    /// forth; The slider itself is labeled "Age" which is not visible in this view.](slider-init-vioecl-ex.gif)
    ///
    /// - Parameters:
    ///   - value: A binding connected to the slider value.
    ///   - bounds: A range of possible values. Defaults to `0...1`.
    ///   - onEditingChanged: A function called when editing begins and ends, which takes a boolean
    ///   parameter equal to true when editing begins, and false when it ends.
    ///   - label: A view used as a label for the slider. Mainly used for accessibility on iOS.
    @available(tvOS, unavailable)
    @available(iOS, deprecated: 100000.0, renamed: "Slider(value:in:label:onEditingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "Slider(value:in:label:onEditingChanged:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Slider(value:in:label:onEditingChanged:)")
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint { }

    /// Creates a slider with a label and a step size.
    ///
    /// ```
    /// struct LabeledSliderView: View {
    ///     @State private var value: Double = 50
    ///
    ///     var body: some View {
    ///         Slider(value: $value,
    ///                in: 0...100,
    ///                step: 10,
    ///                onEditingChanged: { began in print("began? \(began)") },
    ///                label: { Text("Age") })
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a slider starting at half capacity sliding back and
    /// forth; The slider itself is labeled "Age" which is not visible in this view.
    /// In this case, a step size is also specified in the initializer which makes
    /// the movement of the slider discrete, rather than a smooth movement from
    /// side to side.](slider-init-visoecl-ex.gif)
    ///
    /// - Parameters:
    ///   - value: A binding connected to the slider value.
    ///   - bounds: A range of possible values. Defaults to `0...1`.
    ///   - step: The distance between values on the slider. Defaults to 1.
    ///   - onEditingChanged: A function called when editing begins and ends, which takes a boolean
    ///   parameter equal to true when editing begins, and false when it ends.
    ///   - label: A view used as a label for the slider. Mainly used for accessibility on iOS.
    @available(tvOS, unavailable)
    @available(iOS, deprecated: 100000.0, renamed: "Slider(value:in:step:label:onEditingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "Slider(value:in:step:label:onEditingChanged:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Slider(value:in:step:label:onEditingChanged:)")
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint { }
}

@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension Slider where Label == EmptyView, ValueLabel == EmptyView {

    /// Creates a slider.
    ///
    /// ```
    /// struct LabeledSliderView: View {
    ///     @State private var value: Double = 50
    ///
    ///     var body: some View {
    ///         Slider(value: $value,
    ///                in: 0...100,
    ///                onEditingChanged: { began in print("began? \(began)") })
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a light gray slider on a white background sliding
    /// back and forth; blue color fills the slider to the left of the controlling
    /// point, shifting as the value changes.](slider-init-vioecl-ex.gif)
    ///
    /// - Parameters:
    ///   - value: A binding connected to the slider value.
    ///   - bounds: A range of possible values. Defaults to `0...1`.
    ///   - onEditingChanged: A function called when editing begins and ends, which takes a boolean
    ///   parameter equal to true when editing begins, and false when it ends.
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint { }

    /// Creates a slider with a step size.
    ///
    /// ```
    /// struct LabeledSliderView: View {
    ///     @State private var value: Double = 0
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text("Value: \(value)")
    ///             Slider(value: $value,
    ///                    in: 0...100,
    ///                    step: 10,
    ///                    onEditingChanged: { began in print("began? \(began)") })
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a slider from 0 to 100 initialized with a step size of 10. A text
    /// view above it reads "Value:" followed by the current value of the slider.](slider-init-value-step-ex.gif)
    ///
    /// - Parameters:
    ///   - value: A binding connected to the slider value.
    ///   - bounds: A range of possible values. Defaults to `0...1`.
    ///   - step: The distance between values on the slider. Defaults to 1.
    ///   - onEditingChanged: A function called when editing begins and ends, which takes a boolean
    ///   parameter equal to true when editing begins, and false when it ends.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint { }
}

