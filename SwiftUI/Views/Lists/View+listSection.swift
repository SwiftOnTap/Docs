@available(iOS 15.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets whether to hide the separator associated with a list section.
    ///
    /// Separators can be presented above and below a section. You can specify to
    /// which edge this preference should apply.
    ///
    /// This modifier expresses a preference to the containing ``List``. The list
    /// style is the final arbiter of the separator visibility.
    ///
    /// The following example shows a simple grouped list whose bottom
    /// sections separator are hidden:
    ///
    ///     List {
    ///         ForEach(garage) { garage in
    ///             Section(header: Text(garage.location)) {
    ///                 ForEach(garage.cars) { car in
    ///                     Text(car.model)
    ///                         .listRowSeparatorTint(car.brandColor)
    ///                 }
    ///             }
    ///             .listSectionSeparator(.hidden, edges: .bottom)
    ///         }
    ///     }
    ///     .listStyle(.grouped)
    ///
    /// To change the visibility and tint color for a row separator, use
    /// ``View/listRowSeparator(_:edges:)`` and
    /// ``View/listRowSeparatorTint(_:edges:)``.
    /// To set the tint color for a section separator, use
    /// ``View/listSectionSeparatorTint(_:edges:)``.
    ///
    /// - Parameters:
    ///     - visibility: The visibility of this section's separators.
    ///     - edges: The set of row edges for which the preference applies.
    ///         The list style might already decide to not display separators for
    ///         some edges. The default is ``VerticalEdge/Set/all``.
    ///
    public func listSectionSeparator(_ visibility: Visibility, edges: VerticalEdge.Set = .all) -> some View { }


    /// Sets the tint color associated with a section.
    ///
    /// Separators can be presented above and below a section. You can specify to
    /// which edge this preference should apply.
    ///
    /// This modifier expresses a preference to the containing ``List``. The list
    /// style is the final arbiter for the separator tint.
    ///
    /// The following example shows a simple grouped list whose section separators
    /// are tinted based on section-specific data:
    ///
    ///     List {
    ///         ForEach(garage) { garage in
    ///             Section(header: Text(garage.location)) {
    ///                 ForEach(garage.cars) { car in
    ///                     Text(car.model)
    ///                         .listRowSeparatorTint(car.brandColor)
    ///                 }
    ///             }
    ///             .listSectionSeparatorTint(
    ///                 garage.cars.last?.brandColor, edges: .bottom)
    ///         }
    ///     }
    ///     .listStyle(.grouped)
    ///
    /// To change the visibility and tint color for a row separator, use
    /// ``View/listRowSeparator(_:edges:)`` and
    /// ``View/listRowSeparatorTint(_:edges:)``.
    /// To hide a section separator, use
    /// ``View/listSectionSeparator(_:edges:)``.
    ///
    /// - Parameters:
    ///     - color: The color to use to tint the section separators, or `nil` to
    ///         use the default color for the current list style.
    ///     - edges: The set of row edges for which the tint applies.
    ///         The list style might decide to not display certain separators,
    ///         typically the top edge. The default is ``VerticalEdge/Set/all``.
    ///
    public func listSectionSeparatorTint(_ color: Color?, edges: VerticalEdge.Set = .all) -> some View { }

}

