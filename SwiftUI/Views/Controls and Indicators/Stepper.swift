/// Two side-by-side plus/minus buttons.
///
/// Use a stepper to give user control
/// incrementing or decrementing a discrete value.
///
/// - Note: For changing a continuous value, use ``Slider`` instead.
///
/// In general, there are 3 different stepper label types, and 3 different increment/decrement
/// types, for a total of 9 different initializers.
///
/// Label types:
/// 1. [`String`](https://developer.apple.com/documentation/swift/string)
/// 2. ``LocalizedStringKey``
/// 3. ``View``
///
/// Increment/decrement types:
/// 1. Increment and decrement **actions**
/// 2. Closed range **binding**
/// 3. Unlimited range **binding**
///
/// Here is a very simple example:
///
/// ```
/// struct StepperView: View {
///     @State private var value = 0
///
///     var body: some View {
///         Stepper(onIncrement: { value += 1 },
///                 onDecrement: { value -= 1 }) {
///             Text("\(value)")
///         }
///     }
/// }
/// ```
///
/// ![A gif displaying a stepper on the right side of the screen and a number
/// on the left which reflects the value that the stepper has reached. When the user
/// selects the plus button, the number is incremented by 1, and when the user selects
/// the minus button, the number is decremented by 1. The initial value passed
/// to the text is 0, a local state variable.](stepper-ex.gif)
///
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct Stepper<Label> : View where Label : View {

    /// Creates a stepper with a view label and increment/decrement actions.
    ///
    /// Use this initializer to create a control with a custom title that
    /// executes closures you provide when the user clicks or taps the
    /// stepper's increment or decrement buttons.
    ///
    /// The example below uses an array that holds a number of ``Color`` values,
    /// a local state variable, `value`, to set the control's background
    /// color, and title label. When the user clicks or taps on the stepper's
    /// increment or decrement buttons SwiftUI executes the relevant
    /// closure that updates `value`, wrapping the `value` to prevent overflow.
    /// SwiftUI then re-renders the view, updating the text and background
    /// color to match the current index:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let colors: [Color] = [.orange, .red, .gray, .blue, .green, .purple, .pink]
    ///
    ///         func incrementStep() {
    ///             value += 1
    ///             if value >= colors.count { value = 0 }
    ///         }
    ///
    ///         func decrementStep() {
    ///             value -= 1
    ///             if value < 0 { value = colors.count - 1 }
    ///         }
    ///
    ///         var body: some View {
    ///             Stepper(onIncrement: incrementStep, onDecrement: decrementStep) {
    ///                 Text("Value: \(value) Color: \(colors[value].description)")
    ///             }
    ///             .background(colors[value])
    ///         }
    ///     }
    ///
    /// ![A gif with a colored stepper across the center of the screen that reads
    /// a value and a color with the plus/minus on the right side. The initial
    /// value is 0 and the color orange, but as the stepper is incremented, the
    /// array of colors is cycled through and each time the background is
    /// re-rendered to reflect the updated color.](stepper-init-oi-od-oec-l-ex.gif)
    ///
    /// - Parameters:
    ///     - onIncrement: The closure to execute when the user clicks or taps
    ///       the control's plus button.
    ///     - onDecrement: The closure to execute when the user clicks or taps
    ///       the control's minus button.
    ///     - onEditingChanged: A closure called when editing begins and ends.
    ///       For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a ``Stepper`` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    ///     - label: A view describing the purpose of this stepper.
    @available(iOS, deprecated: 100000.0, renamed: "Stepper(label:onIncrement:onDecrement:onEditingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "Stepper(label:onIncrement:onDecrement:onEditingChanged:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Stepper(label:onIncrement:onDecrement:onEditingChanged:)")
    public init(onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) { }

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Stepper {

    /// Creates a stepper with a view label and unlimited range binding.
    ///
    /// Use this initializer to create a stepper that increments or decrements
    /// a bound value by a specific amount each time the user
    /// clicks or taps the stepper's increment or decrement buttons.
    ///
    /// In the example below, a stepper increments or decrements `value` by the
    /// `step` value of 5 at each click or tap of the control's increment or
    /// decrement button:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///
    ///         var body: some View {
    ///             Stepper(value: $value, step: step) {
    ///                 Text("Current value: \(value), step: \(step)")
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a stepper that reads a current value and a step size,
    /// with the plus/minus on the right side. Here, the initial value is set to
    /// 1 and the step set to 5, so each time the user increments the value increases
    /// by 5.](stepper-init-v-s-oec-l-ex.gif)
    ///
    /// - Parameters:
    ///   - value: The ``Binding`` to a value that you provide.
    ///   - step: The amount to increment or decrement `value` each time the
    ///     user clicks or taps the stepper's increment or decrement buttons.
    ///     Defaults to `1`.
    ///   - onEditingChanged: A closure that's called when editing begins and
    ///     ends. For example, on iOS, the user may touch and hold the increment
    ///     or decrement buttons on a stepper which causes the execution
    ///     of the `onEditingChanged` closure at the start and end of
    ///     the gesture.
    ///   - label: A view describing the purpose of this stepper.
    @available(iOS, deprecated: 100000.0, renamed: "Stepper(value:step:label:onEditingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "Stepper(value:step:label:onEditingChanged:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Stepper(value:step:label:onEditingChanged:)")
    public init<V>(value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : Strideable { }

    /// Creates a stepper with a view label and closed range binding.
    ///
    /// Use this initializer to create a stepper that increments or decrements
    /// a binding to value by the step size you provide within the given bounds.
    /// By setting the bounds, you ensure that the value never goes below or
    /// above the lowest or highest value, respectively.
    ///
    /// The example below shows a stepper that displays the effect of
    /// incrementing or decrementing a value with the step size of `step`
    /// with the bounds defined by `range`:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             Stepper(value: $value, in: range, step: step) {
    ///                 Text("Current: \(value) in \(range.description) ") +
    ///                     Text("stepping by \(step)")
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a stepper that reads the current value in a closed range
    /// from 1 to 50. The text reads "Current: # in 1...50 stepping by 5." The
    /// value starts at 0 and each time the user increments, the current number
    /// changes to reflect where the stepper is at in its range.](stepper-init-v-i-s-oec-l-ex.gif)
    ///
    /// - Parameters:
    ///   - value: A ``Binding`` to a value that you provide.
    ///   - bounds: A closed range that describes the upper and lower bounds
    ///     permitted by the stepper.
    ///   - step: The amount to increment or decrement the stepper when the
    ///     user clicks or taps the stepper's increment or decrement buttons,
    ///     respectively.
    ///   - onEditingChanged: A closure that's called when editing begins and
    ///     ends. For example, on iOS, the user may touch and hold the increment
    ///     or decrement buttons on a stepper which causes the execution
    ///     of the `onEditingChanged` closure at the start and end of
    ///     the gesture.
    ///   - label: A view describing the purpose of this stepper.
    @available(iOS, deprecated: 100000.0, renamed: "Stepper(value:in:step:label:onEditingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "Stepper(value:in:step:label:onEditingChanged:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Stepper(value:in:step:label:onEditingChanged:)")
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : Strideable { }
}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Stepper where Label == Text {

    /// Creates a stepper with a localized string key binding and increment/decrement actions.
    ///
    /// Use this initializer to create a stepper with a custom title that
    /// executes closures you provide when either of the stepper's increment
    /// or decrement buttons are pressed. This version of ``Stepper`` doesn't
    /// take a binding to a value, nor does it allow you to specify a range of
    /// acceptable values, or a step value -- it simply calls the closures you
    /// provide when the control's buttons are pressed.
    ///
    /// The example below uses an array that holds a number of ``Color`` values,
    /// a local state variable, `value`, to set the control's background
    /// color, and title label. When the user clicks or taps on the stepper's
    /// increment or decrement buttons SwiftUI executes the relevant
    /// closure that updates `value`, wrapping the `value` to prevent overflow.
    /// SwiftUI then re-renders the view, updating the text and background
    /// color to match the current index:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let colors: [Color] = [.orange, .red, .gray, .blue, .green, .purple, .pink]
    ///
    ///         func incrementStep() {
    ///             value += 1
    ///             if value >= colors.count { value = 0 }
    ///         }
    ///
    ///         func decrementStep() {
    ///             value -= 1
    ///             if value < 0 { value = colors.count - 1 }
    ///         }
    ///
    ///         var body: some View {
    ///             Stepper("Value: \(value) Color: \(colors[value].description)",
    ///                      onIncrement: incrementStep,
    ///                      onDecrement: decrementStep)
    ///             .background(colors[value])
    ///         }
    ///     }
    ///
    /// ![A gif with a colored stepper across the center of the screen that reads
    /// a value and a color with the plus/minus on the right side. The initial
    /// value is 0 and the color orange, but as the stepper is incremented, the
    /// array of colors is cycled through and each time the background is
    /// re-rendered to reflect the updated color.](stepper-init-oi-od-oec-l-ex.gif)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - onIncrement: The closure to execute when the user clicks or taps the
    ///       control's plus button.
    ///     - onDecrement: The closure to execute when the user clicks or taps the
    ///       control's minus button.
    ///    - onEditingChanged: A closure that's called when editing begins and
    ///      ends. For example, on iOS, the user may touch and hold the increment
    ///      or decrement buttons on a ``Stepper`` which causes the execution
    ///      of the `onEditingChanged` closure at the start and end of
    ///      the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }) { }

    /// Creates a stepper with a string label and increment/decrement actions.
    ///
    /// Use `Stepper(_:onIncrement:onDecrement:onEditingChanged:)` to create a
    /// control with a custom title that executes closures you provide when
    /// the user clicks or taps on the stepper's increment or decrement buttons.
    ///
    /// The example below uses an array that holds a number of ``Color`` values,
    /// a local state variable, `value`, to set the control's background
    /// color, and title label. When the user clicks or taps on the stepper's
    /// increment or decrement buttons SwiftUI executes the relevant
    /// closure that updates `value`, wrapping the `value` to prevent overflow.
    /// SwiftUI then re-renders the view, updating the text and background
    /// color to match the current index:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let title = "Step through colors 🎨"
    ///         let colors: [Color] = [.orange, .red, .gray, .blue, .green,
    ///                                .purple, .pink]
    ///
    ///         func incrementStep() {
    ///             value += 1
    ///             if value >= colors.count { value = 0 }
    ///         }
    ///
    ///         func decrementStep() {
    ///             value -= 1
    ///             if value < 0 { value = colors.count - 1 }
    ///         }
    ///
    ///         var body: some View {
    ///             Stepper(title, onIncrement: incrementStep, onDecrement: decrementStep)
    ///                 .background(colors[value])
    ///         }
    ///     }
    ///
    /// ![A gif displaying a stepper that reads "Step through colors." When incremented,
    /// the background of the stepper re-renders to reflect an updated color in its array.
    /// This initializer uses a string title as the text for the label.](stepper-init-oi-od-oec-ex.gif)
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - onIncrement: The closure to execute when the user clicks or taps the
    ///       control's plus button.
    ///     - onDecrement: The closure to execute when the user clicks or taps the
    ///       control's minus button.
    ///    - onEditingChanged: A closure that's called when editing begins and
    ///      ends. For example, on iOS, the user may touch and hold the increment
    ///      or decrement buttons on a ``Stepper`` which causes the execution
    ///      of the `onEditingChanged` closure at the start and end of
    ///      the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol { }

    /// Creates a stepper with a localized string key label and unlimited range binding.
    ///
    /// Use `Stepper(_:value:step:onEditingChanged:)` to create a stepper with a
    /// custom title that increments or decrements a binding to value by the
    /// step size you specify.
    ///
    /// In the example below, the stepper increments or decrements the binding
    /// value by `5` each time the user clicks or taps on the control's
    /// increment or decrement buttons, respectively:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///
    ///         var body: some View {
    ///             Stepper("Current value: \(value), step: \(step)",
    ///                     value: $value,
    ///                     step: step)
    ///         }
    ///     }
    ///
    /// ![A gif displaying a stepper that reads a current value and a step size,
    /// with the plus/minus on the right side. Here, the initial value is set to
    /// 1 and the step set to 5, so each time the user increments the value increases
    /// by 5.](stepper-init-v-s-oec-l-ex.gif)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that you provide.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's plus or minus button,
    ///       respectively.  Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the
    ///       increment or decrement buttons on a ``Stepper`` which causes the
    ///       execution of the `onEditingChanged` closure at the start and end
    ///       of the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable { }

    /// Creates a stepper with a string label and unlimited range binding.
    ///
    /// Use `Stepper(_:value:step:onEditingChanged:)` to create a stepper with a
    /// custom title that increments or decrements a binding to value by the
    /// step size you specify.
    ///
    /// In the example below, the stepper increments or decrements the binding
    /// value by `5` each time one of the user clicks or taps the control's
    /// increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///         let title = "Step me 🆙"
    ///
    ///         var body: some View {
    ///             Text("Step count: \(value)")
    ///             Stepper(title, value: $value, step: step)
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a textview "Step count: \(value)" above
    /// a stepper that reads "Step me up" on the left side; the step is initialized
    /// to 5 in the stepper and changes by 5 when the increment and decrement
    /// buttons are pressed.](stepper-init-value-step-oec-ex.gif)
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - value: The ``Binding`` to a value that you provide.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the
    ///       increment or decrement buttons on a ``Stepper`` which causes the
    ///       execution of the `onEditingChanged` closure at the start and end
    ///       of the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S, V>(_ title: S, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, V : Strideable { }

    /// Creates a stepper with a localized string key label and closed range binding.
    ///
    /// Use `Stepper(_:value:in:step:onEditingChanged:)` to create a stepper
    /// that increments or decrements a value within a specific range of values
    /// by a specific step size. In the example below, a stepper increments or
    /// decrements a binding to value over a range of `1...50` by `5` at each
    /// press of the stepper's increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         @State private var titleKey = "Step city 🏙"
    ///
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             VStack(spacing: 20) {
    ///                 Text("Current Stepper Value: \(value)")
    ///                 Stepper(titleKey, value: $value, in: range, step: step)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a stepper with the localized string key label "Step city,"
    /// and text above it that reads "Current Stepper Value:" followed by the current
    /// value. The step is initialized to 5 and the value set to 0, as well as
    /// a closed range from 1 to 50. As the user increments the stepper, the value
    /// increases by 5, but nothing else in the view changes.](stepper-step-5-from-0.gif)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that your provide.
    ///     - bounds: A closed range that describes the upper and lower bounds
    ///       permitted by the stepper.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a ``Stepper`` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable { }

    /// Creates a stepper with a string label and closed range binding.
    ///
    /// Use `Stepper(_:value:in:step:onEditingChanged:)` to create a stepper
    /// that increments or decrements a value within a specific range of values
    /// by a specific step size. In the example below, a stepper increments or
    /// decrements a binding to value over a range of `1...50` by `5` each time
    /// the user clicks or taps the stepper's increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             Stepper("Current: \(value) in \(range.description) stepping by \(step)",
    ///                     value: $value,
    ///                     in: range,
    ///                     step: step)
    ///         }
    ///     }
    ///
    /// ![A gif displaying a stepper that reads the current value in a closed range
    /// from 1 to 50. The text reads "Current: # in 1...50 stepping by 5." The
    /// value starts at 0 and each time the user increments, the current number
    /// changes to reflect where the stepper is at in its range.](stepper-init-v-i-s-oec-l-ex.gif)
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that your provide.
    ///     - bounds: A closed range that describes the upper and lower bounds
    ///       permitted by the stepper.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a ``Stepper`` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S, V>(_ title: S, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, V : Strideable { }
}

