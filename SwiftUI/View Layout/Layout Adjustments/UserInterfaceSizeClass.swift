/// A set of values that indicate the visual size available to the view.
@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public enum UserInterfaceSizeClass {

    /// The compact size class.
    case compact

    /// The regular size class.
    case regular
}

extension UserInterfaceSizeClass {

    /// Create a size class from its UIUserInterfaceSizeClass equivalent.
    @available(iOS 14.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiUserInterfaceSizeClass: UIUserInterfaceSizeClass) { }
}

