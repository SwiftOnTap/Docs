/// A view that displays an image.
///
/// Use this view to display an image on screen.
///
/// ### Get Started
///
/// **First**, create an image in your Assets folder.
///
/// ![A screenshot of the XCode Assets folder in which an image of the ocean has
/// been imported.](image-assets.png)
///
/// To follow along, save the following image as `"ocean"` in your project.
///
/// ![Ocean Image](ocean.jpg)
///
/// **Second**, reference the image by name in your code.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Image("ocean")
///     }
/// }
/// ```
///
/// ![A view displaying the ocean image.](image-basic.png)
///
/// **Third**, remember to add the ``Image/resizable(capInsets:resizingMode:)`` modifier to make your image resizable.
///
/// Add some modifiers to style your image!
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Image("ocean")
///             .resizable()
///             .scaledToFit()
///             .cornerRadius(10)
///             .padding()
///     }
/// }
/// ```
///
/// ![A view displaying the resizable ocean image, scaled to fit the view, with
/// a 10 point corner radius, and padding.](ocean-image.png)
///
/// ### Resizing Images
///
/// - Important: The ``Image/resizable(capInsets:resizingMode:)`` modifier
/// must come first on an Image before making changes to its size in subsequent
/// modifiers.
///
/// The ``View/scaledToFit()`` modifier will lock the aspect ratio of the image
/// and scale it to the maximum size it can be without being too large for the
/// screen.
///
/// The ``View/scaledToFill()`` modifier also scales the image, but it does not
/// lock the aspect ratio and, subsequently, is likely to stretch or shrink the
/// image to fit the available space.
///
/// ### Using system icon images
///
/// SF Symbols is a library of over 1500 symbols that Apple provides in nine
/// weights from ultralight to black. To use these in custom images, simply
/// use the ``Image/init(systemName:)`` initializer.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Image(systemName: "photo")
///             .resizable()
///             .scaledToFit()
///             .padding()
///     }
/// }
/// ```
///
/// ![A view displaying a resizable system image, called "photo" which has been
/// scaled to fit the view and has a 10 point corner radius and padding.](1285236D-2F00-4099-8A5A-3CC5E76A5000.png)
///
/// The [SF Symbols Mac app](https://developer.apple.com/sf-symbols/) makes the
/// symbol names easier to find. SF Symbols helps to maintain a consistent
/// look with the Apple ecosystem.
///
/// ### Common Errors
///
/// If your app doesn’t have a file with the image name, you’ll get a useful
/// console message saying:
///
///  `No image named ‘Your file name’ found in asset catalog for main bundle.`
///
/// If you find images not turning up in your app, you may want to search for
/// this in the console.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Image : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Image, rhs: Image) -> Bool { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// Creates an image from an asset name and a Bundle.
    ///
    /// Use this initializer to display an image on screen.
    ///
    /// **First**, create an image in your Assets folder.
    ///
    /// ![A screenshot of the XCode Assets folder in which an image of the ocean has
    /// been imported.](image-assets.png)
    ///
    /// To follow along, save the following image as `"ocean"` in your project.
    ///
    /// ![Ocean Image](ocean.jpg)
    ///
    /// **Second**, reference the image by name in your code.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Image("ocean")
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying the ocean image.](image-basic.png)
    ///
    /// Note that the asset name of your image will also be used for
    /// accessiblity purposes. To make these names different, see the
    /// ``Image/init(_:bundle:label:)`` initializer.
    /// To use no accessiblity name, use the
    /// ``Image/init(decorative:bundle:)`` initializer.
    ///
    /// For more on the `bundle` parameter, see [this Apple doc](https://developer.apple.com/documentation/foundation/bundle)
    /// on how to find and use resources using `Bundle` objects.
    ///
    /// - Parameters:
    ///   - name: the name of the image resource to lookup, as well as the
    ///     localization key with which to label the image.
    ///   - bundle: the bundle to search for the image resource and localization
    ///     content. If `nil`, uses the main `Bundle`. Defaults to `nil`.
    public init(_ name: String, bundle: Bundle? = nil) { }

    /// Creates an image from an asset name, a Bundle, and an accessibility
    /// Text label.
    ///
    /// Use this initializer to display an image on screen, while providing
    /// a ``Text`` label for accessibility purposes.
    ///
    /// **First**, create an image in your Assets folder.
    ///
    /// ![A screenshot of the XCode Assets folder in which an image of the ocean has
    /// been imported.](image-assets.png)
    ///
    /// To follow along, save the following image as `"ocean"` in your project.
    ///
    /// ![Ocean Image](ocean.jpg)
    ///
    /// **Second**, reference the image by name in your code. Include a
    /// ``Text`` label for accessibility.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Image("ocean", label: Text("The beautiful 🌊"))
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying the ocean image.(image-basic.png)
    ///
    /// Note that the ``label`` parameter is required for
    /// accessiblity purposes. To use a the asset name for accessibility, see the
    /// ``Image/init(_:bundle:)`` initializer.
    /// To use no accessiblity name, use the
    /// ``Image/init(decorative:bundle:)`` initializer.
    ///
    /// For more on the `bundle` parameter, see [this Apple doc](https://developer.apple.com/documentation/foundation/bundle)
    /// on how to find and use resources using `Bundle` objects.
    ///
    /// - Parameters:
    ///   - name: the name of the image resource to lookup
    ///   - bundle: the bundle to search for the image resource. If `nil`, uses
    ///     the main `Bundle`. Defaults to `nil`.
    ///   - label: The label associated with the image. The label is used for
    ///     things like accessibility.
    public init(_ name: String, bundle: Bundle? = nil, label: Text) { }

    /// Creates an image from an asset name and a Bundle, but the name
    /// won't be used for accessiblity.
    ///
    /// Use this initializer to display an image on screen while including no
    /// alternative text for accessibility purposes.
    ///
    /// **First**, create an image in your Assets folder.
    ///
    /// ![A screenshot of the XCode Assets folder in which an image of the ocean has
    /// been imported.](image-assets.png)
    ///
    /// To follow along, save the following image as `"ocean"` in your project.
    ///
    /// ![Ocean Image](ocean.jpg)
    ///
    /// **Second**, reference the image by name in your code.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Image(decorative: "ocean")
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying the "ocean" image; the name "ocean" won't be used
    /// for accessiblity because the intializer property decorative was used.](image-basic.png)
    ///
    /// Note that your image will name no alternative for accessibility.
    /// To use the asset name of your image for
    /// accessiblity purposes, see the
    /// ``Image/init(_:bundle:)``. To make these names different, see the
    /// ``Image/init(_:bundle:label:)`` initializer.
    ///
    /// For more on the `bundle` parameter, see [this Apple doc](https://developer.apple.com/documentation/foundation/bundle)
    /// on how to find and use resources using `Bundle` objects.
    ///
    /// - Parameters:
    ///   - name: the name of the image resource to lookup
    ///   - bundle: the bundle to search for the image resource. If `nil`, uses
    ///     the main `Bundle`. Defaults to `nil`.
    public init(decorative name: String, bundle: Bundle? = nil) { }

    /// Creates a system symbol image.
    ///
    /// This initializer creates an image using a system-provided symbol. To
    /// create a custom symbol image from your app's asset catalog, use
    /// ``Image/init(_:)`` instead.
    ///
    /// This initializer pulls from the SF Symbols library.
    /// SF Symbols contains over 1500 icons that Apple provides in nine
    /// weights from ultralight to black.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Image(systemName: "photo")
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying the small system symbol image "photo" using the initalizer
    /// property systemName.](image-system-name-init.png)
    ///
    /// The [SF Symbols Mac app](https://developer.apple.com/sf-symbols/) makes the
    /// symbol names easier to find. SF Symbols helps to maintain a consistent
    /// look with the Apple ecosystem.
    ///
    /// - Parameters:
    ///   - systemName: The name of the system symbol image.
    ///     Use the SF Symbols app to look up the names of system symbol images.
    @available(macOS 11.0, *)
    public init(systemName: String) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// Modifies the image rendering mode as either regular or template.
    ///
    /// There are two types of rendering modes:
    /// - ``Image/TemplateRenderingmode/original``
    /// - ``Image/TemplateRenderingMode/template``
    ///
    /// Original mode will draw the image normally, as-is. Template mode will
    /// turn all the parts of the image that are not transparent to one color
    /// that you can set yourself. By default, the color is black.
    ///
    /// A common use case for this modifier would be like this:
    ///
    /// To follow along, save the following image as `"bird"` in your project.
    ///
    /// ![Bird Image](bird.png)
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Image("bird")
    ///                 .renderingMode(.template)
    ///                 .resizable()
    ///                 .frame(width: 50, height: 50)
    ///                 .foregroundColor(.red)
    ///             Image("bird")
    ///                 .renderingMode(.original)
    ///                 .resizable()
    ///                 .frame(width: 50, height: 50)
    ///                 .foregroundColor(.red)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing an HStack with two bird images, the first in template
    /// rendering mode, filled like a silhouette with the foreground color red,
    /// and the second with original rendering mode, showing normally.](image-renderingmode.png)
    ///
    /// The modifier does nothing if renderingMode is `nil`.
    ///
    /// - Parameter renderingMode: The image rendering mode.
    ///
    /// - SeeAlso: Image.TemplateRenderingMode.
    public func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Image { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// Constants that specify the intended display orientation for an image.
    ///
    /// Use this enumeration with the ``Image(_:scale:orientation:label:)``
    /// initializer to create an ``Image`` view that can
    /// be displayed in one of several different orientation
    /// options.
    ///
    /// In order to use this initializer, you must create your
    /// ``Image`` using a
    /// [`CGImage`](https://developer.apple.com/documentation/coregraphics/cgimage).
    /// See that documentation page to learn more about `CGImage`
    /// objects.
    ///
    /// To follow along, save the following image as `"bird"` in your project.
    ///
    /// ![Painting of a bird](bird.png)
    ///
    /// In the following example, we define a helper function called
    /// `image(_:)` so we can keep the code clean, and show all 8 orientations.
    ///
    /// ```
    /// struct ContentView: View {
    ///     func image(_ orientation: Image.Orientation) -> some View {
    ///         Image(UIImage(named: "bird")!.cgImage!,
    ///               scale: 1.0,
    ///               orientation: orientation,
    ///               label: Text("Bird"))
    ///             .resizable()
    ///             .frame(width: 50, height: 50)
    ///     }
    ///
    ///     var body: some View {
    ///         VStack {
    ///             HStack {
    ///                 image(.up) //This leave the image unchanged
    ///                 image(.upMirrored)
    ///             }
    ///             HStack {
    ///                 image(.down)
    ///                 image(.downMirrored)
    ///             }
    ///             HStack {
    ///                 image(.left)
    ///                 image(.leftMirrored)
    ///             }
    ///             HStack {
    ///                 image(.right)
    ///                 image(.rightMirrored)
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with eight images of a bird in the center, arranged as a
    /// VStack of pairs of birds, each arranged in an HStack. The first pair faces
    /// up and towards each other, the second faces down and away from each other,
    /// while the other two pairs are rotated using right and left orientations.](image-orientation.png)
    ///
    @frozen public enum Orientation : UInt8, CaseIterable, Hashable {

        /// The original pixel data matches the intended display orientation.
        ///
        /// Use this enumeration case with the ``Image(_:scale:orientation:label:)``
        /// initializer to create an ``Image`` view that can
        /// be displayed in one of several different orientation
        /// options.
        ///
        /// In order to use this initializer, you must create your
        /// ``Image`` using a
        /// [`CGImage`](https://developer.apple.com/documentation/coregraphics/cgimage).
        /// See that documentation page to learn more about `CGImage`
        /// objects.
        ///
        /// To follow along, save the following image as `"bird"` in your project.
        ///
        /// ![Image of a bird](bird.png)
        ///
        /// In the following example, we define a helper function called
        /// `image(_:)` so we can keep the code clean, and show all 8 orientations.
        ///
        /// ```
        /// struct ContentView: View {
        ///     func image(_ orientation: Image.Orientation) -> some View {
        ///         Image(UIImage(named: "bird")!.cgImage!,
        ///               scale: 1.0,
        ///               orientation: orientation,
        ///               label: Text("Bird"))
        ///             .resizable()
        ///             .frame(width: 50, height: 50)
        ///     }
        ///
        ///     var body: some View {
        ///         VStack {
        ///             HStack {
        ///                 image(.up) //This leave the image unchanged
        ///                 image(.upMirrored)
        ///             }
        ///             HStack {
        ///                 image(.down)
        ///                 image(.downMirrored)
        ///             }
        ///             HStack {
        ///                 image(.left)
        ///                 image(.leftMirrored)
        ///             }
        ///             HStack {
        ///                 image(.right)
        ///                 image(.rightMirrored)
        ///             }
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with eight images of a bird in the center, arranged as a
        /// VStack of pairs of birds, each arranged in an HStack. The first pair faces
        /// up and towards each other, the second faces down and away from each other,
        /// while the other two pairs are rotated using right and left orientations.](image-orientation.png)
        ///
        case up

        /// The image has been horizontally flipped from the orientation of its
        /// original pixel data.
        ///
        /// Use this enumeration case with the ``Image(_:scale:orientation:label:)``
        /// initializer to create an ``Image`` view that can
        /// be displayed a mirrored orientation.
        ///
        /// In order to use this initializer, you must create your
        /// ``Image`` using a
        /// [`CGImage`](https://developer.apple.com/documentation/coregraphics/cgimage).
        /// See that documentation page to learn more about `CGImage`
        /// objects.
        ///
        /// To follow along, save the following image as `"bird"` in your project.
        ///
        /// ![Image of a bird](bird.png)
        ///
        /// In the following example, we define a helper function called
        /// `image(_:)` so we can keep the code clean, and show all 8 orientations.
        ///
        /// ```
        /// struct ContentView: View {
        ///     func image(_ orientation: Image.Orientation) -> some View {
        ///         Image(UIImage(named: "bird")!.cgImage!,
        ///               scale: 1.0,
        ///               orientation: orientation,
        ///               label: Text("Bird"))
        ///             .resizable()
        ///             .frame(width: 50, height: 50)
        ///     }
        ///
        ///     var body: some View {
        ///         VStack {
        ///             HStack {
        ///                 image(.up) //This leave the image unchanged
        ///                 image(.upMirrored)
        ///             }
        ///             HStack {
        ///                 image(.down)
        ///                 image(.downMirrored)
        ///             }
        ///             HStack {
        ///                 image(.left)
        ///                 image(.leftMirrored)
        ///             }
        ///             HStack {
        ///                 image(.right)
        ///                 image(.rightMirrored)
        ///             }
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with eight images of a bird in the center, arranged as a
        /// VStack of pairs of birds, each arranged in an HStack. The first pair faces
        /// up and towards each other, the second faces down and away from each other,
        /// while the other two pairs are rotated using right and left orientations.](image-orientation.png)
        ///
        case upMirrored

        /// The image has been rotated 180° from the orientation of its original
        /// pixel data.
        ///
        /// Use this enumeration case with the ``Image(_:scale:orientation:label:)``
        /// initializer to create an ``Image`` view that can
        /// be displayed in a downwards-rotated orientation.
        ///
        /// In order to use this initializer, you must create your
        /// ``Image`` using a
        /// [`CGImage`](https://developer.apple.com/documentation/coregraphics/cgimage).
        /// See that documentation page to learn more about `CGImage`
        /// objects.
        ///
        /// To follow along, save the following image as `"bird"` in your project.
        ///
        /// ![Image of a bird](bird.png)
        ///
        /// In the following example, we define a helper function called
        /// `image(_:)` so we can keep the code clean, and show all 8 orientations.
        ///
        /// ```
        /// struct ContentView: View {
        ///     func image(_ orientation: Image.Orientation) -> some View {
        ///         Image(UIImage(named: "bird")!.cgImage!,
        ///               scale: 1.0,
        ///               orientation: orientation,
        ///               label: Text("Bird"))
        ///             .resizable()
        ///             .frame(width: 50, height: 50)
        ///     }
        ///
        ///     var body: some View {
        ///         VStack {
        ///             HStack {
        ///                 image(.up) //This leave the image unchanged
        ///                 image(.upMirrored)
        ///             }
        ///             HStack {
        ///                 image(.down)
        ///                 image(.downMirrored)
        ///             }
        ///             HStack {
        ///                 image(.left)
        ///                 image(.leftMirrored)
        ///             }
        ///             HStack {
        ///                 image(.right)
        ///                 image(.rightMirrored)
        ///             }
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with eight images of a bird in the center, arranged as a
        /// VStack of pairs of birds, each arranged in an HStack. The first pair faces
        /// up and towards each other, the second faces down and away from each other,
        /// while the other two pairs are rotated using right and left orientations.](image-orientation.png)
        ///
        case down

        /// The image has been vertically flipped from the orientation of its
        /// original pixel data.
        ///
        /// Use this enumeration case with the ``Image(_:scale:orientation:label:)``
        /// initializer to create an ``Image`` view that has been
        /// flipped along the horizontal axis.
        ///
        /// In order to use this initializer, you must create your
        /// ``Image`` using a
        /// [`CGImage`](https://developer.apple.com/documentation/coregraphics/cgimage).
        /// See that documentation page to learn more about `CGImage`
        /// objects.
        ///
        /// To follow along, save the following image as `"bird"` in your project.
        ///
        /// ![Image of a bird](bird.png)
        ///
        /// In the following example, we define a helper function called
        /// `image(_:)` so we can keep the code clean, and show all 8 orientations.
        ///
        /// ```
        /// struct ContentView: View {
        ///     func image(_ orientation: Image.Orientation) -> some View {
        ///         Image(UIImage(named: "bird")!.cgImage!,
        ///               scale: 1.0,
        ///               orientation: orientation,
        ///               label: Text("Bird"))
        ///             .resizable()
        ///             .frame(width: 50, height: 50)
        ///     }
        ///
        ///     var body: some View {
        ///         VStack {
        ///             HStack {
        ///                 image(.up) //This leave the image unchanged
        ///                 image(.upMirrored)
        ///             }
        ///             HStack {
        ///                 image(.down)
        ///                 image(.downMirrored)
        ///             }
        ///             HStack {
        ///                 image(.left)
        ///                 image(.leftMirrored)
        ///             }
        ///             HStack {
        ///                 image(.right)
        ///                 image(.rightMirrored)
        ///             }
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with eight images of a bird in the center, arranged as a
        /// VStack of pairs of birds, each arranged in an HStack. The first pair faces
        /// up and towards each other, the second faces down and away from each other,
        /// while the other two pairs are rotated using right and left orientations.](image-orientation.png)
        ///
        case downMirrored

        /// The image has been rotated 90° counterclockwise from the orientation
        /// of its original pixel data.
        ///
        /// Use this enumeration case with the ``Image(_:scale:orientation:label:)``
        /// initializer to create an ``Image`` view that has been rotated
        /// 90° counterclockwise.
        ///
        /// In order to use this initializer, you must create your
        /// ``Image`` using a
        /// [`CGImage`](https://developer.apple.com/documentation/coregraphics/cgimage).
        /// See that documentation page to learn more about `CGImage`
        /// objects.
        ///
        /// To follow along, save the following image as `"bird"` in your project.
        ///
        /// ![Image of a bird](bird.png)
        ///
        /// In the following example, we define a helper function called
        /// `image(_:)` so we can keep the code clean, and show all 8 orientations.
        ///
        /// ```
        /// struct ContentView: View {
        ///     func image(_ orientation: Image.Orientation) -> some View {
        ///         Image(UIImage(named: "bird")!.cgImage!,
        ///               scale: 1.0,
        ///               orientation: orientation,
        ///               label: Text("Bird"))
        ///             .resizable()
        ///             .frame(width: 50, height: 50)
        ///     }
        ///
        ///     var body: some View {
        ///         VStack {
        ///             HStack {
        ///                 image(.up) //This leave the image unchanged
        ///                 image(.upMirrored)
        ///             }
        ///             HStack {
        ///                 image(.down)
        ///                 image(.downMirrored)
        ///             }
        ///             HStack {
        ///                 image(.left)
        ///                 image(.leftMirrored)
        ///             }
        ///             HStack {
        ///                 image(.right)
        ///                 image(.rightMirrored)
        ///             }
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with eight images of a bird in the center, arranged as a
        /// VStack of pairs of birds, each arranged in an HStack. The first pair faces
        /// up and towards each other, the second faces down and away from each other,
        /// while the other two pairs are rotated using right and left orientations.](image-orientation.png)
        ///
        case left

        /// The image has been rotated 90° clockwise and flipped horizontally
        /// from the orientation of its original pixel data.
        ///
        /// Use this enumeration case with the ``Image(_:scale:orientation:label:)``
        /// initializer to create an ``Image`` view that has been rotated
        /// 90° counterclockwise and flipped horizontally.
        ///
        /// In order to use this initializer, you must create your
        /// ``Image`` using a
        /// [`CGImage`](https://developer.apple.com/documentation/coregraphics/cgimage).
        /// See that documentation page to learn more about `CGImage`
        /// objects.
        ///
        /// To follow along, save the following image as `"bird"` in your project.
        ///
        /// ![Image of a bird](bird.png)
        ///
        /// In the following example, we define a helper function called
        /// `image(_:)` so we can keep the code clean, and show all 8 orientations.
        ///
        /// ```
        /// struct ContentView: View {
        ///     func image(_ orientation: Image.Orientation) -> some View {
        ///         Image(UIImage(named: "bird")!.cgImage!,
        ///               scale: 1.0,
        ///               orientation: orientation,
        ///               label: Text("Bird"))
        ///             .resizable()
        ///             .frame(width: 50, height: 50)
        ///     }
        ///
        ///     var body: some View {
        ///         VStack {
        ///             HStack {
        ///                 image(.up) //This leave the image unchanged
        ///                 image(.upMirrored)
        ///             }
        ///             HStack {
        ///                 image(.down)
        ///                 image(.downMirrored)
        ///             }
        ///             HStack {
        ///                 image(.left)
        ///                 image(.leftMirrored)
        ///             }
        ///             HStack {
        ///                 image(.right)
        ///                 image(.rightMirrored)
        ///             }
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with eight images of a bird in the center, arranged as a
        /// VStack of pairs of birds, each arranged in an HStack. The first pair faces
        /// up and towards each other, the second faces down and away from each other,
        /// while the other two pairs are rotated using right and left orientations.](image-orientation.png)
        ///
        case leftMirrored

        /// The image has been rotated 90° clockwise from the orientation of its
        /// original pixel data.
        ///
        /// Use this enumeration case with the ``Image(_:scale:orientation:label:)``
        /// initializer to create an ``Image`` view that has been rotated
        /// 90° clockwise.
        ///
        /// In order to use this initializer, you must create your
        /// ``Image`` using a
        /// [`CGImage`](https://developer.apple.com/documentation/coregraphics/cgimage).
        /// See that documentation page to learn more about `CGImage`
        /// objects.
        ///
        /// To follow along, save the following image as `"bird"` in your project.
        ///
        /// ![Image of a bird](bird.png)
        ///
        /// In the following example, we define a helper function called
        /// `image(_:)` so we can keep the code clean, and show all 8 orientations.
        ///
        /// ```
        /// struct ContentView: View {
        ///     func image(_ orientation: Image.Orientation) -> some View {
        ///         Image(UIImage(named: "bird")!.cgImage!,
        ///               scale: 1.0,
        ///               orientation: orientation,
        ///               label: Text("Bird"))
        ///             .resizable()
        ///             .frame(width: 50, height: 50)
        ///     }
        ///
        ///     var body: some View {
        ///         VStack {
        ///             HStack {
        ///                 image(.up) //This leave the image unchanged
        ///                 image(.upMirrored)
        ///             }
        ///             HStack {
        ///                 image(.down)
        ///                 image(.downMirrored)
        ///             }
        ///             HStack {
        ///                 image(.left)
        ///                 image(.leftMirrored)
        ///             }
        ///             HStack {
        ///                 image(.right)
        ///                 image(.rightMirrored)
        ///             }
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with eight images of a bird in the center, arranged as a
        /// VStack of pairs of birds, each arranged in an HStack. The first pair faces
        /// up and towards each other, the second faces down and away from each other,
        /// while the other two pairs are rotated using right and left orientations.](image-orientation.png)
        ///
        case right

        /// The image has been rotated 90° counterclockwise and flipped
        /// horizontally from the orientation of its original pixel data.
        ///
        /// Use this enumeration case with the ``Image(_:scale:orientation:label:)``
        /// initializer to create an ``Image`` view that has been flipped
        /// horizontally and roated 90° counterclockwise.
        ///
        /// In order to use this initializer, you must create your
        /// ``Image`` using a
        /// [`CGImage`](https://developer.apple.com/documentation/coregraphics/cgimage).
        /// See that documentation page to learn more about `CGImage`
        /// objects.
        ///
        /// To follow along, save the following image as `"bird"` in your project.
        ///
        /// ![Image of a bird](bird.png)
        ///
        /// In the following example, we define a helper function called
        /// `image(_:)` so we can keep the code clean, and show all 8 orientations.
        ///
        /// ```
        /// struct ContentView: View {
        ///     func image(_ orientation: Image.Orientation) -> some View {
        ///         Image(UIImage(named: "bird")!.cgImage!,
        ///               scale: 1.0,
        ///               orientation: orientation,
        ///               label: Text("Bird"))
        ///             .resizable()
        ///             .frame(width: 50, height: 50)
        ///     }
        ///
        ///     var body: some View {
        ///         VStack {
        ///             HStack {
        ///                 image(.up) //This leave the image unchanged
        ///                 image(.upMirrored)
        ///             }
        ///             HStack {
        ///                 image(.down)
        ///                 image(.downMirrored)
        ///             }
        ///             HStack {
        ///                 image(.left)
        ///                 image(.leftMirrored)
        ///             }
        ///             HStack {
        ///                 image(.right)
        ///                 image(.rightMirrored)
        ///             }
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with eight images of a bird in the center, arranged as a
        /// VStack of pairs of birds, each arranged in an HStack. The first pair faces
        /// up and towards each other, the second faces down and away from each other,
        /// while the other two pairs are rotated using right and left orientations.](image-orientation.png)
        ///
        case rightMirrored

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        public typealias RawValue = UInt8

        /// Creates a new instance with the specified raw value.
        ///
        /// If there is no value of the type that corresponds with the specified raw
        /// value, this initializer returns `nil`. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     print(PaperSize(rawValue: "Legal"))
        ///     // Prints "Optional("PaperSize.Legal")"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init?(rawValue: UInt8) { }

        /// The corresponding value of the raw type.
        ///
        /// A new instance initialized with `rawValue` will be equivalent to this
        /// instance. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     let selectedSize = PaperSize.Letter
        ///     print(selectedSize.rawValue)
        ///     // Prints "Letter"
        ///
        ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
        ///     // Prints "true"
        public var rawValue: UInt8 { get }

        /// A type that can represent a collection of all values of this type.
        public typealias AllCases = [Image.Orientation]

        /// A collection of all values of this type.
        public static var allCases: [Image.Orientation] { get }
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// Options for rendering the image normally, or with only 1 color.
    ///
    /// Use this enumeration with the
    /// ``Image/renderingMode(_:)`` image modifier to render in image
    /// either normally or with only one color.
    ///
    /// This enumeration has 2 cases:
    ///
    /// 1. ``Image/TemplateRenderingMode/template``: turns all the parts of the
    /// image that are not transparent to one color
    /// 2. ``Image/TemplateRenderingMode/original``: draws the image normally,
    /// as-is.
    ///
    /// A common use case for this enumeration would be like this:
    ///
    /// To follow along, save the following image as `"bird"` in your project.
    ///
    /// ![Image of a bird](bird.png)
    ///
    /// ```
    /// struct ContentView {
    ///     var body: some View {
    ///         HStack {
    ///             Image("bird")
    ///                 .renderingMode(TemplateRenderingMode.template)
    ///                 .resizable()
    ///                 .frame(width: 50, height: 50)
    ///                 .foregroundColor(.red)
    ///             Image("bird")
    ///                 .renderingMode(TemplateRenderingMode.original)
    ///                 .resizable()
    ///                 .frame(width: 50, height: 50)
    ///                 .foregroundColor(.red)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with two bird images in an HStack in the center of the
    /// screen; the one on the left is filled in red while the one on the right has
    /// it's original coloring.](image-renderingmode.png)
    ///
    public enum TemplateRenderingMode {

        /// Render the image as all black except where opacity is 0.
        ///
        /// This is often used if the image is going to be a mask or otherwise
        /// used only for its outline.
        ///
        /// Use this enumeration case with the
        /// ``Image/renderingMode(_:)`` image modifier to render in image
        /// with only one color.
        ///
        /// A common use case for this enumeration case would be like this:
        ///
        /// To follow along, save the following image as `"bird"` in your project.
        ///
        /// ![Image of a bird](bird.png)
        ///
        /// ```
        /// struct ContentView {
        ///     var body: some View {
        ///         HStack {
        ///             Image("bird")
        ///                 .renderingMode(.template)
        ///                 .resizable()
        ///                 .frame(width: 50, height: 50)
        ///                 .foregroundColor(.red)
        ///             Image("bird")
        ///                 .renderingMode(.original)
        ///                 .resizable()
        ///                 .frame(width: 50, height: 50)
        ///                 .foregroundColor(.red)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with two bird images in an HStack in the center of the
        /// screen; the one on the left is filled in red while the one on the right has
        /// it's original coloring.](image-renderingmode.png)
        ///
        case template

        /// Render the image as usual.
        ///
        /// Use this enumeration case with the
        /// ``Image/renderingMode(_:)`` image modifier to render in image
        /// normally. This is in contrast to
        /// ``Image/TemplateRenderingMode/template`` which renders
        /// an image with only one color.
        ///
        /// A common use case for this enumeration case would be like this:
        ///
        /// To follow along, save the following image as `"bird"` in your project.
        ///
        /// ![Image of a bird](bird.png)
        ///
        /// ```
        /// struct ContentView {
        ///     var body: some View {
        ///         HStack {
        ///             Image("bird")
        ///                 .renderingMode(.template)
        ///                 .resizable()
        ///                 .frame(width: 50, height: 50)
        ///                 .foregroundColor(.red)
        ///             Image("bird")
        ///                 .renderingMode(.original)
        ///                 .resizable()
        ///                 .frame(width: 50, height: 50)
        ///                 .foregroundColor(.red)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot with two bird images in an HStack in the center of the
        /// screen; the one on the left is filled in red while the one on the right has
        /// it's original coloring.](image-renderingmode.png)
        ///
        case original

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.TemplateRenderingMode, b: Image.TemplateRenderingMode) -> Bool { }

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher) { }
    }

    /// The scale to apply to vector images relative to text.
    ///
    /// Use this enumeration with the ``View/imageScale(_:)``
    /// view modifier to scale an image up or down.
    ///
    /// This is most often used with system images, which can be both
    /// scaled alongside the text using ``View/font(_:)`` view modifier
    /// and also using
    /// the ``View/imageScale(_:)`` image modifier.
    ///
    /// There are 3 types of ``Image/Scale``s:
    ///
    /// 1. ``Image/Scale/small``
    /// 2. ``Image/Scale/medium``
    /// 3. ``Image/Scale/large``
    ///
    /// See below for a comparison.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Image(systemName: "die.face.5.fill")
    ///                 .imageScale(.small)
    ///             Image(systemName: "die.face.5.fill")
    ///                 .imageScale(.medium)
    ///             Image(systemName: "die.face.5.fill")
    ///                 .imageScale(.large)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying three dice faces in an HStack, each showing
    /// side 5, growing from left to right owed to small, medium, and large
    /// scales with the imageScale modifier, respectively.](image-scale-ex.png)
    ///
    @available(macOS 11.0, *)
    public enum Scale {

        /// The small image scale size.
        ///
        /// Use this enumeration case with the ``View/imageScale(_:)``
        /// view modifier to scale an image down.
        ///
        /// This is most often used with system images, which can be both
        /// scaled alongside the text using ``View/font(_:)`` view modifier
        /// and also using
        /// the ``View/imageScale(_:)`` image modifier.
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         HStack {
        ///             Image(systemName: "die.face.5.fill")
        ///                 .imageScale(.small)
        ///             Image(systemName: "die.face.5.fill")
        ///                 .imageScale(.medium)
        ///             Image(systemName: "die.face.5.fill")
        ///                 .imageScale(.large)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying three dice faces in an HStack, each showing
        /// side 5, growing from left to right owed to small, medium, and large
        /// scales with the imageScale modifier, respectively.](image-scale-ex.png)
        ///
        case small

        /// The medium image scale size.
        ///
        /// Use this enumeration case with the ``View/imageScale(_:)``
        /// view modifier to scale an image.
        ///
        /// This is most often used with system images, which can be both
        /// scaled alongside the text using ``View/font(_:)`` view modifier
        /// and also using
        /// the ``View/imageScale(_:)`` image modifier.
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         HStack {
        ///             Image(systemName: "die.face.5.fill")
        ///                 .imageScale(.small)
        ///             Image(systemName: "die.face.5.fill")
        ///                 .imageScale(.medium)
        ///             Image(systemName: "die.face.5.fill")
        ///                 .imageScale(.large)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying three dice faces in an HStack, each showing
        /// side 5, growing from left to right owed to small, medium, and large
        /// scales with the imageScale modifier, respectively.](image-scale-ex.png)
        ///
        case medium

        /// The large image scale size.
        ///
        /// Use this enumeration case with the ``View/imageScale(_:)``
        /// view modifier to scale an image up.
        ///
        /// This is most often used with system images, which can be both
        /// scaled alongside the text using ``View/font(_:)`` view modifier
        /// and also using
        /// the ``View/imageScale(_:)`` image modifier.
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         HStack {
        ///             Image(systemName: "die.face.5.fill")
        ///                 .imageScale(.small)
        ///             Image(systemName: "die.face.5.fill")
        ///                 .imageScale(.medium)
        ///             Image(systemName: "die.face.5.fill")
        ///                 .imageScale(.large)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying three dice faces in an HStack, each showing
        /// side 5, growing from left to right owed to small, medium, and large
        /// scales with the imageScale modifier, respectively.](image-scale-ex.png)
        ///
        case large

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.Scale, b: Image.Scale) -> Bool { }

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher) { }
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// The different amounts of interpolation that can be applied to an image.
    ///
    /// Use this enumeration with the ``Image/interpolation(_:)``
    /// image modifier to specify what kind of interpolation to us
    /// on an image.
    ///
    /// Image interpolation is a digital process that occurs when an image is
    /// either scaled up or scaled down, or when rotating an image.
    ///
    /// Interpolation uses what is known in the image to estimate unknown
    /// values.
    ///
    /// Interpolation can make scaled up images retain some of their clarity,
    /// and can make scaled down images look better.
    ///
    /// There are 4 cases of image interpolation:
    ///
    /// 1. ``Image/Interpolation/none``
    /// 2. ``Image/Interpolation/low``
    /// 3. ``Image/Interpolation/medium``
    /// 4. ``Image/Interpolation/hight``
    ///
    /// See them compared below.
    ///
    /// To follow along, save the following image as `"bird-small"` in your project.
    ///
    /// ![Small image of a bird](bird-small.png)
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Image("bird-small")
    ///                 .resizable()
    ///                 .interpolation(.none)
    ///                 .frame(width: 50, height: 50)
    ///             Image("bird-small")
    ///                 .resizable()
    ///                 .interpolation(.low)
    ///                 .frame(width: 50, height: 50)
    ///             Image("bird-small")
    ///                 .resizable()
    ///                 .interpolation(.medium)
    ///                 .frame(width: 50, height: 50)
    ///             Image("bird-small")
    ///                 .resizable()
    ///                 .interpolation(.high)
    ///                 .frame(width: 50, height: 50)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying four bird images in an HStack with increasing
    /// levels of interpolation from left to right. The image appears blurrier as
    /// the amount of interpolation is increased.](image-interpolation.png)
    ///
    public enum Interpolation {

        /// Apply no interpolation to the image when remapping.
        ///
        /// Use this enumeration case with the ``Image/interpolation(_:)``
        /// image modifier to specify using no interpolation on an image.
        ///
        /// Image interpolation is a digital process that occurs when an image is
        /// either scaled up or scaled down, or when rotating an image.
        ///
        /// Interpolation uses what is known in the image to estimate unknown
        /// values.
        ///
        /// Interpolation can make scaled up images retain some of their clarity,
        /// and can make scaled down images look better.
        ///
        /// To follow along, save the following image as `"bird-small"` in your project.
        ///
        /// ![Small image of a bird](bird-small.png)
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         HStack {
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.none)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.low)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.medium)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.high)
        ///                 .frame(width: 50, height: 50)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying four bird images in an HStack with increasing
        /// levels of interpolation from left to right. The image appears blurrier as
        /// the amount of interpolation is increased.](image-interpolation.png)
        ///
        case none

        /// Apply a low amount of interpolation to the image when remapping.
        ///
        /// Use this enumeration case with the ``Image/interpolation(_:)``
        /// image modifier to specify using low interpolation on an image.
        ///
        /// Image interpolation is a digital process that occurs when an image is
        /// either scaled up or scaled down, or when rotating an image.
        ///
        /// Interpolation uses what is known in the image to estimate unknown
        /// values.
        ///
        /// Interpolation can make scaled up images retain some of their clarity,
        /// and can make scaled down images look better.
        ///
        /// To follow along, save the following image as `"bird-small"` in your project.
        ///
        /// ![Small image of a bird](bird-small.png)
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         HStack {
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.none)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.low)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.medium)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.high)
        ///                 .frame(width: 50, height: 50)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying four bird images in an HStack with increasing
        /// levels of interpolation from left to right. The image appears blurrier as
        /// the amount of interpolation is increased.](image-interpolation.png)
        ///
        case low

        /// Apply a medium amount of interpolation to the image when remapping.
        ///
        /// Use this enumeration case with the ``Image/interpolation(_:)``
        /// image modifier to specify using medium interpolation on an image.
        ///
        /// Image interpolation is a digital process that occurs when an image is
        /// either scaled up or scaled down, or when rotating an image.
        ///
        /// Interpolation uses what is known in the image to estimate unknown
        /// values.
        ///
        /// Interpolation can make scaled up images retain some of their clarity,
        /// and can make scaled down images look better.
        ///
        /// To follow along, save the following image as `"bird-small"` in your project.
        ///
        /// ![Small image of a bird](bird-small.png)
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         HStack {
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.none)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.low)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.medium)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.high)
        ///                 .frame(width: 50, height: 50)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying four bird images in an HStack with increasing
        /// levels of interpolation from left to right. The image appears blurrier as
        /// the amount of interpolation is increased.](image-interpolation.png)
        ///
        case medium

        /// Apply a high amount of interpolation to the image when remapping.
        ///
        /// Use this enumeration case with the ``Image/interpolation(_:)``
        /// image modifier to specify using high interpolation on an image.
        ///
        /// Image interpolation is a digital process that occurs when an image is
        /// either scaled up or scaled down, or when rotating an image.
        ///
        /// Interpolation uses what is known in the image to estimate unknown
        /// values.
        ///
        /// Interpolation can make scaled up images retain some of their clarity,
        /// and can make scaled down images look better.
        ///
        /// To follow along, save the following image as `"bird-small"` in your project.
        ///
        /// ![Small image of a bird](bird-small.png)
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         HStack {
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.none)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.low)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.medium)
        ///                 .frame(width: 50, height: 50)
        ///             Image("bird-small")
        ///                 .resizable()
        ///                 .interpolation(.high)
        ///                 .frame(width: 50, height: 50)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A screenshot displaying four bird images in an HStack with increasing
        /// levels of interpolation from left to right. The image appears blurrier as
        /// the amount of interpolation is increased.](image-interpolation.png)
        ///
        case high

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.Interpolation, b: Image.Interpolation) -> Bool { }

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher) { }
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// Adjusts the interpolation property of an image.
    ///
    /// Use this image modifier case with the ``Image/Interpolation``
    /// enumeration to specify what kind of interpolation to use on an image.
    ///
    /// Image interpolation is a digital process that occurs when an image is
    /// either scaled up or scaled down, or when rotating an image.
    ///
    /// Interpolation uses what is known in the image to estimate unknown
    /// values.
    ///
    /// Interpolation can make scaled up images retain some of their clarity,
    /// and can make scaled down images look better.
    ///
    /// To follow along, save the following image as `"bird-small"` in your project.
    ///
    /// ![Bird Small Image](bird-small.png)
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Image("bird-small")
    ///                 .resizable()
    ///                 .interpolation(.none)
    ///                 .frame(width: 50, height: 50)
    ///             Image("bird-small")
    ///                 .resizable()
    ///                 .interpolation(.low)
    ///                 .frame(width: 50, height: 50)
    ///             Image("bird-small")
    ///                 .resizable()
    ///                 .interpolation(.medium)
    ///                 .frame(width: 50, height: 50)
    ///             Image("bird-small")
    ///                 .resizable()
    ///                 .interpolation(.high)
    ///                 .frame(width: 50, height: 50)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing an HStack with four small bird images, the first
    /// with interpolation none, the second with low interpolation, the third
    /// with medium interpolation, and the fourth with high interpolation.](image-interpolation.png)
    ///
    ///
    /// - Parameter interpolation: The image's interpolation property.
    public func interpolation(_ interpolation: Image.Interpolation) -> Image { }

    /// Adjusts the antialiasing properties of an image.
    ///
    /// If an image is antialiased, then it resists being distorted when it is
    /// shrunk to a lower resolution.
    ///
    /// As far as I can tell, this isn't doing anything right now.
    /// But you can check it out for yourself:
    ///
    /// To follow along, save the following image as `"bird"` in your project.
    ///
    /// ![Bird Image](bird.png)
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Image("bird")
    ///                 .resizable()
    ///                 .antialiased(true)
    ///                 .frame(width: 100, height: 100)
    ///             Image("bird")
    ///                 .resizable()
    ///                 .antialiased(false)
    ///                 .frame(width: 100, height: 100)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing an HStack with two bird images, the first the
    /// antialiased set to true, and the second with antialiased set to false.](image-antialiased-ex.png)
    ///
    /// - Parameter isAntialiased: Whether the image is antialiased.
    public func antialiased(_ isAntialiased: Bool) -> Image { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// Creates an image from a `CGImage` with a custom Text label used for
    /// accessibility.
    ///
    /// Use this initializer to create an ``Image`` view from a
    /// core graphics image. See the Apple documentation on how to
    /// use this class [here](https://developer.apple.com/documentation/coregraphics/cgimage).
    ///
    /// To follow along, save the following image as `"bird"` in your project.
    ///
    /// ![Bird Image](bird.png)
    ///
    /// ```
    /// struct ContentView: View {
    ///     let cgImage = UIImage(named: "bird")!.cgImage!
    ///
    ///     var body: some View {
    ///         Image(cgImage, scale: 1.0, label: Text("Bird"))
    ///             .resizable()
    ///             .frame(width: 50, height: 50)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a bird image derived from a CGImage.](image-bird.png)
    ///
    /// The main benefit of using this initializer is that it gives you
    /// the option to scale and re-orient your image. See
    /// ``Image/Orientation`` for all of the orientation options.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let cgImage = UIImage(named: "bird")!.cgImage!
    ///
    ///     var body: some View {
    ///         Image(cgImage, scale: 1.0, orientation: .leftMirrored, label: Text("Bird"))
    ///             .resizable()
    ///             .frame(width: 50, height: 50)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a left mirrored bird image derived from a CGImage.](image-leftmirrored.png)
    ///
    /// - Parameters:
    ///   - cgImage: the base graphical image
    ///   - scale: the scale factor the image is intended for
    ///     (e.g. 1.0, 2.0, 3.0)
    ///   - orientation: the orientation of the image
    ///   - label: The label associated with the image. The label is used for
    ///     things like accessibility.
    public init(_ cgImage: CGImage, scale: CGFloat, orientation: Image.Orientation = .up, label: Text) { }

    /// Creates an image from a `CGImage` with no accessiblity label.
    ///
    /// This image has no alternative label for accessibility purposes.
    /// Use ``Image/init(_:scale:orientation:label:)`` for details on how
    /// to add a label to the image.
    ///
    /// Use this initializer to create an ``Image`` view from a
    /// core graphics image. See the Apple documentation on how to
    /// use this class [here](https://developer.apple.com/documentation/coregraphics/cgimage).
    ///
    /// To follow along, save the following image as `"bird"` in your project.
    ///
    /// ![Bird Image](bird.png)
    ///
    /// ```
    /// struct ContentView: View {
    ///     let cgImage = UIImage(named: "bird")!.cgImage!
    ///
    ///     var body: some View {
    ///         Image(cgImage, scale: 1.0)
    ///             .resizable()
    ///             .frame(width: 50, height: 50)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view displaying a bird image.](image-bird.png)
    ///
    /// The main benefit of using this initializer is that it gives you
    /// the option to scale and re-orient your image. See
    /// ``Image/Orientation`` for all of the orientation options.
    ///
    /// ```
    /// struct ContentView: View {
    ///     let cgImage = UIImage(named: "bird")!.cgImage!
    ///
    ///     var body: some View {
    ///         Image(cgImage, scale: 1.0, orientation: .leftMirrored)
    ///             .resizable()
    ///             .frame(width: 50, height: 50)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a bird image with left mirrored orientation.](image-leftmirrored.png)
    ///
    /// - Parameters:
    ///   - cgImage: the base graphical image
    ///   - scale: the scale factor the image is intended for
    ///     (e.g. 1.0, 2.0, 3.0)
    ///   - orientation: the orientation of the image
    public init(decorative cgImage: CGImage, scale: CGFloat, orientation: Image.Orientation = .up) { }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension Image {

    /// Creates an image from a `UIImage`.
    ///
    /// `UIImage` is asn image class from Apple's `UIKit` framework.
    /// See [this page](https://developer.apple.com/documentation/uikit/uiimage)
    /// from Apple's `UIKit` docs for more info on creating a `UIImage`
    ///
    /// To follow along, save the following image as `"bird"` in your project.
    ///
    /// ![Bird Image](bird.png)
    ///
    /// ```
    /// struct ContentView: View {
    ///     let uiImage = UIImage(named: "bird")!
    ///
    ///     var body: some View {
    ///         Image(uiImage: uiImage)
    ///             .resizable()
    ///             .frame(width: 50, height: 50)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a bird image derived from a UIImage.(image-bird.png)
    ///
    public init(uiImage: UIImage) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// The different ways of resizing an image to fill a view.
    ///
    /// Use this enumeration with the ``Image/resizable(_:)``
    /// image modifier to determine how the image gets resized.
    /// The two options are ``ResizingMode/stretch``, the familiar method
    /// of resizing an image by squishing and stretching it, and
    /// ``ResizingMode/tile``, which keeps the image as-is, but tiles or
    /// crops it to fit the available space.
    ///
    /// See the two options compared below.
    ///
    /// To follow along, save the following image as `"bird-small"` in your project.
    ///
    /// ![Bird Small Image](bird-small.png)
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Image("bird-small")
    ///                 .resizable(resizingMode: .stretch)
    ///                 .frame(width: 200, height: 100)
    ///             Image("bird-small")
    ///                 .resizable(resizingMode: .tile)
    ///                 .frame(width: 200, height: 100)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a VStack with two small bird images, one of which
    /// has been stretched, and the other of which has been tiled in a square;
    /// both images have been modified using resizingMode in the resizable modifier.](bird-tile-stretch.png)
    ///
    public enum ResizingMode {

        /// The resizing method of maintaining image properties, positioning
        /// several in a grid to fill the space if necessary.
        ///
        /// Use this enumeration case with the ``Image/resizable(_:)``
        /// image modifier to determine how the image gets resized.
        /// The two options are ``ResizingMode/stretch``, the familiar method
        /// of resizing an image by squishing and stretching it, and
        /// ``ResizingMode/tile``, which keeps the image as-is, but tiles or
        /// crops it to fit the available space.
        ///
        /// See the two options compared below.
        ///
        /// To follow along, save the following image as `"bird-small"` in your project.
        ///
        /// ![Bird Small Image](bird-small.png)
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         VStack {
        ///             Image("bird-small")
        ///                 .resizable(resizingMode: .stretch)
        ///                 .frame(width: 200, height: 100)
        ///             Image("bird-small")
        ///                 .resizable(resizingMode: .tile)
        ///                 .frame(width: 200, height: 100)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing a VStack with two small bird images, one of which
        /// has been stretched, and the other of which has been tiled in a square;
        /// both images have been modified using resizingMode in the resizable modifier.](bird-tile-stretch.png)
        ///
        case tile

        /// The resizing method of stretching the image, distorting the properties
        /// if necessary.
        ///
        /// Use this enumeration with the ``Image/resizable(_:)``
        /// image modifier to determine how the image gets resized.
        /// The two options are ``ResizingMode/stretch``, the familiar method
        /// of resizing an image by squishing and stretching it, and
        /// ``ResizingMode/tile``, which keeps the image as-is, but tiles or
        /// crops it to fit the available space.
        ///
        /// See the two options compared below.
        ///
        /// To follow along, save the following image as `"bird-small"` in your project.
        ///
        /// ![Bird Small Image](bird-small.png)
        ///
        /// ```
        /// struct ContentView: View {
        ///     var body: some View {
        ///         VStack {
        ///             Image("bird-small")
        ///                 .resizable(resizingMode: .stretch)
        ///                 .frame(width: 200, height: 100)
        ///             Image("bird-small")
        ///                 .resizable(resizingMode: .tile)
        ///                 .frame(width: 200, height: 100)
        ///         }
        ///     }
        /// }
        /// ```
        ///
        /// ![A view containing a VStack with two small bird images, one of which
        /// has been stretched, and the other of which has been tiled in a square;
        /// both images have been modified using resizingMode in the resizable modifier.](bird-tile-stretch.png)
        ///
        case stretch

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.ResizingMode, b: Image.ResizingMode) -> Bool { }

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher) { }
    }

    /// Modifies an image to make it resizable.
    ///
    /// Applying this modifier before reframing an image or in other ways
    /// distorting it is necessary otherwise the images view will change, but
    /// the image itself will not be resized.
    ///
    /// **Important:** This modifier
    /// must come first on an ``Image`` before making changes to its size in subsequent
    /// modifiers.
    ///
    /// See the ``Image/ResizingMode`` enumeration for details on how to use
    /// the `resizingMode` parameter.
    ///
    /// The `capInsets` parameter is rarely used. It specifies distance
    /// from the edges of the image where the image does *not*
    /// get resized.
    ///
    /// To follow along, save the following image as `"bird"` in your project.
    ///
    /// ![Bird Image](bird.png)
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Image("bird")
    ///             .resizable()
    ///             .frame(width: 50, height: 50)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing the bird image, which has been altered using the empty resizable modifier.](image-bird.png)
    ///
    /// - Parameters:
    ///   - capInsets: The values to use for the cap insets.
    ///   - resizingMode: The mode of resizing to use.
    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image { }
}

