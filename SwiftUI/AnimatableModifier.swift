/// A modifier that can create another modifier with animation.
///
/// ``AnimatableModifier`` is closely coupled with ``Animatable``.
///
/// [[animatable-modifier]]
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol AnimatableModifier : Animatable, ViewModifier { }
extension AnimatableModifier : Animatable, ViewModifier {
}
