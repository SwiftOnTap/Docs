/// A structure that defines the placement of a search field in a view
/// hierarchy.
///
/// You can give a preferred placement to any of the searchable modifiers, like
/// ``View/searchable(text:placement:prompt:)-co5e``:
///
///     var body: some View {
///         NavigationView {
///             PrimaryView()
///             SecondaryView()
///             Text("Select a primary and secondary item")
///         }
///         .searchable(text: $text, placement: .sidebar)
///     }
///
/// Depending on the containing view hierachy, the requested placement may
/// not be able to be fulfilled.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct SearchFieldPlacement {

    /// The search field is placed automatically depending on the platform.
    ///
    /// On iOS, iPadOS, and macOS, the search field is placed in the toolbar.
    ///
    /// On tvOS and watchOS, the search field will be placed inline with its
    /// content.
    public static let automatic: SearchFieldPlacement

    /// The search field is placed in the toolbar.
    ///
    /// On iOS and watchOS, the search field is placed beneath the
    /// navigation bar and revealed by scrolling.
    ///
    /// On iPadOS, the search field is placed in the trailing
    /// navigation bar.
    ///
    /// On macOS, the search field is placed in the trailing toolbar.
    @available(tvOS, unavailable)
    public static let toolbar: SearchFieldPlacement

    /// The search field is placed in the sidebar of a navigation view.
    ///
    /// On iOS, and iPadOS the search field is placed in the section of
    /// the navigation bar associated with the sidebar.
    ///
    /// On macOS, the search field is placed inline with the sidebar's content.
    ///
    /// If a sidebar is not available, the search field is placed inline with
    /// other available content.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let sidebar: SearchFieldPlacement

    /// The search field is placed in an drawer of the navigation bar.
    ///
    /// The drawer is beneath any navigation bar title, and depending
    /// on the provided display mode, may collapse into the navigation bar as a
    /// user scrolls the content.
    @available(iOS 15.0, watchOS 8.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    public static let navigationBarDrawer: SearchFieldPlacement

    /// The search field is placed in an drawer of the navigation bar.
    ///
    /// The drawer is beneath any navigation bar title, and collapses
    /// into the navigation bar as a user scrolls the content depending on
    /// the provided display mode.
    ///
    /// - Parameter displayMode: How to display the search field based on
    ///   the users content.
    @available(iOS 15.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static func navigationBarDrawer(displayMode: SearchFieldPlacement.NavigationBarDrawerDisplayMode) -> SearchFieldPlacement { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension SearchFieldPlacement {

    /// A structure that defines the display behavior of a search field
    /// when in the navigation bar drawer.
    @available(iOS 15.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public struct NavigationBarDrawerDisplayMode {

        /// Allow the search field to be collapsed as the user scrolls
        /// their content.
        public static let automatic: SearchFieldPlacement.NavigationBarDrawerDisplayMode

        /// Always display the search field no matter the scroll position of
        /// the user's content.
        public static let always: SearchFieldPlacement.NavigationBarDrawerDisplayMode
    }
}

