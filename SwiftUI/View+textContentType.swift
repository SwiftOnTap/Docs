extension View {

    /// A view modifier that sets the text content type for this view, which the system uses to
    /// offer suggestions while the user enters text on an iOS or tvOS device.
    ///
    /// Use `textContentType(_:)` to set the content type for this view.
    /// This is especially useful for auto-complete purposes.
    ///
    /// Available content type values can be found in the
    /// [`UITextContentType`](https://developer.apple.com/documentation/uikit/uitextcontenttype)
    /// page.
    ///
    /// This example configures the ``TextField`` for the entry of email
    /// addresses:
    ///
    /// ```
    /// struct EmailView: View {
    ///     @State private var emailAddress = ""
    ///
    ///     var body: some View {
    ///         TextField("Enter email:", text: $emailAddress)
    ///             .textContentType(.emailAddress)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a keyboard on the lower half of the screen
    /// and a text field above which reads "billjames2@icloud.com" Since the
    /// textContentType is set to emailAddress, the keyboard suggest "com" as
    /// the last part of the email.](textcontenttype.png)
    ///
    /// - Parameter textContentType: One of the content types available in the
    ///   `UITextContentType` enumeration that identify the semantic meaning
    ///     expected for a text-entry area. These include support for email
    ///     addresses, location names, URLs, and telephone numbers to name
    ///     just a few.
    @available(iOS 13.0, tvOS 13.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @inlinable public func textContentType(_ textContentType: UITextContentType?) -> some View { }

}

