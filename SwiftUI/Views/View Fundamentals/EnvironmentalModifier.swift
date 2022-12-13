/// A modifier that must resolve to a concrete modifier in an environment before
/// use.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol EnvironmentalModifier : ViewModifier where Self.Body == Never { }
extension EnvironmentalModifier : ViewModifier where Self.Body == Never {

    /// The type of modifier to use after being resolved.
    associatedtype ResolvedModifier : ViewModifier

    /// Resolve to a concrete modifier in the given ``environment``.
    func resolve(in environment: EnvironmentValues) -> Self.ResolvedModifier { }
}

