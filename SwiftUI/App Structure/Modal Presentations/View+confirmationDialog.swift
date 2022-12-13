@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Presents a confirmation dialog when a given condition is true, using a
    /// localized string key for the title.
    ///
    /// In the example below, a button conditionally presents a confirmation
    /// dialog depending upon the value of a bound Boolean variable. When the
    /// Boolean value is set to `true`, the system displays a confirmation
    /// dialog with a cancel action and a destructive action.
    ///
    ///     struct ConfirmEraseItems: View {
    ///         @State private var isShowingDialog = false
    ///         var body: some View {
    ///             Button("Empty Trash") {
    ///                 isShowingDialog = true
    ///             }
    ///             .confirmationDialog(
    ///                 "Permanently erase the items in the Trash?",
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Empty Trash", role: .destructive) {
    ///                     // Handle empty trash action.
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// On iOS, tvOS, and watchOS, confirmation dialogs only support controls
    /// with labels that are ``Text``. Passing any other type of view results in
    /// the content being omitted.
    ///
    /// This modifier creates a ``Text`` view for the title on your behalf, and
    /// treats the localized key similar to
    /// ``Text/init(_:tableName:bundle:comment:)``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized string that describes the title
    ///     of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - actions: A view builder returning the dialog's actions.
    public func confirmationDialog<A>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, @ViewBuilder actions: () -> A) -> some View where A : View { }


    /// Presents a confirmation dialog when a given condition is true, using a
    /// string variable as a title.
    ///
    /// In the example below, a button conditionally presents a confirmation
    /// dialog depending upon the value of a bound Boolean variable. When the
    /// Boolean value is set to `true`, the system displays a confirmation
    /// dialog with a cancel action and a destructive action.
    ///
    ///     struct ConfirmEraseItems: View {
    ///         @State private var isShowingDialog = false
    ///         var title: String
    ///         var body: some View {
    ///             Button("Empty Trash") {
    ///                 isShowingDialog = true
    ///             }
    ///             .confirmationDialog(
    ///                 title,
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Empty Trash", role: .destructive) {
    ///                     // Handle empty trash action.
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     isShowingDialog = false
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// - Parameters:
    ///   - title: A text string used as the title of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - actions: A view builder returning the dialog's actions.
    public func confirmationDialog<S, A>(_ title: S, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, @ViewBuilder actions: () -> A) -> some View where S : StringProtocol, A : View { }


    /// Presents a confirmation dialog when a given condition is true, using a
    /// text view for the title.
    ///
    /// In the example below, a button conditionally presents a confirmation
    /// dialog depending upon the value of a bound Boolean variable. When the
    /// Boolean value is set to `true`, the system displays a confirmation
    /// dialog with a cancel action and a destructive action.
    ///
    ///     struct ConfirmEraseItems: View {
    ///         @State private var isShowingDialog = false
    ///         var body: some View {
    ///             Button("Empty Trash") {
    ///                 isShowingDialog = true
    ///             }
    ///             .confirmationDialog(
    ///                 Text("Permanently erase the items in the trash?"),
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Empty Trash", role: .destructive) {
    ///                     // Handle empty trash action.
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// - Parameters:
    ///   - title: the title of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - actions: A view builder returning the dialog's actions.
    public func confirmationDialog<A>(_ title: Text, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, @ViewBuilder actions: () -> A) -> some View where A : View { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Presents a confirmation dialog with a message when a given condition is
    /// true, using a localized string key for the title.
    ///
    /// In the example below, a button conditionally presents a confirmation
    /// dialog depending upon the value of a bound Boolean variable. When the
    /// Boolean value is set to `true`, the system displays a confirmation
    /// dialog with a cancel action and a destructive action.
    ///
    ///     struct ConfirmEraseItems: View {
    ///         @State private var isShowingDialog = false
    ///         var body: some View {
    ///             Button("Empty Trash") {
    ///                 isShowingDialog = true
    ///             }
    ///             .confirmationDialog(
    ///                 "Permanently erase the items in the Trash?",
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Empty Trash", role: .destructive) {
    ///                     // Handle empty trash action.
    ///                 }
    ///             } message: {
    ///                 Text("You cannot undo this action.")
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// On iOS, tvOS, and watchOS, confirmation dialogs only support controls
    /// with labels that are `Text`. Passing any other type of view results in
    /// the content being omitted.
    ///
    /// This modifier creates a ``Text`` view for the title on your behalf, and
    /// treats the localized key similar to
    /// ``Text/init(_:tableName:bundle:comment:)``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized string that describes the title
    ///     of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - actions: A view builder returning the dialog's actions.
    ///   - message: A view builder returning the message for the dialog.
    public func confirmationDialog<A, M>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where A : View, M : View { }


    /// Presents a confirmation dialog with a message when a given condition is
    /// true, using a string variable for the title.
    ///
    /// In the example below, a button conditionally presents a confirmation
    /// dialog depending upon the value of a bound Boolean variable. When the
    /// Boolean value is set to `true`, the system displays a confirmation
    /// dialog with a cancel action and a destructive action.
    ///
    ///     struct ConfirmEraseItems: View {
    ///         @State private var isShowingDialog = false
    ///         var title: String
    ///         var body: some View {
    ///             Button("Empty Trash") {
    ///                 isShowingDialog = true
    ///             }
    ///             .confirmationDialog(
    ///                 title,
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Empty Trash", role: .destructive) {
    ///                     // Handle empty trash action.
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     isShowingDialog = false
    ///                 }
    ///             } message: {
    ///                 Text("You cannot undo this action.")
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// - Parameters:
    ///   - title: A text string used as the title of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether to
    ///     present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - actions: A view builder returning the dialog's actions.
    ///   - message: A view builder returning the message for the dialog.
    public func confirmationDialog<S, A, M>(_ title: S, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where S : StringProtocol, A : View, M : View { }


    /// Presents a confirmation dialog with a message when a given condition is
    /// true, using a text view for the title.
    ///
    /// In the example below, a button conditionally presents a confirmation
    /// dialog depending upon the value of a bound Boolean variable. When the
    /// Boolean value is set to `true`, the system displays a confirmation
    /// dialog with a cancel action and a destructive action.
    ///
    ///     struct ConfirmEraseItems: View {
    ///         @State private var isShowingDialog = false
    ///         var body: some View {
    ///             Button("Empty Trash") {
    ///                 isShowingDialog = true
    ///             }
    ///             .confirmationDialog(
    ///                 Text("Permanently erase the items in the trash?"),
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Empty Trash", role: .destructive) {
    ///                     // Handle empty trash action.
    ///                 }
    ///             } message: {
    ///                 Text("You cannot undo this action.")
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// - Parameters:
    ///   - title: the title of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - actions: A view builder returning the dialog's actions.
    ///   - message: A view builder returning the message for the dialog.
    public func confirmationDialog<A, M>(_ title: Text, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where A : View, M : View { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Presents a confirmation dialog using data to produce the dialog's
    /// content and a localized string key for the title.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `data` must not be `nil`. `data` should not change after the
    /// presentation occurs. Any changes which occur after the presentation
    /// occurs will be ignored.
    ///
    /// Use this method when you need to populate the fields of a confirmation
    /// dialog with content from a data source. The example below shows a custom
    /// data source, `FileDetails`, that provides data to populate the dialog:
    ///
    ///     struct FileDetails: Identifiable {
    ///         var id: String { name }
    ///         let name: String
    ///         let fileType: UTType
    ///     }
    ///     struct ConfirmFileImport: View {
    ///         @State private var isConfirming = false
    ///         @State private var dialogDetail: FileDetails?
    ///         var body: some View {
    ///             Button("Import File") {
    ///                 dialogDetail = FileDetails(
    ///                     name: "MyImageFile.png", fileType: .png)
    ///                 isConfirming = true
    ///             }
    ///             .confirmationDialog(
    ///                 "Are you sure you want to import this file?",
    ///                 isPresented: $isConfirming, presenting: dialogDetail
    ///             ) { detail in
    ///                 Button {
    ///                     // Handle import action.
    ///                 } label: {
    ///                     Text("""
    ///                     Import \(detail.name)
    ///                     File Type: \(detail.fileType.description)
    ///                     """)
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     dialogDetail = nil
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
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// On iOS, tvOS, and watchOS, confirmation dialogs only support controls
    /// with labels that are `Text`. Passing any other type of view results in
    /// the content being omitted.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized string that describes the title
    ///     of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - data: An optional source of truth for the confirmation dialog. The
    ///     system passes the contents to the modifier's closures. You use this
    ///     data to populate the fields of a confirmation dialog that you create
    ///     that the system displays to the user.
    ///   - actions: A view builder returning the dialog's actions given the
    ///     currently available data.
    public func confirmationDialog<A, T>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, presenting data: T?, @ViewBuilder actions: (T) -> A) -> some View where A : View { }


    /// Presents a confirmation dialog using data to produce the dialog's
    /// content and a string variable for the title.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `data` must not be `nil`. `data` should not change after the
    /// presentation occurs. Any changes which occur after the presentation
    /// occurs will be ignored.
    ///
    /// Use this method when you need to populate the fields of a confirmation
    /// dialog with content from a data source. The example below shows a custom
    /// data source, `FileDetails`, that provides data to populate the dialog:
    ///
    ///     struct FileDetails: Identifiable {
    ///         var id: String { name }
    ///         let name: String
    ///         let fileType: UTType
    ///     }
    ///     struct ConfirmFileImport: View {
    ///         var title: String
    ///         @State private var isConfirming = false
    ///         @State private var dialogDetail: FileDetails?
    ///         var body: some View {
    ///             Button("Import File") {
    ///                 dialogDetail = FileDetails(
    ///                     name: "MyImageFile.png", fileType: .png)
    ///                 isConfirming = true
    ///             }
    ///             .confirmationDialog(
    ///                 title, isPresented: $isConfirming,
    ///                 presenting: dialogDetail
    ///             ) { detail in
    ///                 Button {
    ///                     // Handle import action.
    ///                 } label: {
    ///                     Text("""
    ///                     Import \(detail.name)
    ///                     File Type: \(detail.fileType.description)
    ///                     """)
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     dialogDetail = nil
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// On iOS, tvOS, and watchOS, confirmation dialogs only support controls
    /// with labels that are `Text`. Passing any other type of view results in
    /// the content being omitted.
    ///
    /// - Parameters:
    ///   - title: A text string used as the title of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - data: An optional source of truth for the confirmation dialog. The
    ///     system passes the contents to the modifier's closures. You use this
    ///     data to populate the fields of a confirmation dialog that you create
    ///     that the system displays to the user.
    ///   - actions: A view builder returning the dialog's actions given the
    ///     currently available data.
    public func confirmationDialog<S, A, T>(_ title: S, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, presenting data: T?, @ViewBuilder actions: (T) -> A) -> some View where S : StringProtocol, A : View { }


    /// Presents a confirmation dialog using data to produce the dialog's
    /// content and a text view for the title.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `data` must not be `nil`. `data` should not change after the
    /// presentation occurs. Any changes which occur after the presentation
    /// occurs will be ignored.
    ///
    /// Use this method when you need to populate the fields of a confirmation
    /// dialog with content from a data source. The example below shows a custom
    /// data source, `FileDetails`, that provides data to populate the dialog:
    ///
    ///     struct FileDetails: Identifiable {
    ///         var id: String { name }
    ///         let name: String
    ///         let fileType: UTType
    ///     }
    ///     struct ConfirmFileImport: View {
    ///         @State private var isConfirming = false
    ///         @State private var dialogDetail: FileDetails?
    ///         var body: some View {
    ///             Button("Import File") {
    ///                 dialogDetail = FileDetails(
    ///                     name: "MyImageFile.png", fileType: .png)
    ///                 isConfirming = true
    ///             }
    ///             .confirmationDialog(
    ///                 Text("Import New File?"),
    ///                 isPresented: $isConfirming, presenting: dialogDetail
    ///             ) { detail in
    ///                 Button {
    ///                     // Handle import action.
    ///                 } label: {
    ///                     Text("""
    ///                     Import \(detail.name)
    ///                     File Type: \(detail.fileType.description)
    ///                     """)
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     dialogDetail = nil
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// On iOS, tvOS, and watchOS, confirmation dialogs only support controls
    /// with labels that are `Text`. Passing any other type of view results in
    /// the content being omitted.
    ///
    /// - Parameters:
    ///   - title: the title of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - data: An optional source of truth for the confirmation dialog. The
    ///     system passes the contents to the modifier's closures. You use this
    ///     data to populate the fields of a confirmation dialog that you create
    ///     that the system displays to the user.
    ///   - actions: A view builder returning the dialog's actions given the
    ///     currently available data.
    public func confirmationDialog<A, T>(_ title: Text, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, presenting data: T?, @ViewBuilder actions: (T) -> A) -> some View where A : View { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Presents a confirmation dialog with a message using data to produce the
    /// dialog's content and a localized string key for the title.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `data` must not be `nil`. `data` should not change after the
    /// presentation occurs. Any changes which occur after the presentation
    /// occurs will be ignored.
    ///
    /// Use this method when you need to populate the fields of a confirmation
    /// dialog with content from a data source. The example below shows a custom
    /// data source, `FileDetails`, that provides data to populate the dialog:
    ///
    ///     struct FileDetails: Identifiable {
    ///         var id: String { name }
    ///         let name: String
    ///         let fileType: UTType
    ///     }
    ///     struct ConfirmFileImport: View {
    ///         @State private var isConfirming = false
    ///         @State private var dialogDetail: FileDetails?
    ///         var body: some View {
    ///             Button("Import File") {
    ///                 dialogDetail = FileDetails(
    ///                     name: "MyImageFile.png", fileType: .png)
    ///                 isConfirming = true
    ///             }
    ///             .confirmationDialog(
    ///                 "Are you sure you want to import this file?",
    ///                 isPresented: $isConfirming, presenting: dialogDetail
    ///             ) { detail in
    ///                 Button {
    ///                     // Handle import action.
    ///                 } label: {
    ///                     Text("Import \(detail.name)")
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     dialogDetail = nil
    ///                 }
    ///             } message: { detail in
    ///                 Text(
    ///                     """
    ///                     This will add \(detail.name).\(detail.fileType) \
    ///                     to your library.
    ///                     """)
    ///             }
    ///         }
    ///     }
    ///
    /// This modifier creates a ``Text`` view for the title on your behalf, and
    /// treats the localized key similar to
    /// ``Text/init(_:tableName:bundle:comment:)``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// On iOS, tvOS, and watchOS, confirmation dialogs only support controls
    /// with labels that are `Text`. Passing any other type of view results in
    /// the content being omitted.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized string that describes the title
    ///     of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - data: An optional source of truth for the confirmation dialog. The
    ///     system passes the contents to the modifier's closures. You use this
    ///     data to populate the fields of a confirmation dialog that you create
    ///     that the system displays to the user.
    ///   - actions: A view builder returning the dialog's actions given the
    ///     currently available data.
    ///   - message: A view builder returning the message for the dialog given
    ///     the currently available data.
    public func confirmationDialog<A, M, T>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, presenting data: T?, @ViewBuilder actions: (T) -> A, @ViewBuilder message: (T) -> M) -> some View where A : View, M : View { }


    /// Presents a confirmation dialog with a message using data to produce the
    /// dialog's content and a string variable for the title.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `data` must not be `nil`. `data` should not change after the
    /// presentation occurs. Any changes which occur after the presentation
    /// occurs will be ignored.
    ///
    /// Use this method when you need to populate the fields of a confirmation
    /// dialog with content from a data source. The example below shows a custom
    /// data source, `FileDetails`, that provides data to populate the dialog:
    ///
    ///     struct FileDetails: Identifiable {
    ///         var id: String { name }
    ///         let name: String
    ///         let fileType: UTType
    ///     }
    ///     struct ConfirmFileImport: View {
    ///         var title: String
    ///         @State private var isConfirming = false
    ///         @State private var dialogDetail: FileDetails?
    ///         var body: some View {
    ///             Button("Import File") {
    ///                 dialogDetail = FileDetails(
    ///                     name: "MyImageFile.png", fileType: .png)
    ///                 isConfirming = true
    ///             }
    ///             .confirmationDialog(
    ///                 title, isPresented: $isConfirming,
    ///                 presenting: dialogDetail
    ///             ) { detail in
    ///                 Button {
    ///                     // Handle import action.
    ///                 } label: {
    ///                     Text("Import \(detail.name)")
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     dialogDetail = nil
    ///                 }
    ///             } message: { detail in
    ///                 Text(
    ///                     """
    ///                     This will add \(detail.name).\(detail.fileType) \
    ///                     to your library.
    ///                     """)
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// On iOS, tvOS, and watchOS, confirmation dialogs only support controls
    /// with labels that are `Text`. Passing any other type of view results in
    /// the content being omitted.
    ///
    /// - Parameters:
    ///   - title: A text string used as the title of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - data: An optional source of truth for the confirmation dialog. The
    ///     system passes the contents to the modifier's closures. You use this
    ///     data to populate the fields of a confirmation dialog that you create
    ///     that the system displays to the user.
    ///   - actions: A view builder returning the dialog's actions given the
    ///     currently available data.
    ///   - message: A view builder returning the message for the dialog given
    ///     the currently available data.
    public func confirmationDialog<S, A, M, T>(_ title: S, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, presenting data: T?, @ViewBuilder actions: (T) -> A, @ViewBuilder message: (T) -> M) -> some View where S : StringProtocol, A : View, M : View { }


    /// Presents a confirmation dialog with a message using data to produce the
    /// dialog's content and a text view for the message.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `data` must not be `nil`. `data` should not change after the
    /// presentation occurs. Any changes which occur after the presentation
    /// occurs will be ignored.
    ///
    /// Use this method when you need to populate the fields of a confirmation
    /// dialog with content from a data source. The example below shows a custom
    /// data source, `FileDetails`, that provides data to populate the dialog:
    ///
    ///     struct FileDetails: Identifiable {
    ///         var id: String { name }
    ///         let name: String
    ///         let fileType: UTType
    ///     }
    ///     struct ConfirmFileImport: View {
    ///         @State private var isConfirming = false
    ///         @State private var dialogDetail: FileDetails?
    ///         var body: some View {
    ///             Button("Import File") {
    ///                 dialogDetail = FileDetails(
    ///                     name: "MyImageFile.png", fileType: .png)
    ///                 isConfirming = true
    ///             }
    ///             .confirmationDialog(
    ///                 Text("Import New File?"),
    ///                 isPresented: $isConfirming, presenting: dialogDetail
    ///             ) { detail in
    ///                 Button {
    ///                     // Handle import action.
    ///                 } label: {
    ///                     Text("Import \(detail.name)")
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     dialogDetail = nil
    ///                 }
    ///             } message: { detail in
    ///                 Text(
    ///                     """
    ///                     This will add \(detail.name).\(detail.fileType) \
    ///                     to your library.
    ///                     """)
    ///             }
    ///         }
    ///     }
    ///
    /// All actions in a confirmation dialog will dismiss the dialog after the
    /// action runs. The default button will be shown with greater prominence.
    /// You can influence the default button by assigning it the
    /// ``KeyboardShortcut/defaultAction`` keyboard shortcut.
    ///
    /// The system may reorder the buttons based on their role and prominence.
    ///
    /// Dialogs include a standard dismiss action by default. If you provide a
    /// button with a role of ``ButtonRole/cancel``, that button takes the place
    /// of the default dismiss action. You don't have to dismiss the
    /// presentation with the cancel button's action.
    ///
    /// > Note: In regular size classes in iOS, the system renders confirmation
    /// dialogs as a popover that the user dismisses by tapping anywhere outside
    /// the popover, rather than displaying the standard dismiss action.
    ///
    /// On iOS, tvOS, and watchOS, confirmation dialogs only support controls
    /// with labels that are `Text`. Passing any other type of view results in
    /// the content being omitted.
    ///
    /// - Parameters:
    ///   - title: the title of the dialog.
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the dialog. When the user presses or taps the dialog's
    ///     default action button, the system sets this value to `false`,
    ///     dismissing the dialog.
    ///   - titleVisibility: The visibility of the dialog's title. The default
    ///     value is ``Visibility/automatic``.
    ///   - data: An optional source of truth for the confirmation dialog. The
    ///     system passes the contents to the modifier's closures. You use this
    ///     data to populate the fields of a confirmation dialog that you create
    ///     that the system displays to the user.
    ///   - actions: A view builder returning the dialog's actions given the
    ///     currently available data.
    ///   - message: A view builder returning the message for the dialog given
    ///     the currently available data.
    public func confirmationDialog<A, M, T>(_ title: Text, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, presenting data: T?, @ViewBuilder actions: (T) -> A, @ViewBuilder message: (T) -> M) -> some View where A : View, M : View { }

}
