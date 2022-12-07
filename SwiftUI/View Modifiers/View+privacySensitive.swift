@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Marks the view as containing sensitive, private user data.
    ///
    /// SwiftUI redacts views marked with this modifier when you apply the
    /// ``RedactionReasons/privacy`` redaction reason.
    ///
    ///     struct BankAccountView: View {
    ///         var body: some View {
    ///             VStack {
    ///                 Text("Account #")
    ///
    ///                 Text(accountNumber)
    ///                     .font(.headline)
    ///                     .privacySensitive() // Hide only the account number.
    ///             }
    ///         }
    ///     }
    public func privacySensitive(_ sensitive: Bool = true) -> some View { }

}
