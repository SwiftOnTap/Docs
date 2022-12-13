extension View {

    /// A view modifier that disables autocorrection.
    ///
    /// Use this modifier when the  autocorrection in a text field would
    /// make it more difficult for the user to input information. Some examples of where this
    /// might be the case include:
    /// - proper names
    /// - street addresses
    ///
    /// - Note: If the user has turned *off* autocorrection in their device settings, there is no way
    /// to use this modifier to force autocorrection to turn *on*.
    ///
    /// In the example below, disabling autocorrection allows the user to enter their
    /// text without the autocorrection system offering suggestions or
    /// attempting to override their input.
    ///
    ///     struct ExampleView: View {
    ///         @State private var address1 = ""
    ///         @State private var address2 = ""
    ///
    ///         var body: some View {
    ///             TextField("1234 Main St.", text: $address1)
    ///                 .disableAutocorrection(true)
    ///             TextField("Label this address", text: $address2)
    ///                 .disableAutocorrection(false)
    ///         }
    ///     }
    ///
    /// ![A gif displaying a view with two text fields, the top one with the
    /// placeholder "1234 Main St." and autocorrect disabled, and the other with
    /// the placeholder "Label this address" and autocorrect enabled; when
    /// "Avenue" is mistyped into the first field, it is not autocorrected, but
    /// when "Home" is partially typed into the second, autocorrected completions
    /// immediately appear.](disable-autocorrect-ex.gif)
    ///
    /// - Parameter disable: Whether autocorrection is disabled for the view.
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
    @available(watchOS, unavailable)
    public func disableAutocorrection(_ disable: Bool?) -> some View { }

}

