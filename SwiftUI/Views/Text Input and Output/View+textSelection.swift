@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Controls whether people can select text within this view.
    ///
    /// People sometimes need to copy useful information from ``Text`` views ---
    /// including error messages, serial numbers, or IP addresses --- so they
    /// can then paste the text into another context. Enable text selection
    /// to let people select text in a platform-appropriate way.
    ///
    /// You can apply this method to an individual text view, or to a
    /// container to make each contained text view selectable. In the following
    /// example, the person using the app can select text that shows the date of
    /// an event or the name or email of any of the event participants:
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text("Event Invite")
    ///                 .font(.title)
    ///             Text(invite.date.formatted(date: .long, time: .shortened))
    ///                 .textSelection(.enabled)
    ///
    ///             List(invite.recipients) { recipient in
    ///                 VStack (alignment: .leading) {
    ///                     Text(recipient.name)
    ///                     Text(recipient.email)
    ///                         .foregroundStyle(.secondary)
    ///                 }
    ///             }
    ///             .textSelection(.enabled)
    ///         }
    ///         .navigationTitle("New Invitation")
    ///     }
    ///
    /// On macOS, people use the mouse or trackpad to select a range of text,
    /// which they can quickly copy by choosing Edit > Copy, or with the
    /// standard keyboard shortcut.
    ///
    /// ![A macOS window titled New Invitation, with header Event Invite and
    /// the date and time of the event below it. The date --- July 31, 2022 ---
    /// is selected. Below this, a list of invitees by name and
    /// email.](View-textSelection-1)
    ///
    /// On iOS, the person using the app touches and holds on a selectable
    /// `Text` view, which brings up a system menu with menu items appropriate
    /// for the current context. These menu items operate on the entire contents
    /// of the `Text` view; the person can't select a range of text like they
    /// can on macOS.
    ///
    /// ![A portion of an iOS view, with header Event Invite and
    /// the date and time of the event below it. Below the date and time, a
    /// menu shows two items: Copy and Share. Below this, a list of invitees by
    /// name and email.](View-textSelection-2)
    ///
    /// - Note: ``Button`` views don't support text selection.
    public func textSelection<S>(_ selectability: S) -> some View where S : TextSelectability { }

}

