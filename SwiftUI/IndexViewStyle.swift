/// Types conforming to this protocol are used to style page index ``TabView``'s.
///
/// Currently the IndexViewStyle protocol is not public, so it cannot be implemented for
/// a custom view. The only type conforming to this protocol is ``PageIndexViewStyle``.
/// To configure the current `IndexViewStyle` for a view hierarchy, use the
/// `.indexViewStyle()` modifier.
///
/// For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         TabView {
///             Text("Tab 1")
///             Text("Tab 2")
///             Text("Tab 3")
///         }
///         .tabViewStyle(.page(indexDisplayMode: .always))
///         .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
///     }
/// }
/// ```
///
/// ![Index view style protocol example 1](A68AC8DE-29C1-44C6-880C-2CEB9ED93988.png)
@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public protocol IndexViewStyle { }

extension IndexViewStyle { }

