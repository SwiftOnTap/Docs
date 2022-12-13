/// Specifies the appearance and interaction of all pickers within a view hierarchy.
///
/// `PickerStyle` styles a ``Picker`` and does not have a public interface
/// - and therefore your app is limited to their default styles.
///
/// To apply a `PickerStyle` to a ``Picker``, use the ``View/pickerStyle(_:)``
/// view modifier.
///
/// There are 7 different styles:
/// * ``DefaultPickerStyle``
/// * ``InlinePickerStyle``
/// * ``MenuPickerStyle``
/// * ``SegmentedPickerStyle``
/// * ``WheelPickerStyle``
/// * `PopUpButtonPickerStyle` (not available on iOS)
/// * `RadioGroupPickerStyle` (not available on iOS)
///
/// ### ``DefaultPickerStyle``
/// [[pickerstyle-default]]
///
/// ### ``InlinePickerStyle``
/// [[pickerstyle-inline]]
///
/// ### ``MenuPickerStyle``
/// [[pickerstyle-menu]]
///
/// ### ``SegmentedPickerStyle``
/// [[pickerstyle-segmented]]
///
/// ### ``WheelPickerStyle``
/// [[pickerstyle-wheel]]
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PickerStyle { }

extension PickerStyle { }
