/// A type to generate an ``AXChartDescriptor`` object that you use to provide
/// information about a chart and its data for an accessible experience
/// in VoiceOver or other assistive technologies.
///
/// Note that you may use the `@Environment` property wrapper inside the
/// implementation of your ``AXChartDescriptorRepresentable``, in which case you
/// should implement `updateChartDescriptor`, which will be called when the
/// `Environment` changes.
///
/// For example, to provide accessibility for a view that represents a chart,
/// you would first declare your chart descriptor representable type:
///
///     struct MyChartDescriptorRepresentable: AXChartDescriptorRepresentable {
///         func makeChartDescriptor() -> AXChartDescriptor {
///             // Build and return your `AXChartDescriptor` here.
///         }
///
///         func updateChartDescriptor(_ descriptor: AXChartDescriptor) {
///             // Update your chart descriptor with any new values.
///         }
///     }
///
/// Then, provide an instance of your `AXChartDescriptorRepresentable` type to
/// your view using the `accessibilityChartDescriptor` modifier:
///
///     var body: some View {
///         MyChartView()
///             .accessibilityChartDescriptor(MyChartDescriptorRepresentable())
///     }
///
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public protocol AXChartDescriptorRepresentable {

    /// Create the `AXChartDescriptor` for this view, and return it.
    ///
    /// This will be called once per identity of your `View`. It will not be run
    /// again unless the identity of your `View` changes. If you need to
    /// update the `AXChartDescriptor` based on changes in your `View`, or in
    /// the `Environment`, implement `updateChartDescriptor`.
    /// This method will only be called if / when accessibility needs the
    /// `AXChartDescriptor` of your view, for VoiceOver.
    func makeChartDescriptor() -> AXChartDescriptor { }

    /// Update the existing `AXChartDescriptor` for your view, based on changes
    /// in your view or in the `Environment`.
    ///
    /// This will be called as needed, when accessibility needs your
    /// `AXChartDescriptor` for VoiceOver. It will only be called if the inputs
    /// to your views, or a relevant part of the `Environment`, have changed.
    func updateChartDescriptor(_ descriptor: AXChartDescriptor) { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension AXChartDescriptorRepresentable {

    /// Update the existing `AXChartDescriptor` for your view, based on changes
    /// in your view or in the `Environment`.
    ///
    /// This will be called as needed, when accessibility needs your
    /// `AXChartDescriptor` for VoiceOver. It will only be called if the inputs
    /// to your views, or a relevant part of the `Environment`, have changed.
    public func updateChartDescriptor(_ descriptor: AXChartDescriptor) { }
}

