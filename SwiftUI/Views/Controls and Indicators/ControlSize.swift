/// The size classes, like regular or small, that you can apply to controls
/// within a view.
@available(iOS 15.0, macOS 10.15, watchOS 9.0, *)
@available(tvOS, unavailable)
public enum ControlSize : CaseIterable {

    /// A control version that is minimally sized.
    case mini

    /// A control version that is proportionally smaller size for space-constrained views.
    case small

    /// A control version that is the default size.
    case regular

    /// A control version that is prominently sized.
    @available(macOS 11.0, *)
    case large

    /// A collection of all values of this type.
    public static var allCases: [ControlSize] { get }

}

@available(iOS 15.0, macOS 10.15, watchOS 9.0, *)
@available(tvOS, unavailable)
extension ControlSize : Equatable { }

@available(iOS 15.0, macOS 10.15, watchOS 9.0, *)
@available(tvOS, unavailable)
extension ControlSize : Hashable { }
