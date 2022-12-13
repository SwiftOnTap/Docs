@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that presents an alert when a given value is not nil.
    ///
    /// Use this modifier to present an alert over the current view when you
    /// need to pass the alert a value.
    /// The alert will be presented only when the binding value you pass it is
    /// not nil.
    ///
    /// If your alert doesn't need an `item` parameter, use
    /// ``View/alert(isPresented:content)`` instead.
    ///
    /// Use the modifier like this:
    ///
    ///     struct Item: Identifiable {
    ///         let id = UUID()
    ///         let text: String
    ///     }
    ///
    ///     struct ExampleView: View {
    ///         @State private var item: Item? = nil
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Button("🍌 Alert") {
    ///                     item = Item(text: "🍌🍌")
    ///                 }
    ///                 Button("🍑 Alert") {
    ///                     item = Item(text: "🍑🍑")
    ///                 }
    ///             }
    ///             .alert(item: $item, content: alertBuilder)
    ///         }
    ///
    ///         func alertBuilder(item: Item) -> Alert {
    ///             let confirm = Alert.Button.default(Text("Confirm \(item.text)")) { print(item.text) }
    ///             let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
    ///
    ///             return Alert(title: Text("Confirm fruit"),
    ///                         message: Text("Please confirm your fruit"),
    ///                         primaryButton: confirm,
    ///                         secondaryButton: cancel)
    ///         }
    ///     }
    ///
    /// ![A gif displaying two buttons in a VStack, denoted by a banana and
    /// peach emoji, respectively. When pressed, each prompts an alert to
    /// confirm the fruit, with the option to either confirm or cancel. The
    /// alert is implemented as a modifier to the VStack, which determines the
    /// prompted alert based on the binding value passed to its item parameter.](alert-item-content.gif)
    ///
    /// - Parameters:
    ///   - item: A binding value passed to `content` to build the sheet. The sheet will show
    ///   when this value is not `nil`.
    ///   - content: A view builder closure that takes in the `item` and returns the alert.
    public func alert<Item>(item: Binding<Item?>, content: (Item) -> Alert) -> some View where Item : Identifiable { }


    /// A view modifier that presents an alert when a given condition is true.
    ///
    /// Use this modifier to present an alert over the current view.
    /// The alert will be presented only when the binding value you pass it is true.
    ///
    /// If your alert needs an `item` parameter, use
    /// ``View/alert(item:content)`` instead.
    ///
    /// Use the modifier like this:
    ///
    ///     struct ExampleView: View {
    ///         @State private var showAlert = false
    ///
    ///         var body: some View {
    ///             Button("Open sesame 🚨") {
    ///                 showAlert = true
    ///             }
    ///             .alert(isPresented: $showAlert) {
    ///                 let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.") }
    ///                 let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
    ///
    ///                 return Alert(title: Text("Confirm alert"),
    ///                             message: Text("Please confirm your alert!"),
    ///                             primaryButton: confirm,
    ///                             secondaryButton: cancel)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A gif with a blue button that reads "Open sesame"—when pressed,
    /// an alert pops up that asks the user to confirm the alert, with the
    /// option to either confirm or cancel.](alert-is-presented.gif)
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the alert is presented.
    ///   - content: A closure returning the ``Alert``.
    public func alert(isPresented: Binding<Bool>, content: () -> Alert) -> some View { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Presents an alert when a given condition is true, using a localized
    /// string key for the title.
    ///
    /// In the example below, a login form conditionally presents an alert by
    /// setting the `didFail` state variable. When the form sets the value to
    /// to `true`, the system displays an alert with an "OK" action.
    ///
    ///     struct Login: View {
    ///         @State private var didFail = false
    ///
    ///         var body: some View {
    ///             LoginForm(didFail: $didFail)
    ///                 .alert(
    ///                     "Login failed.",
    ///                     isPresented: $didFail
    ///                 ) {
    ///                     Button("OK") {
    ///                         // Handle the acknowledgement.
    ///                     }
    ///                 }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// This modifier creates a ``Text`` view for the title on your behalf, and
    /// treats the localized key similar to
    /// ``Text/init(_:tableName:bundle:comment:)``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized string that describes the title
    ///     of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions.
    public func alert<A>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A) -> some View where A : View { }


    /// Presents an alert when a given condition is true, using a string
    /// variable as a title.
    ///
    /// In the example below, a login form conditionally presents an alert by
    /// setting the `didFail` state variable. When the form sets the value to
    /// to `true`, the system displays an alert with an "OK" action.
    ///
    ///     struct Login: View {
    ///         @State private var didFail = false
    ///         let alertTitle: String = "Login failed."
    ///
    ///         var body: some View {
    ///             LoginForm(didFail: $didFail)
    ///                 .alert(
    ///                     alertTitle,
    ///                     isPresented: $didFail
    ///                 ) {
    ///                     Button("OK") {
    ///                         // Handle the acknowledgement.
    ///                     }
    ///                 }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// - Parameters:
    ///   - title: A text string used as the title of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions.
    public func alert<S, A>(_ title: S, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A) -> some View where S : StringProtocol, A : View { }


    /// Presents an alert when a given condition is true, using a text view for
    /// the title.
    ///
    /// In the example below, a login form conditionally presents an alert by
    /// setting the `didFail` state variable. When the form sets the value to
    /// to `true`, the system displays an alert with an "OK" action.
    ///
    ///     struct Login: View {
    ///         @State private var didFail = false
    ///         let alertTitle: String = "Login failed."
    ///
    ///         var body: some View {
    ///             LoginForm(didFail: $didFail)
    ///                 .alert(
    ///                     Text(alertTitle),
    ///                     isPresented: $didFail
    ///                 ) {
    ///                     Button("OK") {
    ///                         // Handle the acknowledgement.
    ///                     }
    ///                 }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions.
    public func alert<A>(_ title: Text, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A) -> some View where A : View { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Presents an alert with a message when a given condition is true, using
    /// a localized string key for a title.
    ///
    /// In the example below, a login form conditionally presents an alert by
    /// setting the `didFail` state variable. When the form sets the value to
    /// to `true`, the system displays an alert with an "OK" action.
    ///
    ///     struct Login: View {
    ///         @State private var didFail = false
    ///
    ///         var body: some View {
    ///             LoginForm(didFail: $didFail)
    ///                 .alert(
    ///                     "Login failed.",
    ///                     isPresented: $didFail
    ///                 ) {
    ///                     Button("OK") {
    ///                         // Handle the acknowledgement.
    ///                     }
    ///                 } message: {
    ///                     Text("Please check your credentials and try again.")
    ///                 }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// Only unstyled text is supported for the message.
    ///
    /// This modifier creates a ``Text`` view for the title on your behalf, and
    /// treats the localized key similar to
    /// ``Text/init(_:tableName:bundle:comment:)``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized string that describes the title
    ///     of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions.
    ///   - message: A ``ViewBuilder`` returning the message for the alert.
    public func alert<A, M>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where A : View, M : View { }


    /// Presents an alert with a message when a given condition is true using
    /// a string variable as a title.
    ///
    /// In the example below, a login form conditionally presents an alert by
    /// setting the `didFail` state variable. When the form sets the value to
    /// to `true`, the system displays an alert with an "OK" action.
    ///
    ///     struct Login: View {
    ///         @State private var didFail = false
    ///         let alertTitle: String = "Login failed."
    ///
    ///         var body: some View {
    ///             LoginForm(didFail: $didFail)
    ///                 .alert(
    ///                     alertTitle,
    ///                     isPresented: $didFail
    ///                 ) {
    ///                     Button("OK") {
    ///                         // Handle the acknowledgement.
    ///                     }
    ///                 } message: {
    ///                     Text("Please check your credentials and try again.")
    ///                 }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// Only unstyled text is supported for the message.
    ///
    /// - Parameters:
    ///   - title: A text string used as the title of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions.
    ///   - message: A ``ViewBuilder`` returning the message for the alert.
    public func alert<S, A, M>(_ title: S, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where S : StringProtocol, A : View, M : View { }


    /// Presents an alert with a message when a given condition is true using
    /// a text view as a title.
    ///
    /// In the example below, a login form conditionally presents an alert by
    /// setting the `didFail` state variable. When the form sets the value to
    /// to `true`, the system displays an alert with an "OK" action.
    ///
    ///     struct Login: View {
    ///         @State private var didFail = false
    ///         let alertTitle: String = "Login failed."
    ///
    ///         var body: some View {
    ///             LoginForm(didFail: $didFail)
    ///                 .alert(
    ///                     Text(alertTitle),
    ///                     isPresented: $didFail
    ///                 ) {
    ///                     Button("OK") {
    ///                         // Handle the acknowledgement.
    ///                     }
    ///                 } message: {
    ///                    Text("Please check your credentials and try again.")
    ///                 }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// Only unstyled text is supported for the message.
    ///
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions.
    ///   - message: A ``ViewBuilder`` returning the message for the alert.
    public func alert<A, M>(_ title: Text, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where A : View, M : View { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Presents an alert using the given data to produce the alert's content
    /// and a localized string key for a title.
    ///
    /// For the alert to appear, both `isPresented` must be `true` and
    /// `data` must not be `nil`. The data should not change after the
    /// presentation occurs. Any changes that you make after the presentation
    /// occurs are ignored.
    ///
    /// Use this method when you need to populate the fields of an alert with
    /// content from a data source. The example below shows a custom data
    /// source, `SaveDetails`, that provides data to populate the alert:
    ///
    ///     struct SaveDetails: Identifiable {
    ///         let name: String
    ///         let error: String
    ///         let id = UUID()
    ///     }
    ///
    ///     struct SaveButton: View {
    ///         @State private var didError = false
    ///         @State private var details: SaveDetails?
    ///
    ///         var body: some View {
    ///             Button("Save") {
    ///                 details = model.save(didError: $didError)
    ///             }
    ///             .alert(
    ///                 "Save failed.",
    ///                 isPresented: $didError,
    ///                 presenting: details
    ///             ) { details in
    ///                 Button(role: .destructive) {
    ///                     // Handle the deletion.
    ///                 } label: {
    ///                     Text("Delete \(details.name)")
    ///                 }
    ///                 Button("Retry") {
    ///                     // Handle the retry action.
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// This modifier creates a ``Text`` view for the title on your behalf, and
    /// treats the localized key similar to
    /// ``Text/init(_:tableName:bundle:comment:)``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized string that describes the title
    ///     of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - data: An optional source of truth for the alert. The system passes
    ///     the contents to the modifier's closures. You use this data to
    ///     populate the fields of an alert that you create that the system
    ///     displays to the user.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions given the
    ///     currently available data.
    public func alert<A, T>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A) -> some View where A : View { }


    /// Presents an alert using the given data to produce the alert's content
    /// and a string variable as a title.
    ///
    /// For the alert to appear, both `isPresented` must be `true` and
    /// `data` must not be `nil`. The data should not change after the
    /// presentation occurs. Any changes that you make after the presentation
    /// occurs are ignored.
    ///
    /// Use this method when you need to populate the fields of an alert with
    /// content from a data source. The example below shows a custom data
    /// source, `SaveDetails`, that provides data to populate the alert:
    ///
    ///     struct SaveDetails: Identifiable {
    ///         let name: String
    ///         let error: String
    ///         let id = UUID()
    ///     }
    ///
    ///     struct SaveButton: View {
    ///         @State private var didError = false
    ///         @State private var details: SaveDetails?
    ///         let alertTitle: String = "Save failed."
    ///
    ///         var body: some View {
    ///             Button("Save") {
    ///                 details = model.save(didError: $didError)
    ///             }
    ///             .alert(
    ///                 alertTitle,
    ///                 isPresented: $didError,
    ///                 presenting: details
    ///             ) { details in
    ///                 Button(role: .destructive) {
    ///                     // Handle the deletion.
    ///                 } label: {
    ///                     Text("Delete \(details.name)")
    ///                 }
    ///                 Button("Retry") {
    ///                     // Handle the retry action.
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// - Parameters:
    ///   - title: A text string used as the title of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - data: An optional source of truth for the alert. The system passes
    ///     the contents to the modifier's closures. You use this data to
    ///     populate the fields of an alert that you create that the system
    ///     displays to the user.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions given the
    ///     currently available data.
    public func alert<S, A, T>(_ title: S, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A) -> some View where S : StringProtocol, A : View { }


    /// Presents an alert using the given data to produce the alert's content
    /// and a text view as a title.
    ///
    /// For the alert to appear, both `isPresented` must be `true` and
    /// `data` must not be `nil`. The data should not change after the
    /// presentation occurs. Any changes that you make after the presentation
    /// occurs are ignored.
    ///
    /// Use this method when you need to populate the fields of an alert with
    /// content from a data source. The example below shows a custom data
    /// source, `SaveDetails`, that provides data to populate the alert:
    ///
    ///     struct SaveDetails: Identifiable {
    ///         let name: String
    ///         let error: String
    ///         let id = UUID()
    ///     }
    ///
    ///     struct SaveButton: View {
    ///         @State private var didError = false
    ///         @State private var details: SaveDetails?
    ///         let alertTitle: String = "Save failed."
    ///
    ///             var body: some View {
    ///             Button("Save") {
    ///                 details = model.save(didError: $didError)
    ///             }
    ///             .alert(
    ///                 Text(alertTitle),
    ///                 isPresented: $didError,
    ///                 presenting: details
    ///             ) { details in
    ///                 Button(role: .destructive) {
    ///                     // Handle the deletion.
    ///                 } label: {
    ///                     Text("Delete \(details.name)")
    ///                 }
    ///                 Button("Retry") {
    ///                     // Handle the retry action.
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// - Parameters:
    ///   - title: the title of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - data: An optional source of truth for the alert. The system passes
    ///     the contents to the modifier's closures. You use this data to
    ///     populate the fields of an alert that you create that the system
    ///     displays to the user.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions given the
    ///     currently available data.
    public func alert<A, T>(_ title: Text, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A) -> some View where A : View { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Presents an alert with a message using the given data to produce the
    /// alert's content and a localized string key for a title.
    ///
    /// For the alert to appear, both `isPresented` must be `true` and
    /// `data` must not be `nil`. The data should not change after the
    /// presentation occurs. Any changes that you make after the presentation
    /// occurs are ignored.
    ///
    /// Use this method when you need to populate the fields of an alert with
    /// content from a data source. The example below shows a custom data
    /// source, `SaveDetails`, that provides data to populate the alert:
    ///
    ///     struct SaveDetails: Identifiable {
    ///         let name: String
    ///         let error: String
    ///         let id = UUID()
    ///     }
    ///
    ///     struct SaveButton: View {
    ///         @State private var didError = false
    ///         @State private var details: SaveDetails?
    ///
    ///         var body: some View {
    ///             Button("Save") {
    ///                 details = model.save(didError: $didError)
    ///             }
    ///             .alert(
    ///                 "Save failed.",
    ///                 isPresented: $didError,
    ///                 presenting: details
    ///             ) { details in
    ///                 Button(role: .destructive) {
    ///                     // Handle the deletion.
    ///                 } label: {
    ///                     Text("Delete \(details.name)")
    ///                 }
    ///                 Button("Retry") {
    ///                     // Handle the retry action.
    ///                 }
    ///             } message: { details in
    ///                 Text(details.error)
    ///             }
    ///         }
    ///     }
    ///
    /// This modifier creates a ``Text`` view for the title on your behalf, and
    /// treats the localized key similar to
    /// ``Text/init(_:tableName:bundle:comment:)``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// Only unstyled text is supported for the message.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized string that describes the title
    ///     of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - data: An optional source of truth for the alert. The system passes
    ///     the contents to the modifier's closures. You use this data to
    ///     populate the fields of an alert that you create that the system
    ///     displays to the user.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions given the
    ///     currently available data.
    ///   - message: A ``ViewBuilder`` returning the message for the alert given
    ///     the currently available data.
    public func alert<A, M, T>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A, @ViewBuilder message: (T) -> M) -> some View where A : View, M : View { }


    /// Presents an alert with a message using the given data to produce the
    /// alert's content and a string variable as a title.
    ///
    /// For the alert to appear, both `isPresented` must be `true` and
    /// `data` must not be `nil`. The data should not change after the
    /// presentation occurs. Any changes that you make after the presentation
    /// occurs are ignored.
    ///
    /// Use this method when you need to populate the fields of an alert with
    /// content from a data source. The example below shows a custom data
    /// source, `SaveDetails`, that provides data to populate the alert:
    ///
    ///     struct SaveDetails: Identifiable {
    ///         let name: String
    ///         let error: String
    ///         let id = UUID()
    ///     }
    ///
    ///     struct SaveButton: View {
    ///         @State private var didError = false
    ///         @State private var details: SaveDetails?
    ///         let alertTitle: String = "Save failed."
    ///
    ///         var body: some View {
    ///             Button("Save") {
    ///                 details = model.save(didError: $didError)
    ///             }
    ///             .alert(
    ///                 alertTitle,
    ///                 isPresented: $didError,
    ///                 presenting: details
    ///             ) { details in
    ///                 Button(role: .destructive) {
    ///                     // Handle the deletion.
    ///                 } label: {
    ///                     Text("Delete \(details.name)")
    ///                 }
    ///                 Button("Retry") {
    ///                     // Handle the retry action.
    ///                 }
    ///             } message: { details in
    ///                 Text(details.error)
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// Only unstyled text is supported for the message.
    ///
    /// - Parameters:
    ///   - title: A text string used as the title of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - data: An optional source of truth for the alert. The system passes
    ///     the contents to the modifier's closures. You use this data to
    ///     populate the fields of an alert that you create that the system
    ///     displays to the user.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions given the
    ///     currently available data.
    ///   - message: A ``ViewBuilder`` returning the message for the alert given
    ///     the currently available data.
    public func alert<S, A, M, T>(_ title: S, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A, @ViewBuilder message: (T) -> M) -> some View where S : StringProtocol, A : View, M : View { }


    /// Presents an alert with a message using the given data to produce the
    /// alert's content and a text view for a title.
    ///
    /// For the alert to appear, both `isPresented` must be `true` and
    /// `data` must not be `nil`. The data should not change after the
    /// presentation occurs. Any changes that you make after the presentation
    /// occurs are ignored.
    ///
    /// Use this method when you need to populate the fields of an alert with
    /// content from a data source. The example below shows a custom data
    /// source, `SaveDetails`, that provides data to populate the alert:
    ///
    ///     struct SaveDetails: Identifiable {
    ///         let name: String
    ///         let error: String
    ///         let id = UUID()
    ///     }
    ///
    ///     struct SaveButton: View {
    ///         @State private var didError = false
    ///         @State private var details: SaveDetails?
    ///         let alertTitle: String = "Save failed."
    ///
    ///         var body: some View {
    ///             Button("Save") {
    ///                 details = model.save(didError: $didError)
    ///             }
    ///             .alert(
    ///                 Text(alertTitle),
    ///                 isPresented: $didError,
    ///                 presenting: details
    ///             ) { details in
    ///                 Button(role: .destructive) {
    ///                     // Handle the deletion.
    ///                 } label: {
    ///                     Text("Delete \(details.name)")
    ///                 }
    ///                 Button("Retry") {
    ///                     // Handle the retry action.
    ///                 }
    ///             } message: { details in
    ///                 Text(details.error)
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// Only unstyled text is supported for the message.
    ///
    /// - Parameters:
    ///   - title: the title of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - data: An optional source of truth for the alert. The system passes
    ///     the contents to the modifier's closures. You use this data to
    ///     populate the fields of an alert that you create that the system
    ///     displays to the user.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions given the
    ///     currently available data.
    ///   - message: A ``ViewBuilder`` returning the message for the alert given
    ///     the currently available data.
    public func alert<A, M, T>(_ title: Text, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A, @ViewBuilder message: (T) -> M) -> some View where A : View, M : View { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Presents an alert when an error is present.
    ///
    /// In the example below, a form conditionally presents an alert depending
    /// upon the value of an error. When the error value isn't `nil`, the system
    /// presents an alert with an "OK" action.
    ///
    /// The title of the alert is inferred from the error's `errorDescription`.
    ///
    ///     struct TicketPurchase: View {
    ///         @State private var error: TicketPurchaseError? = nil
    ///         @State private var showAlert = false
    ///
    ///         var body: some View {
    ///             TicketForm(showAlert: $showAlert, error: $error)
    ///                 .alert(isPresented: $showAlert, error: error) {
    ///                     Button("OK") {
    ///                         // Handle acknowledgement.
    ///                     }
    ///                 }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// This modifier creates a ``Text`` view for the title on your behalf, and
    /// treats the localized key similar to
    /// ``Text/init(_:tableName:bundle:comment:)``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - error: An optional localized Error that is used to generate the
    ///     alert's title.  The system passes the contents to the modifier's
    ///     closures. You use this data to populate the fields of an alert that
    ///     you create that the system displays to the user.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions.
    public func alert<E, A>(isPresented: Binding<Bool>, error: E?, @ViewBuilder actions: () -> A) -> some View where E : LocalizedError, A : View { }


    /// Presents an alert with a message when an error is present.
    ///
    /// In the example below, a form conditionally presents an alert depending
    /// upon the value of an error. When the error value isn't `nil`, the system
    /// presents an alert with an "OK" action.
    ///
    /// The title of the alert is inferred from the error's `errorDescription`.
    ///
    ///     struct TicketPurchase: View {
    ///         @State private var error: TicketPurchaseError? = nil
    ///         @State private var showAlert = false
    ///
    ///         var body: some View {
    ///             TicketForm(showAlert: $showAlert, error: $error)
    ///                 .alert(isPresented: $showAlert, error: error) { _ in
    ///                     Button("OK") {
    ///                         // Handle acknowledgement.
    ///                     }
    ///                 } message: { error in
    ///                     Text(error.recoverySuggestion ?? "Try again later.")
    ///                 }
    ///         }
    ///     }
    ///
    /// All actions in an alert dismiss the alert after the action runs.
    /// The default button is shown with greater prominence.  You can
    /// influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// If no actions are present, the system includes a standard "OK"
    /// action. No default cancel action is provided. If you want to show a
    /// cancel action, use a button with a role of ``ButtonRole/cancel``.
    ///
    /// On iOS, tvOS, and watchOS, alerts only support controls with labels that
    /// are ``Text``. Passing any other type of view results in the content
    /// being omitted.
    ///
    /// This modifier creates a ``Text`` view for the title on your behalf, and
    /// treats the localized key similar to
    /// ``Text/init(_:tableName:bundle:comment:)``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the alert. When the user presses or taps one of the alert's
    ///     actions, the system sets this value to `false` and dismisses.
    ///   - error: An optional localized Error that is used to generate the
    ///     alert's title.  The system passes the contents to the modifier's
    ///     closures. You use this data to populate the fields of an alert that
    ///     you create that the system displays to the user.
    ///   - actions: A ``ViewBuilder`` returning the alert's actions.
    ///   - message: A view builder returning the message for the alert given
    ///     the current error.
    public func alert<E, A, M>(isPresented: Binding<Bool>, error: E?, @ViewBuilder actions: (E) -> A, @ViewBuilder message: (E) -> M) -> some View where E : LocalizedError, A : View, M : View { }

}
