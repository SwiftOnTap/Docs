/// The Accessibility Bold Text user setting options.
///
/// The app can't override the user's choice.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum LegibilityWeight : Hashable {
    
    /// Use regular font weight (no Accessibility Bold).
    case regular
    
    /// Use heavier font weight (force Accessibility Bold).
    case bold
    
}

extension LegibilityWeight {

    /// Creates a legibility weight from its UILegibilityWeight equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiLegibilityWeight: UILegibilityWeight) { }
}

