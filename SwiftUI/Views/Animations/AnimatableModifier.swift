/// A modifier that can create another modifier with animation.
///
/// ``AnimatableModifier`` is closely coupled with ``Animatable``.
///
/// [[animatable-modifier]]
@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "use Animatable directly")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "use Animatable directly")
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "use Animatable directly")
@available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "use Animatable directly")
public protocol AnimatableModifier : Animatable, ViewModifier { }

extension AnimatableModifier : Animatable, ViewModifier { }
