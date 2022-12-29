/// Identifier types for standard locations that new command groups can be
/// placed relative to.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct CommandGroupPlacement {

    /// Standard placement for commands that provide information about the app,
    /// the terms of the user's license agreement, etc.
    ///
    /// Includes the following by default on macOS:
    /// * About App
    public static let appInfo: CommandGroupPlacement

    /// Standard placement for commands that expose app settings and
    /// preferences.
    ///
    /// Includes the following by default on macOS:
    /// * Preferences
    public static let appSettings: CommandGroupPlacement

    /// Standard placement for commands that expose services provided by other
    /// apps.
    ///
    /// Includes the following by default on macOS:
    /// * Services submenu (managed automatically)
    public static let systemServices: CommandGroupPlacement

    /// Standard placement for commands that control the visibility of running
    /// apps.
    ///
    /// Includes the following by default on macOS:
    /// * Hide App
    /// * Hide Others
    /// * Show All
    public static let appVisibility: CommandGroupPlacement

    /// Standard placement for commands that result in app termination.
    ///
    /// Includes the following by default on macOS:
    /// * Quit App
    public static let appTermination: CommandGroupPlacement

    /// Standard placement for commands that create and open different kinds of
    /// documents.
    ///
    /// Includes the following by default on macOS:
    /// * New
    /// * Open
    /// * Open Recent submenu (managed automatically)
    public static let newItem: CommandGroupPlacement

    /// Standard placement for commands that save open documents and close
    /// windows.
    ///
    /// Includes the following by default on macOS:
    /// * Close
    /// * Save
    /// * Save As/Duplicate
    /// * Revert to Saved
    public static let saveItem: CommandGroupPlacement

    /// Standard placement for commands that relate to importing and exporting
    /// data using formats that the app doesn't natively support.
    ///
    /// Empty by default on macOS.
    public static let importExport: CommandGroupPlacement

    /// Standard placement for commands related to printing app content.
    ///
    /// Includes the following by default on macOS:
    /// * Page Setup
    /// * Print
    public static let printItem: CommandGroupPlacement

    /// Standard placement for commands that control the Undo Manager.
    ///
    /// Includes the following by default on macOS:
    /// * Undo
    /// * Redo
    public static let undoRedo: CommandGroupPlacement

    /// Standard placement for commands that interact with the pasteboard and
    /// manipulate content that is currently selected in the app's view
    /// hierarchy.
    ///
    /// Includes the following by default on macOS:
    /// * Cut
    /// * Copy
    /// * Paste
    /// * Paste and Match Style
    /// * Delete
    /// * Select All
    public static let pasteboard: CommandGroupPlacement

    /// Standard placement for commands that manipulate and transform text
    /// selections.
    ///
    /// Includes the following by default on macOS:
    /// * Find submenu
    /// * Spelling and Grammar submenu
    /// * Substitutions submenu
    /// * Transformations submenu
    /// * Speech submenu
    public static let textEditing: CommandGroupPlacement

    /// Standard placement for commands that manipulate and transform the styles
    /// applied to text selections.
    ///
    /// Includes the following by default on macOS:
    /// * Font submenu
    /// * Text submenu
    public static let textFormatting: CommandGroupPlacement

    /// Standard placement for commands that manipulate the toolbar.
    ///
    /// Includes the following by default on macOS:
    /// * Show/Hide Toolbar
    /// * Customize Toolbar
    public static let toolbar: CommandGroupPlacement

    /// Standard placement for commands that control the app's sidebar and full
    /// screen modes.
    ///
    /// Includes the following by default on macOS:
    /// * Show/Hide Sidebar
    /// * Enter/Exit Full Screen
    public static let sidebar: CommandGroupPlacement

    /// Standard placement for commands that control the size of the window.
    ///
    /// Includes the following by default on macOS:
    /// * Minimize
    /// * Zoom
    public static let windowSize: CommandGroupPlacement

    /// Standard placement for commands that arrange all of an app's windows.
    ///
    /// Includes the following by default on macOS:
    /// * Bring All to Front
    public static let windowArrangement: CommandGroupPlacement

    /// Standard placement for commands that present documentation and helpful
    /// information to the user.
    ///
    /// Includes the following by default on macOS:
    /// * App Help
    public static let help: CommandGroupPlacement
}

