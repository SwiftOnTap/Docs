@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the device for a preview.
    ///
    /// If you set the preview device to `nil`, as it is by default, Xcode
    /// automatically chooses an appropriate device based on your target.
    ///
    /// You can get a list of supported values, like `"iPhone 11"`,
    /// `"iPad Pro (11-inch)"`, and `"Apple Watch Series 5 - 44mm"` by using the
    /// `xcrun` command in the Terminal app:
    ///
    ///     $ xcrun simctl list devicetypes
    ///
    /// Additionally, the following values are supported for macOS platform
    /// development:
    ///  - `"Mac"`
    ///  - `"Mac Catalyst"`
    ///
    /// See ``PreviewDevice`` for the full list of supported devices.
    ///
    /// The following example changes the device preview to iPhone SE
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("Preview on iPhone SE 📱")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///             .previewDevice("iPhone SE")
    ///     }
    /// }
    /// ```
    ///
    /// ![An image of a preview on an iPhone SE as specified by the previewDevice
    /// view modifier with text that reads "Preview on iPhone SE."](previewdevice.png)
    ///
    ///- Parameter value: The device to display the preview on.
    @inlinable public func previewDevice(_ value: PreviewDevice?) -> some View { }


    /// A view modifier that sets the size for a Xcode preview.
    ///
    /// There are 3 different Xcode ``PreviewLayout`` types:
    /// 1. ``PreviewLayout/device``:  Adds the view to the center of the specified preview device.
    /// 2. ``PreviewLayout/sizeThatFits``: Fits a container around the previewed view.
    /// 3.  ``PreviewLayout/fixed(width:height:)``: Adds the view to a fixed size container.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("➡️This box fits me snugly⬅️")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///             .previewLayout(.sizeThatFits)
    ///     }
    /// }
    /// ```
    ///
    /// ![An image of a preview in Xcode in which the preview box fits directly
    /// around text which reads "This box fits me snugly." Using the previewLayout
    /// view modifier, the preview renders a direct fit by passing .sizeThatFits
    /// to the modifier.](previewlayout-sizethatfits.png)
    ///
    /// The default value is ``PreviewLayout/device``.
    @inlinable public func previewLayout(_ value: PreviewLayout) -> some View { }


    /// A view modifier that sets a custom name in the Xcode preview.
    ///
    /// Use this modifier to change the little name at the top of the
    /// screen in an Xcode preview.
    /// By default, it's "Preview". In this example, we make it "🍌":
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("My name is 🍌")
    ///     }
    /// }
    ///
    /// struct ContentView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         ContentView()
    ///             .previewDisplayName("🍌")
    ///     }
    /// }
    /// ```
    ///
    /// ![An image of a preview in Xcode in which the name at the top of the
    /// preview is switched from its default value of "Preview" to instead be
    /// a banana emoji. Text within the preview itself reads "My name is"
    /// followed by a banana emoji.](previewdisplayname.png)
    ///
    /// The default value is `nil`.
    ///
    /// - Parameter value: The preview name to display.
    @inlinable public func previewDisplayName(_ value: String?) -> some View { }


    /// A view modifier that declares a context for the Xcode preview.
    ///
    /// There is currently only one type of preview context:
    /// [`WidgetPreviewContext`](https://developer.apple.com/documentation/widgetkit/widgetpreviewcontext).
    /// Its initializer takes a
    /// [`WidgetFamily`](https://developer.apple.com/documentation/widgetkit/widgetfamily).
    ///
    /// There are 3 types of `WidgetFamily` variables:
    /// 1. [`systemSmall`](https://developer.apple.com/documentation/widgetkit/widgetfamily/systemsmall)
    /// 2. [`systemMedium`](https://developer.apple.com/documentation/widgetkit/widgetfamily/systemmedium)
    /// 3. [`systemLarge`](https://developer.apple.com/documentation/widgetkit/widgetfamily/systemlarge)
    ///
    /// The example below is pulled from Apple's widget boilerplate.
    /// To pull this up yourself, go to *File > New > Target* and search
    /// for "Widget Extension". This target is named "PreviewContextTest."
    ///
    /// ```
    /// struct PreviewContextTest_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         PreviewContextTestEntryView(entry: SimpleEntry(date: Date()))
    ///             .previewContext(WidgetPreviewContext(family: .systemSmall))
    ///     }
    /// }
    /// ```
    ///
    /// ![An image of a preview in Xcode that shows a widget in which the time
    /// reads "4:11 PM." By passing systemSmall to the WidgetPreviewContext,
    /// the widget shows up smaller in preview.](widgetpreviewcontext.png)
    ///
    /// For more on getting started with widgets, check out
    /// [this tutorial](https://www.raywenderlich.com/11303363-getting-started-with-widgets).
    ///
    /// - Parameter value: The context for the preview; the default is `nil`.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @inlinable public func previewContext<C>(_ value: C) -> some View where C : PreviewContext { }
    
    /// Overrides the orientation of the preview.
    ///
    /// By default, device previews appear right side up, using orientation
    /// ``InterfaceOrientation/portrait``. You can
    /// change the orientation of a preview using one of the values in
    /// the ``InterfaceOrientation`` structure:
    ///
    ///     struct CircleImage_Previews: PreviewProvider {
    ///         static var previews: some View {
    ///             CircleImage()
    ///                 .previewInterfaceOrientation(.landscapeRight)
    ///         }
    ///     }
    ///
    /// - Parameter value: An orientation to use for preview.
    /// - Returns: A preview that uses the given orientation.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public func previewInterfaceOrientation(_ value: InterfaceOrientation) -> some View { }

}

