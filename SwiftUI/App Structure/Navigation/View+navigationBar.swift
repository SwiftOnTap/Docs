@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension View {

    /// Hides the navigation bar for this view.
    ///
    /// Use ``View/navigationBarHidden(_:)`` to hide the navigation bar. This modifier
    /// only takes effect when this view is inside of and visible within a
    /// ``NavigationView``.
    ///
    ///     struct FlavorView: View {
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip", "Pistachio"]
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 List(items, id: \.self) { item in
    ///                     Text(item)
    ///                 }
    ///                 .navigationBarTitle("You can't see me 👀")
    ///                 .navigationBarHidden(true)
    ///             }
    ///         }
    ///     }
    ///
    /// ![](navigationbarhidden.png)
    ///
    /// - Parameter hidden: A Boolean value that indicates whether to hide the
    ///   navigation bar.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use toolbar(.hidden)")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use toolbar(.hidden)")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use toolbar(.hidden)")
    @available(macOS, unavailable)
    public func navigationBarHidden(_ hidden: Bool) -> some View { }


    /// A view modifier that sets the title in the navigation bar for this view.
    ///
    /// **This modifier has been deprecated. Use
    /// ``View/navigationTitle(_:)-e8e60`` instead.**
    ///
    /// Use `navigationBarTitle(_:)` to set the title of the navigation bar.
    /// This modifier only takes effect when this view is inside of and visible
    /// within a ``NavigationView``.
    ///
    /// The example below shows setting the title of the navigation bar using a
    /// ``Text`` view:
    ///
    ///     struct FlavorView: View {
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip", "Pistachio"]
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 List(items, id: \.self) { item in
    ///                     Text(item)
    ///                 }
    ///                 .navigationBarTitle(Text("Today's Flavors"))
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a navigation bar with a series of ice cream
    /// flavors, with a navigationBarTitle view modifier applied to the list to
    /// read "Today's Flavors" in large bold text above the list.](navigationbartitle.png)
    ///
    /// - Parameter title: A description of this view to display in the
    ///   navigation bar.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    public func navigationBarTitle(_ title: Text) -> some View { }


    /// A view modifier that sets the title of this view's navigation bar with a localized string.
    ///
    /// **This modifier has been deprecated. Use
    /// ``View/navigationTitle(_:)-d3628`` instead.**
    ///
    /// Use `navigationBarTitle(_:)` to set the title of the navigation bar
    /// using a ``LocalizedStringKey`` that will be used to search for a
    /// matching localized string in the application's localizable strings
    /// assets.
    ///
    /// This modifier only takes effect when this view is inside of and visible
    /// within a ``NavigationView``.
    ///
    /// In the example below, a string constant is used to access a
    /// ``LocalizedStringKey`` that will be resolved at run time to provide a
    /// title for the navigation bar. If the localization key cannot be
    /// resolved, the text of the key name will be used as the title text.
    ///
    ///     struct FlavorView: View {
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip", "Pistachio"]
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 List(items, id: \.self) { item in
    ///                     Text(item)
    ///                 }
    ///                 .navigationBarTitle("Today's Flavors")
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a navigation bar with a series of ice cream
    /// flavors, with a navigationBarTitle view modifier applied to the list to
    /// read "Today's Flavors" in large bold text above the list.](navigationbartitle.png)
    ///
    /// - Parameter titleKey: A key to a localized description of this view to
    ///   display in the navigation bar.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    public func navigationBarTitle(_ titleKey: LocalizedStringKey) -> some View { }


    /// A view modifier that sets the title of this view's navigation bar with a string.
    ///
    /// **This modifier has been deprecated. Use
    /// ``View/navigationTitle(_:)-ee24d`` instead.**
    ///
    /// Use `navigationBarTitle(_:)` to set the title of the navigation bar
    /// using a
    /// [`String`](https://developer.apple.com/documentation/swift/string).
    /// This modifier only takes effect when this view is
    /// inside of and visible within a ``NavigationView``.
    ///
    /// In the example below, text for the navigation bar title is provided
    /// using a string:
    ///
    ///     struct FlavorView: View {
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip", "Pistachio"]
    ///         let text = "Today's Flavors"
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 List(items, id: \.self) { item in
    ///                     Text(item)
    ///                 }
    ///                 .navigationBarTitle(text)
    ///             }
    ///         }
    ///     }
    /// ![A screenshot displaying a navigation bar with a series of ice cream
    /// flavors, with a navigationBarTitle view modifier applied to the list to
    /// read "Today's Flavors" in large bold text above the list.](navigationbartitle.png)
    ///
    /// - Parameter title: A title for this view to display in the navigation
    ///   bar.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    public func navigationBarTitle<S>(_ title: S) -> some View where S : StringProtocol { }


    /// A view modifier that sets the title and display mode in the navigation bar for this view.
    ///
    /// **This modifier has been deprecated. Use
    /// ``View/navigationTitle(_:)-e8e60`` with
    /// ``View/navigationBarTitleDisplayMode(_:)`` instead.**
    ///
    /// Use `navigationBarTitle(_:displayMode:)` to set the title of the
    /// navigation bar for this view and specify a display mode for the title
    /// from one of the ``NavigationBarItem/TitleDisplayMode`` styles. This
    /// modifier only takes effect when this view is inside of and visible
    /// within a ``NavigationView``.
    ///
    /// In the example below, text for the navigation bar title is provided
    /// using a ``Text`` view. The navigation bar title's
    /// ``NavigationBarItem/TitleDisplayMode`` is set to `.inline` which places
    /// the navigation bar title in the bounds of the navigation bar.
    ///
    ///     struct FlavorView: View {
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip",  "Pistachio"]
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 List(items, id: \.self) { item in
    ///                     Text(item)
    ///                 }
    ///                 .navigationBarTitle(Text("Today's Flavors"), displayMode: .inline)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a navigation bar with a series of ice cream
    /// flavors, with a navigationBarTitle view modifier applied to the list to
    /// read "Today's Flavors" in bold text above the list. The displayMode passed
    /// to the modifier places the title in the bounds of the bar.](navigationtitle-string.png)
    ///
    /// - Parameters:
    ///   - title: A title for this view to display in the navigation bar.
    ///   - displayMode: The style to use for displaying the navigation bar title.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use navigationTitle(_:) with navigationBarTitleDisplayMode(_:)")
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func navigationBarTitle(_ title: Text, displayMode: NavigationBarItem.TitleDisplayMode) -> some View { }


    /// A view modifier that sets the title and display mode in the navigation bar for this view.
    ///
    /// **This modifier has been deprecated. Use
    /// ``View/navigationTitle(_:)-d3628`` with
    /// ``View/navigationBarTitleDisplayMode(_:)`` instead.**
    ///
    /// Use `navigationBarTitle(_:displayMode:)` to set the title of the
    /// navigation bar for this view and specify a display mode for the title
    /// from one of the ``NavigationBarItem/TitleDisplayMode`` styles. This
    /// modifier only takes effect when this view is inside of and visible
    /// within a ``NavigationView``.
    ///
    /// In the example below, text for the navigation bar title is provided
    /// using a string. The navigation bar title's
    /// ``NavigationBarItem/TitleDisplayMode`` is set to `.inline` which places
    /// the navigation bar title in the bounds of the navigation bar.
    ///
    ///     struct FlavorView: View {
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip", "Pistachio"]
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 List(items, id: \.self) { item in
    ///                     Text(item)
    ///                 }
    ///                 .navigationBarTitle("Today's Flavors", displayMode: .inline)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a navigation bar with a series of ice cream
    /// flavors, with a navigationBarTitle view modifier applied to the list to
    /// read "Today's Flavors" in bold text above the list. The displayMode passed
    /// to the modifier places the title in the bounds of the bar.](navigationtitle-string.png)
    ///
    /// If the `titleKey` can't be found, the title uses the text of the key
    /// name instead.
    ///
    /// - Parameters:
    ///   - titleKey: A key to a localized description of this view to display
    ///     in the navigation bar.
    ///   - displayMode: The style to use for displaying the navigation bar
    ///     title.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use navigationTitle(_:) with navigationBarTitleDisplayMode(_:)")
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func navigationBarTitle(_ titleKey: LocalizedStringKey, displayMode: NavigationBarItem.TitleDisplayMode) -> some View { }


    /// A view modifier that sets the title and display mode in the navigation bar for this view.
    ///
    /// **This modifier has been deprecated. Use
    /// ``View/navigationTitle(_:)-ee24d`` with
    /// ``View/navigationBarTitleDisplayMode(_:)`` instead.**
    ///
    /// Use `navigationBarTitle(_:displayMode:)` to set the title of the
    /// navigation bar for this view and specify a display mode for the
    /// title from one of the ``NavigationBarItem/Title/DisplayMode``
    /// styles. This modifier only takes effect when this view is inside of and
    /// visible within a ``NavigationView``.
    ///
    /// In the example below, text for the navigation bar title is provided using
    /// a string. The navigation bar title's `displayMode` is set to
    /// `.inline` which places the navigation bar title in the bounds of the
    /// navigation bar.
    ///
    ///     struct FlavorView: View {
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip", "Pistachio"]
    ///         let title = "Today's Flavors"
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 List(items, id: \.self) { item in
    ///                     Text(item)
    ///                 }
    ///                 .navigationBarTitle(title, displayMode: .inline)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot displaying a navigation bar with a series of ice cream
    /// flavors, with a navigationBarTitle view modifier applied to the list to
    /// read "Today's Flavors" in bold text above the list. The displayMode passed
    /// to the modifier places the title in the bounds of the bar.](navigationtitle-string.png)
    ///
    /// - Parameters:
    ///   - title: A title for this view to display in the navigation bar.
    ///   - displayMode: The way to display the title.
    @available(iOS, introduced: 14.0, deprecated: 100000.0, message: "Use navigationTitle(_:) with navigationBarTitleDisplayMode(_:)")
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func navigationBarTitle<S>(_ title: S, displayMode: NavigationBarItem.TitleDisplayMode) -> some View where S : StringProtocol { }


    /// A view modifier that hides the navigation bar back button for the view.
    ///
    /// Use `navigationBarBackButtonHidden(_:)` to hide the back button for this
    /// view.
    ///
    /// This modifier only takes effect when this view is inside of and visible
    /// within a ``NavigationView``.
    ///
    /// - Note: When applying this modifier, your navigation view will also
    /// lose the ability to swipe back.
    ///
    /// ```
    /// struct TrapDoorView: View {
    ///     var body: some View {
    ///         NavigationView {
    ///             NavigationLink(destination: NoReturnView()) {
    ///                 Text("Tap to fall into the trap door 🚪")
    ///             }
    ///         }
    ///     }
    /// }
    ///
    /// struct NoReturnView: View {
    ///     var body: some View {
    ///         Text("Ha! You cannot return.")
    ///             .navigationBarBackButtonHidden(true)
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif displaying a button that reads "Tap to fall into the trap
    /// door," which taps to reveal a new text view which reads "Ha! You
    /// cannot return." Since the view modifier hides the back button for the
    /// view, there is no way for the user to get back to the original
    /// navigation view.](nav-bar-bbh-ex.gif)
    ///
    /// - Parameter hidesBackButton: A Boolean value that indicates whether to
    ///   hide the back button.
    @available(macOS, unavailable)
    public func navigationBarBackButtonHidden(_ hidesBackButton: Bool) -> some View { }

}

