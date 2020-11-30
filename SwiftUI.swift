import Combine
import CoreData
import CoreFoundation
import CoreGraphics
import Darwin
import DeveloperToolsSupport
import Foundation
import SwiftUI
import UIKit
import UniformTypeIdentifiers
import os.log
import os
import os.signpost

/// The kind of an Accessibility action. Includes name information for custom
/// actions
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityActionKind : Equatable {
    
    public static let `default`: AccessibilityActionKind

    public static let escape: AccessibilityActionKind

    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    @available(macOS, unavailable)
    public static let magicTap: AccessibilityActionKind

    public init(named name: Text)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AccessibilityActionKind, b: AccessibilityActionKind) -> Bool
}

/// A directional indicator you use when making an accessibility adjustment.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum AccessibilityAdjustmentDirection {

    case increment

    case decrement

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AccessibilityAdjustmentDirection, b: AccessibilityAdjustmentDirection) -> Bool

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
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AccessibilityAdjustmentDirection : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AccessibilityAdjustmentDirection : Hashable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityAttachmentModifier : ViewModifier {

    /// The type of view representing the body.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityChildBehavior : Hashable {

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
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: AccessibilityChildBehavior, rhs: AccessibilityChildBehavior) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AccessibilityChildBehavior {

    /// Child accessibility elements are ignored
    public static let ignore: AccessibilityChildBehavior

    /// Any child accessibility elements become children of the new
    /// accessibility element
    public static let contain: AccessibilityChildBehavior

    /// Combine any child accessibility element's properties for the
    /// new accessibility element
    public static let combine: AccessibilityChildBehavior
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public enum AccessibilityLabeledPairRole {

    /// This element represents the label part of the label / content pair.
    ///
    /// For example, it might be the explanatory text to the left of a control,
    /// describing what the control does.
    case label

    /// This element represents the content part of the label / content pair.
    ///
    /// For example, it might be the custom control itself.
    case content

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AccessibilityLabeledPairRole, b: AccessibilityLabeledPairRole) -> Bool
}

extension AccessibilityLabeledPairRole : Hashable {

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
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityTraits : SetAlgebra {

    /// The accessibility element is a button.
    public static let isButton: AccessibilityTraits

    /// The accessibility element is a header that divides content into sections, like the title of a navigation bar.
    public static let isHeader: AccessibilityTraits

    /// The accessibility element is currently selected.
    public static let isSelected: AccessibilityTraits

    /// The accessibility element is a link.
    public static let isLink: AccessibilityTraits

    /// The accessibility element is a search field.
    public static let isSearchField: AccessibilityTraits

    /// The accessibility element is an image.
    public static let isImage: AccessibilityTraits

    /// The accessibility element plays its own sound when activated.
    public static let playsSound: AccessibilityTraits

    /// The accessibility element behaves as a keyboard key.
    public static let isKeyboardKey: AccessibilityTraits

    /// The accessibility element is a static text that cannot be modified by the user.
    public static let isStaticText: AccessibilityTraits

    /// The accessibility element provides summary information when the application starts.
    ///
    /// Use this trait to characterize an accessibility element that provides a summary of
    /// current conditions, settings, or state, like the temperature in the Weather app.
    public static let isSummaryElement: AccessibilityTraits

    /// The accessibility element frequently updates its label or value.
    ///
    /// Include this trait when you want an assistive application to poll for changes
    /// when it needs updated information. For example, you might use this trait to
    /// characterize the readout of a stopwatch.
    public static let updatesFrequently: AccessibilityTraits

    /// The accessibility element starts a media session when it is activated.
    ///
    /// Use this trait to silence the audio output of an assistive technology,
    /// such as VoiceOver, during a media session that should not be interrupted.
    /// For example, you might use this trait to silence VoiceOver speech while the user is recording audio.
    public static let startsMediaSession: AccessibilityTraits

    /// The accessibility element allows direct touch interaction for VoiceOver users.
    public static let allowsDirectInteraction: AccessibilityTraits

    /// The accessibility element causes an automatic page turn when VoiceOver finishes reading the text within it.
    public static let causesPageTurn: AccessibilityTraits

    /// The siblings of this accessibility element will be ignored by accessibility.
    public static let isModal: AccessibilityTraits

    /// Creates an empty set.
    ///
    /// This initializer is equivalent to initializing with an empty array
    /// literal. For example, you create an empty `Set` instance with either
    /// this initializer or with an empty array literal.
    ///
    ///     var emptySet = Set<Int>()
    ///     print(emptySet.isEmpty)
    ///     // Prints "true"
    ///
    ///     emptySet = []
    ///     print(emptySet.isEmpty)
    ///     // Prints "true"
    public init()

    /// Adds the elements of the given set to the set.
    ///
    /// In the following example, the elements of the `visitors` set are added to
    /// the `attendees` set:
    ///
    ///     var attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     let visitors: Set = ["Diana", "Marcia", "Nathaniel"]
    ///     attendees.formUnion(visitors)
    ///     print(attendees)
    ///     // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
    ///
    /// If the set already contains one or more elements that are also in
    /// `other`, the existing members are kept.
    ///
    ///     var initialIndices = Set(0..<5)
    ///     initialIndices.formUnion([2, 3, 6, 7])
    ///     print(initialIndices)
    ///     // Prints "[2, 4, 6, 7, 0, 1, 3]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    public mutating func formUnion(_ other: AccessibilityTraits)

    /// Returns a new set with the elements that are common to both this set and
    /// the given set.
    ///
    /// In the following example, the `bothNeighborsAndEmployees` set is made up
    /// of the elements that are in *both* the `employees` and `neighbors` sets.
    /// Elements that are in only one or the other are left out of the result of
    /// the intersection.
    ///
    ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
    ///     let bothNeighborsAndEmployees = employees.intersection(neighbors)
    ///     print(bothNeighborsAndEmployees)
    ///     // Prints "["Bethany", "Eric"]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    /// - Returns: A new set.
    ///
    /// - Note: if this set and `other` contain elements that are equal but
    ///   distinguishable (e.g. via `===`), which of these elements is present
    ///   in the result is unspecified.
    public func intersection(_ other: AccessibilityTraits) -> AccessibilityTraits

    /// Removes the elements of this set that aren't also in the given set.
    ///
    /// In the following example, the elements of the `employees` set that are
    /// not also members of the `neighbors` set are removed. In particular, the
    /// names `"Alicia"`, `"Chris"`, and `"Diana"` are removed.
    ///
    ///     var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
    ///     employees.formIntersection(neighbors)
    ///     print(employees)
    ///     // Prints "["Bethany", "Eric"]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    public mutating func formIntersection(_ other: AccessibilityTraits)

    /// Returns a new set with the elements that are either in this set or in the
    /// given set, but not in both.
    ///
    /// In the following example, the `eitherNeighborsOrEmployees` set is made up
    /// of the elements of the `employees` and `neighbors` sets that are not in
    /// both `employees` *and* `neighbors`. In particular, the names `"Bethany"`
    /// and `"Eric"` do not appear in `eitherNeighborsOrEmployees`.
    ///
    ///     let employees: Set = ["Alicia", "Bethany", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani"]
    ///     let eitherNeighborsOrEmployees = employees.symmetricDifference(neighbors)
    ///     print(eitherNeighborsOrEmployees)
    ///     // Prints "["Diana", "Forlani", "Alicia"]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    /// - Returns: A new set.
    public func symmetricDifference(_ other: AccessibilityTraits) -> AccessibilityTraits

    /// Removes the elements of the set that are also in the given set and adds
    /// the members of the given set that are not already in the set.
    ///
    /// In the following example, the elements of the `employees` set that are
    /// also members of `neighbors` are removed from `employees`, while the
    /// elements of `neighbors` that are not members of `employees` are added to
    /// `employees`. In particular, the names `"Bethany"` and `"Eric"` are
    /// removed from `employees` while the name `"Forlani"` is added.
    ///
    ///     var employees: Set = ["Alicia", "Bethany", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani"]
    ///     employees.formSymmetricDifference(neighbors)
    ///     print(employees)
    ///     // Prints "["Diana", "Forlani", "Alicia"]"
    ///
    /// - Parameter other: A set of the same type.
    public mutating func formSymmetricDifference(_ other: AccessibilityTraits)

    /// Returns a Boolean value that indicates whether the given element exists
    /// in the set.
    ///
    /// This example uses the `contains(_:)` method to test whether an integer is
    /// a member of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
    ///     let x = 5
    ///     if primes.contains(x) {
    ///         print("\(x) is prime!")
    ///     } else {
    ///         print("\(x). Not prime.")
    ///     }
    ///     // Prints "5 is prime!"
    ///
    /// - Parameter member: An element to look for in the set.
    /// - Returns: `true` if `member` exists in the set; otherwise, `false`.
    public func contains(_ member: AccessibilityTraits) -> Bool

    /// Returns a new set with the elements of both this and the given set.
    ///
    /// In the following example, the `attendeesAndVisitors` set is made up
    /// of the elements of the `attendees` and `visitors` sets:
    ///
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     let visitors = ["Marcia", "Nathaniel"]
    ///     let attendeesAndVisitors = attendees.union(visitors)
    ///     print(attendeesAndVisitors)
    ///     // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
    ///
    /// If the set already contains one or more elements that are also in
    /// `other`, the existing members are kept.
    ///
    ///     let initialIndices = Set(0..<5)
    ///     let expandedIndices = initialIndices.union([2, 3, 6, 7])
    ///     print(expandedIndices)
    ///     // Prints "[2, 4, 6, 7, 0, 1, 3]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    /// - Returns: A new set with the unique elements of this set and `other`.
    ///
    /// - Note: if this set and `other` contain elements that are equal but
    ///   distinguishable (e.g. via `===`), which of these elements is present
    ///   in the result is unspecified.
    public func union(_ other: AccessibilityTraits) -> AccessibilityTraits

    /// Removes the given element and any elements subsumed by the given element.
    ///
    /// - Parameter member: The element of the set to remove.
    /// - Returns: For ordinary sets, an element equal to `member` if `member` is
    ///   contained in the set; otherwise, `nil`. In some cases, a returned
    ///   element may be distinguishable from `newMember` by identity comparison
    ///   or some other means.
    ///
    ///   For sets where the set type and element type are the same, like
    ///   `OptionSet` types, this method returns any intersection between the set
    ///   and `[member]`, or `nil` if the intersection is empty.
    public mutating func remove(_ member: AccessibilityTraits) -> AccessibilityTraits?

    /// Inserts the given element in the set if it is not already present.
    ///
    /// If an element equal to `newMember` is already contained in the set, this
    /// method has no effect. In this example, a new element is inserted into
    /// `classDays`, a set of days of the week. When an existing element is
    /// inserted, the `classDays` set does not change.
    ///
    ///     enum DayOfTheWeek: Int {
    ///         case sunday, monday, tuesday, wednesday, thursday,
    ///             friday, saturday
    ///     }
    ///
    ///     var classDays: Set<DayOfTheWeek> = [.wednesday, .friday]
    ///     print(classDays.insert(.monday))
    ///     // Prints "(true, .monday)"
    ///     print(classDays)
    ///     // Prints "[.friday, .wednesday, .monday]"
    ///
    ///     print(classDays.insert(.friday))
    ///     // Prints "(false, .friday)"
    ///     print(classDays)
    ///     // Prints "[.friday, .wednesday, .monday]"
    ///
    /// - Parameter newMember: An element to insert into the set.
    /// - Returns: `(true, newMember)` if `newMember` was not contained in the
    ///   set. If an element equal to `newMember` was already contained in the
    ///   set, the method returns `(false, oldMember)`, where `oldMember` is the
    ///   element that was equal to `newMember`. In some cases, `oldMember` may
    ///   be distinguishable from `newMember` by identity comparison or some
    ///   other means.
    public mutating func insert(_ newMember: AccessibilityTraits) -> (inserted: Bool, memberAfterInsert: AccessibilityTraits)

    /// Inserts the given element into the set unconditionally.
    ///
    /// If an element equal to `newMember` is already contained in the set,
    /// `newMember` replaces the existing element. In this example, an existing
    /// element is inserted into `classDays`, a set of days of the week.
    ///
    ///     enum DayOfTheWeek: Int {
    ///         case sunday, monday, tuesday, wednesday, thursday,
    ///             friday, saturday
    ///     }
    ///
    ///     var classDays: Set<DayOfTheWeek> = [.monday, .wednesday, .friday]
    ///     print(classDays.update(with: .monday))
    ///     // Prints "Optional(.monday)"
    ///
    /// - Parameter newMember: An element to insert into the set.
    /// - Returns: For ordinary sets, an element equal to `newMember` if the set
    ///   already contained such a member; otherwise, `nil`. In some cases, the
    ///   returned element may be distinguishable from `newMember` by identity
    ///   comparison or some other means.
    ///
    ///   For sets where the set type and element type are the same, like
    ///   `OptionSet` types, this method returns any intersection between the 
    ///   set and `[newMember]`, or `nil` if the intersection is empty.
    public mutating func update(with newMember: AccessibilityTraits) -> AccessibilityTraits?

    /// A type for which the conforming type provides a containment test.
    public typealias Element = AccessibilityTraits

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = AccessibilityTraits

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AccessibilityTraits, b: AccessibilityTraits) -> Bool
}

/// A storage type for an action sheet presentation.
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
public struct ActionSheet {

    /// Creates an action sheet with the provided buttons.
    public init(title: Text, message: Text? = nil, buttons: [ActionSheet.Button] = [.cancel()])

    /// A button representing an operation of an action sheet presentation.
    public typealias Button = Alert.Button
}

/// A representation for an alert presentation.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Alert {

    /// Creates an alert with one button.
    public init(title: Text, message: Text? = nil, dismissButton: Alert.Button? = nil)

    /// Creates an alert with two buttons.
    ///
    /// The system determines the visual ordering of the buttons.
    public init(title: Text, message: Text? = nil, primaryButton: Alert.Button, secondaryButton: Alert.Button)

    /// A button representing an operation of an alert presentation.
    public struct Button {

        /// Creates an `Alert.Button` with the default style.
        public static func `default`(_ label: Text, action: (() -> Void)? = {}) -> Alert.Button

        /// Creates an `Alert.Button` that indicates cancellation of some
        /// operation.
        public static func cancel(_ label: Text, action: (() -> Void)? = {}) -> Alert.Button

        /// An alert button that indicates cancellation.
        ///
        /// The system automatically chooses the label of the button for the
        /// appropriate locale.
        public static func cancel(_ action: (() -> Void)? = {}) -> Alert.Button

        /// Creates an `Alert.Button` with a style indicating destruction of
        /// some data.
        public static func destructive(_ label: Text, action: (() -> Void)? = {}) -> Alert.Button
    }
}

/// An alignment in both axes.
///
/// The following table shows the various alignment guides next to each other.
///
/// ![A table showing the various alignment guides next to each
/// other.](SwiftUI-Alignment-table.png)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Alignment : Equatable {

    /// The alignment on the horizontal axis.
    public var horizontal: HorizontalAlignment

    /// The alignment on the vertical axis.
    public var vertical: VerticalAlignment

    /// Creates an instance with the given horizontal and vertical alignments.
    ///
    /// - Parameters:
    ///   - horizontal: The alignment on the horizontal axis.
    ///   - vertical: The alignment on the vertical axis.
    @inlinable public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment)

    /// A guide marking the center of the view.
    public static let center: Alignment

    /// A guide marking the leading edge of the view.
    public static let leading: Alignment

    /// A guide marking the trailing edge of the view.
    public static let trailing: Alignment

    /// A guide marking the top edge of the view.
    public static let top: Alignment

    /// A guide marking the bottom edge of the view.
    public static let bottom: Alignment

    /// A guide marking the top and leading edges of the view.
    public static let topLeading: Alignment

    /// A guide marking the top and trailing edges of the view.
    public static let topTrailing: Alignment

    /// A guide marking the bottom and leading edges of the view.
    public static let bottomLeading: Alignment

    /// A guide marking the bottom and trailing edges of the view.
    public static let bottomTrailing: Alignment

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Alignment, b: Alignment) -> Bool
}

/// Types used to identify alignment guides.
///
/// Types conforming to `AlignmentID` have a corresponding alignment guide
/// value, typically declared as a static constant property of
/// ``HorizontalAlignment`` or ``VerticalAlignment``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol AlignmentID {

    /// The value of the corresponding guide in the given context when not
    /// otherwise set in that context.
    static func defaultValue(in context: ViewDimensions) -> CGFloat
}

/// An opaque value derived from an anchor source and a particular view.
///
/// You can convert the anchor to a `Value` in the coordinate space of a target
/// view by using a ``GeometryProxy`` to specify the target view.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Anchor<Value> {

    /// A type-erased geometry value that produces an anchored value of a given
    /// type.
    ///
    /// SwiftUI passes anchored geometry values around the view tree via
    /// preference keys. It then converts them back into the local coordinate
    /// space using a ``GeometryProxy`` value.
    @frozen public struct Source {
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source where Value == CGRect {

    /// Returns an anchor source rect defined by `r` in the current view.
    public static func rect(_ r: CGRect) -> Anchor<Value>.Source

    /// An anchor source rect defined as the entire bounding rect of the current
    /// view.
    public static var bounds: Anchor<CGRect>.Source { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source where Value == CGPoint {

    public static func point(_ p: CGPoint) -> Anchor<Value>.Source

    public static func unitPoint(_ p: UnitPoint) -> Anchor<Value>.Source

    public static var topLeading: Anchor<CGPoint>.Source { get }

    public static var top: Anchor<CGPoint>.Source { get }

    public static var topTrailing: Anchor<CGPoint>.Source { get }

    public static var leading: Anchor<CGPoint>.Source { get }

    public static var center: Anchor<CGPoint>.Source { get }

    public static var trailing: Anchor<CGPoint>.Source { get }

    public static var bottomLeading: Anchor<CGPoint>.Source { get }

    public static var bottom: Anchor<CGPoint>.Source { get }

    public static var bottomTrailing: Anchor<CGPoint>.Source { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source {

    public init<T>(_ array: [Anchor<T>.Source]) where Value == [T]
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source {

    public init<T>(_ anchor: Anchor<T>.Source?) where Value == T?
}

/// A geometric angle whose value you access in either radians or degrees.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Angle {

    public var radians: Double

    @inlinable public var degrees: Double

    @inlinable public init()

    @inlinable public init(radians: Double)

    @inlinable public init(degrees: Double)

    @inlinable public static func radians(_ radians: Double) -> Angle

    @inlinable public static func degrees(_ degrees: Double) -> Angle
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Angle : Hashable, Comparable {

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func < (lhs: Angle, rhs: Angle) -> Bool

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Angle, b: Angle) -> Bool

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
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Angle : Animatable {

    /// The data to animate.
    public var animatableData: Double

    @inlinable public static var zero: Angle { get }

    /// The type defining the data to animate.
    public typealias AnimatableData = Double
}

/// An angular gradient.
///
/// An angular gradient is also known as a "conic" gradient. This gradient
/// applies the color function as the angle changes, relative to a center point
/// and defined start and end angles. If `endAngle - startAngle > 2π`, the
/// gradient only draws the last complete turn. If `endAngle - startAngle < 2π`,
/// the gradient fills the missing area with the colors defined by gradient
/// locations one and zero, transitioning between the two halfway across the
/// missing area. The gradient maps the unit-space center point into the
/// bounding rectangle of each shape filled with the gradient.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct AngularGradient : ShapeStyle, View {

    public init(gradient: Gradient, center: UnitPoint, startAngle: Angle = .zero, endAngle: Angle = .zero)

    public init(gradient: Gradient, center: UnitPoint, angle: Angle = .zero)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

/// A type that describes how to animate a property of a view.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol Animatable {

    /// The type defining the data to animate.
    associatedtype AnimatableData : VectorArithmetic

    /// The data to animate.
    var animatableData: Self.AnimatableData { get set }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animatable where Self : VectorArithmetic {

    /// The data to animate.
    public var animatableData: Self
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animatable where Self.AnimatableData == EmptyAnimatableData {

    /// The data to animate.
    public var animatableData: EmptyAnimatableData
}

/// A modifier that can create another modifier with animation.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol AnimatableModifier : Animatable, ViewModifier {
}

/// A pair of animatable values, which is itself animatable.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct AnimatablePair<First, Second> : VectorArithmetic where First : VectorArithmetic, Second : VectorArithmetic {

    /// The first value.
    public var first: First

    /// The second value.
    public var second: Second

    /// Creates an animated pair with the provided values.
    @inlinable public init(_ first: First, _ second: Second)

    /// The zero value.
    ///
    /// Zero is the identity element for addition. For any value,
    /// `x + .zero == x` and `.zero + x == x`.
    public static var zero: AnimatablePair<First, Second> { get }

    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    public static func += (lhs: inout AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>)

    /// Subtracts the second value from the first and stores the difference in the
    /// left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func -= (lhs: inout AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>)

    /// Adds two values and produces their sum.
    ///
    /// The addition operator (`+`) calculates the sum of its two arguments. For
    /// example:
    ///
    ///     1 + 2                   // 3
    ///     -10 + 15                // 5
    ///     -15 + -5                // -20
    ///     21.5 + 3.25             // 24.75
    ///
    /// You cannot use `+` with arguments of different types. To add values of
    /// different types, convert one of the values to the other value's type.
    ///
    ///     let x: Int8 = 21
    ///     let y: Int = 1000000
    ///     Int(x) + y              // 1000021
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    public static func + (lhs: AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) -> AnimatablePair<First, Second>

    /// Subtracts one value from another and produces their difference.
    ///
    /// The subtraction operator (`-`) calculates the difference of its two
    /// arguments. For example:
    ///
    ///     8 - 3                   // 5
    ///     -10 - 5                 // -15
    ///     100 - -5                // 105
    ///     10.5 - 100.0            // -89.5
    ///
    /// You cannot use `-` with arguments of different types. To subtract values
    /// of different types, convert one of the values to the other value's type.
    ///
    ///     let x: UInt8 = 21
    ///     let y: UInt = 1000000
    ///     y - UInt(x)             // 999979
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func - (lhs: AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) -> AnimatablePair<First, Second>

    /// Multiplies each component of this value by the given value.
    public mutating func scale(by rhs: Double)

    /// The dot-product of this animated pair with itself.
    public var magnitudeSquared: Double { get }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AnimatablePair<First, Second>, b: AnimatablePair<First, Second>) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Animation : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Animation, rhs: Animation) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// A persistent spring animation. When mixed with other `spring()`
    /// or `interactiveSpring()` animations on the same property, each
    /// animation will be replaced by their successor, preserving
    /// velocity from one animation to the next. Optionally blends the
    /// response values between springs over a time period.
    ///
    /// - Parameters:
    ///   - response: The stiffness of the spring, defined as an
    ///     approximate duration in seconds. A value of zero requests
    ///     an infinitely-stiff spring, suitable for driving
    ///     interactive animations.
    ///   - dampingFraction: The amount of drag applied to the value
    ///     being animated, as a fraction of an estimate of amount
    ///     needed to produce critical damping.
    ///   - blendDuration: The duration in seconds over which to
    ///     interpolate changes to the response value of the spring.
    /// - Returns: a spring animation.
    public static func spring(response: Double = 0.55, dampingFraction: Double = 0.825, blendDuration: Double = 0) -> Animation

    /// A convenience for a `spring()` animation with a lower
    /// `response` value, intended for driving interactive animations.
    public static func interactiveSpring(response: Double = 0.15, dampingFraction: Double = 0.86, blendDuration: Double = 0.25) -> Animation
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    public static let `default`: Animation
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    public static func easeInOut(duration: Double) -> Animation

    public static var easeInOut: Animation { get }

    public static func easeIn(duration: Double) -> Animation

    public static var easeIn: Animation { get }

    public static func easeOut(duration: Double) -> Animation

    public static var easeOut: Animation { get }

    public static func linear(duration: Double) -> Animation

    public static var linear: Animation { get }

    public static func timingCurve(_ c0x: Double, _ c0y: Double, _ c1x: Double, _ c1y: Double, duration: Double = 0.35) -> Animation
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// An interpolating spring animation that uses a damped spring
    /// model to produce values in the range [0, 1] that are then used
    /// to interpolate within the [from, to] range of the animated
    /// property. Preserves velocity across overlapping animations by
    /// adding the effects of each animation.
    ///
    /// - Parameters:
    ///   - mass: The mass of the object attached to the spring.
    ///   - stiffness: The stiffness of the spring.
    ///   - damping: The spring damping value.
    ///   - initialVelocity: the initial velocity of the spring, as
    ///     a value in the range [0, 1] representing the magnitude of
    ///     the value being animated.
    /// - Returns: a spring animation.
    public static func interpolatingSpring(mass: Double = 1.0, stiffness: Double, damping: Double, initialVelocity: Double = 0.0) -> Animation
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    public func delay(_ delay: Double) -> Animation
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// Returns an animation that has its speed multiplied by `speed`. For
    /// example, if you had `oneSecondAnimation.speed(0.25)`, it would be at 25%
    /// of its normal speed, so you would have an animation that would last 4
    /// seconds.
    public func speed(_ speed: Double) -> Animation
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    public func repeatCount(_ repeatCount: Int, autoreverses: Bool = true) -> Animation

    public func repeatForever(autoreverses: Bool = true) -> Animation
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation : CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `description` property for types that conform to
    /// `CustomStringConvertible`:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    public var description: String { get }

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `debugDescription` property for types that conform to
    /// `CustomDebugStringConvertible`:
    ///
    ///     struct Point: CustomDebugStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var debugDescription: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `debugDescription` property.
    public var debugDescription: String { get }

    /// The custom mirror for this instance.
    ///
    /// If this type has value semantics, the mirror should be unaffected by
    /// subsequent mutations of the instance.
    public var customMirror: Mirror { get }
}

/// A type-erased gesture.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct AnyGesture<Value> : Gesture {

    /// Creates an instance from another gesture.
    ///
    /// - Parameter gesture: A gesture that you use to create a new gesture.
    public init<T>(_ gesture: T) where Value == T.Value, T : Gesture

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

/// A type-erased transition.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct AnyTransition {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    public static func offset(_ offset: CGSize) -> AnyTransition

    public static func offset(x: CGFloat = 0, y: CGFloat = 0) -> AnyTransition
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    public static var scale: AnyTransition { get }

    public static func scale(scale: CGFloat, anchor: UnitPoint = .center) -> AnyTransition
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition from transparent to opaque on insertion, and from opaque to
    /// transparent on removal.
    public static let opacity: AnyTransition
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition that inserts by moving in from the leading edge, and
    /// removes by moving out towards the trailing edge.
    ///
    /// - SeeAlso: `AnyTransition.move(edge:)`
    public static var slide: AnyTransition { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Combines this transition with another, returning a new transition that
    /// is the result of both transitions being applied.
    public func combined(with other: AnyTransition) -> AnyTransition
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Returns a transition defined between an active modifier and an identity
    /// modifier.
    public static func modifier<E>(active: E, identity: E) -> AnyTransition where E : ViewModifier
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Attaches an animation to this transition.
    public func animation(_ animation: Animation?) -> AnyTransition
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition that returns the input view, unmodified, as the output
    /// view.
    public static let identity: AnyTransition
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Returns a transition that moves the view away, towards the specified
    /// edge of the view.
    public static func move(edge: Edge) -> AnyTransition
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Provides a composite transition that uses a different transition for
    /// insertion versus removal.
    public static func asymmetric(insertion: AnyTransition, removal: AnyTransition) -> AnyTransition
}

/// A type-erased view.
///
/// An `AnyView` allows changing the type of view used in a given view
/// hierarchy. Whenever the type of view used with an `AnyView` changes, the old
/// hierarchy is destroyed and a new hierarchy is created for the new type.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct AnyView : View {

    /// Create an instance that type-erases `view`.
    public init<V>(_ view: V) where V : View

    public init<V>(erasing view: V) where V : View

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A type that represents the structure and behavior of an app.
///
/// Create an app by declaring a structure that conforms to the `App` protocol.
/// Implement the required ``SwiftUI/App/body-swift.property`` computed property
/// to define the app's content:
///
///     @main
///     struct MyApp: App {
///         var body: some Scene {
///             WindowGroup {
///                 Text("Hello, world!")
///             }
///         }
///     }
///
/// Precede the structure's declaration with the
/// [@main](https://docs.swift.org/swift-book/ReferenceManual/Attributes.html#ID626)
/// attribute to indicate that your custom `App` protocol conformer provides the
/// entry point into your app. The protocol provides a default implementation of
/// the ``SwiftUI/App/main()`` method that the system calls to launch your app.
/// You can have exactly one entry point among all of your app's files.
///
/// Compose the app's body from instances that conform to the ``SwiftUI/Scene``
/// protocol. Each scene contains the root view of a view hierarchy and has a
/// life cycle managed by the system. SwiftUI provides some concrete scene types
/// to handle common scenarios, like for displaying documents or settings. You
/// can also create custom scenes.
///
///     @main
///     struct Mail: App {
///         var body: some Scene {
///             WindowGroup {
///                 MailViewer()
///             }
///             Settings {
///                 SettingsView()
///             }
///         }
///     }
///
/// You can declare state in your app to share across all of its scenes. For
/// example, you can use the ``SwiftUI/StateObject`` attribute to initialize a
/// data model, and then provide that model on a view input as an
/// ``SwiftUI/ObservedObject`` or through the environment as an
/// ``SwiftUI/EnvironmentObject`` to scenes in the app:
///
///     @main
///     struct Mail: App {
///         @StateObject private var model = MailModel()
///
///         var body: some Scene {
///             WindowGroup {
///                 MailViewer()
///                     .environmentObject(model) // Passed through the environment.
///             }
///             Settings {
///                 SettingsView(model: model) // Passed as an observed object.
///             }
///         }
///     }
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol App {

    /// The type of scene representing the content of the app.
    ///
    /// When you create a custom app, Swift infers this type from your
    /// implementation of the required ``SwiftUI/App/body-swift.property``
    /// property.
    associatedtype Body : Scene

    /// The content and behavior of the app.
    ///
    /// For any app that you create, provide a computed `body` property that
    /// defines your app's scenes, which are instances that conform to the
    /// ``SwiftUI/Scene`` protocol. For example, you can create a simple app
    /// with a single scene containing a single view:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 Text("Hello, world!")
    ///             }
    ///         }
    ///     }
    ///
    /// Swift infers the app's ``SwiftUI/App/Body-swift.associatedtype``
    /// associated type based on the scene provided by the `body` property.
    @SceneBuilder var body: Self.Body { get }

    /// Creates an instance of the app using the body that you define for its
    /// content.
    ///
    /// Swift synthesizes a default initializer for structures that don't
    /// provide one. You typically rely on the default initializer for
    /// your app.
    init()
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension App {

    /// Initializes and runs the app.
    ///
    /// If you precede your ``SwiftUI/App`` conformer's declaration with the
    /// [@main](https://docs.swift.org/swift-book/ReferenceManual/Attributes.html#ID626)
    /// attribute, the system calls the conformer's `main()` method to launch
    /// the app. SwiftUI provides a
    /// default implementation of the method that manages the launch process in
    /// a platform-appropriate way.
    public static func main()
}

/// A property wrapper type that reflects a value from `UserDefaults` and
/// invalidates a view on a change in value in that user default.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen @propertyWrapper public struct AppStorage<Value> : DynamicProperty {

    public var wrappedValue: Value { get nonmutating set }

    public var projectedValue: Binding<Value> { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension AppStorage {

    /// Creates a property that can read and write to a boolean user default.
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a boolean value is not specified
    ///     for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Bool

    /// Creates a property that can read and write to an integer user default.
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if an integer value is not specified
    ///     for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Int

    /// Creates a property that can read and write to a double user default.
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a double value is not specified
    ///     for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Double

    /// Creates a property that can read and write to a string user default.
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a string value is not specified
    ///     for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == String

    /// Creates a property that can read and write to a url user default.
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a url value is not specified for
    ///     the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == URL

    /// Creates a property that can read and write to a user default as data.
    ///
    /// Avoid storing large data blobs in user defaults, such as image data,
    /// as it can negatively affect performance of your app. On tvOS, a
    /// `NSUserDefaultsSizeLimitExceededNotification` notification is posted
    /// if the total user default size reaches 512kB.
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a data value is not specified for
    ///    the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Data

    /// Creates a property that can read and write to an integer user default,
    /// transforming that to `RawRepresentable` data type.
    ///
    /// A common usage is with enumerations:
    ///
    ///    enum MyEnum: Int {
    ///        case a
    ///        case b
    ///        case c
    ///    }
    ///    struct MyView: View {
    ///        @AppStorage("MyEnumValue") private var value = MyEnum.a
    ///        var body: some View { ... }
    ///    }
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if an integer value
    ///     is not specified for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value : RawRepresentable, Value.RawValue == Int

    /// Creates a property that can read and write to a string user default,
    /// transforming that to `RawRepresentable` data type.
    ///
    /// A common usage is with enumerations:
    ///
    ///    enum MyEnum: String {
    ///        case a
    ///        case b
    ///        case c
    ///    }
    ///    struct MyView: View {
    ///        @AppStorage("MyEnumValue") private var value = MyEnum.a
    ///        var body: some View { ... }
    ///    }
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value if a string value
    ///     is not specified for the given key.
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value : RawRepresentable, Value.RawValue == String
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension AppStorage where Value : ExpressibleByNilLiteral {

    /// Creates a property that can read and write an Optional boolean user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Bool?

    /// Creates a property that can read and write an Optional integer user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Int?

    /// Creates a property that can read and write an Optional double user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Double?

    /// Creates a property that can read and write an Optional string user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == String?

    /// Creates a property that can read and write an Optional URL user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == URL?

    /// Creates a property that can read and write an Optional data user
    /// default.
    ///
    /// Defaults to nil if there is no restored value.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults
    ///     store.
    ///   - store: The user defaults store to read and write to. A value
    ///     of `nil` will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = nil) where Value == Data?
}

/// The horizontal or vertical dimension in a 2D coordinate system.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public enum Axis : Int8, CaseIterable {

    /// The horizontal dimension.
    case horizontal

    /// The vertical dimension.
    case vertical

    /// An efficient set of axes.
    @frozen public struct Set : OptionSet {

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = Axis.Set

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
        public let rawValue: Int8

        /// Creates a new option set from the given raw value.
        ///
        /// This initializer always succeeds, even if the value passed as `rawValue`
        /// exceeds the static properties declared as part of the option set. This
        /// example creates an instance of `ShippingOptions` with a raw value beyond
        /// the highest element, with a bit mask that effectively contains all the
        /// declared static members.
        ///
        ///     let extraOptions = ShippingOptions(rawValue: 255)
        ///     print(extraOptions.isStrictSuperset(of: .all))
        ///     // Prints "true"
        ///
        /// - Parameter rawValue: The raw value of the option set to create. Each bit
        ///   of `rawValue` potentially represents an element of the option set,
        ///   though raw values may include bits that are not defined as distinct
        ///   values of the `OptionSet` type.
        public init(rawValue: Int8)

        public static let horizontal: Axis.Set

        public static let vertical: Axis.Set

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = Axis.Set.Element

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        public typealias RawValue = Int8
    }

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int8

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
    public var rawValue: Int8 { get }

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
    public init?(rawValue: Int8)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [Axis]

    /// A collection of all values of this type.
    public static var allCases: [Axis] { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : CustomStringConvertible {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `description` property for types that conform to
    /// `CustomStringConvertible`:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    public var description: String { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : Hashable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : RawRepresentable {
}

/// A style that shows the correct fill for the background based on the current
/// context.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct BackgroundStyle {

    @inlinable public init()
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension BackgroundStyle : ShapeStyle {
}

/// A property wrapper type that can read and write a value owned by a source of
/// truth.
///
/// Use a binding to create a two-way connection between a property that stores
/// data, and a view that displays and changes the data. A binding connects a
/// property to a source of truth stored elsewhere, instead of storing data
/// directly. For example, a button that toggles between play and pause can
/// create a binding to a property of its parent view using the `Binding`
/// property wrapper.
///
///     struct PlayButton: View {
///         @Binding var isPlaying: Bool
///
///         var body: some View {
///             Button(action: {
///                 self.isPlaying.toggle()
///             }) {
///                 Image(systemName: isPlaying ? "pause.circle" : "play.circle")
///             }
///         }
///     }
///
/// The parent view declares a property to hold the playing state, using the
/// ``State`` property wrapper to indicate that this property is the value's
/// source of truth.
///
///     struct PlayerView: View {
///         var episode: Episode
///         @State private var isPlaying: Bool = false
///
///         var body: some View {
///             VStack {
///                 Text(episode.title)
///                 Text(episode.showTitle)
///                 PlayButton(isPlaying: $isPlaying)
///             }
///         }
///     }
///
/// When `PlayerView` initializes `PlayButton`, it passes a binding of its state
/// property into the button's binding property. Applying the `$` prefix to a
/// property wrapped value returns its ``State/projectedValue``, which for a
/// state property wrapper returns a binding to the value.
///
/// Whenever the user taps the `PlayButton`, the `PlayerView` updates its
/// `isPlaying` state.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen @propertyWrapper @dynamicMemberLookup public struct Binding<Value> {

    /// The binding's transaction.
    ///
    /// The transaction captures the information needed to update the view when
    /// the binding value changes.
    public var transaction: Transaction

    /// Creates a binding with closures that read and write the binding value.
    ///
    /// - Parameters:
    ///   - get: A closure that retrieves the binding value. The closure has no
    ///     parameters, and returns a value.
    ///   - set: A closure that sets the binding value. The closure has the
    ///     following parameter:
    ///       - newValue: The new value of the binding value.
    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void)

    /// Creates a binding with a closure that reads from the binding value, and
    /// a closure that applies a transaction when writing to the binding value.
    ///
    /// - Parameters:
    ///   - get: A closure to retrieve the binding value. The closure has no
    ///     parameters, and returns a value.
    ///   - set: A closure to set the binding value. The closure has the
    ///     following parameters:
    ///       - newValue: The new value of the binding value.
    ///       - transaction: The transaction to apply when setting a new value.
    public init(get: @escaping () -> Value, set: @escaping (Value, Transaction) -> Void)

    /// Creates a binding with an immutable value.
    ///
    /// Use this method to create a binding to a value that cannot change.
    /// This can be useful when using a ``PreviewProvider`` to see how a view
    /// represents different values.
    ///
    ///     // Example of binding to an immutable value.
    ///     PlayButton(isPlaying: Binding.constant(true))
    ///
    /// - Parameter value: An immutable value.
    public static func constant(_ value: Value) -> Binding<Value>

    /// The underlying value referenced by the binding variable.
    ///
    /// This property provides primary access to the value's data. However, you
    /// don't access `wrappedValue` directly. Instead, you use the property
    /// variable created with the `@Binding` attribute. For instance, in the
    /// following code example the binding variable `isPlaying` returns the
    /// value of `wrappedValue`:
    ///
    ///     struct PlayButton: View {
    ///         @Binding var isPlaying: Bool
    ///
    ///         var body: some View {
    ///             Button(action: {
    ///                 self.isPlaying.toggle()
    ///             }) {
    ///                 Image(systemName: isPlaying ? "pause.circle" : "play.circle")
    ///             }
    ///         }
    ///     }
    ///
    /// When a mutable binding value changes, the new value is immediately
    /// available. However, updates to a view displaying the value happens
    /// asynchronously, so the view may not show the change immediately.
    public var wrappedValue: Value { get nonmutating set }

    /// A projection of the binding value that returns a binding.
    ///
    /// Use the projected value to pass a binding value down a view hierarchy.
    /// To get the `projectedValue`, prefix the property variable with `$`. For
    /// example, in the following code example `PlayerView` projects a binding
    /// of the state property `isPlaying` to the `PlayButton` view using
    /// `$isPlaying`.
    ///
    ///     struct PlayerView: View {
    ///         var episode: Episode
    ///         @State private var isPlaying: Bool = false
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Text(episode.title)
    ///                 Text(episode.showTitle)
    ///                 PlayButton(isPlaying: $isPlaying)
    ///             }
    ///         }
    ///     }
    public var projectedValue: Binding<Value> { get }

    /// Returns a binding to the resulting value of a given key path.
    ///
    /// - Parameter keyPath: A key path to a specific resulting value.
    ///
    /// - Returns: A new binding.
    public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Binding<Subject> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Binding {

    /// Creates a binding by projecting the base value to an optional value.
    ///
    /// - Parameter base: A value to project to an optional value.
    public init<V>(_ base: Binding<V>) where Value == V?

    /// Creates a binding by projecting the base value to an unwrapped value.
    ///
    /// - Parameter base: A value to project to an unwrapped value.
    ///
    /// - Returns: A new binding or `nil` when `base` is `nil`.
    public init?(_ base: Binding<Value?>)

    /// Creates a binding by projecting the base value to a hashable value.
    ///
    /// - Parameters:
    ///   - base: A `Hashable` value to project to an `AnyHashable` value.
    public init<V>(_ base: Binding<V>) where Value == AnyHashable, V : Hashable
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Binding {

    /// Specifies a transaction for the binding.
    ///
    /// - Parameter transaction  : An instance of a ``Transaction``.
    ///
    /// - Returns: A new binding.
    public func transaction(_ transaction: Transaction) -> Binding<Value>

    /// Specifies an animation to perform when the binding value changes.
    ///
    /// - Parameter animation: An animation sequence performed when the binding
    ///   value changes.
    ///
    /// - Returns: A new binding.
    public func animation(_ animation: Animation? = .default) -> Binding<Value>
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Binding : DynamicProperty {
}

/// Modes for compositing a view with overlapping content.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum BlendMode {

    case normal

    case multiply

    case screen

    case overlay

    case darken

    case lighten

    case colorDodge

    case colorBurn

    case softLight

    case hardLight

    case difference

    case exclusion

    case hue

    case saturation

    case color

    case luminosity

    case sourceAtop

    case destinationOver

    case destinationOut

    case plusDarker

    case plusLighter

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: BlendMode, b: BlendMode) -> Bool

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
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension BlendMode : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension BlendMode : Hashable {
}

/// A menu style that displays a borderless button that toggles the display of
/// the menu's contents when pressed.
///
/// On macOS, the button optionally displays an arrow indicating that it presents
/// a menu.
///
/// Pressing and then dragging into the contents triggers the chosen action on
/// release.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct BorderlessButtonMenuStyle : MenuStyle {

    /// Creates a borderless button menu style.
    ///
    /// By default, the borderless style displays a visual indicator that it
    /// represents a menu.
    public init()

    /// Creates a view that represents the body of a menu.
    ///
    /// - Parameter configuration: The properties of the menu.
    ///
    /// The system calls this method for each ``Menu`` instance in a view
    /// hierarchy where this style is the current menu style.
    public func makeBody(configuration: BorderlessButtonMenuStyle.Configuration) -> some View


    /// A view that represents the body of a menu.
    public typealias Body = some View
}

/// A button style that doesn't apply a border.
///
/// To apply this style to a button, or to a view that contains buttons, use the
/// ``View/buttonStyle(_:)-66fbx`` modifier.
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct BorderlessButtonStyle : PrimitiveButtonStyle {

    /// Creates a borderless button style.
    public init()

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: BorderlessButtonStyle.Configuration) -> some View


    /// A view that represents the body of a button.
    public typealias Body = some View
}

/// A control that performs an action when triggered.
///
/// You create a button by providing an action and a label. The action is either
/// a method or closure property that does something when a user clicks or taps
/// the button. The label is a view that describes the button's action, for
/// example, by showing text such as Cancel or an icon such as a back arrow.
///
///     Button(action: signIn) {
///         Text("Sign In")
///     }
///
/// For the common case of text-only labels, you can use the convenience
/// initializer that takes a title string (or localized string key) as its first
/// parameter, instead of a trailing closure:
///
///     Button("Sign In", action: signIn)
///
/// The method of triggering the button varies by platform:
/// - In iOS and watchOS, the user triggers a standard button by tapping on it.
/// - In macOS, the user triggers a standard button by clicking on it.
/// - In tvOS, the user triggers a standard button by pressing "select" on an
///   external remote, like the Siri Remote, while focusing on the button.
///
/// ### Adding Buttons to Containers
///
/// Use buttons for any user interface element that triggers actions on press.
/// Buttons automatically adapt their visual style to match the expected style
/// within these different containers and contexts. For example, to create a
/// list cell that triggers an action when selected by the user, add a button to
/// the list's content. For example:
///
///     // A list of items, where the last row, when triggered,
///     // opens a UI for adding a new item.
///     List {
///         ForEach(items) { item in
///             Text(item.title)
///         }
///         Button("Add Item", action: addItem)
///     }
///
/// Similarly, to create a context menu item that triggers an action, add a
/// button to the menu's content:
///
///     .contextMenu {
///         Button("Cut", action: cut)
///         Button("Copy", action: copy)
///         Button("Paste", action: paste)
///     }
///
/// This pattern extends to most other container views in SwiftUI that have
/// customizable, interactive content, like forms (instances of ``Form``).
///
/// ### Styling Buttons
///
/// You can customize a button's appearance and interaction behavior. To add a
/// custom appearance with standard interaction behavior, create a style that
/// conforms to the ``ButtonStyle`` protocol. To customize both appearance and
/// interaction behavior, create a style that conforms to the
/// ``PrimitiveButtonStyle`` protocol. To set a specific style for all button
/// instances within a view, use the ``View/buttonStyle(_:)-66fbx`` modifier:
///
///     HStack {
///         Button("Sign In", action: signIn)
///         Button("Register", action: register)
///     }
///     .buttonStyle(BorderedButtonStyle())
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Button<Label> : View where Label : View {

    /// Creates a button that displays a custom label.
    ///
    /// - Parameters:
    ///   - action: The action to perform when the user triggers the button.
    ///   - label: A view that describes the purpose of the button's `action`.
    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Button where Label == Text {

    /// Creates a button that generates its label from a localized string key.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:tableName:bundle:comment:)``. See
    /// ``Text`` for more information about localizing strings.
    ///
    /// To initialize a button with a string variable, use
    /// ``Button/init(_:action:)-lpm7`` instead.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the button's localized title, that describes
    ///     the purpose of the button's `action`.
    ///   - action: The action to perform when the user triggers the button.
    public init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void)

    /// Creates a button that generates its label from a string.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// title similar to ``Text/init(_:)-9d1g4``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// To initialize a button with a localized string key, use
    /// ``Button/init(_:action:)-1asy`` instead.
    ///
    /// - Parameters:
    ///   - title: A string that describes the purpose of the button's `action`.
    ///   - action: The action to perform when the user triggers the button.
    public init<S>(_ title: S, action: @escaping () -> Void) where S : StringProtocol
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Button where Label == PrimitiveButtonStyleConfiguration.Label {

    /// Creates a button based on a configuration for a style with a custom
    /// appearance and custom interaction behavior.
    ///
    /// Use this initializer within the
    /// ``PrimitiveButtonStyle/makeBody(configuration:)`` method of a
    /// ``PrimitiveButtonStyle`` to create an instance of the button that you
    /// want to style. This is useful for custom button styles that modify the
    /// current button style, rather than implementing a brand new style.
    ///
    /// For example, the following style adds a red border around the button,
    /// but otherwise preserves the button's current style:
    ///
    ///     struct RedBorderedButtonStyle : PrimitiveButtonStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             Button(configuration)
    ///                 .border(Color.red)
    ///         }
    ///     }
    ///
    /// - Parameter configuration: A configuration for a style with a custom
    ///   appearance and custom interaction behavior.
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public init(_ configuration: PrimitiveButtonStyleConfiguration)
}

/// A type that applies standard interaction behavior and a custom appearance to
/// all buttons within a view hierarchy.
///
/// To configure the current button style for a view hierarchy, use the
/// ``View/buttonStyle(_:)-7qx1`` modifier. Specify a style that conforms to
/// ``ButtonStyle`` when creating a button that uses the standard button
/// interaction behavior defined for each platform. To create a button with
/// custom interaction behavior, use ``PrimitiveButtonStyle`` instead.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ButtonStyle {

    /// A view that represents the body of a button.
    associatedtype Body : View

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a button.
    typealias Configuration = ButtonStyleConfiguration
}

/// The properties of a button.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ButtonStyleConfiguration {

    /// A type-erased label of a button.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A view that describes the effect of pressing the button.
    public let label: ButtonStyleConfiguration.Label

    /// A Boolean that indicates whether the user is currently pressing the
    /// button.
    public let isPressed: Bool
}

/// A capsule shape aligned inside the frame of the view containing it.
///
/// A capsule shape is equivalent to a rounded rectangle where the corner radius
/// is chosen as half the length of the rectangle's smallest edge.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Capsule : Shape {

    public var style: RoundedCornerStyle

    @inlinable public init(style: RoundedCornerStyle = .circular)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in r: CGRect) -> Path

    /// The type defining the data to animate.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Capsule : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// A circle centered on the frame of the view containing it.
///
/// The circle's radius equals half the length of the frame rectangle's smallest
/// edge.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Circle : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    @inlinable public init()

    /// The type defining the data to animate.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Circle : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// A progress view that visually indicates its progress using a circular gauge.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct CircularProgressViewStyle : ProgressViewStyle {

    /// Creates a circular progress view style.
    public init()

    /// Creates a circular progress view style with a tint color.
    public init(tint: Color)

    /// Creates a view representing the body of a progress view.
    ///
    /// - Parameter configuration: The properties of the progress view being
    ///   created.
    ///
    /// The view hierarchy calls this method for each progress view where this
    /// style is the current progress view style.
    ///
    /// - Parameter configuration: The properties of the progress view, such as
    ///  its preferred progress type.
    public func makeBody(configuration: CircularProgressViewStyle.Configuration) -> some View


    /// A view representing the body of a progress view.
    public typealias Body = some View
}

/// An environment-dependent color.
///
/// A `Color` is a late-binding token: SwiftUI only resolves it to a concrete
/// value just before using it in a given environment.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Color : Hashable, CustomStringConvertible {

    /// Returns a `CGColor` that represents this color if one can be constructed
    /// that accurately represents this color.
    @available(iOS 14.0, macOS 11, tvOS 14.0, watchOS 7.0, *)
    public var cgColor: CGColor? { get }

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
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Color, rhs: Color) -> Bool

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `description` property for types that conform to
    /// `CustomStringConvertible`:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    public var description: String { get }

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Color {

    /// Creates a color from an instance of `CGColor`.
    public init(_ cgColor: CGColor)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    public enum RGBColorSpace {

        case sRGB

        case sRGBLinear

        case displayP3

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Color.RGBColorSpace, b: Color.RGBColorSpace) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }

    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1)

    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1)

    public init(hue: Double, saturation: Double, brightness: Double, opacity: Double = 1)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// A color that represents the system or application accent color.
    ///
    /// The accent color reflects the broad theme color that can be applied to
    /// views and controls. If an explicit value hasn't been set, the default
    /// application or system accent color will be used.
    ///
    /// On macOS, customization of the accent color is only used if the
    /// "Multicolor" accent color is selected in System Preferences.
    public static var accentColor: Color { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// A set of colors that are used by system elements and applications.
    public static let clear: Color

    public static let black: Color

    public static let white: Color

    public static let gray: Color

    public static let red: Color

    public static let green: Color

    public static let blue: Color

    public static let orange: Color

    public static let yellow: Color

    public static let pink: Color

    public static let purple: Color

    public static let primary: Color

    public static let secondary: Color
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color : ShapeStyle {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// Creates a named color.
    ///
    /// - Parameters:
    ///   - name: the name of the color resource to lookup.
    ///   - bundle: the bundle to search for the color resource in.
    public init(_ name: String, bundle: Bundle? = nil)
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension Color {

    /// Creates a color from an instance of `UIColor`.
    public init(_ color: UIColor)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    public func opacity(_ opacity: Double) -> Color
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color.RGBColorSpace : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color.RGBColorSpace : Hashable {
}

/// A control used to select a color from the system color picker UI.
///
/// The color picker provides a color well that shows the currently selected
/// color, and displays the larger system color picker that allows users to
/// select a new color.
///
/// By default color picker supports colors with opacity; to disable opacity
/// support, set the `supportsOpacity` parameter to `false`.
/// In this mode the color picker won't show controls for adjusting the opacity
/// of the selected color, and strips out opacity from any color set
/// programmatically or selected from the user's system favorites.
///
/// You use `ColorPicker` by embedding it inside a view hierarchy and
/// initializing it with a title string and a ``Binding`` to a ``Color``:
///
///     struct FormattingControls: View {
///         @State private var bgColor =
///             Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
///
///         var body: some View {
///             VStack {
///                 ColorPicker("Alignment Guides", selection: $bgColor)
///             }
///         }
///     }
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ColorPicker<Label> : View where Label : View {

    /// Creates an instance that selects a color.
    ///
    /// - Parameters:
    ///     - selection: A ``Binding`` to the variable that displays the
    ///       selected ``Color``.
    ///     - supportsOpacity: A Boolean value that indicates whether the color
    ///       picker allows adjusting the selected color's opacity; the default
    ///       is `true`.
    ///     - label: A view that describes the use of the selected color.
    ///        The system color picker UI sets it's title using the text from
    ///        this view.
    ///
    public init(selection: Binding<Color>, supportsOpacity: Bool = true, @ViewBuilder label: () -> Label)

    /// Creates an instance that selects a color.
    ///
    /// - Parameters:
    ///     - selection: A ``Binding`` to the variable that displays the
    ///       selected ``CGColor``.
    ///     - supportsOpacity: A Boolean value that indicates whether the color
    ///       picker allows adjusting the selected color's opacity; the default
    ///       is `true`.
    ///     - label: A view that describes the use of the selected color.
    ///        The system color picker UI sets it's title using the text from
    ///        this view.
    ///
    public init(selection: Binding<CGColor>, supportsOpacity: Bool = true, @ViewBuilder label: () -> Label)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ColorPicker where Label == Text {

    /// Creates a color picker with a text label generated from a title string key.
    ///
    /// Use ``ColorPicker`` to create a color well that your app uses to allow
    /// the selection of a ``Color``. The example below creates a color well
    /// using a ``Binding`` to a property stored in a settings object and title
    /// you provide:
    ///
    ///     final class Settings: ObservableObject {
    ///         @Published var alignmentGuideColor =
    ///             Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    ///     }
    ///
    ///     struct FormattingControls: View {
    ///         @State private var settings = Settings()
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 // Other formatting controls.
    ///                 ColorPicker("Alignment Guides",
    ///                     selection: $settings.alignmentGuideColor
    ///                 )
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the picker.
    ///   - selection: A ``Binding`` to the variable that displays the
    ///     selected ``Color``.
    ///   - supportsOpacity: A Boolean value that indicates whether the color
    ///     picker allows adjustments to the selected color's opacity; the
    ///     default is `true`.
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Color>, supportsOpacity: Bool = true)

    /// Creates a color picker with a text label generated from a title string.
    ///
    /// Use ``ColorPicker`` to create a color well that your app uses to allow
    /// the selection of a ``Color``. The example below creates a color well
    /// using a ``Binding`` and title you provide:
    ///
    ///     func showColorPicker(_ title: String, color: Binding<Color>) {
    ///         ColorPicker(title, selection: color)
    ///     }
    ///
    /// - Parameters:
    ///   - title: The title displayed by the color picker.
    ///   - selection: A ``Binding`` to the variable containing a ``Color``.
    ///   - supportsOpacity: A Boolean value that indicates whether the color
    ///     picker allows adjustments to the selected color's opacity; the
    ///     default is `true`.
    public init<S>(_ title: S, selection: Binding<Color>, supportsOpacity: Bool = true) where S : StringProtocol

    /// Creates a color picker with a text label generated from a title string key.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the picker.
    ///   - selection: A ``Binding`` to the variable that displays the
    ///     selected ``CGColor``.
    ///   - supportsOpacity: A Boolean value that indicates whether the color
    ///     picker allows adjustments to the selected color's opacity; the
    ///     default is `true`.
    public init(_ titleKey: LocalizedStringKey, selection: Binding<CGColor>, supportsOpacity: Bool = true)

    /// Creates a color picker with a text label generated from a title string.
    ///
    /// - Parameters:
    ///   - title: The title displayed by the color picker.
    ///   - selection: A ``Binding`` to the variable containing a ``CGColor``.
    ///   - supportsOpacity: A Boolean value that indicates whether the color
    ///     picker allows adjustments to the selected color's opacity; the
    ///     default is `true`.
    public init<S>(_ title: S, selection: Binding<CGColor>, supportsOpacity: Bool = true) where S : StringProtocol
}

/// The working color space for color-compositing operations.
///
/// Each color space guarantees to preserve a particular range of color values.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ColorRenderingMode {

    /// The non-linear sRGB working color space, with color component values
    /// outside the range `[0, 1]` producing undefined results.
    ///
    /// This color space is gamma corrected.
    case nonLinear

    /// The linear sRGB working color space, with color component values outside
    /// the range `[0, 1]` producing undefined results.
    ///
    /// This color space isn't gamma corrected.
    case linear

    /// The linear sRGB working color space, with color component values outside
    /// the range `[0, 1]` preserved.
    ///
    /// This color space isn't gamma corrected.
    case extendedLinear

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ColorRenderingMode, b: ColorRenderingMode) -> Bool

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
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorRenderingMode : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorRenderingMode : Hashable {
}

/// The possible types of color schemes, like Dark Mode.
///
/// The color scheme enumerates the user setting options for Light or Dark Mode.
/// It also provides the light or dark options for any particular view when the
/// app wants to override the user setting.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ColorScheme : CaseIterable {

    case light

    case dark

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ColorScheme, b: ColorScheme) -> Bool

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
    public func hash(into hasher: inout Hasher)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ColorScheme]

    /// A collection of all values of this type.
    public static var allCases: [ColorScheme] { get }
}

extension ColorScheme {

    /// Create a color scheme from its UIUserInterfaceStyle equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiUserInterfaceStyle: UIUserInterfaceStyle)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorScheme : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorScheme : Hashable {
}

/// Options indicating whether the system uses standard or increased contrast
/// between the app's foreground and background colors.
///
/// The user sets the Increase Contrast option using the Settings app. Your app
/// cannot override the user's choice.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ColorSchemeContrast : CaseIterable {

    /// An option indicating that the system is using standard contrast between
    /// the app's foreground and background colors.
    case standard

    /// An option indicating that the system is using increased contrast between
    /// the app's foreground and background colors.
    case increased

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ColorSchemeContrast, b: ColorSchemeContrast) -> Bool

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
    public func hash(into hasher: inout Hasher)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ColorSchemeContrast]

    /// A collection of all values of this type.
    public static var allCases: [ColorSchemeContrast] { get }
}

extension ColorSchemeContrast {

    /// Create a contrast from its UIAccessibilityContrast equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiAccessibilityContrast: UIAccessibilityContrast)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorSchemeContrast : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorSchemeContrast : Hashable {
}

/// Command groups describe additional groupings of controls to add to existing
/// command menus.
///
/// On macOS, command groups are realized as collections of menu items in a menu
/// bar menu. On iOS, iPadOS, and tvOS, SwiftUI creates key commands for each of
/// a group's commands that has a keyboard shortcut.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct CommandGroup<Content> : Commands where Content : View {

    /// The composition of commands that comprise the command group.
    public var body: some Commands { get }

    /// A value describing the addition of the given views to the beginning of
    /// the indicated group.
    public init(before group: CommandGroupPlacement, @ViewBuilder addition: () -> Content)

    /// A value describing the addition of the given views to the end of the
    /// indicated group.
    public init(after group: CommandGroupPlacement, @ViewBuilder addition: () -> Content)

    /// A value describing the complete replacement of the contents of the
    /// indicated group with the given views.
    public init(replacing group: CommandGroupPlacement, @ViewBuilder addition: () -> Content)

    /// The type of command group representing the body of this command group.
    public typealias Body = some Commands
}

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

/// Command menus are stand-alone, top-level containers for controls that
/// perform related, app-specific commands.
///
/// Command menus are realized as menu bar menus on macOS, inserted between the
/// built-in View and Window menus in order of declaration. On iOS, iPadOS, and
/// tvOS, SwiftUI creates key commands for each of a menu's commands that has a
/// keyboard shortcut.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct CommandMenu<Content> : Commands where Content : View {

    /// The composition of commands that comprise the command group.
    public var body: some Commands { get }

    /// Creates a new menu with a localized name for a collection of app-
    /// specific commands, inserted in the standard location for app menus
    /// (after the View menu, in order with other menus declared without an
    /// explicit location).
    public init(_ nameKey: LocalizedStringKey, @ViewBuilder content: () -> Content)

    /// Creates a new menu for a collection of app-specific commands, inserted
    /// in the standard location for app menus (after the View menu, in order
    /// with other menus declared without an explicit location).
    public init(_ name: Text, @ViewBuilder content: () -> Content)

    /// Creates a new menu for a collection of app-specific commands, inserted
    /// in the standard location for app menus (after the View menu, in order
    /// with other menus declared without an explicit location).
    public init<S>(_ name: S, @ViewBuilder content: () -> Content) where S : StringProtocol

    /// The type of command group representing the body of this command group.
    public typealias Body = some Commands
}

/// Conforming types represent a group of related commands that can be exposed
/// to the user via the main menu on macOS and key commands on iOS.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol Commands {

    /// The type of command group representing the body of this command group.
    associatedtype Body : Commands

    /// The composition of commands that comprise the command group.
    @CommandsBuilder var body: Self.Body { get }
}

/// Constructs command sets from multi-expression closures. Like `ViewBuilder`,
/// it supports up to ten expressions in the closure body.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@_functionBuilder public struct CommandsBuilder {

    /// Builds an empty command set from an block containing no statements.
    public static func buildBlock() -> EmptyCommands

    /// Passes a single command group written as a child group through
    /// modified.
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : Commands
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CommandsBuilder {

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some Commands where C0 : Commands, C1 : Commands

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CommandsBuilder {

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some Commands where C0 : Commands, C1 : Commands, C2 : Commands

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CommandsBuilder {

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some Commands where C0 : Commands, C1 : Commands, C2 : Commands, C3 : Commands

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CommandsBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some Commands where C0 : Commands, C1 : Commands, C2 : Commands, C3 : Commands, C4 : Commands

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CommandsBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some Commands where C0 : Commands, C1 : Commands, C2 : Commands, C3 : Commands, C4 : Commands, C5 : Commands

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CommandsBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some Commands where C0 : Commands, C1 : Commands, C2 : Commands, C3 : Commands, C4 : Commands, C5 : Commands, C6 : Commands

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CommandsBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some Commands where C0 : Commands, C1 : Commands, C2 : Commands, C3 : Commands, C4 : Commands, C5 : Commands, C6 : Commands, C7 : Commands

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CommandsBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some Commands where C0 : Commands, C1 : Commands, C2 : Commands, C3 : Commands, C4 : Commands, C5 : Commands, C6 : Commands, C7 : Commands, C8 : Commands

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CommandsBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some Commands where C0 : Commands, C1 : Commands, C2 : Commands, C3 : Commands, C4 : Commands, C5 : Commands, C6 : Commands, C7 : Commands, C8 : Commands, C9 : Commands

}

/// A system style that displays the components in a compact, textual format.
///
/// This style is useful when space is constrained and users expect to
/// make specific date and time selections. Some variants may include rich
/// editing controls in a popup.
@available(iOS 14.0, macCatalyst 13.4, macOS 10.15.4, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct CompactDatePickerStyle : DatePickerStyle {

    public init()
}

/// A shape that is replaced by an inset version of the current
/// container shape. If no container shape was defined, is replaced by
/// a rectangle.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct ContainerRelativeShape : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    @inlinable public init()

    /// The type defining the data to animate.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ContainerRelativeShape : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// Constants that define how a view's content fills the available space.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public enum ContentMode : Hashable, CaseIterable {

    case fit

    case fill

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ContentMode, b: ContentMode) -> Bool

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
    public func hash(into hasher: inout Hasher)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ContentMode]

    /// A collection of all values of this type.
    public static var allCases: [ContentMode] { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ContentSizeCategory : Hashable, CaseIterable {

    case extraSmall

    case small

    case medium

    case large

    case extraLarge

    case extraExtraLarge

    case extraExtraExtraLarge

    case accessibilityMedium

    case accessibilityLarge

    case accessibilityExtraLarge

    case accessibilityExtraExtraLarge

    case accessibilityExtraExtraExtraLarge

    /// A `Bool` value indicating whether the content size category is one that
    /// is associated with accessibility.
    @available(iOS 13.4, macOS 10.15.4, tvOS 13.4, watchOS 6.2, *)
    public var isAccessibilityCategory: Bool { get }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ContentSizeCategory, b: ContentSizeCategory) -> Bool

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
    public func hash(into hasher: inout Hasher)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ContentSizeCategory]

    /// A collection of all values of this type.
    public static var allCases: [ContentSizeCategory] { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ContentSizeCategory {

    /// Returns a Boolean value indicating whether the value of the first argument is less than that of the second argument.
    public static func < (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool

    /// Returns a Boolean value indicating whether the value of the first argument is less than or equal to that of the second argument.
    public static func <= (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool

    /// Returns a Boolean value indicating whether the value of the first argument is greater than that of the second argument.
    public static func > (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool

    /// Returns a Boolean value indicating whether the value of the first argument is greater than or equal to that of the second argument.
    public static func >= (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool
}

extension ContentSizeCategory {

    /// Create a size category from its UIContentSizeCateogry equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiSizeCategory: UIContentSizeCategory)
}

/// A container for views that you present as menu items in a contextual menu
/// after completion of the standard system gesture.
///
/// Relate the controls that a `ContextMenu` contains to the context from
/// which you show them.
@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use `contextMenu(menuItems:)` instead.")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use `contextMenu(menuItems:)` instead.")
@available(tvOS, unavailable)
@available(watchOS, introduced: 6.0, deprecated: 7.0)
public struct ContextMenu<MenuItems> where MenuItems : View {

    public init(@ViewBuilder menuItems: () -> MenuItems)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum CoordinateSpace {

    case global

    case local

    case named(AnyHashable)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CoordinateSpace {

    public var isGlobal: Bool { get }

    public var isLocal: Bool { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CoordinateSpace : Equatable, Hashable {

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
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CoordinateSpace, rhs: CoordinateSpace) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

/// Conforming types represent items that can be placed in various locations
/// in a customizable toolbar.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol CustomizableToolbarContent : ToolbarContent where Self.Body : CustomizableToolbarContent {
}

/// A control for selecting an absolute date.
///
/// It can be configured to only display specific components of the date, but
/// still results in picking a complete `Date` instance.
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DatePicker<Label> : View where Label : View {

    public typealias Components = DatePickerComponents

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DatePicker {

    /// Creates an instance that selects a `Date` with an unbounded range.
    ///
    /// - Parameters:
    ///   - selection: The date value being displayed and selected.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///   - label: A view that describes the use of the date.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label)

    /// Creates an instance that selects a `Date` in a closed range.
    ///
    /// - Parameters:
    ///   - selection: The date value being displayed and selected.
    ///   - range: The inclusive range of selectable dates.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///   - label: A view that describes the use of the date.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label)

    /// Creates an instance that selects a `Date` on or after some start date.
    ///
    /// - Parameters:
    ///   - selection: The date value being displayed and selected.
    ///   - range: The open range from some selectable start date.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///   - label: A view that describes the use of the date.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label)

    /// Creates an instance that selects a `Date` on or before some end date.
    ///
    /// - Parameters:
    ///   - selection: The date value being displayed and selected.
    ///   - range: The open range before some selectable end date.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///   - label: A view that describes the use of the date.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label)
}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DatePicker where Label == Text {

    /// Creates an instance that selects a `Date` with an unbounded range.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of `self`, describing
    ///     its purpose.
    ///   - selection: The date value being displayed and selected.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])

    /// Creates an instance that selects a `Date` in a closed range.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of `self`, describing
    ///     its purpose.
    ///   - selection: The date value being displayed and selected.
    ///   - range: The inclusive range of selectable dates.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])

    /// Creates an instance that selects a `Date` on or after some start date.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of `self`, describing
    ///     its purpose.
    ///   - selection: The date value being displayed and selected.
    ///   - range: The open range from some selectable start date.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])

    /// Creates an instance that selects a `Date` on or before some end date.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of `self`, describing
    ///     its purpose.
    ///   - selection: The date value being displayed and selected.
    ///   - range: The open range before some selectable end date.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])

    /// Creates an instance that selects a `Date` within the given range.
    ///
    /// - Parameters:
    ///   - title: The title of `self`, describing its purpose.
    ///   - selection: The date value being displayed and selected.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol

    /// Creates an instance that selects a `Date` in a closed range.
    ///
    /// - Parameters:
    ///   - title: The title of `self`, describing its purpose.
    ///   - selection: The date value being displayed and selected.
    ///   - range: The inclusive range of selectable dates.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol

    /// Creates an instance that selects a `Date` on or after some start date.
    ///
    /// - Parameters:
    ///   - title: The title of `self`, describing its purpose.
    ///   - selection: The date value being displayed and selected.
    ///   - range: The open range from some selectable start date.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol

    /// Creates an instance that selects a `Date` on or before some end date.
    ///
    /// - Parameters:
    ///   - title: The title of `self`, describing its purpose.
    ///   - selection: The date value being displayed and selected.
    ///   - range: The open range before some selectable end date.
    ///   - displayedComponents: The date components that user is able to
    ///     view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol
}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DatePickerComponents : OptionSet {

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
    public let rawValue: UInt

    /// Creates a new option set from the given raw value.
    ///
    /// This initializer always succeeds, even if the value passed as `rawValue`
    /// exceeds the static properties declared as part of the option set. This
    /// example creates an instance of `ShippingOptions` with a raw value beyond
    /// the highest element, with a bit mask that effectively contains all the
    /// declared static members.
    ///
    ///     let extraOptions = ShippingOptions(rawValue: 255)
    ///     print(extraOptions.isStrictSuperset(of: .all))
    ///     // Prints "true"
    ///
    /// - Parameter rawValue: The raw value of the option set to create. Each bit
    ///   of `rawValue` potentially represents an element of the option set,
    ///   though raw values may include bits that are not defined as distinct
    ///   values of the `OptionSet` type.
    public init(rawValue: UInt)

    /// Displays hour and minute components based on the locale
    public static let hourAndMinute: DatePickerComponents

    /// Displays day, month, and year based on the locale
    public static let date: DatePickerComponents

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = DatePickerComponents

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = UInt

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = DatePickerComponents
}

/// A specification for the appearance and interaction of a `DatePicker`.
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol DatePickerStyle {
}

/// The default button style, based on the button's context.
///
/// If you create a button directly on a blank canvas, the style varies by
/// platform. iOS uses the borderless button style by default, whereas macOS,
/// tvOS, and watchOS use the bordered button style.
///
/// If you create a button inside a container, like a ``List``, the style
/// resolves to the recommended style for buttons inside that container for that
/// specific platform.
///
/// You can override a button's style. To apply the default style to a button,
/// or to a view that contains buttons, use the ``View/buttonStyle(_:)-66fbx``
/// modifier.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultButtonStyle : PrimitiveButtonStyle {

    /// Creates a default button style.
    public init()

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: DefaultButtonStyle.Configuration) -> some View


    /// A view that represents the body of a button.
    public typealias Body = some View
}

/// The default `DatePicker` style.
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultDatePickerStyle : DatePickerStyle {

    public init()
}

/// The default `GroupBoxStyle`.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultGroupBoxStyle : GroupBoxStyle {

    public init()

    /// Creates a `View` representing the body of a `GroupBox`.
    ///
    /// - Parameter configuration: The properties of the group box instance being
    ///   created.
    ///
    /// This method will be called for each instance of `GroupBox` created within
    /// a view hierarchy where this style is the current `GroupBoxStyle`.
    public func makeBody(configuration: DefaultGroupBoxStyle.Configuration) -> some View


    /// A `View` representing the body of a `GroupBox`.
    public typealias Body = some View
}

/// The default label style in the current context.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct DefaultLabelStyle : LabelStyle {

    /// Creates a default label style.
    public init()

    /// Creates a view that represents the body of a label.
    ///
    /// The system calls this method for each ``Label`` instance in a view
    /// hierarchy where this style is the current label style.
    ///
    /// - Parameter configuration: The properties of the label.
    public func makeBody(configuration: DefaultLabelStyle.Configuration) -> some View


    /// A view that represents the body of a label.
    public typealias Body = some View
}

/// The instance that describes a platform's default behavior and appearance for
/// a list.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultListStyle : ListStyle {

    /// Creates a default list style.
    public init()
}

/// The default menu style, based on the menu's context.
///
/// The default menu style can vary by platform. By default, macOS uses the
/// bordered button style.
///
/// If you create a menu inside a container, the style resolves to the
/// recommended style for menus inside that container for that specific platform.
/// For example, a menu nested within another menu will resolve to a submenu:
///
///     Menu("Edit") {
///         Menu("Arrange") {
///             Button("Bring to Front", action: moveSelectionToFront)
///             Button("Send to Back", action: moveSelectionToBack)
///         }
///         Button("Delete", action: deleteSelection)
///     }
///
/// You can override a menu's style. To apply the default style to a menu, or to
/// a view that contains a menu, use the ``View/menuStyle(_:)`` modifier.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultMenuStyle : MenuStyle {

    /// Creates a default menu style.
    public init()

    /// Creates a view that represents the body of a menu.
    ///
    /// - Parameter configuration: The properties of the menu.
    ///
    /// The system calls this method for each ``Menu`` instance in a view
    /// hierarchy where this style is the current menu style.
    public func makeBody(configuration: DefaultMenuStyle.Configuration) -> some View


    /// A view that represents the body of a menu.
    public typealias Body = some View
}

/// The default navigation view style.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
public struct DefaultNavigationViewStyle : NavigationViewStyle {

    public init()
}

/// The default picker style, based on the picker's context.
///
/// How a picker using the default picker style appears largely depends on the
/// platform and the view type in which it appears. For example, in a standard
/// view, the default picker styles by platform are:
///
/// * On iOS and watchOS the default is a wheel.
/// * On macOS, the default is a pop-up button.
/// * On tvOS, the default is a segmented control.
///
/// The default picker style may also take into account other factors — like
/// whether the picker appears in a container view — when setting the appearance
/// of a picker.
///
/// You can override a picker’s style. To apply the default style to a picker,
/// or to a view that contains pickers, use the ``View/pickerStyle(_:)`` modifier.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultPickerStyle : PickerStyle {

    /// Creates a default picker style.
    public init()
}

/// The default progress view style in the current context of the view being
/// styled.
///
/// The default style represents the recommended style based on the original
/// initialization parameters of the progress view, and the progress view's
/// context within the view hierarchy.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct DefaultProgressViewStyle : ProgressViewStyle {

    /// Creates a default progress view style.
    public init()

    /// Creates a view representing the body of a progress view.
    ///
    /// - Parameter configuration: The properties of the progress view being
    ///   created.
    ///
    /// The view hierarchy calls this method for each progress view where this
    /// style is the current progress view style.
    ///
    /// - Parameter configuration: The properties of the progress view, such as
    ///  its preferred progress type.
    public func makeBody(configuration: DefaultProgressViewStyle.Configuration) -> some View


    /// A view representing the body of a progress view.
    public typealias Body = some View
}

/// The default `TabView` style.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
public struct DefaultTabViewStyle : TabViewStyle {

    public init()
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultTextFieldStyle : TextFieldStyle {

    public init()
}

/// The default toggle style.
///
/// If you create a toggle directly on a blank canvas, the style varies:
///
/// - For the phone, pad, and watch idioms, the default toggle style is a
///   switch.
/// - For the Mac idiom, the default toggle style is a checkbox.
/// - For the TV idom, the default toggle style is a button.
///
/// If you create a toggle inside a container, such as a ``List``, the toggle
/// automatically uses a style appropriate to the context. To apply a different
/// style to a toggle, or to a view that contains toggles, use the
/// ``View/toggleStyle(_:)`` modifier. To revert a custom-styled toggle to the
///  default, use `toggleStyle(DefaultToggleStyle())`.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultToggleStyle : ToggleStyle {

    /// Creates a default toggle style.
    public init()

    /// Creates a view that represents the body of a toggle.
    ///
    /// The system calls this method for each ``Toggle`` instance in a view
    /// hierarchy where this style is the current toggle style.
    ///
    /// - Parameter configuration: The properties of the toggle.
    public func makeBody(configuration: DefaultToggleStyle.Configuration) -> some View


    /// A view that represents the appearance and interaction of a toggle.
    public typealias Body = some View
}

/// A view that shows or hides another content view, based on the state of a
/// disclosure control.
///
/// A disclosure group view consists of a label to identify the contents, and a
/// control to show and hide the contents. Showing the contents puts the
/// disclosure group into the "expanded" state, and hiding them makes the
/// disclosure group "collapsed".
///
/// In the following example, a disclosure group contains two toggles and
/// an embedded disclosure group. The top level disclosure group exposes its
/// expanded state with the bound property, `topLevelExpanded`. By expanding
/// the disclosure group, the user can use the toggles to update the state of
/// the `toggleStates` structure.
///
///     struct ToggleStates {
///         var oneIsOn: Bool = false
///         var twoIsOn: Bool = true
///     }
///     @State private var toggleStates = ToggleStates()
///     @State private var topExpanded: Bool = true
///
///     var body: some View {
///         DisclosureGroup("Items", isExpanded: $topExpanded) {
///             Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
///             Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
///             DisclosureGroup("Sub-items") {
///                 Text("Sub-item 1")
///             }
///         }
///     }
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DisclosureGroup<Label, Content> : View where Label : View, Content : View {

    /// Creates a disclosure group with the given label and content views.
    ///
    /// - Parameters:
    ///   - content: The content shown when the disclosure group expands.
    ///   - label: A view that describes the content of the disclosure group.
    public init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder label: () -> Label)

    /// Creates a disclosure group with the given label and content views, and
    /// a binding to the expansion state (expanded or collapsed).
    ///
    /// - Parameters:
    ///   - isExpanded: A binding to a Boolean value that determines the group's
    ///    expansion state (expanded or collapsed).
    ///   - content: The content shown when the disclosure group expands.
    ///   - label: A view that describes the content of the disclosure group.
    public init(isExpanded: Binding<Bool>, @ViewBuilder content: @escaping () -> Content, @ViewBuilder label: () -> Label)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DisclosureGroup where Label == Text {

    /// Creates a disclosure group, using a provided localized string key to
    /// create a text view for the label.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized label of `self` that describes
    ///     the content of the disclosure group.
    ///   - content: The content shown when the disclosure group expands.
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: @escaping () -> Content)

    /// Creates a disclosure group, using a provided localized string key to
    /// create a text view for the label, and a binding to the expansion state
    /// (expanded or collapsed).
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized label of `self` that describes
    ///     the content of the disclosure group.
    ///   - isExpanded: A binding to a Boolean value that determines the group's
    ///    expansion state (expanded or collapsed).
    ///   - content: The content shown when the disclosure group expands.
    public init(_ titleKey: LocalizedStringKey, isExpanded: Binding<Bool>, @ViewBuilder content: @escaping () -> Content)

    /// Creates a disclosure group, using a provided string to create a
    /// text view for the label.
    ///
    /// - Parameters:
    ///   - label: A description of the content of the disclosure group.
    ///   - content: The content shown when the disclosure group expands.
    public init<S>(_ label: S, @ViewBuilder content: @escaping () -> Content) where S : StringProtocol

    /// Creates a disclosure group, using a provided string to create a
    /// text view for the label, and a binding to the expansion state (expanded
    /// or collapsed).
    ///
    /// - Parameters:
    ///   - label: A description of the content of the disclosure group.
    ///   - isExpanded: A binding to a Boolean value that determines the group's
    ///    expansion state (expanded or collapsed).
    ///   - content: The content shown when the disclosure group expands.
    public init<S>(_ label: S, isExpanded: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) where S : StringProtocol
}

/// A visual element that can be used to separate other content.
///
/// When contained in a stack, the divider extends across the minor axis of the
/// stack, or horizontally when not in a stack.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Divider : View {

    public init()

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A scene that enables support for opening, creating, and saving documents.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DocumentGroup<Document, Content> : Scene where Content : View {

    /// The content and behavior of the scene.
    ///
    /// For any scene that you create, provide a computed `body` property that
    /// defines the scene as a composition of other scenes. You can assemble a
    /// scene from primitive scenes that SwiftUI provides, as well as other
    /// scenes that you've defined.
    ///
    /// Swift infers the scene's ``SwiftUI/Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    public var body: some Scene { get }

    /// The type of scene that represents the body of this scene.
    ///
    /// When you create a custom scene, Swift infers this type from your
    /// implementation of the required ``SwiftUI/Scene/body-swift.property``
    /// property.
    public typealias Body = some Scene
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DocumentGroup where Document : FileDocument {

    /// Creates a document group that is able to create and edit file documents.
    ///
    /// - Parameters:
    ///   - newDocument: The initial document used when the user creates
    ///     a new document.
    ///   - editor: The editing UI for the provided document.
    public init(newDocument: @autoclosure @escaping () -> Document, @ViewBuilder editor: @escaping (FileDocumentConfiguration<Document>) -> Content)

    /// Creates a document group that is able to view file documents.
    ///
    /// - Parameters:
    ///   - documentType: The type of document being viewed.
    ///   - viewer: The viewing UI for the provided document.
    ///
    /// - See Also: `CFBundleTypeRole` with a value of "Viewer"
    public init(viewing documentType: Document.Type, @ViewBuilder viewer: @escaping (FileDocumentConfiguration<Document>) -> Content)
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DocumentGroup where Document : ReferenceFileDocument {

    /// Creates a document group that is able to create and edit reference file
    /// documents.
    ///
    /// - Parameters:
    ///   - newDocument: The initial document used when the user creates
    ///     a new document. The argument should create a new instance, such that
    ///     a new document is created on each invocation of the closure.
    ///   - editor: The editing UI for the provided document.
    ///
    /// The current document for a given editor instance is also provided as an
    /// environment object for its subhierarchy.
    ///
    /// Undo support is not automatically provided for this construction of
    /// a `DocumentGroup`, and any updates to the document by the editor view
    /// hierarchy are expected to register undo operations when appropriate.
    public init(newDocument: @escaping () -> Document, @ViewBuilder editor: @escaping (ReferenceFileDocumentConfiguration<Document>) -> Content)

    /// Creates a document group that is able to view reference file documents.
    ///
    /// - Parameters:
    ///   - documentType: The type of document being viewed.
    ///   - viewer: The viewing UI for the provided document.
    ///
    /// The current document for a given editor instance is also provided as an
    /// environment object for its subhierarchy.
    ///
    /// - See Also: `CFBundleTypeRole` with a value of "Viewer"
    public init(viewing documentType: Document.Type, @ViewBuilder viewer: @escaping (ReferenceFileDocumentConfiguration<Document>) -> Content)
}

/// A navigation view style represented by a primary view stack that
/// navigates to a detail view.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct DoubleColumnNavigationViewStyle : NavigationViewStyle {

    public init()
}

/// A dragging motion that invokes an action as the drag-event sequence changes.
///
/// To recognize a drag gesture on a view, create and configure the gesture, and
/// then add it to the view using the ``View/gesture(_:including:)`` modifier.
///
/// Add a drag gesture to a ``Circle`` and change its color while the user
/// performs the drag gesture:
///
///     struct DragGestureView: View {
///         @State var isDragging = false
///
///         var drag: some Gesture {
///             DragGesture()
///                 .onChanged { _ in self.isDragging = true }
///                 .onEnded { _ in self.isDragging = false }
///         }
///
///         var body: some View {
///             Circle()
///                 .fill(self.isDragging ? Color.red : Color.blue)
///                 .frame(width: 100, height: 100, alignment: .center)
///                 .gesture(drag)
///         }
///     }
@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct DragGesture : Gesture {

    /// The attributes of a drag gesture.
    public struct Value : Equatable {

        /// The time associated with the drag gesture's current event.
        public var time: Date

        /// The location of the drag gesture's current event.
        public var location: CGPoint

        /// The location of the drag gesture's first event.
        public var startLocation: CGPoint

        /// The total translation from the start of the drag gesture to the
        /// current event of the drag gesture.
        ///
        /// This is equivalent to `location.{x,y} - startLocation.{x,y}`.
        public var translation: CGSize { get }

        /// A prediction, based on the current drag velocity, of where the final
        /// location will be if dragging stopped now.
        public var predictedEndLocation: CGPoint { get }

        /// A prediction, based on the current drag velocity, of what the final
        /// translation will be if dragging stopped now.
        public var predictedEndTranslation: CGSize { get }

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: DragGesture.Value, b: DragGesture.Value) -> Bool
    }

    /// The minimum dragging distance before the gesture succeeds.
    public var minimumDistance: CGFloat

    /// The coordinate space in which to receive location values.
    public var coordinateSpace: CoordinateSpace

    /// Creates a dragging gesture with the minimum dragging distance before the
    /// gesture succeeds and the coordinate space of the gesture's location.
    ///
    /// - Parameters:
    ///   - minimumDistance: The minimum dragging distance for the gesture to
    ///     succeed.
    ///   - coordinateSpace: The coordinate space of the dragging gesture's
    ///     location.
    public init(minimumDistance: CGFloat = 10, coordinateSpace: CoordinateSpace = .local)

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

/// An interface that you implement to interact with a drop operation in a view
/// modified to accept drops.
///
/// The ``DropDelegate`` protocol provides a comprehensive and flexible way to
/// interact with a drop operation. Specify a drop delegate when you modify a
/// view to accept drops with the ``View/onDrop(of:delegate:)-6lin8`` method.
///
/// Alternatively, for simple drop cases that don't require the full
/// functionality of a drop delegate, you can modify a view to accept drops
/// using the ``View/onDrop(of:isTargeted:perform:)-f15m`` or the
/// ``View/onDrop(of:isTargeted:perform:)-982eu`` method. These methods handle the
/// drop using a closure you provide as part of the modifier.
@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol DropDelegate {

    /// Tells the delegate that a drop containing items conforming to one of the
    /// expected types entered a view that accepts drops.
    ///
    /// Specify the expected types when you apply the drop modifier to the view.
    /// The default implementation returns `true`.
    func validateDrop(info: DropInfo) -> Bool

    /// Tells the delegate it can request the item provider data from the given
    /// information.
    ///
    /// Incorporate the received data into your app's data model as appropriate.
    /// - Returns: A Boolean that is `true` if the drop was successful, `false`
    ///   otherwise.
    func performDrop(info: DropInfo) -> Bool

    /// Tells the delegate a validated drop has entered the modified view.
    ///
    /// The default implementation does nothing.
    func dropEntered(info: DropInfo)

    /// Tells the delegate that a validated drop moved inside the modified view.
    ///
    /// Use this method to return a drop proposal containing the operation the
    /// delegate intends to perform at the drop ``DropInfo/location``. The
    /// default implementation of this method returns `nil`, which tells the
    /// drop to use the last valid returned value or else
    /// ``DropOperation/copy``.
    func dropUpdated(info: DropInfo) -> DropProposal?

    /// Tells the delegate a validated drop operation has exited the modified
    /// view.
    ///
    /// The default implementation does nothing.
    func dropExited(info: DropInfo)
}

@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DropDelegate {

    /// Tells the delegate that a drop containing items conforming to one of the
    /// expected types entered a view that accepts drops.
    ///
    /// Specify the expected types when you apply the drop modifier to the view.
    /// The default implementation returns `true`.
    public func validateDrop(info: DropInfo) -> Bool

    /// Tells the delegate a validated drop has entered the modified view.
    ///
    /// The default implementation does nothing.
    public func dropEntered(info: DropInfo)

    /// Tells the delegate that a validated drop moved inside the modified view.
    ///
    /// Use this method to return a drop proposal containing the operation the
    /// delegate intends to perform at the drop ``DropInfo/location``. The
    /// default implementation of this method returns `nil`, which tells the
    /// drop to use the last valid returned value or else
    /// ``DropOperation/copy``.
    public func dropUpdated(info: DropInfo) -> DropProposal?

    /// Tells the delegate a validated drop operation has exited the modified
    /// view.
    ///
    /// The default implementation does nothing.
    public func dropExited(info: DropInfo)
}

/// The current state of a drop.
@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DropInfo {

    /// The location of the drag in the coordinate space of the drop view.
    public var location: CGPoint { get }

    /// Indicates whether at least one item conforms to at least one of the
    /// specified uniform type identifiers.
    ///
    /// - Parameter contentTypes: The uniform type identifiers to query for.
    /// - Returns: Whether at least one item conforms to one of `contentTypes`.
    @available(iOS 14.0, macOS 11.0, *)
    public func hasItemsConforming(to contentTypes: [UTType]) -> Bool

    /// Finds item providers that conform to at least one of the specified
    /// uniform type identifiers.
    ///
    /// This function is only valid during the `performDrop()` action.
    ///
    /// - Parameter contentTypes: The uniform type identifiers to query for.
    /// - Returns: The item providers that conforms to `contentTypes`.
    @available(iOS 14.0, macOS 11.0, *)
    public func itemProviders(for contentTypes: [UTType]) -> [NSItemProvider]
}

@available(iOS, introduced: 13.4, deprecated: 100000.0, message: "Provide `UTType`s as the `types` instead.")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Provide `UTType`s as the `types` instead.")
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DropInfo {

    /// Returns whether at least one item conforms to at least one of the
    /// specified uniform type identifiers.
    public func hasItemsConforming(to types: [String]) -> Bool

    /// Returns an Array of items that each conform to at least one of the
    /// specified uniform type identifiers.
    ///
    /// This function is only valid during the performDrop() action.
    public func itemProviders(for types: [String]) -> [NSItemProvider]
}

/// Operation types that determine how a drag and drop session resolves when the
/// user drops a drag item.
@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public enum DropOperation {

    /// Cancel the drag operation and transfer no data.
    case cancel

    /// The drop activity is not allowed at this time or location.
    case forbidden

    /// Copy the data to the modified view.
    case copy

    /// Move the data represented by the drag items instead of copying it.
    case move

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: DropOperation, b: DropOperation) -> Bool

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
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DropOperation : Equatable {
}

@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DropOperation : Hashable {
}

/// The behavior of a drop.
@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DropProposal {

    /// The drop operation that the drop proposes to perform.
    public let operation: DropOperation

    public init(operation: DropOperation)
}

/// An interface for a stored variable that updates an external property of a
/// view.
///
/// The view gives values to these properties prior to recomputing the view's
/// ``View/body-swift.property``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol DynamicProperty {

    /// Updates the underlying value of the stored value.
    ///
    /// SwiftUI calls this function before rending a view's
    /// ``View/body-swift.property`` to ensure the view has the most recent
    /// value.
    mutating func update()
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicProperty {

    /// Updates the underlying value of the stored value.
    ///
    /// SwiftUI calls this function before rending a view's
    /// ``View/body-swift.property`` to ensure the view has the most recent
    /// value.
    public mutating func update()
}

/// A type of view that generates views from an underlying collection of data.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol DynamicViewContent : View {

    /// The type of the underlying collection of data.
    associatedtype Data : Collection

    /// The collection of underlying data.
    var data: Self.Data { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicViewContent {

    /// Sets the deletion action for the dynamic view.
    ///
    /// - Parameter action: The action that you want SwiftUI to perform when
    ///   elements in the view are deleted. SwiftUI passes a set of indices to the
    ///   closure that's relative to the dynamic view's underlying collection of
    ///   data.
    ///
    /// - Returns: A view that calls `action` when elements are deleted from the
    ///   original view.
    @inlinable public func onDelete(perform action: ((IndexSet) -> Void)?) -> some DynamicViewContent

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicViewContent {

    /// Sets the move action for the dynamic view.
    ///
    /// - Parameters:
    ///   - action: A closure that SwiftUI invokes when elements in the dynamic
    ///     view are moved. The closure takes two arguments that represent the
    ///     offset relative to the dynamic view's underlying collection of data.
    ///     Pass `nil` to disable the ability to move items.
    ///
    /// - Returns: A view that calls `action` when elements are moved within the
    ///   original view.
    @inlinable public func onMove(perform action: ((IndexSet, Int) -> Void)?) -> some DynamicViewContent

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicViewContent {

    /// Sets the insert action for the dynamic view.
    ///
    /// - Parameters:
    ///   - supportedContentTypes: An array of UTI types that the dynamic
    ///     view supports.
    ///   - action: A closure that SwiftUI invokes when elements are added to
    ///     the view. The closure takes two arguments: The first argument is the
    ///     offset relative to the dynamic view's underlying collection of data.
    ///     The second argument is an array of
    ///     <doc://com.apple.documentation/documentation/Foundation/NSItemProvider> items that
    ///     represents the data that you want to insert.
    ///
    /// - Returns: A view that calls `action` when elements are inserted into
    ///   the original view.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public func onInsert(of supportedContentTypes: [UTType], perform action: @escaping (Int, [NSItemProvider]) -> Void) -> some DynamicViewContent


    /// Sets the insert action for the dynamic view.
    ///
    /// - Parameters:
    ///   - acceptedTypeIdentifiers: An array of UTI types that the dynamic
    ///     view supports.
    ///   - action: A closure that SwiftUI invokes when elements are added to
    ///     the view. The closure takes two arguments: The first argument is the
    ///     offset relative to the dynamic view's underlying collection of data.
    ///     The second argument is an array of `NSItemProvider` that represents
    ///     the data that you want to insert.
    ///
    /// - Returns: A view that calls `action` when elements are inserted into
    ///   the original view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Provide `UTType`s as the `supportedContentTypes` instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Provide `UTType`s as the `supportedContentTypes` instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Provide `UTType`s as the `supportedContentTypes` instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Provide `UTType`s as the `supportedContentTypes` instead.")
    public func onInsert(of acceptedTypeIdentifiers: [String], perform action: @escaping (Int, [NSItemProvider]) -> Void) -> some DynamicViewContent

}

/// An enumeration to indicate one edge of a rectangle.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public enum Edge : Int8, CaseIterable {

    case top

    case leading

    case bottom

    case trailing

    /// An efficient set of `Edge`s.
    @frozen public struct Set : OptionSet {

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = Edge.Set

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
        public let rawValue: Int8

        /// Creates a new option set from the given raw value.
        ///
        /// This initializer always succeeds, even if the value passed as `rawValue`
        /// exceeds the static properties declared as part of the option set. This
        /// example creates an instance of `ShippingOptions` with a raw value beyond
        /// the highest element, with a bit mask that effectively contains all the
        /// declared static members.
        ///
        ///     let extraOptions = ShippingOptions(rawValue: 255)
        ///     print(extraOptions.isStrictSuperset(of: .all))
        ///     // Prints "true"
        ///
        /// - Parameter rawValue: The raw value of the option set to create. Each bit
        ///   of `rawValue` potentially represents an element of the option set,
        ///   though raw values may include bits that are not defined as distinct
        ///   values of the `OptionSet` type.
        public init(rawValue: Int8)

        public static let top: Edge.Set

        public static let leading: Edge.Set

        public static let bottom: Edge.Set

        public static let trailing: Edge.Set

        public static let all: Edge.Set

        public static let horizontal: Edge.Set

        public static let vertical: Edge.Set

        /// Creates an instance containing just `e`
        public init(_ e: Edge)

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = Edge.Set.Element

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        public typealias RawValue = Int8
    }

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int8

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
    public init?(rawValue: Int8)

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
    public var rawValue: Int8 { get }

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [Edge]

    /// A collection of all values of this type.
    public static var allCases: [Edge] { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Edge : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Edge : Hashable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Edge : RawRepresentable {
}

/// The inset distances for the sides of a rectangle.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EdgeInsets : Equatable {

    public var top: CGFloat

    public var leading: CGFloat

    public var bottom: CGFloat

    public var trailing: CGFloat

    @inlinable public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat)

    @inlinable public init()

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: EdgeInsets, b: EdgeInsets) -> Bool
}

extension EdgeInsets {

    /// Create edge insets from the equivalent NSDirectionalEdgeInsets.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, *)
    @available(watchOS, unavailable)
    public init(_ nsEdgeInsets: NSDirectionalEdgeInsets)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EdgeInsets : Animatable {

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>

    /// The data to animate.
    public var animatableData: EdgeInsets.AnimatableData
}

/// A button that toggles the edit mode for the current edit scope.
@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct EditButton : View {

    public init()

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

/// The mode of a view indicating whether the user can edit its content.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public enum EditMode {

    /// The view content cannot be edited.
    case inactive

    /// The view is in a temporary edit mode.
    ///
    /// The definition of temporary might vary by platform or specific control.
    /// As an example, temporary edit mode may be engaged over the duration of a
    /// swipe gesture.
    case transient

    /// The view content can be edited.
    case active

    /// Indicates whether a view is being edited.
    public var isEditing: Bool { get }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: EditMode, b: EditMode) -> Bool

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
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension EditMode : Equatable {
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension EditMode : Hashable {
}

/// An ellipse aligned inside the frame of the view containing it.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Ellipse : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    @inlinable public init()

    /// The type defining the data to animate.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Ellipse : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// An empty type for animatable data.
///
/// This type is suitable for use as the `animatableData` property of
/// types that do not have any animatable properties.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EmptyAnimatableData : VectorArithmetic {

    @inlinable public init()

    /// The zero value.
    ///
    /// Zero is the identity element for addition. For any value,
    /// `x + .zero == x` and `.zero + x == x`.
    @inlinable public static var zero: EmptyAnimatableData { get }

    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    @inlinable public static func += (lhs: inout EmptyAnimatableData, rhs: EmptyAnimatableData)

    /// Subtracts the second value from the first and stores the difference in the
    /// left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    @inlinable public static func -= (lhs: inout EmptyAnimatableData, rhs: EmptyAnimatableData)

    /// Adds two values and produces their sum.
    ///
    /// The addition operator (`+`) calculates the sum of its two arguments. For
    /// example:
    ///
    ///     1 + 2                   // 3
    ///     -10 + 15                // 5
    ///     -15 + -5                // -20
    ///     21.5 + 3.25             // 24.75
    ///
    /// You cannot use `+` with arguments of different types. To add values of
    /// different types, convert one of the values to the other value's type.
    ///
    ///     let x: Int8 = 21
    ///     let y: Int = 1000000
    ///     Int(x) + y              // 1000021
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    @inlinable public static func + (lhs: EmptyAnimatableData, rhs: EmptyAnimatableData) -> EmptyAnimatableData

    /// Subtracts one value from another and produces their difference.
    ///
    /// The subtraction operator (`-`) calculates the difference of its two
    /// arguments. For example:
    ///
    ///     8 - 3                   // 5
    ///     -10 - 5                 // -15
    ///     100 - -5                // 105
    ///     10.5 - 100.0            // -89.5
    ///
    /// You cannot use `-` with arguments of different types. To subtract values
    /// of different types, convert one of the values to the other value's type.
    ///
    ///     let x: UInt8 = 21
    ///     let y: UInt = 1000000
    ///     y - UInt(x)             // 999979
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    @inlinable public static func - (lhs: EmptyAnimatableData, rhs: EmptyAnimatableData) -> EmptyAnimatableData

    /// Multiplies each component of this value by the given value.
    @inlinable public mutating func scale(by rhs: Double)

    /// The dot-product of this animatable data instance with itself.
    @inlinable public var magnitudeSquared: Double { get }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: EmptyAnimatableData, b: EmptyAnimatableData) -> Bool
}

/// An empty group of commands.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct EmptyCommands : Commands {

    /// Creates an empty group of commands.
    public init()

    /// The type of command group representing the body of this command group.
    public typealias Body = Never
}

/// An empty, or identity, modifier, used during development to switch
/// modifiers at compile time.
///
/// Use the empty modifier to switch modifiers at compile time during
/// development. In the example below, in a debug build the ``Text``
/// view inside `ContentView` has a yellow background and a red border.
/// A non-debug build reflects the default system, or container supplied
/// appearance.
///
///     struct EmphasizedLayout: ViewModifier {
///         func body(content: Content) -> some View {
///             content
///                 .background(Color.yellow)
///                 .border(Color.red)
///         }
///     }
///
///     struct ContentView: View {
///         var body: some View {
///             Text("Hello, World!")
///                 .modifier(modifier)
///         }
///
///         var modifier: some ViewModifier {
///             #if DEBUG
///                 return EmphasizedLayout()
///             #else
///                 return EmptyModifier()
///             #endif
///         }
///     }
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EmptyModifier : ViewModifier {

    public static let identity: EmptyModifier

    /// The type of view representing the body.
    public typealias Body = Never

    @inlinable public init()

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    public func body(content: EmptyModifier.Content) -> EmptyModifier.Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EmptyView : View {

    @inlinable public init()

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// An empty widget configuration.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@frozen public struct EmptyWidgetConfiguration : WidgetConfiguration {

    @inlinable public init()

    /// The type of widget configuration representing the body of
    /// this configuration.
    ///
    /// When you create a custom widget, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A property wrapper that reads a value from a view's environment.
///
/// Use the `Environment` property wrapper to read a value
/// stored in a view's environment. Indicate the value to read using an
/// ``EnvironmentValues`` key path in the property declaration. For example, you
/// can create a property that reads the color scheme of the current
/// view using the key path of the ``EnvironmentValues/colorScheme``
/// property:
///
///     @Environment(\.colorScheme) var colorScheme: ColorScheme
///
/// You can condition a view's content on the associated value, which
/// you read from the declared property's ``wrappedValue``. As with any property
/// wrapper, you access the wrapped value by directly referring to the property:
///
///     if colorScheme == .dark { // Checks the wrapped value.
///         DarkContent()
///     } else {
///         LightContent()
///     }
///
/// If the value changes, SwiftUI updates any parts of your view that depend on
/// the value. For example, that might happen in the above example if the user
/// changes the Appearance settings.
///
/// You can use this property wrapper to read --- but not set --- an environment
/// value. SwiftUI updates some environment values automatically based on system
/// settings and provides reasonable defaults for others. You can override some
/// of these, as well as set custom environment values that you define,
/// using the ``View/environment(_:_:)`` view modifier.
///
/// For the complete list of environment values provided by SwiftUI, see the
/// properties of the ``EnvironmentValues`` structure. For information about
/// creating custom environment values, see the ``EnvironmentKey`` protocol.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen @propertyWrapper public struct Environment<Value> : DynamicProperty {

    /// Creates an environment property to read the specified key path.
    ///
    /// Don’t call this initializer directly. Instead, declare a property
    /// with the ``Environment`` property wrapper, and provide the key path of
    /// the environment value that the property should reflect:
    ///
    ///     struct MyView: View {
    ///         @Environment(\.colorScheme) var colorScheme: ColorScheme
    ///
    ///         // ...
    ///     }
    ///
    /// SwiftUI automatically updates any parts of `MyView` that depend on
    /// the property when the associated environment value changes.
    /// You can't modify the environment value using a property like this.
    /// Instead, use the ``View/environment(_:_:)`` view modifier on a view to
    /// set a value for a view hierarchy.
    ///
    /// - Parameter keyPath: A key path to a specific resulting value.
    @inlinable public init(_ keyPath: KeyPath<EnvironmentValues, Value>)

    /// The current value of the environment property.
    ///
    /// The wrapped value property provides primary access to the value's data.
    /// However, you don't access `wrappedValue` directly. Instead, you read the
    /// property variable created with the ``Environment`` property wrapper:
    ///
    ///     @Environment(\.colorScheme) var colorScheme: ColorScheme
    ///
    ///     var body: some View {
    ///         if colorScheme == .dark {
    ///             DarkContent()
    ///         } else {
    ///             LightContent()
    ///         }
    ///     }
    ///
    @inlinable public var wrappedValue: Value { get }
}

/// A key for accessing values in the environment.
///
/// You can create custom environment values by extending the
/// ``EnvironmentValues`` structure with new properties.
/// First declare a new environment key type and specify a value for the
/// required ``defaultValue`` property:
///
///     private struct MyEnvironmentKey: EnvironmentKey {
///         static let defaultValue: String = "Default value"
///     }
///
/// The Swift compiler automatically infers the associated ``Value`` type as the
/// type you specify for the default value. Then use the key to define a new
/// environment value property:
///
///     extension EnvironmentValues {
///         var myCustomValue: String {
///             get { self[MyEnvironmentKey.self] }
///             set { self[MyEnvironmentKey.self] = newValue }
///         }
///     }
///
/// Clients of your environment value never use the key directly.
/// Instead, they use the key path of your custom environment value property.
/// To set the environment value for a view and all its subviews, add the
/// ``View/environment(_:_:)`` view modifier to that view:
///
///     MyView()
///         .environment(\.myCustomValue, "Another string")
///
/// As a convenience, you can also define a dedicated view modifier to
/// apply this environment value:
///
///     extension View {
///         func myCustomValue(_ myCustomValue: String) -> some View {
///             environment(\.myCustomValue, myCustomValue)
///         }
///     }
///
/// This improves clarity at the call site:
///
///     MyView()
///         .myCustomValue("Another string")
///
/// To read the value from inside `MyView` or one of its descendants, use the
/// ``Environment`` property wrapper:
///
///     struct MyView: View {
///         @Environment(\.myCustomValue) var customValue: String
///
///         var body: some View {
///             Text(customValue) // Displays "Another value".
///         }
///     }
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol EnvironmentKey {

    /// The associated type representing the type of the environment key's
    /// value.
    associatedtype Value

    /// The default value for the environment key.
    static var defaultValue: Self.Value { get }
}

/// A property wrapper type for an observable object supplied by a parent or
/// ancestor view.
///
/// An environment object invalidates the current view whenever the observable
/// object changes. If you declare a property as an environment object, be sure
/// to set a corresponding model object on an ancestor view by calling its
/// ``View/environmentObject(_:)`` modifier.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen @propertyWrapper public struct EnvironmentObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {

    /// A wrapper of the underlying environment object that can create bindings
    /// to its properties using dynamic member lookup.
    @dynamicMemberLookup @frozen public struct Wrapper {

        /// Returns a binding to the resulting value of a given key path.
        ///
        /// - Parameter keyPath: A key path to a specific resulting value.
        ///
        /// - Returns: A new binding.
        public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> { get }
    }

    /// The underlying value referenced by the environment object.
    ///
    /// This property provides primary access to the value's data. However, you
    /// don't access `wrappedValue` directly. Instead, you use the property
    /// variable created with the ``EnvironmentObject`` attribute.
    ///
    /// When a mutable value changes, the new value is immediately available.
    /// However, a view displaying the value is updated asynchronously and may
    /// not show the new value immediately.
    @inlinable public var wrappedValue: ObjectType { get }

    /// A projection of the environment object that creates bindings to its
    /// properties using dynamic member lookup.
    ///
    /// Use the projected value to pass an environment object down a view
    /// hierarchy.
    public var projectedValue: EnvironmentObject<ObjectType>.Wrapper { get }

    /// Creates an environment object.
    public init()
}

/// A collection of environment values propagated through a view hierarchy.
///
/// SwiftUI exposes a collection of values to your app's views in an
/// `EnvironmentValues` structure. To read a value from the structure,
/// declare a property using the ``Environment`` property wrapper and
/// specify the value's key path. For example, you can read the current locale:
///
///     @Environment(\.locale) var locale: Locale
///
/// Use the property you declare to dynamically control a view's layout.
/// SwiftUI automatically sets or updates many environment values, like
/// ``EnvironmentValues/pixelLength``, ``EnvironmentValues/scenePhase``, or
/// ``EnvironmentValues/locale``, based on device characteristics, system state,
/// or user settings. For others, like ``EnvironmentValues/lineLimit``, SwiftUI
/// provides a reasonable default value.
///
/// You can set or override some values using the ``View/environment(_:_:)``
/// view modifier:
///
///     MyView()
///         .environment(\.lineLimit, 2)
///
/// The value that you set affects the environment for the view that you modify
/// --- including its descendants in the view hierarchy --- but only up to the
/// point where you apply a different environment modifier.
///
/// SwiftUI provides dedicated view modifiers for setting some values, which
/// typically makes your code easier to read. For example, rather than setting
/// the ``EnvironmentValues/lineLimit`` value directly, as in the previous
/// example, you should instead use the ``View/lineLimit(_:)`` modifier:
///
///     MyView()
///         .lineLimit(2)
///
/// In some cases, using a dedicated view modifier provides additional
/// functionality. For example, you must use the
/// ``View/preferredColorScheme(_:)`` modifier rather than setting
/// ``EnvironmentValues/colorScheme`` directly to ensure that the new
/// value propagates up to the presenting container when presenting a view
/// like a popover:
///
///     MyView()
///         .popover(isPresented: $isPopped) {
///             PopoverContent()
///                 .preferredColorScheme(.dark)
///         }
///
/// Create custom environment values by defining a type that
/// conforms to the ``EnvironmentKey`` protocol, and then extending the
/// environment values structure with a new property. Use your key to get and
/// set the value, and provide a dedicated modifier for clients to use when
/// setting the value:
///
///     private struct MyEnvironmentKey: EnvironmentKey {
///         static let defaultValue: String = "Default value"
///     }
///
///     extension EnvironmentValues {
///         var myCustomValue: String {
///             get { self[MyEnvironmentKey.self] }
///             set { self[MyEnvironmentKey.self] = newValue }
///         }
///     }
///
///     extension View {
///         func myCustomValue(_ myCustomValue: String) -> some View {
///             environment(\.myCustomValue, myCustomValue)
///         }
///     }
///
/// Clients of your value then access the value in the usual way, reading it
/// with the ``Environment`` property wrapper, and setting it with the
/// `myCustomValue` view modifier.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct EnvironmentValues : CustomStringConvertible {

    /// Creates an environment values instance.
    ///
    /// You don't typically create an instance of ``EnvironmentValues``
    /// directly. Doing so would provide access only to default values that
    /// don't update based on system settings or device characteristics.
    /// Instead, you rely on an environment values' instance
    /// that SwiftUI manages for you when you use the ``Environment``
    /// property wrapper and the ``View/environment(_:_:)`` view modifier.
    public init()

    /// Accesses the environment value associated with a custom key.
    ///
    /// Create custom environment values by defining a key
    /// that conforms to the ``EnvironmentKey`` protocol, and then using that
    /// key with the subscript operator of the ``EnvironmentValues`` structure
    /// to get and set a value for that key:
    ///
    ///     private struct MyEnvironmentKey: EnvironmentKey {
    ///         static let defaultValue: String = "Default value"
    ///     }
    ///
    ///     extension EnvironmentValues {
    ///         var myCustomValue: String {
    ///             get { self[MyEnvironmentKey.self] }
    ///             set { self[MyEnvironmentKey.self] = newValue }
    ///         }
    ///     }
    ///
    /// You use custom environment values the same way you use system-provided
    /// values, setting a value with the ``View/environment(_:_:)`` view
    /// modifier, and reading values with the ``Environment`` property wrapper.
    /// You can also provide a dedicated view modifier as a convenience for
    /// setting the value:
    ///
    ///     extension View {
    ///         func myCustomValue(_ myCustomValue: String) -> some View {
    ///             environment(\.myCustomValue, myCustomValue)
    ///         }
    ///     }
    ///
    public subscript<K>(key: K.Type) -> K.Value where K : EnvironmentKey

    /// A string that represents the contents of the environment values
    /// instance.
    public var description: String { get }
}

extension EnvironmentValues {

    /// A Boolean value that determines whether the view hierarchy has
    /// auto-correction enabled.
    ///
    /// When the value is `nil`, SwiftUI uses the system default. The default
    /// value is `nil`.
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
    @available(watchOS, unavailable)
    public var disableAutocorrection: Bool?
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The preferred size of the content.
    ///
    /// The default value is ``ContentSizeCategory/large``.
    public var sizeCategory: ContentSizeCategory
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    public var managedObjectContext: NSManagedObjectContext
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The undo manager used to register a view's undo operations.
    ///
    /// This value is `nil` when the environment represents a context that
    /// doesn't support undo and redo operations. You can skip registration of
    /// an undo operation when this value is `nil`.
    public var undoManager: UndoManager? { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The layout direction associated with the current environment.
    ///
    /// Use this value to determine whether the environment uses a left-to-right
    /// or right-to-left orientation.
    public var layoutDirection: LayoutDirection
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {

    /// The current redaction reasons applied to the view hierarchy.
    public var redactionReasons: RedactionReasons
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {

    /// The current phase of the scene.
    ///
    /// The system sets this value to provide an indication of the
    /// operational state of a scene or collection of scenes. The exact
    /// meaning depends on where you access the value. For more information,
    /// see ``ScenePhase``.
    public var scenePhase: ScenePhase
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The default minimum height of a row in a list.
    public var defaultMinListRowHeight: CGFloat

    /// The default minimum height of a header in a list.
    ///
    /// When this value is `nil`, the system chooses the appropriate height. The
    /// default is `nil`.
    public var defaultMinListHeaderHeight: CGFloat?
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// A Boolean value that indicates whether the view associated with this
    /// environment allows user interaction.
    ///
    /// The default value is `true`.
    public var isEnabled: Bool
}

extension EnvironmentValues {

    /// Returns whether the nearest focusable ancestor has focus.
    ///
    /// If there is no focusable ancestor, the value is `false`.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public var isFocused: Bool { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The default font of this environment.
    public var font: Font?

    /// The display scale of this environment.
    public var displayScale: CGFloat

    /// The image scale for this environment.
    @available(macOS 11.0, *)
    public var imageScale: Image.Scale

    /// The size of a pixel on the screen.
    ///
    /// This value is equal to `1` divided by
    /// ``EnvironmentValues/displayScale``.
    public var pixelLength: CGFloat { get }

    /// The font weight to apply to text.
    ///
    /// This value reflects the value of the Bold Text display setting found in
    /// the Accessibility settings.
    public var legibilityWeight: LegibilityWeight?

    /// The current locale that views should use.
    public var locale: Locale

    /// The current calendar that views should use when handling dates.
    public var calendar: Calendar

    /// The current time zone that views should use when handling dates.
    public var timeZone: TimeZone

    /// The color scheme of this environment.
    ///
    /// When writing custom drawing code that depends on the current color
    /// scheme, you should also consider the
    /// ``EnvironmentValues/colorSchemeContrast`` property. You can specify
    /// images and colors in asset catalogs according to either the
    /// ``ColorScheme/light`` or ``ColorScheme/dark`` color scheme, as well as
    /// standard or increased contrast. The correct image or color displays
    /// automatically for the current environment.
    ///
    /// You only need to check `colorScheme` and
    /// ``EnvironmentValues/colorSchemeContrast`` for custom drawing if the
    /// differences go beyond images and colors.
    ///
    /// Setting the `colorScheme` environment value directly is an advanced use
    /// case, as it changes the color scheme of the contained views but *not* of
    /// the container. Instead, consider using the
    /// ``View/preferredColorScheme(_:)`` modifier, which propagates to the
    /// presentation containing the view.
    public var colorScheme: ColorScheme

    /// The contrast associated with the color scheme of this environment.
    public var colorSchemeContrast: ColorSchemeContrast { get }
}

@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {

    /// The horizontal size class of this environment.
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var horizontalSizeClass: UserInterfaceSizeClass?

    /// The vertical size class of this environment.
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var verticalSizeClass: UserInterfaceSizeClass?
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// A Boolean value that indicates whether the user has enabled an assistive
    /// technology.
    public var accessibilityEnabled: Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// Whether the system preference for Differentiate without Color is enabled.
    ///
    /// If this is true, UI should not convey information using color alone
    /// and instead should use shapes or glyphs to convey information.
    public var accessibilityDifferentiateWithoutColor: Bool { get }

    /// Whether the system preference for Reduce Transparency is enabled.
    ///
    /// If this property's value is true, UI (mainly window) backgrounds should
    /// not be semi-transparent; they should be opaque.
    public var accessibilityReduceTransparency: Bool { get }

    /// Whether the system preference for Reduce Motion is enabled.
    ///
    /// If this property's value is true, UI should avoid large animations,
    /// especially those that simulate the third dimension.
    public var accessibilityReduceMotion: Bool { get }

    /// Whether the system preference for Invert Colors is enabled.
    ///
    /// If this property's value is true then the display will be inverted.
    /// In these cases it may be needed for UI drawing to be adjusted to in
    /// order to display optimally when inverted.
    public var accessibilityInvertColors: Bool { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {

    /// Whether the system preference for Show Button Shapes is enabled.
    ///
    /// If this property's value is true, interactive custom controls
    /// such as buttons should be drawn in such a way that their edges
    /// and borders are clearly visible.
    public var accessibilityShowButtonShapes: Bool { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EnvironmentValues {

    /// Opens a URL using the appropriate system service.
    public var openURL: OpenURLAction { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// A value that indicates how text instance aligns its lines when the
    /// content wraps or contains newlines.
    ///
    /// Use alignment parameters on a parent view to align ``Text`` with respect
    /// to its parent. Because the horizontal bounds of ``TextField`` never
    /// exceed its graphical extent, this value has little to no effect on
    /// single-line text.
    public var multilineTextAlignment: TextAlignment

    /// A value that indicates how the layout truncates the last line of text to
    /// fit into the available space.
    ///
    /// The default value is ``Text/TruncationMode/tail``.
    public var truncationMode: Text.TruncationMode

    /// The distance in points between the bottom of one line fragment and the
    /// top of the next.
    ///
    /// This value is always nonnegative.
    public var lineSpacing: CGFloat

    /// A Boolean value that indicates whether inter-character spacing should
    /// tighten to fit the text into the available space.
    ///
    /// The default value is `false`.
    public var allowsTightening: Bool

    /// The maximum number of lines that text can occupy in a view.
    ///
    /// The maximum number of lines is `1` if the value is less than `1`. If the
    /// value is `nil`, the text uses as many lines as required. The default is
    /// `nil`.
    public var lineLimit: Int?

    /// The minimum permissible proportion to shrink the font size to fit
    /// the text into the available space.
    ///
    /// In the example below, a label with a `minimumScaleFactor` of `0.5`
    /// draws its text in a font size as small as half of the actual font if
    /// needed to fit into the space next to the text input field:
    ///
    ///     HStack {
    ///         Text("This is a very long label:")
    ///             .lineLimit(1)
    ///             .minimumScaleFactor(0.5)
    ///         TextField("My Long Text Field", text: $myTextField)
    ///             .frame(width: 250, height: 50, alignment: .center)
    ///     }
    ///
    /// ![A screenshot showing the effects of setting the minimumScaleFactor on
    ///   the text in a view](SwiftUI-view-minimumScaleFactor.png)
    ///
    /// You can set the minimum scale factor to any value greater than `0` and
    /// less than or equal to `1`. The default value is `1`.
    ///
    /// SwiftUI uses this value to shrink text that doesn't fit in a view when
    /// it's okay to shrink the text. For example, a label with a
    /// `minimumScaleFactor` of `0.5` draws its text in a font size as small as
    /// half the actual font if needed.
    public var minimumScaleFactor: CGFloat

    /// A stylistic override to transform the case of `Text` when displayed,
    /// using the environment's locale.
    ///
    /// The default value is `nil`, displaying the `Text` without any case
    /// changes.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public var textCase: Text.Case?
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {

    /// The mode indicating whether the user can edit the contents of a view
    /// associated with this environment.
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public var editMode: Binding<EditMode>?
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// A binding to the current presentation mode of the view associated with
    /// this environment.
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public var presentationMode: Binding<PresentationMode> { get }
}

/// A modifier that must resolve to a concrete modifier in an environment before
/// use.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol EnvironmentalModifier : ViewModifier where Self.Body == Never {

    /// The type of modifier to use after being resolved.
    associatedtype ResolvedModifier : ViewModifier

    /// Resolve to a concrete modifier in the given `environment`.
    func resolve(in environment: EnvironmentValues) -> Self.ResolvedModifier
}

/// A view type that compares itself against its previous value and prevents its
/// child updating if its new value is the same as its old value.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EquatableView<Content> : View where Content : Equatable, Content : View {

    public var content: Content

    @inlinable public init(content: Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A set of key modifiers that you can add to a gesture.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EventModifiers : OptionSet {

    /// The raw value.
    public let rawValue: Int

    /// Creates a new set from a raw value.
    ///
    /// - Parameter rawValue: The raw value with which to create the key
    ///   modifier.
    public init(rawValue: Int)

    /// The Caps Lock key.
    public static let capsLock: EventModifiers

    /// The Shift key.
    public static let shift: EventModifiers

    /// The Control key.
    public static let control: EventModifiers

    /// The Option key.
    public static let option: EventModifiers

    /// The Command key.
    public static let command: EventModifiers

    /// Any key on the numeric keypad.
    public static let numericPad: EventModifiers

    /// The Function key.
    public static let function: EventModifiers

    /// All possible modifier keys.
    public static let all: EventModifiers

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = EventModifiers

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = EventModifiers
}

/// A gesture that consists of two gestures where only one of them can succeed.
///
/// The `ExclusiveGesture` gives precedence to its first gesture.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ExclusiveGesture<First, Second> : Gesture where First : Gesture, Second : Gesture {

    /// The value of an exclusive gesture that indicates which of two gestures
    /// succeeded.
    @frozen public enum Value {

        /// The first of two gestures succeeded.
        case first(First.Value)

        /// The second of two gestures succeeded.
        case second(Second.Value)
    }

    /// The first of two gestures.
    public var first: First

    /// The second of two gestures.
    public var second: Second

    /// Creates a gesture from two gestures where only one of them succeeds.
    ///
    /// - Parameters:
    ///   - first: The first of two gestures. This gesture has precedence over
    ///     the other gesture.
    ///   - second: The second of two gestures.
    @inlinable public init(_ first: First, _ second: Second)

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ExclusiveGesture.Value : Equatable where First.Value : Equatable, Second.Value : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ExclusiveGesture<First, Second>.Value, b: ExclusiveGesture<First, Second>.Value) -> Bool
}

/// A property wrapper type that makes fetch requests and retrieves the results
/// from a Core Data store.
///
/// The fetch request and its results use the managed object context provided by
/// the environment value ``EnvironmentValues/managedObjectContext``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper public struct FetchRequest<Result> : DynamicProperty where Result : NSFetchRequestResult {

    /// The fetched results of the fetch request.
    ///
    /// This property returns an empty array when there are no fetched results.
    public var wrappedValue: FetchedResults<Result> { get }

    /// Creates an instance by defining a fetch request based on the parameters.
    /// - Parameters:
    ///   - entity: The kind of modeled object to fetch.
    ///   - sortDescriptors: An array of sort descriptors defines the sort
    ///     order of the fetched results.
    ///   - predicate: An NSPredicate defines a filter for the fetched results.
    ///   - animation: The animation used for any changes to the fetched
    ///     results.
    public init(entity: NSEntityDescription, sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil, animation: Animation? = nil)

    /// Creates an instance from a fetch request.
    /// - Parameters:
    ///   - fetchRequest: The request used to produce the fetched results.
    ///   - animation: The animation used for any changes to the fetched
    ///     results.
    public init(fetchRequest: NSFetchRequest<Result>, animation: Animation? = nil)

    /// Creates an instance from a fetch request.
    /// - Parameters:
    ///   - fetchRequest: The request used to produce the fetched results.
    ///   - transaction: The transaction used for any changes to the fetched
    ///     results.
    public init(fetchRequest: NSFetchRequest<Result>, transaction: Transaction)

    /// Updates the fetched results.
    ///
    /// SwiftUI calls this function before rendering a view's
    /// ``View/body-swift.property`` to ensure the view has the most recent
    /// fetched results.
    public mutating func update()
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension FetchRequest where Result : NSManagedObject {

    /// Creates an instance by defining a fetch request based on the parameters.
    /// The fetch request will automatically infer the entity using Result.entity().
    /// - Parameters:
    ///   - sortDescriptors: An array of sort descriptors defines the sort
    ///     order of the fetched results.
    ///   - predicate: An NSPredicate defines a filter for the fetched results.
    ///   - animation: The animation used for any changes to the fetched
    ///     results.
    public init(sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil, animation: Animation? = nil)
}

/// The FetchedResults collection type represents the results of performing a
/// fetch request. Internally, it may use strategies such as batching and
/// transparent futures to minimize memory use and I/O.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct FetchedResults<Result> : RandomAccessCollection where Result : NSFetchRequestResult {

    /// The position of the first element in a nonempty collection.
    ///
    /// If the collection is empty, `startIndex` is equal to `endIndex`.
    public var startIndex: Int { get }

    /// The collection's "past the end" position---that is, the position one
    /// greater than the last valid subscript argument.
    ///
    /// When you need a range that includes the last element of a collection, use
    /// the half-open range operator (`..<`) with `endIndex`. The `..<` operator
    /// creates a range that doesn't include the upper bound, so it's always
    /// safe to use with `endIndex`. For example:
    ///
    ///     let numbers = [10, 20, 30, 40, 50]
    ///     if let index = numbers.firstIndex(of: 30) {
    ///         print(numbers[index ..< numbers.endIndex])
    ///     }
    ///     // Prints "[30, 40, 50]"
    ///
    /// If the collection is empty, `endIndex` is equal to `startIndex`.
    public var endIndex: Int { get }

    /// Accesses the element at the specified position.
    ///
    /// The following example accesses an element of an array through its
    /// subscript to print its value:
    ///
    ///     var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    ///     print(streets[1])
    ///     // Prints "Bryant"
    ///
    /// You can subscript a collection with any valid index other than the
    /// collection's end index. The end index refers to the position one past
    /// the last element of a collection, so it doesn't correspond with an
    /// element.
    ///
    /// - Parameter position: The position of the element to access. `position`
    ///   must be a valid index of the collection that is not equal to the
    ///   `endIndex` property.
    ///
    /// - Complexity: O(1)
    public subscript(position: Int) -> Result { get }

    /// A type representing the sequence's elements.
    public typealias Element = Result

    /// A type that represents a position in the collection.
    ///
    /// Valid indices consist of the position of every element and a
    /// "past the end" position that's not valid for use as a subscript
    /// argument.
    public typealias Index = Int

    /// A type that provides the collection's iteration interface and
    /// encapsulates its iteration state.
    ///
    /// By default, a collection conforms to the `Sequence` protocol by
    /// supplying `IndexingIterator` as its associated `Iterator`
    /// type.
    public typealias Iterator = IndexingIterator<FetchedResults<Result>>

    /// A sequence that represents a contiguous subrange of the collection's
    /// elements.
    ///
    /// This associated type appears as a requirement in the `Sequence`
    /// protocol, but it is restated here with stricter constraints. In a
    /// collection, the subsequence should also conform to `Collection`.
    public typealias SubSequence = Slice<FetchedResults<Result>>

    /// A type that represents the indices that are valid for subscripting the
    /// collection, in ascending order.
    public typealias Indices = Range<Int>
}

/// A document model definition used to serialize documents to and from file
/// contents.
///
/// Conformance to `FileDocument` is expected to have value semantics and be
/// thread-safe. Serialization and deserialization will be done on a background
/// thread.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol FileDocument {

    /// The types the document is able to open.
    static var readableContentTypes: [UTType] { get }

    /// The types the document is able to save or export to.
    ///
    /// Defaults to `readableContentTypes`.
    static var writableContentTypes: [UTType] { get }

    /// Initialize self by reading from the contents of a given `ReadConfiguration`.
    init(configuration: Self.ReadConfiguration) throws

    /// The configuration for reading document contents.
    typealias ReadConfiguration = FileDocumentReadConfiguration

    /// Serialize the document to file contents for a specified `configuration`.
    /// - Parameter configuration: the configuration for the current document
    ///   contents.
    ///
    /// - Returns: The destination to serialize the document contents to. The
    ///   value can be a newly created `FileWrapper` or an updated `FileWrapper`
    ///   of the one provided in `configuration`.
    func fileWrapper(configuration: Self.WriteConfiguration) throws -> FileWrapper

    /// The configuration for serializing document contents.
    typealias WriteConfiguration = FileDocumentWriteConfiguration
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension FileDocument {

    /// The types the document is able to save or export to.
    ///
    /// Defaults to `readableContentTypes`.
    public static var writableContentTypes: [UTType] { get }
}

/// The properties of an open file document.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct FileDocumentConfiguration<Document> where Document : FileDocument {

    /// The current document model.
    ///
    /// Setting a new value will mark the document as dirty for later saving
    /// as well as register an undo action to restore the model to its previous
    /// value.
    ///
    /// If `isEditable` is `false`, setting a new value will have no effect.
    public var document: Document { get nonmutating set }

    public var $document: Binding<Document> { get }

    /// The url of the open file document.
    public var fileURL: URL?

    /// Whether the document is able to be edited.
    ///
    /// This can return `false` if the document is in viewing mode or if the
    /// file is unable to be written to.
    public var isEditable: Bool
}

/// The configuration for reading file contents.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct FileDocumentReadConfiguration {

    /// The expected uniform type of the file contents.
    public let contentType: UTType

    /// The file wrapper containing the document content.
    public let file: FileWrapper
}

/// The configuration for serializing file contents.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct FileDocumentWriteConfiguration {

    /// The expected uniform type of the file contents.
    public let contentType: UTType

    /// The file wrapper containing the current document content.
    /// `nil` if the document is unsaved.
    public let existingFile: FileWrapper?
}

/// A style for rasterizing vector shapes.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct FillStyle : Equatable {

    /// A Boolean value that indicates whether to use the even-odd rule when
    /// rendering a shape.
    ///
    /// When `isOEFilled` is `false`, the style uses the non-zero winding number
    /// rule.
    public var isEOFilled: Bool

    /// A Boolean value that indicates whether to apply antialiasing the edges
    /// of a shape.
    public var isAntialiased: Bool

    /// Creates a new fill style with the specified settings.
    ///
    /// - Parameters:
    ///   - eoFill: A Boolean value that indicates whether to use the even-od
    ///     rule for rendering a shape. Pass `false` to use the non-zero winding
    ///     number rule instead.
    ///   - antialiased: A Boolean value that indicates whether to use
    ///     antialiasing when rendering the edges of a shape.
    public init(eoFill: Bool = false, antialiased: Bool = true)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: FillStyle, b: FillStyle) -> Bool
}

/// A convenience property wrapper for observing and automatically unwrapping
/// state bindings from the focused view or one of its ancestors.
///
/// If multiple views publish bindings using the same key, the wrapped property
/// will reflect the value of the binding from the view closest to focus.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@propertyWrapper public struct FocusedBinding<Value> : DynamicProperty {

    /// A new property wrapper for the given key path.
    ///
    /// The value of the property wrapper is updated dynamically as focus
    /// changes and different published bindings go in and out of scope.
    ///
    /// - Parameter keyPath: The key path for the focus value to read.
    public init(_ keyPath: KeyPath<FocusedValues, Binding<Value>?>)

    /// The unwrapped value for the focus key given the current scope and state
    /// of the focused view hierarchy.
    @inlinable public var wrappedValue: Value? { get nonmutating set }

    /// A binding to the optional value.
    ///
    /// The unwrapped value is `nil` when no focused view hierarchy has
    /// published a corresponding binding.
    public var projectedValue: Binding<Value?> { get }
}

/// A property wrapper for observing values from the focused view or one of its
/// ancestors.
///
/// If multiple views publish values using the same key, the wrapped property
///  will reflect the value from the view closest to focus.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@propertyWrapper public struct FocusedValue<Value> : DynamicProperty {

    /// A new property wrapper for the given key path.
    ///
    /// The value of the property wrapper is updated dynamically as focus
    /// changes and different published values go in and out of scope.
    ///
    /// - Parameter keyPath: The key path for the focus value to read.
    public init(_ keyPath: KeyPath<FocusedValues, Value?>)

    /// The value for the focus key given the current scope and state of the
    /// focused view hierarchy.
    ///
    /// Returns `nil` when nothing in the focused view hierarchy exports a
    /// value.
    @inlinable public var wrappedValue: Value? { get }
}

/// A protocol for identifier types used when publishing and observing focused
/// values.
///
/// Unlike `EnvironmentKey`, `FocusedValuesHostKey` has no default value
/// requirement, because the default value for a key is always `nil`.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol FocusedValueKey {

    associatedtype Value
}

/// A collection of state exported by the focused view and its ancestors.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct FocusedValues {

    /// Reads and writes values associated with a given environment key.
    ///
    /// Setting has no effect if the current focus scope already contains a
    /// value for the key.
    public subscript<Key>(key: Key.Type) -> Key.Value? where Key : FocusedValueKey
}

/// An environment-dependent font.
///
/// The system resolves a font's value at the time it uses the font in a given
/// environment because ``Font`` is a late-binding token.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Font : Hashable {

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
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Font, rhs: Font) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {

    /// A font with the large title text style.
    public static let largeTitle: Font

    /// A font with the title text style.
    public static let title: Font

    /// Create a font for second level hierarchical headings.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static let title2: Font

    /// Create a font for third level hierarchical headings.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static let title3: Font

    /// A font with the headline text style.
    public static let headline: Font

    /// A font with the subheadline text style.
    public static let subheadline: Font

    /// A font with the body text style.
    public static let body: Font

    /// A font with the callout text style.
    public static let callout: Font

    /// A font with the footnote text style.
    public static let footnote: Font

    /// A font with the caption text style.
    public static let caption: Font

    /// Create a font with the alternate caption text style.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static let caption2: Font

    /// Gets a system font with the given style and design.
    public static func system(_ style: Font.TextStyle, design: Font.Design = .default) -> Font

    /// A dynamic text style to use for fonts.
    public enum TextStyle : CaseIterable {

        /// The font style for large titles.
        case largeTitle

        /// The font used for first level hierarchical headings.
        case title

        /// The font used for second level hierarchical headings.
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        case title2

        /// The font used for third level hierarchical headings.
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        case title3

        /// The font used for headings.
        case headline

        /// The font used for subheadings.
        case subheadline

        /// The font used for body text.
        case body

        /// The font used for callouts.
        case callout

        /// The font used in footnotes.
        case footnote

        /// The font used for standard captions.
        case caption

        /// The font used for alternate captions.
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        case caption2

        /// A collection of all values of this type.
        public static var allCases: [Font.TextStyle]

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Font.TextStyle, b: Font.TextStyle) -> Bool

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
        public func hash(into hasher: inout Hasher)

        /// A type that can represent a collection of all values of this type.
        public typealias AllCases = [Font.TextStyle]
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {

    /// Adds italics to the font.
    public func italic() -> Font

    /// Adjusts the font to enable all small capitals.
    ///
    /// See ``Font/lowercaseSmallCaps()`` and ``Font/uppercaseSmallCaps()`` for
    /// more details.
    public func smallCaps() -> Font

    /// Adjusts the font to enable lowercase small capitals.
    ///
    /// This function turns lowercase characters into small capitals for the
    /// font. It is generally used for display lines set in large and small
    /// caps, such as titles. It may include forms related to small capitals,
    /// such as old-style figures.
    public func lowercaseSmallCaps() -> Font

    /// Adjusts the font to enable uppercase small capitals.
    ///
    /// This feature turns capital characters into small capitals. It is
    /// generally used for words which would otherwise be set in all caps, such
    /// as acronyms, but which are desired in small-cap form to avoid disrupting
    /// the flow of text.
    public func uppercaseSmallCaps() -> Font

    /// Adjusts the font to use monospace digits.
    public func monospacedDigit() -> Font

    /// Sets the weight of the font.
    public func weight(_ weight: Font.Weight) -> Font

    /// Adds bold styling to the font.
    public func bold() -> Font

    /// Create a version of `self` that uses leading (line spacing) adjustment.
    ///
    /// The availability of leading adjustments depends on font.
    ///
    /// For example, `Font.body.tightLeading()` will return a `Font` in `body`
    /// text style with tight line spacing. This modifier may return the
    /// original `Font` unchanged for some fonts.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public func leading(_ leading: Font.Leading) -> Font

    /// A weight to use for fonts.
    @frozen public struct Weight : Hashable {

        public static let ultraLight: Font.Weight

        public static let thin: Font.Weight

        public static let light: Font.Weight

        public static let regular: Font.Weight

        public static let medium: Font.Weight

        public static let semibold: Font.Weight

        public static let bold: Font.Weight

        public static let heavy: Font.Weight

        public static let black: Font.Weight

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Font.Weight, b: Font.Weight) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public enum Leading {

        case standard

        case tight

        case loose

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Font.Leading, b: Font.Leading) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {

    /// Specifies a system font to use, along with the style, weight, and any
    /// design parameters you want applied to the text.
    ///
    /// Use this function to create a system font by specifying the size and
    /// weight, and a type design together. The following styles the system font
    /// as 17 point, ``Font/Weight/semibold`` text:
    ///
    ///     Text("Hello").font(.system(size: 17, weight: .semibold))
    ///
    /// While the following styles the text as 17 point ``Font/Weight/bold``,
    /// and applies a `serif` ``Font/Design`` to the system font:
    ///
    ///     Text("Hello").font(.system(size: 17, weight: .bold, design: .serif))
    ///
    /// If you want to use the default ``Font/Weight``
    /// (``Font/Weight/regular``), you don't need to specify the `weight` in the
    /// method. The following example styles the text as 17 point
    /// ``Font/Weight/regular``, and uses a ``Font/Design/rounded`` system font:
    ///
    ///     Text("Hello").font(.system(size: 17, design: .rounded))
    public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font

    /// A design to use for fonts.
    public enum Design : Hashable {

        case `default`

        @available(watchOS 7.0, *)
        case serif

        case rounded

        @available(watchOS 7.0, *)
        case monospaced

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Font.Design, b: Font.Design) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {

    /// Create a custom font with the given `name` and `size` that scales with
    /// the body text style.
    public static func custom(_ name: String, size: CGFloat) -> Font

    /// Create a custom font with the given `name` and `size` that scales
    /// relative to the given `textStyle`.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func custom(_ name: String, size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font

    /// Create a custom font with the given `name` and a fixed `size` that does
    /// not scale with Dynamic Type.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func custom(_ name: String, fixedSize: CGFloat) -> Font

    /// Creates a custom font from a platform font instance.
    ///
    /// Initializing ``Font`` with platform font instance
    /// (<doc://com.apple.documentation/documentation/CoreText/CTFont-q6r>) can bridge SwiftUI
    /// ``Font`` with <doc://com.apple.documentation/documentation/AppKit/NSFont> or
    /// <doc://com.apple.documentation/documentation/UIKit/UIFont>, both of which are
    /// toll-free bridged to
    /// <doc://com.apple.documentation/documentation/CoreText/CTFont-q6r>. For example:
    ///
    ///     // Use native Core Text API to create desired ctFont.
    ///     let ctFont = CTFontCreateUIFontForLanguage(.system, 12, nil)!
    ///
    ///     // Create SwiftUI Text with the CTFont instance.
    ///     let text = Text("Hello").font(Font(ctFont))
    public init(_ font: CTFont)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font.TextStyle : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font.TextStyle : Hashable {
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Font.Leading : Equatable {
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Font.Leading : Hashable {
}

/// A structure that computes views on demand from an underlying collection of
/// of identified data.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ForEach<Data, ID, Content> where Data : RandomAccessCollection, ID : Hashable {

    /// The collection of underlying identified data that SwiftUI uses to create
    /// views dynamically.
    public var data: Data

    /// A function you can use to create content on demand using the underlying
    /// data.
    public var content: (Data.Element) -> Content
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach : DynamicViewContent where Content : View {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach : View where Content : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach where ID == Data.Element.ID, Content : View, Data.Element : Identifiable {

    /// Creates an instance that uniquely identifies and creates views across
    /// updates based on the identity of the underlying data.
    ///
    /// It's important that the `id` of a data element doesn't change unless you
    /// replace the data element with a new data element that has a new
    /// identity. If the `id` of a data element changes, the content view
    /// generated from that data element loses any current state and animations.
    ///
    /// - Parameters:
    ///   - data: The identified data that the ``ForEach`` instance uses to
    ///     create views dynamically.
    ///   - content: The view builder that creates views dynamically.
    public init(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach where Content : View {

    /// Creates an instance that uniquely identifies and creates views across
    /// updates based on the provided key path to the underlying data's
    /// identifier.
    ///
    /// It's important that the `id` of a data element doesn't change, unless
    /// SwiftUI considers the data element to have been replaced with a new data
    /// element that has a new identity. If the `id` of a data element changes,
    /// then the content view generated from that data element will lose any
    /// current state and animations.
    ///
    /// - Parameters:
    ///   - data: The data that the `ForEach` instance uses to create views
    ///     dynamically.
    ///   - id: The key path to the provided data's identifier.
    ///   - content: The view builder that creates views dynamically.
    public init(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder content: @escaping (Data.Element) -> Content)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach where Data == Range<Int>, ID == Int, Content : View {

    /// Creates an instance that computes views on demand over a given constant
    /// range.
    ///
    /// The instance only reads the initial value of the provided `data` and
    /// doesn't need to identify views across updates. To compute views on
    /// demand over a dynamic range, use ``ForEach/init(_:id:content:)``.
    ///
    /// - Parameters:
    ///   - data: A constant range.
    ///   - content: The view builder that creates views dynamically.
    public init(_ data: Range<Int>, @ViewBuilder content: @escaping (Int) -> Content)
}

/// A style that shows the correct fill for the foreground based on the current
/// context.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ForegroundStyle {

    @inlinable public init()
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForegroundStyle : ShapeStyle {
}

/// A container for grouping controls used for data entry, such as in settings
/// or inspectors.
///
/// SwiftUI renders forms in a manner appropriate for the platform. For example,
/// on iOS, forms appear as grouped lists. Use ``Section`` to group different
/// parts of a form's content.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Form<Content> : View where Content : View {

    public init(@ViewBuilder content: () -> Content)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

/// An effect that changes the visual appearance of a view, largely without
/// changing its ancestors or descendants.
///
/// The only change the effect makes to the view's ancestors and descendants is
/// to change the coordinate transform to and from them.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol GeometryEffect : Animatable, ViewModifier where Self.Body == Never {

    /// Returns the current value of the effect.
    func effectValue(size: CGSize) -> ProjectionTransform
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension GeometryEffect {

    /// Returns an effect that produces the same geometry transform as this
    /// effect, but only applies the transform while rendering its view.
    ///
    /// Use this method to disable layout changes during transitions. The view
    /// ignores the transform returned by this method while the view is
    /// performing its layout calculations.
    @inlinable public func ignoredByLayout() -> _IgnoredByLayoutEffect<Self>
}

/// A proxy for access to the size and coordinate space (for anchor resolution)
/// of the container view.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct GeometryProxy {

    /// The size of the container view.
    public var size: CGSize { get }

    /// Resolves the value of `anchor` to the container view.
    public subscript<T>(anchor: Anchor<T>) -> T { get }

    /// The safe area inset of the container view.
    public var safeAreaInsets: EdgeInsets { get }

    /// Returns the container view's bounds rectangle, converted to a defined
    /// coordinate space.
    public func frame(in coordinateSpace: CoordinateSpace) -> CGRect
}

/// A container view that defines its content as a function of its own size and
/// coordinate space.
///
/// This view returns a flexible preferred size to its parent layout.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct GeometryReader<Content> : View where Content : View {

    public var content: (GeometryProxy) -> Content

    @inlinable public init(@ViewBuilder content: @escaping (GeometryProxy) -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// An instance that matches a sequence of events to a gesture, and returns a
/// stream of values for each of its states.
///
/// Create custom gestures by declaring types that conform to the `Gesture`
/// protocol.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol Gesture {

    /// The type representing the gesture's value.
    associatedtype Value

    /// The type of gesture representing the body of `Self`.
    associatedtype Body : Gesture

    /// The content and behavior of the gesture.
    var body: Self.Body { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Sequences a gesture with another one to create a new gesture, which
    /// results in the second gesture only receiving events after the first
    /// gesture succeeds.
    ///
    /// - Parameter other: A gesture you want to combine with another gesture to
    ///   create a new, sequenced gesture.
    ///
    /// - Returns: A gesture that's a sequence of two gestures.
    @inlinable public func sequenced<Other>(before other: Other) -> SequenceGesture<Self, Other> where Other : Gesture
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Combines a gesture with another gesture to create a new gesture that
    /// recognizes both gestures at the same time.
    ///
    /// - Parameter other: A gesture that you want to combine with your gesture
    ///   to create a new, combined gesture.
    ///
    /// - Returns: A gesture with two simultaneous gestures.
    @inlinable public func simultaneously<Other>(with other: Other) -> SimultaneousGesture<Self, Other> where Other : Gesture
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Adds an action to perform when the gesture ends.
    ///
    /// - Parameter action: The action to perform when this gesture ends. The
    ///   `action` closure's parameter contains the final value of the gesture.
    ///
    /// - Returns: A gesture that triggers `action` when the gesture ends.
    public func onEnded(_ action: @escaping (Self.Value) -> Void) -> _EndedGesture<Self>
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture where Self.Value : Equatable {

    /// Adds an action to perform when the gesture's value changes.
    ///
    /// - Parameter action: The action to perform when this gesture's value
    ///   changes. The `action` closure's parameter contains the gesture's new
    ///   value.
    ///
    /// - Returns: A gesture that triggers `action` when this gesture's value
    ///   changes.
    public func onChanged(_ action: @escaping (Self.Value) -> Void) -> _ChangedGesture<Self>
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Returns a gesture that's the result of mapping the given closure over
    /// the gesture.
    public func map<T>(_ body: @escaping (Self.Value) -> T) -> _MapGesture<Self, T>
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Combines two gestures exclusively to create a new gesture where only one
    /// gesture succeeds, giving precedence to the first gesture.
    ///
    /// - Parameter other: A gesture you combine with your gesture, to create a
    ///   new, combined gesture.
    ///
    /// - Returns: A gesture that's the result of combining two gestures where
    ///   only one of them can succeed. SwiftUI gives precedence to the first
    ///   gesture.
    @inlinable public func exclusively<Other>(before other: Other) -> ExclusiveGesture<Self, Other> where Other : Gesture
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Updates the provided gesture state property as the gesture's value
    /// changes.
    ///
    /// Use this callback to update transient UI state as described in
    /// <doc:Adding-Interactivity-with-Gestures>.
    ///
    /// - Parameters:
    ///   - state: A binding to a view's ``GestureState`` property.
    ///   - body: The callback that SwiftUI invokes as the gesture's value
    ///     changes. Its `currentState` parameter is the updated state of the
    ///     gesture. The `gestureState` parameter is the previous state of the
    ///     gesture, and the `transaction` is the context of the gesture.
    ///
    /// - Returns: A version of the gesture that updates the provided `state` as
    ///   the originating gesture's value changes, and that resets the `state`
    ///   to its initial value when the users cancels or ends the gesture.
    @inlinable public func updating<State>(_ state: GestureState<State>, body: @escaping (Self.Value, inout State, inout Transaction) -> Void) -> GestureStateGesture<Self, State>
}

/// Options that control how adding a gesture to a view affect's other gestures
/// recognized by the view and its subviews.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct GestureMask : OptionSet {

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
    public let rawValue: UInt32

    /// Creates a new option set from the given raw value.
    ///
    /// This initializer always succeeds, even if the value passed as `rawValue`
    /// exceeds the static properties declared as part of the option set. This
    /// example creates an instance of `ShippingOptions` with a raw value beyond
    /// the highest element, with a bit mask that effectively contains all the
    /// declared static members.
    ///
    ///     let extraOptions = ShippingOptions(rawValue: 255)
    ///     print(extraOptions.isStrictSuperset(of: .all))
    ///     // Prints "true"
    ///
    /// - Parameter rawValue: The raw value of the option set to create. Each bit
    ///   of `rawValue` potentially represents an element of the option set,
    ///   though raw values may include bits that are not defined as distinct
    ///   values of the `OptionSet` type.
    public init(rawValue: UInt32)

    /// Disable all gestures in the subview hierarchy, including the added
    /// gesture.
    public static let none: GestureMask

    /// Enable the added gesture but disable all gestures in the subview
    /// hierarchy.
    public static let gesture: GestureMask

    /// Enable all gestures in the subview hierarchy but disable the added
    /// gesture.
    public static let subviews: GestureMask

    /// Enable both the added gesture as well as all other gestures on the view
    /// and its subviews.
    public static let all: GestureMask

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = GestureMask

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = GestureMask

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = UInt32
}

/// A property wrapper type that updates a property while the user performs a
/// gesture and resets the property back to its initial state when the gesture
/// ends.
///
/// Declare a property as `@GestureState`, pass as a binding to it as a
/// parameter to a gesture's ``Gesture/updating(_:body:)`` callback, and receive
/// updates to it. A property that's declared as `@GestureState` implicitly
/// resets when the gesture becomes inactive, making it suitable for tracking
/// transient state.
///
/// Add a long-press gesture to a ``Circle``, and update the interface during
/// the gesture by declaring a property as `@GestureState`:
///
///     struct SimpleLongPressGestureView: View {
///         @GestureState var isDetectingLongPress = false
///
///         var longPress: some Gesture {
///             LongPressGesture(minimumDuration: 3)
///                 .updating($isDetectingLongPress) { currentstate, gestureState, transaction in
///                     gestureState = currentstate
///                 }
///         }
///
///         var body: some View {
///             Circle()
///                 .fill(self.isDetectingLongPress ? Color.red : Color.green)
///                 .frame(width: 100, height: 100, alignment: .center)
///                 .gesture(longPress)
///         }
///     }
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper @frozen public struct GestureState<Value> : DynamicProperty {

    /// Creates a view state that's derived from a gesture.
    ///
    /// - Parameter wrappedValue: A wrapped value for the gesture state
    ///   property.
    public init(wrappedValue: Value)

    /// Creates a view state that's derived from a gesture with an initial
    /// value.
    ///
    /// - Parameter initialValue: An initial value for the gesture state
    ///   property.
    public init(initialValue: Value)

    /// Creates a view state that's derived from a gesture with a wrapped state
    /// value and a transaction to reset it.
    ///
    /// - Parameters:
    ///   - wrappedValue: A wrapped value for the gesture state property.
    ///   - resetTransaction: A transaction that provides metadata for view
    ///     updates.
    public init(wrappedValue: Value, resetTransaction: Transaction)

    /// Creates a view state that's derived from a gesture with an initial state
    /// value and a transaction to reset it.
    ///
    /// - Parameters:
    ///   - initialValue: An initial state value.
    ///   - resetTransaction: A transaction that provides metadata for view
    ///     updates.
    public init(initialValue: Value, resetTransaction: Transaction)

    /// Creates a view state that's derived from a gesture with a wrapped state
    /// value and a closure that provides a transaction to reset it.
    ///
    /// - Parameters:
    ///   - wrappedValue: A wrapped value for the gesture state property.
    ///   - reset: A closure that provides a ``Transaction``.
    public init(wrappedValue: Value, reset: @escaping (Value, inout Transaction) -> Void)

    /// Creates a view state that's derived from a gesture with an initial state
    /// value and a closure that provides a transaction to reset it.
    ///
    /// - Parameters:
    ///   - initialValue: An initial state value.
    ///   - reset: A closure that provides a ``Transaction``.
    public init(initialValue: Value, reset: @escaping (Value, inout Transaction) -> Void)

    /// The wrapped value referenced by the gesture state property.
    public var wrappedValue: Value { get }

    /// A binding to the gesture state property.
    public var projectedValue: GestureState<Value> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension GestureState where Value : ExpressibleByNilLiteral {

    /// Creates a view state that's derived from a gesture with a transaction to
    /// reset it.
    ///
    /// - Parameter resetTransaction: A transaction that provides metadata for
    ///   view updates.
    public init(resetTransaction: Transaction = Transaction())

    /// Creates a view state that's derived from a gesture with a closure that
    /// provides a transaction to reset it.
    ///
    /// - Parameter reset: A closure that provides a ``Transaction``.
    public init(reset: @escaping (Value, inout Transaction) -> Void)
}

/// A gesture that updates the state provided by a gesture's updating callback.
///
/// A gesture's ``Gesture/updating(_:body:)`` callback returns a
/// `GestureStateGesture` instance for updating a transient state property
/// that's annotated with the ``GestureState`` property wrapper.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct GestureStateGesture<Base, State> : Gesture where Base : Gesture {

    /// The type representing the gesture's value.
    public typealias Value = Base.Value

    /// The originating gesture.
    public var base: Base

    /// A value that changes as the user performs the gesture.
    public var state: GestureState<State>

    /// The updating gesture containing the originating gesture's value, the
    /// updated state of the gesture, and a transaction.
    public var body: (GestureStateGesture<Base, State>.Value, inout State, inout Transaction) -> Void

    /// Creates a new gesture that's the result of an ongoing gesture.
    ///
    /// - Parameters:
    ///   - base: The originating gesture.
    ///   - state: The wrapped value of a ``GestureState`` property.
    ///   - body: The callback that SwiftUI invokes as the gesture's value
    ///     changes.
    @inlinable public init(base: Base, state: GestureState<State>, body: @escaping (GestureStateGesture<Base, State>.Value, inout State, inout Transaction) -> Void)

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

/// A color gradient represented as an array of color stops, each having a
/// parametric location value.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Gradient : Equatable {

    /// One color stop in the gradient.
    @frozen public struct Stop : Equatable {

        /// The color for the stop.
        public var color: Color

        /// The parametric location of the stop.
        ///
        /// This value must be in the range `[0, 1]`.
        public var location: CGFloat

        /// Creates a color stop with a color and location.
        public init(color: Color, location: CGFloat)

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Gradient.Stop, b: Gradient.Stop) -> Bool
    }

    /// The array of color stops.
    public var stops: [Gradient.Stop]

    /// Creates a gradient from an array of color stops.
    public init(stops: [Gradient.Stop])

    /// Creates a gradient from an array of colors.
    ///
    /// The gradient synthesizes its location values to evenly space the colors
    /// along the gradient.
    public init(colors: [Color])

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Gradient, b: Gradient) -> Bool
}

/// A system style of `DatePicker` that displays an interactive calendar or
/// clock.
///
/// This style is useful when wanting to allow browsing through days in a
/// calendar, or when the look of a clock face is appropriate.
@available(iOS 14.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct GraphicalDatePickerStyle : DatePickerStyle {

    public init()
}

/// A description of a single grid item, such as a row or a column.
///
/// You use `GridItem` instances to configure the layout of items in
/// ``LazyHGrid`` and ``LazyVGrid`` views. Each grid item specifies layout
/// properties like spacing and alignment, which the grid view uses to size and
/// position all items in a given column or row.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct GridItem {

    /// The size in the minor axis of one or more rows or columns in a grid
    /// layout.
    public enum Size {

        /// A single item with the specified fixed size.
        case fixed(CGFloat)

        /// A single flexible item.
        ///
        /// The size of this item is the size of the grid with spacing and
        /// inflexible items removed, divided by the number of flexible items,
        /// clamped to the provided bounds.
        case flexible(minimum: CGFloat = 10, maximum: CGFloat = .infinity)

        /// Multiple items in the space of a single flexible item.
        ///
        /// This size case places one or more items into the space assigned to
        /// a single `flexible` item, using the provided bounds and
        /// spacing to decide exactly how many items fit. This approach prefers
        /// to insert as many items of the `minimum` size as possible
        /// but lets them increase to the `maximum` size.
        case adaptive(minimum: CGFloat, maximum: CGFloat = .infinity)
    }

    /// The size of the item, which is the width of a column item or the
    /// height of a row item.
    public var size: GridItem.Size

    /// The spacing to the next item.
    ///
    /// If this value is `nil`, the item uses a reasonable default for the
    /// current platform.
    public var spacing: CGFloat?

    /// The alignment to use when placing each view.
    ///
    /// Use this property to anchor the view's relative position to the same
    /// relative position in the view's assigned grid space.
    public var alignment: Alignment?

    /// Creates a grid item with the provided size, spacing, and alignment
    /// properties.
    ///
    /// - Parameters:
    ///   - size: The size of the grid item.
    ///   - spacing: The spacing to use between this and the next item.
    ///   - alignment: The alignment to use for this grid item.
    public init(_ size: GridItem.Size = .flexible(), spacing: CGFloat? = nil, alignment: Alignment? = nil)
}

/// An affordance for grouping view content.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Group<Content> {

    /// The type of content representing the body of this toolbar content.
    public typealias Body = Never
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Group : ToolbarContent where Content : ToolbarContent {

    public init(@ToolbarContentBuilder content: () -> Content)
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Group : CustomizableToolbarContent where Content : CustomizableToolbarContent {

    public init(@ToolbarContentBuilder content: () -> Content)
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Group : Scene where Content : Scene {

    @inlinable public init(@SceneBuilder content: () -> Content)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Group : View where Content : View {

    @inlinable public init(@ViewBuilder content: () -> Content)
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Group : Commands where Content : Commands {

    @inlinable public init(@CommandsBuilder content: () -> Content)
}

/// A stylized view with an optional label that is associated with a logical
/// grouping of content.
@available(iOS 14.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct GroupBox<Label, Content> : View where Label : View, Content : View {

    public init(label: Label, @ViewBuilder content: () -> Content)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension GroupBox where Label == GroupBoxStyleConfiguration.Label, Content == GroupBoxStyleConfiguration.Content {

    /// Creates an instance representing the configuration of a `GroupBoxStyle`.
    public init(_ configuration: GroupBoxStyleConfiguration)
}

@available(iOS 14.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension GroupBox where Label == EmptyView {

    public init(@ViewBuilder content: () -> Content)
}

/// Defines the implementation of all `GroupBox` instances within a view
/// hierarchy.
///
/// To configure the current `GroupBoxStyle` for a view hiearchy, use the
/// `.groupBoxStyle()` modifier.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol GroupBoxStyle {

    /// A `View` representing the body of a `GroupBox`.
    associatedtype Body : View

    /// Creates a `View` representing the body of a `GroupBox`.
    ///
    /// - Parameter configuration: The properties of the group box instance being
    ///   created.
    ///
    /// This method will be called for each instance of `GroupBox` created within
    /// a view hierarchy where this style is the current `GroupBoxStyle`.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a `GroupBox` instance being created.
    typealias Configuration = GroupBoxStyleConfiguration
}

/// The properties of a `GroupBox` instance being created.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct GroupBoxStyleConfiguration {

    /// A type-erased label of a `GroupBox`.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A type-erased content of a `GroupBox`.
    public struct Content : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A view that describes the `GroupBox`.
    public let label: GroupBoxStyleConfiguration.Label

    /// A view that represents the content of the `GroupBox`.
    public let content: GroupBoxStyleConfiguration.Content
}

/// The instance that describes the behavior and appearance of a grouped list.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct GroupedListStyle : ListStyle {

    /// Creates a grouped list style.
    public init()
}

/// A view that arranges its children in a horizontal line.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct HStack<Content> : View where Content : View {

    /// Creates an instance with the given spacing and vertical alignment.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. It has
    ///     the same vertical screen coordinate for all children.
    ///   - spacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - content: A view builder that creates the content of this stack.
    @inlinable public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// An alignment position along the horizontal axis.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct HorizontalAlignment : Equatable {

    /// Creates an instance with the given identifier.
    ///
    /// Each instance needs a unique identifier.
    ///
    /// - Parameter id: An identifier that uniquely identifies the horizontal
    ///   alignment.
    public init(_ id: AlignmentID.Type)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: HorizontalAlignment, b: HorizontalAlignment) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension HorizontalAlignment {

    /// A guide marking the leading edge of the view.
    public static let leading: HorizontalAlignment

    /// A guide marking the horizontal center of the view.
    public static let center: HorizontalAlignment

    /// A guide marking the trailing edge of the view.
    public static let trailing: HorizontalAlignment
}

/// An effect applied when the pointer hovers over a view.
@available(iOS 13.4, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct HoverEffect {

    /// An effect  that attempts to determine the effect automatically.
    /// This is the default effect.
    public static let automatic: HoverEffect

    /// An effect  that morphs the pointer into a platter behind the view
    /// and shows a light source indicating position.
    public static let highlight: HoverEffect

    /// An effect that slides the pointer under the view and disappears as the
    /// view scales up and gains a shadow.
    public static let lift: HoverEffect
}

/// A label style that only displays the icon of the label.
///
/// The title of the label is still used for non-visual descriptions, such as
/// VoiceOver.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct IconOnlyLabelStyle : LabelStyle {

    /// Creates an icon-only label style.
    public init()

    /// Creates a view that represents the body of a label.
    ///
    /// The system calls this method for each ``Label`` instance in a view
    /// hierarchy where this style is the current label style.
    ///
    /// - Parameter configuration: The properties of the label.
    public func makeBody(configuration: IconOnlyLabelStyle.Configuration) -> some View


    /// A view that represents the body of a label.
    public typealias Body = some View
}

/// A view that displays an environment-dependent image.
///
/// An `Image` is a late-binding token; the system resolves its actual value
/// only when it's about to use the image in a given environment.
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
    public static func == (lhs: Image, rhs: Image) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// Creates a labeled image that you can use as content for controls.
    ///
    /// - Parameters:
    ///   - name: the name of the image resource to lookup, as well as the
    ///     localization key with which to label the image.
    ///   - bundle: the bundle to search for the image resource and localization
    ///     content. If `nil`, uses the main `Bundle`. Defaults to `nil`.
    public init(_ name: String, bundle: Bundle? = nil)

    /// Creates a labeled image that you can use as content for controls, with
    /// the specified label.
    ///
    /// - Parameters:
    ///   - name: the name of the image resource to lookup
    ///   - bundle: the bundle to search for the image resource. If `nil`, uses
    ///     the main `Bundle`. Defaults to `nil`.
    ///   - label: The label associated with the image. The label is used for
    ///     things like accessibility.
    public init(_ name: String, bundle: Bundle? = nil, label: Text)

    /// Creates an unlabeled, decorative image.
    ///
    /// This image is ignored for accessibility purposes.
    ///
    /// - Parameters:
    ///   - name: the name of the image resource to lookup
    ///   - bundle: the bundle to search for the image resource. If `nil`, uses
    ///     the main `Bundle`. Defaults to `nil`.
    public init(decorative name: String, bundle: Bundle? = nil)

    /// Creates a system symbol image.
    ///
    /// This initializer creates an image using a system-provided symbol. To
    /// create a custom symbol image from your app's asset catalog, use
    /// `init(_:)` instead.
    ///
    /// - Parameters:
    ///   - systemName: The name of the system symbol image.
    ///     Use the SF Symbols app to look up the names of system symbol images.
    @available(macOS 11.0, *)
    public init(systemName: String)
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

    public func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Image
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// The orientation of an image.
    @frozen public enum Orientation : UInt8, CaseIterable, Hashable {

        case up

        case upMirrored

        case down

        case downMirrored

        case left

        case leftMirrored

        case right

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
        public init?(rawValue: UInt8)

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

    public enum TemplateRenderingMode {

        case template

        case original

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.TemplateRenderingMode, b: Image.TemplateRenderingMode) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }

    /// The scale to apply to vector images relative to text.
    @available(macOS 11.0, *)
    public enum Scale {

        case small

        case medium

        case large

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.Scale, b: Image.Scale) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    public enum Interpolation {

        case none

        case low

        case medium

        case high

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.Interpolation, b: Image.Interpolation) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    public func interpolation(_ interpolation: Image.Interpolation) -> Image

    public func antialiased(_ isAntialiased: Bool) -> Image
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// Creates a labeled image based on a `CGImage`, usable as content for
    /// controls.
    ///
    /// - Parameters:
    ///   - cgImage: the base graphical image
    ///   - scale: the scale factor the image is intended for
    ///     (e.g. 1.0, 2.0, 3.0)
    ///   - orientation: the orientation of the image
    ///   - label: The label associated with the image. The label is used for
    ///     things like accessibility.
    public init(_ cgImage: CGImage, scale: CGFloat, orientation: Image.Orientation = .up, label: Text)

    /// Creates an unlabeled, decorative image based on a `CGImage`.
    ///
    /// This image is ignored for accessibility purposes.
    ///
    /// - Parameters:
    ///   - cgImage: the base graphical image
    ///   - scale: the scale factor the image is intended for
    ///     (e.g. 1.0, 2.0, 3.0)
    ///   - orientation: the orientation of the image
    public init(decorative cgImage: CGImage, scale: CGFloat, orientation: Image.Orientation = .up)
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension Image {

    public init(uiImage: UIImage)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    public enum ResizingMode {

        case tile

        case stretch

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.ResizingMode, b: Image.ResizingMode) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }

    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.Orientation : RawRepresentable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.TemplateRenderingMode : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.TemplateRenderingMode : Hashable {
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 11.0, *)
extension Image.Scale : Equatable {
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 11.0, *)
extension Image.Scale : Hashable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.Interpolation : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.Interpolation : Hashable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.ResizingMode : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.ResizingMode : Hashable {
}

/// A shape style that fills a shape by repeating a region of an image.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ImagePaint : ShapeStyle {

    /// The image to be drawn.
    public var image: Image

    /// A unit-space rectangle defining how much of the source image to draw.
    ///
    /// The results are undefined if this rectangle selects areas outside the
    /// `[0, 1]` range in either axis.
    public var sourceRect: CGRect

    /// A scale factor applied to the image while being drawn.
    public var scale: CGFloat

    /// Creates a shape-filling shape style.
    ///
    /// - Parameters:
    ///   - image: The image to be drawn.
    ///   - sourceRect: A unit-space rectangle defining how much of the source
    ///     image to draw. The results are undefined if `sourceRect` selects
    ///     areas outside the `[0, 1]` range in either axis.
    ///   - scale: A scale factor applied to the image during rendering.
    public init(image: Image, sourceRect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1), scale: CGFloat = 1)
}

/// Defines the implementation of all `IndexView` instances within a view
/// hierarchy.
///
/// To configure the current `IndexViewStyle` for a view hierarchy, use the
/// `.indexViewStyle()` modifier.
@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public protocol IndexViewStyle {
}

/// A `PickerStyle` where each option is displayed inline with
/// other views in the current container.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct InlinePickerStyle : PickerStyle {

    /// Creates an inline picker style.
    public init()
}

/// The instance that describes the behavior and appearance of an inset grouped list.
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct InsetGroupedListStyle : ListStyle {

    /// Creates an inset grouped list style.
    public init()
}

/// The behavior and appearance of an inset list.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct InsetListStyle : ListStyle {

    /// Creates an inset list style.
    public init()
}

/// A shape type that is able to inset itself to produce another shape.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol InsettableShape : Shape {

    /// The type of the inset shape.
    associatedtype InsetShape : InsettableShape

    /// Returns `self` inset by `amount`.
    func inset(by amount: CGFloat) -> Self.InsetShape
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension InsettableShape {

    /// Returns a view that is the result of insetting `self` by
    /// `style.lineWidth / 2`, stroking the resulting shape with
    /// `style`, and then filling with `content`.
    @inlinable public func strokeBorder<S>(_ content: S, style: StrokeStyle, antialiased: Bool = true) -> some View where S : ShapeStyle


    /// Returns a view that is the result of insetting `self` by
    /// `style.lineWidth / 2`, stroking the resulting shape with
    /// `style`, and then filling with the foreground color.
    @inlinable public func strokeBorder(style: StrokeStyle, antialiased: Bool = true) -> some View


    /// Returns a view that is the result of filling the `width`-sized
    /// border (aka inner stroke) of `self` with `content`. This is
    /// equivalent to insetting `self` by `width / 2` and stroking the
    /// resulting shape with `width` as the line-width.
    @inlinable public func strokeBorder<S>(_ content: S, lineWidth: CGFloat = 1, antialiased: Bool = true) -> some View where S : ShapeStyle


    /// Returns a view that is the result of filling the `width`-sized
    /// border (aka inner stroke) of `self` with the foreground color.
    /// This is equivalent to insetting `self` by `width / 2` and
    /// stroking the resulting shape with `width` as the line-width.
    @inlinable public func strokeBorder(lineWidth: CGFloat = 1, antialiased: Bool = true) -> some View

}

/// Key equivalents consist of a letter, punctuation, or function key that can
/// be combined with an optional set of modifier keys to specify a keyboard
/// shortcut.
///
/// Key equivalents are used to establish keyboard shortcuts to app
/// functionality. Any key can be used as a key equivalent as long as pressing
/// it produces a single character value. Key equivalents are typically
/// initialized using a single-character string literal, with constants for
/// unprintable or hard-to-type values.
///
/// The modifier keys necessary to type a key equivalent are factored in to the
/// resulting keyboard shortcut. That is, a key equivalent whose raw value is
/// the capitalized string "A" corresponds with the keyboard shortcut
/// Command-Shift-A. The exact mapping may depend on the keyboard layout—for
/// example, a key equivalent whith the character value "}" produces a shortcut
/// equivalent to Command-Shift-] on ANSI keyboards, but would produce a
/// different shortcut for keyboard layouts where punctuation characters are in
/// different locations.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct KeyEquivalent {

    /// Up Arrow (U+F700)
    public static let upArrow: KeyEquivalent

    /// Down Arrow (U+F701)
    public static let downArrow: KeyEquivalent

    /// Left Arrow (U+F702)
    public static let leftArrow: KeyEquivalent

    /// Right Arrow (U+F703)
    public static let rightArrow: KeyEquivalent

    /// Escape (U+001B)
    public static let escape: KeyEquivalent

    /// Delete (U+0008)
    public static let delete: KeyEquivalent

    /// Delete Forward (U+F728)
    public static let deleteForward: KeyEquivalent

    /// Home (U+F729)
    public static let home: KeyEquivalent

    /// End (U+F72B)
    public static let end: KeyEquivalent

    /// Page Up (U+F72C)
    public static let pageUp: KeyEquivalent

    /// Page Down (U+F72D)
    public static let pageDown: KeyEquivalent

    /// Clear (U+F739)
    public static let clear: KeyEquivalent

    /// Tab (U+0009)
    public static let tab: KeyEquivalent

    /// Space (U+0020)
    public static let space: KeyEquivalent

    /// Return (U+000D)
    public static let `return`: KeyEquivalent

    /// The character value that the key equivalent represents.
    public var character: Character

    /// Creates a new key equivalent from the given character value.
    public init(_ character: Character)
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension KeyEquivalent : ExpressibleByExtendedGraphemeClusterLiteral {

    /// Creates an instance initialized to the given value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(extendedGraphemeClusterLiteral: Character)

    /// A type that represents an extended grapheme cluster literal.
    ///
    /// Valid types for `ExtendedGraphemeClusterLiteralType` are `Character`,
    /// `String`, and `StaticString`.
    public typealias ExtendedGraphemeClusterLiteralType = Character

    /// A type that represents a Unicode scalar literal.
    ///
    /// Valid types for `UnicodeScalarLiteralType` are `Unicode.Scalar`,
    /// `Character`, `String`, and `StaticString`.
    public typealias UnicodeScalarLiteralType = Character
}

/// Keyboard shortcuts describe combinations of keys on a keyboard that the user
/// can press in order to activate a button or toggle.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct KeyboardShortcut {

    /// The standard keyboard shortcut for the default button, consisting of
    /// the Return (↩) key and no modifiers.
    ///
    /// On macOS, the default button is designated with special coloration. If
    /// more than one control is assigned this shortcut, only the first one is
    /// emphasized.
    public static let defaultAction: KeyboardShortcut

    /// The standard keyboard shortcut for cancelling the in-progress action
    /// or dismissing a prompt, consisting of the Escape (⎋) key and no
    /// modifiers.
    public static let cancelAction: KeyboardShortcut

    /// The key equivalent that the user presses in conjunction with any
    /// specified modifier keys to activate the shortcut.
    public var key: KeyEquivalent

    /// The modifier keys that the user presses in conjunction with a key
    /// equivalent to activate the shortcut.
    public var modifiers: EventModifiers

    /// Creates a new keyboard shortcut with the given key equivalent and set of
    /// modifier keys.
    public init(_ key: KeyEquivalent, modifiers: EventModifiers = .command)
}

/// A standard label for user interface items, consisting of an icon with a
/// title.
///
/// One of the most common and recognizable user interface components is the
/// combination of an icon and a label. This idiom appears across many kinds of
/// apps and shows up in collections, lists, menus of action items, and
/// disclosable lists, just to name a few.
///
/// You create a label, in its simplest form, by providing a title and the name
/// of an image, such as an icon from the
/// [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/)
/// collection:
///
///     Label("Lightning", systemImage: "bolt.fill")
///
/// You can also apply styles to labels in several ways. In the case of dynamic
/// changes to the view after device rotation or change to a window size you
/// might want to show only the text portion of the label using the title-only
/// label style:
///
///     Label("Lightning", systemImage: "bolt.fill")
///         .labelStyle(TitleOnlyLabelStyle())
///
/// Conversely, there's also an icon-only label style:
///
///     Label("Lightning", systemImage: "bolt.fill")
///         .labelStyle(IconOnlyLabelStyle())
///
/// You can also create a customized label style by modifying an existing
/// style; this example adds a red border to the default label style:
///
///     struct RedBorderedLabelStyle : LabelStyle {
///         func makeBody(configuration: Configuration) -> some View {
///             Label(configuration)
///                 .border(Color.red)
///         }
///     }
///
/// For more extensive customization or to create a completely new label style,
/// you'll need to adopt the ``LabelStyle`` protocol and implement a
/// ``LabelStyleConfiguration`` for the new style.
///
/// To apply a common label style to a group of labels, apply the style
/// to the view hierarchy that contains the labels:
///
///     VStack {
///         Label("Rain", systemImage: "cloud.rain")
///         Label("Snow", systemImage: "snow")
///         Label("Sun", systemImage: "sun.max")
///     }
///     .labelStyle(IconOnlyLabelStyle())
///
/// It's also possible to make labels using views to compose the label's icon
/// programmatically, rather than using a pre-made image. In this example, the
/// icon portion of the label uses a filled ``Circle`` overlaid
/// with the user's initials:
///
///     Label {
///         Text(person.fullName)
///             .font(.body)
///             .foregroundColor(.primary)
///         Text(person.title)
///             .font(.subheadline)
///             .foregroundColor(.secondary)
///     } icon: {
///         Circle()
///             .fill(person.profileColor)
///             .frame(width: 44, height: 44, alignment: .center)
///             .overlay(Text(person.initials))
///     }
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct Label<Title, Icon> : View where Title : View, Icon : View {

    /// Creates a label with a custom title and icon.
    public init(@ViewBuilder title: () -> Title, @ViewBuilder icon: () -> Icon)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Label where Title == Text, Icon == Image {

    /// Creates a label with an icon image and a title generated from a
    /// localized string.
    ///
    /// - Parameters:
    ///    - titleKey: A title generated from a localized string.
    ///    - image: The name of the image resource to lookup.
    public init(_ titleKey: LocalizedStringKey, image name: String)

    /// Creates a label with a system icon image and a title generated from a
    /// localized string.
    ///
    /// - Parameters:
    ///    - titleKey: A title generated from a localized string.
    ///    - systemImage: The name of the image resource to lookup.
    public init(_ titleKey: LocalizedStringKey, systemImage name: String)

    /// Creates a label with an icon image and a title generated from a string.
    ///
    /// - Parameters:
    ///    - title: A string to used as the label's title.
    ///    - image: The name of the image resource to lookup.
    public init<S>(_ title: S, image name: String) where S : StringProtocol

    /// Creates a label with a system icon image and a title generated from a
    /// string.
    ///
    /// - Parameters:
    ///    - title: A string to used as the label's title.
    ///    - systemImage: The name of the image resource to lookup.
    public init<S>(_ title: S, systemImage name: String) where S : StringProtocol
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Label where Title == LabelStyleConfiguration.Title, Icon == LabelStyleConfiguration.Icon {

    /// Creates a label representing the configuration of a style.
    ///
    /// You can use this initializer within the ``LabelStyle/makeBody(configuration:)``
    /// method of a ``LabelStyle`` instance to create an instance of the label
    /// that's being styled. This is useful for custom label styles that only
    /// wish to modify the current style, as opposed to implementing a brand new
    /// style.
    ///
    /// For example, the following style adds a red border around the label,
    /// but otherwise preserves the current style:
    ///
    ///     struct RedBorderedLabelStyle : LabelStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             Label(configuration)
    ///                 .border(Color.red)
    ///         }
    ///     }
    ///
    /// - Parameter configuration: The label style to use.
    public init(_ configuration: LabelStyleConfiguration)
}

/// A type that applies a custom appearance to all labels within a view.
///
/// To configure the current label style for a view hierarchy, use the
/// ``View/labelStyle(_:)`` modifier.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol LabelStyle {

    /// A view that represents the body of a label.
    associatedtype Body : View

    /// Creates a view that represents the body of a label.
    ///
    /// The system calls this method for each ``Label`` instance in a view
    /// hierarchy where this style is the current label style.
    ///
    /// - Parameter configuration: The properties of the label.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a label.
    typealias Configuration = LabelStyleConfiguration
}

/// The properties of a label.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LabelStyleConfiguration {

    /// A type-erased title view of a label.
    public struct Title {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A type-erased icon view of a label.
    public struct Icon {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A description of the labeled item.
    public var title: LabelStyleConfiguration.Title { get }

    /// A symbolic representation of the labeled item.
    public var icon: LabelStyleConfiguration.Icon { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LabelStyleConfiguration.Title : View {
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LabelStyleConfiguration.Icon : View {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum LayoutDirection : Hashable, CaseIterable {

    case leftToRight

    case rightToLeft

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: LayoutDirection, b: LayoutDirection) -> Bool

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
    public func hash(into hasher: inout Hasher)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [LayoutDirection]

    /// A collection of all values of this type.
    public static var allCases: [LayoutDirection] { get }
}

extension LayoutDirection {

    /// Create a direction from its UITraitEnvironmentLayoutDirection equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiLayoutDirection: UITraitEnvironmentLayoutDirection)
}

/// A container view that arranges its child views in a grid that
/// grows horizontally, creating items only as needed.
///
/// The grid is "lazy," in that the grid view does not create items until
/// they are needed.
///
/// In the following example, a ``ScrollView`` contains a `LazyHGrid` that
/// consists of a horizontally-arranged grid of ``Text`` views, aligned to
/// the top of the scroll view. For each column in the grid, the top row shows
/// a Unicode code point from the "Smileys" group, and the bottom shows its
/// corresponding emoji.
///
///     var rows: [GridItem] =
///             Array(repeating: .init(.fixed(20)), count: 2)
///     ScrollView(.horizontal) {
///         LazyHGrid(rows: rows, alignment: .top) {
///             ForEach((0...79), id: \.self) {
///                 let codepoint = $0 + 0x1f600
///                 let codepointString = String(format: "%02X", codepoint)
///                 Text("\(codepointString)")
///                     .font(.footnote)
///                 let emoji = String(Character(UnicodeScalar(codepoint)!))
///                 Text("\(emoji)")
///                     .font(.largeTitle)
///             }
///         }
///     }
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LazyHGrid<Content> : View where Content : View {

    /// Creates a grid that grows horizontally, given the provided properties.
    ///
    /// - Parameters:
    ///   - rows: An array of grid items to size and position each column of
    ///    the grid.
    ///   - alignment: The alignment of the grid within its parent view.
    ///   - spacing: The spacing beween the grid and the next item in its
    ///   parent view.
    ///   - pinnedViews: Views to pin to the bounds of a parent scroll view.
    ///   - content: The content of the grid.
    public init(rows: [GridItem], alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A view that arranges its children in a line that grows horizontally,
/// creating items only as needed.
///
/// The stack is "lazy," in that the stack view doesn't create items until
/// it needs to render them onscreen.
///
/// In the following example, a ``ScrollView`` contains a `LazyHStack` that
/// consists of a horizontal row of text views. The stack aligns to the top
/// of the scroll view and uses 10-point spacing between each text view.
///
///     ScrollView(.horizontal) {
///         LazyHStack(alignment: .top, spacing: 10) {
///             ForEach(1...100, id: \.self) {
///                 Text("Column \($0)")
///             }
///         }
///     }
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LazyHStack<Content> : View where Content : View {

    /// Creates a lazy horizontal stack view with the given spacing,
    /// vertical alignment, pinning behavior, and content.
    ///
    /// - Parameters:
    ///     - alignment: The guide for aligning the subviews in this stack. All
    ///       child views have the same vertical screen coordinate.
    ///     - spacing: The distance between adjacent subviews, or `nil` if you
    ///       want the stack to choose a default distance for each pair of
    ///       subviews.
    ///     - pinnedViews: The kinds of child views that will be pinned.
    ///     - content: A view builder that creates the content of this stack.
    public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A container view that arranges its child views in a grid that
/// grows vertically, creating items only as needed.
///
/// The grid is "lazy," in that the grid view does not create items until
/// they are needed.
///
/// In the following example, a ``ScrollView`` contains a
/// `LazyVGrid` consisting of a two-column grid of ``Text`` views, showing
/// Unicode code points from the "Smileys" group and their corresponding emoji:
///
///      var columns: [GridItem] =
///              Array(repeating: .init(.flexible()), count: 2)
///      ScrollView {
///          LazyVGrid(columns: columns) {
///              ForEach((0...79), id: \.self) {
///                  let codepoint = $0 + 0x1f600
///                  let codepointString = String(format: "%02X", codepoint)
///                  Text("\(codepointString)")
///                  let emoji = String(Character(UnicodeScalar(codepoint)!))
///                  Text("\(emoji)")
///              }
///          }.font(.largeTitle)
///      }
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LazyVGrid<Content> : View where Content : View {

    /// Creates a grid that grows vertically, given the provided properties.
    ///
    /// - Parameters:
    ///   - columns: An array of grid items to size and position each row of
    ///    the grid.
    ///   - alignment: The alignment of the grid within its parent view.
    ///   - spacing: The spacing beween the grid and the next item in its
    ///   parent view.
    ///   - pinnedViews: Views to pin to the bounds of a parent scroll view.
    ///   - content: The content of the grid.
    public init(columns: [GridItem], alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A view that arranges its children in a line that grows vertically,
/// creating items only as needed.
///
/// The stack is "lazy," in that the stack view doesn't create items until
/// it needs to render them onscreen.
///
/// In the following example, a ``ScrollView`` contains a `LazyVStack` that
/// consists of a vertical row of text views. The stack aligns to the
/// leading edge of the scroll view, and uses default spacing between the
/// text views.
///
///     ScrollView {
///         LazyVStack(alignment: .leading) {
///             ForEach(1...100, id: \.self) {
///                 Text("Row \($0)")
///             }
///         }
///     }
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LazyVStack<Content> : View where Content : View {

    /// Creates a lazy vertical stack view with the given spacing,
    /// vertical alignment, pinning behavior, and content.
    ///
    /// - Parameters:
    ///     - alignment: The guide for aligning the subviews in this stack. All
    ///     child views have the same horizontal screen coordinate.
    ///     - spacing: The distance between adjacent subviews, or `nil` if you
    ///       want the stack to choose a default distance for each pair of
    ///       subviews.
    ///     - pinnedViews: The kinds of child views that will be pinned.
    ///     - content: A view builder that creates the content of this stack.
    public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// The Accessibility Bold Text user setting options.
///
/// The app can't override the user's choice.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum LegibilityWeight : Hashable {

    /// Use regular font weight (no Accessibility Bold).
    case regular

    /// Use heavier font weight (force Accessibility Bold).
    case bold

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: LegibilityWeight, b: LegibilityWeight) -> Bool

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
    public func hash(into hasher: inout Hasher)
}

extension LegibilityWeight {

    /// Creates a legibility weight from its UILegibilityWeight equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiLegibilityWeight: UILegibilityWeight)
}

/// A linear gradient.
///
/// The gradient applies the color function along an axis, as defined by its
/// start and end points. The gradient maps the unit-space points into the
/// bounding rectangle of each shape filled with the gradient.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct LinearGradient : ShapeStyle, View {

    public init(gradient: Gradient, startPoint: UnitPoint, endPoint: UnitPoint)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

/// A progress view that visually indicates its progress using a horizontal bar.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LinearProgressViewStyle : ProgressViewStyle {

    /// Creates a linear progress view style.
    public init()

    /// Creates a linear progress view style with a tint color.
    public init(tint: Color)

    /// Creates a view representing the body of a progress view.
    ///
    /// - Parameter configuration: The properties of the progress view being
    ///   created.
    ///
    /// The view hierarchy calls this method for each progress view where this
    /// style is the current progress view style.
    ///
    /// - Parameter configuration: The properties of the progress view, such as
    ///  its preferred progress type.
    public func makeBody(configuration: LinearProgressViewStyle.Configuration) -> some View


    /// A view representing the body of a progress view.
    public typealias Body = some View
}

/// A control for navigating to a URL.
///
/// You create a link by providing a destination URL and a title. The title
/// tells the user the purpose of the link, which can be either a string, or a
/// title key that returns a localized string used to construct a label
/// displayed to the user in your app's UI. The example below creates a link to
/// `example.com` and displays the title string you provide as a
/// link-styled view in your app:
///
///     Link("View Our Terms of Service",
///           destination: URL(string: "https://www.example.com/TOS.html")!)
///
/// When a user taps or clicks a `Link`, where the URL opens depends on the
/// contents of the URL. For example, a Universal Link will open in the
/// associated app, if possible, but otherwise in the user's default web
/// browser.
///
/// As with other views, you can style links using standard view modifiers
/// depending on the view type of the link's label. For example, a ``Text``
/// label could be modified with a custom ``View/font(_:)`` or
/// ``View/foregroundColor(_:)`` to customize the appearance of the link in
/// your app's UI.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct Link<Label> : View where Label : View {

    /// Creates a control, consisting of a URL and a label, used to navigate
    /// to the given URL.
    ///
    /// - Parameters:
    ///     - destination: The URL for the link.
    ///     - label: A view that describes the destination of URL.
    public init(destination: URL, @ViewBuilder label: () -> Label)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Link where Label == Text {

    /// Creates a control, consisting of a URL and a title key, used to
    /// navigate to a URL.
    ///
    /// Use ``Link`` to create a control that your app uses to navigate to a
    /// URL that you provide. The example below creates a link to
    /// `example.com` and uses `Visit Example Co` as the title key to
    /// generate a link-styled view in your app:
    ///
    ///     Link("Visit Example Co",
    ///           destination: URL(string: "https://www.example.com/")!)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title that describes the
    ///       purpose of this link.
    ///     - destination: The URL for the link.
    public init(_ titleKey: LocalizedStringKey, destination: URL)

    /// Creates a control, consisting of a URL and a title string, used to
    /// navigate to a URL.
    ///
    /// Use ``Link`` to create a control that your app uses to navigate to a
    /// URL that you provide. The example below creates a link to
    /// `example.com` and displays the title string you provide as a
    /// link-styled view in your app:
    ///
    ///     func marketingLink(_ callToAction: String) -> Link {
    ///         Link(callToAction,
    ///             destination: URL(string: "https://www.example.com/")!)
    ///     }
    ///
    /// - Parameters:
    ///     - title: A text string used as the title for describing the
    ///       underlying `destination` URL.
    ///     - destination: The URL for the link.
    public init<S>(_ title: S, destination: URL) where S : StringProtocol
}

/// A container that presents rows of data arranged in a single column.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct List<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {

    /// Creates a list with the given content that supports selecting multiple
    /// rows.
    ///
    /// On iOS and tvOS, you must explicitly put the list into edit mode for
    /// the selection to apply.
    ///
    /// - Parameters:
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - content: The content of the list.
    @available(watchOS, unavailable)
    public init(selection: Binding<Set<SelectionValue>>?, @ViewBuilder content: () -> Content)

    /// Creates a list with the given content that supports selecting a single
    /// row.
    ///
    /// On iOS and tvOS, you must explicitly put the list into edit mode for
    /// the selection to apply.
    ///
    /// - Parameters:
    ///   - selection: A binding to a selected row.
    ///   - content: The content of the list.
    @available(watchOS, unavailable)
    public init(selection: Binding<SelectionValue?>?, @ViewBuilder content: () -> Content)

    /// The content of the list.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension List {

    /// Creates a list that computes its rows on demand from an underlying
    /// collection of identifiable data, optionally allowing users to select
    /// multiple rows.
    ///
    /// - Parameters:
    ///   - data: The identifiable data for computing the list.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable

    /// Creates a hierarchical list that computes its rows on demand from an
    /// underlying collection of identifiable data, optionally allowing users to
    /// select multiple rows.
    ///
    /// - Parameters:
    ///   - data: The identifiable data for computing the list.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, children: KeyPath<Data.Element, Data?>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable

    /// Creates a list that identifies its rows based on a key path to the
    /// identifier of the underlying data, optionally allowing users to select
    /// multiple rows.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View

    /// Creates a hierarchical list that identifies its rows based on a key path
    /// to the identifier of the underlying data, optionally allowing users to
    /// select multiple rows.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, children: KeyPath<Data.Element, Data?>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View

    /// Creates a list that computes its views on demand over a constant range.
    ///
    /// This instance only reads the initial value of `data` and doesn't need to
    /// identify views across updates. To compute views on demand over a dynamic
    /// range, use ``List/init(_:id:selection:rowContent:)-8ef64``.
    ///
    /// - Parameters:
    ///   - data: A *constant* range of data to populate the list.
    ///   - selection: A binding to a set that identifies selected rows.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<RowContent>(_ data: Range<Int>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View

    /// Creates a list that computes its rows on demand from an underlying
    /// collection of identifiable data, optionally allowing users to select a
    /// single row.
    ///
    /// - Parameters:
    ///   - data: The identifiable data for computing the list.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable

    /// Creates a hierarchical list that computes its rows on demand from an
    /// underlying collection of identifiable data, optionally allowing users to
    /// select a single row.
    ///
    /// - Parameters:
    ///   - data: The identifiable data for computing the list.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, children: KeyPath<Data.Element, Data?>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable

    /// Creates a list that identifies its rows based on a key path to the
    /// identifier of the underlying data, optionally allowing users to select a
    /// single row.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View

    /// Creates a hierarchical list that identifies its rows based on a key path
    /// to the identifier of the underlying data, optionally allowing users to
    /// select a single row.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, children: KeyPath<Data.Element, Data?>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View

    /// Creates a list that computes its views on demand over a constant range.
    ///
    /// This instance only reads the initial value of `data` and doesn't need to
    /// identify views across updates. To compute views on demand over a dynamic
    /// range, use ``List/init(_:id:selection:rowContent:)-9r2hz``.
    ///
    /// - Parameters:
    ///   - data: A *constant* range of data to populate the list.
    ///   - selection: A binding to a selected value.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(watchOS, unavailable)
    public init<RowContent>(_ data: Range<Int>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension List where SelectionValue == Never {

    /// Creates a list with the given content.
    ///
    /// - Parameter content: The content of the list.
    public init(@ViewBuilder content: () -> Content)

    /// Creates a list that computes its rows on demand from an underlying
    /// collection of identifiable data.
    ///
    /// - Parameters:
    ///   - data: A collection of identifiable data for computing the list.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    public init<Data, RowContent>(_ data: Data, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable

    /// Creates a hierarchical list that computes its rows on demand from an
    /// underlying collection of identifiable data.
    ///
    /// - Parameters:
    ///   - data: A collection of identifiable data for computing the list.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, children: KeyPath<Data.Element, Data?>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable

    /// Creates a list that identifies its rows based on a key path to the
    /// identifier of the underlying data.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View

    /// Creates a hierarchical list that identifies its rows based on a key path
    /// to the identifier of the underlying data.
    ///
    /// - Parameters:
    ///   - data: The data for populating the list.
    ///   - id: The key path to the data model's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes a node capable
    ///     of having children that is currently childless, such as an empty
    ///     directory in a file system. On the other hand, if the property at the
    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
    ///     like a regular file in a file system.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    @available(iOS 14.0, macOS 11.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, children: KeyPath<Data.Element, Data?>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View

    /// Creates a list that computes its views on demand over a constant range.
    ///
    /// This instance only reads the initial value of `data` and doesn't need to
    /// identify views across updates. To compute views on demand over a dynamic
    /// range, use ``List/init(_:id:rowContent:)``.
    ///
    /// - Parameters:
    ///   - data: A *constant* range of data to populate the list.
    ///   - rowContent: A view builder that creates the view for a single row of
    ///     the list.
    public init<RowContent>(_ data: Range<Int>, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View
}

/// The configuration of a tint effect applied to content within a List.
///
/// - See Also: `View.listItemTint(_:)`
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ListItemTint {

    /// An explicit tint color.
    ///
    /// This tint effect is fixed and not overridable by other
    /// system effects.
    public static func fixed(_ tint: Color) -> ListItemTint

    /// An explicit tint color that is overridable.
    ///
    /// This tint effect is overridable by system effects, for
    /// example when the system has a custom user accent
    /// color on macOS.
    public static func preferred(_ tint: Color) -> ListItemTint

    /// A standard grayscale tint effect.
    ///
    /// Monochrome tints are not overridable.
    public static let monochrome: ListItemTint
}

/// A protocol that describes the behavior and appearance of a list.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ListStyle {
}

/// The key used to look up a string in a strings file or strings dictionary
/// file.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct LocalizedStringKey : Equatable, ExpressibleByStringInterpolation {

    public init(_ value: String)

    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral value: String)

    /// Creates an instance from a string interpolation.
    /// 
    /// Most `StringInterpolation` types will store information about the
    /// literals and interpolations appended to them in one or more properties.
    /// `init(stringInterpolation:)` should use these properties to initialize
    /// the instance.
    /// 
    /// - Parameter stringInterpolation: An instance of `StringInterpolation`
    ///             which has had each segment of the string literal appended
    ///             to it.
    public init(stringInterpolation: LocalizedStringKey.StringInterpolation)

    /// The type each segment of a string literal containing interpolations
    /// should be appended to.
    ///
    /// The `StringLiteralType` of an interpolation type must match the
    /// `StringLiteralType` of the conforming type.
    public struct StringInterpolation : StringInterpolationProtocol {

        /// Creates an empty instance ready to be filled with string literal content.
        /// 
        /// Don't call this initializer directly. Instead, initialize a variable or
        /// constant using a string literal with interpolated expressions.
        /// 
        /// Swift passes this initializer a pair of arguments specifying the size of
        /// the literal segments and the number of interpolated segments. Use this
        /// information to estimate the amount of storage you will need.
        /// 
        /// - Parameter literalCapacity: The approximate size of all literal segments
        ///   combined. This is meant to be passed to `String.reserveCapacity(_:)`;
        ///   it may be slightly larger or smaller than the sum of the counts of each
        ///   literal segment.
        /// - Parameter interpolationCount: The number of interpolations which will be
        ///   appended. Use this value to estimate how much additional capacity will
        ///   be needed for the interpolated segments.
        public init(literalCapacity: Int, interpolationCount: Int)

        /// Appends a literal segment to the interpolation.
        /// 
        /// Don't call this method directly. Instead, initialize a variable or
        /// constant using a string literal with interpolated expressions.
        /// 
        /// Interpolated expressions don't pass through this method; instead, Swift
        /// selects an overload of `appendInterpolation`. For more information, see
        /// the top-level `StringInterpolationProtocol` documentation.
        /// 
        /// - Parameter literal: A string literal containing the characters
        ///   that appear next in the string literal.
        public mutating func appendLiteral(_ literal: String)

        public mutating func appendInterpolation(_ string: String)

        public mutating func appendInterpolation<Subject>(_ subject: Subject, formatter: Formatter? = nil) where Subject : ReferenceConvertible

        public mutating func appendInterpolation<Subject>(_ subject: Subject, formatter: Formatter? = nil) where Subject : NSObject

        public mutating func appendInterpolation<T>(_ value: T) where T : _FormatSpecifiable

        public mutating func appendInterpolation<T>(_ value: T, specifier: String) where T : _FormatSpecifiable

        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        public mutating func appendInterpolation(_ text: Text)

        /// The type that should be used for literal segments.
        public typealias StringLiteralType = String
    }

    /// A type that represents a string literal.
    ///
    /// Valid types for `StringLiteralType` are `String` and `StaticString`.
    public typealias StringLiteralType = String

    /// A type that represents an extended grapheme cluster literal.
    ///
    /// Valid types for `ExtendedGraphemeClusterLiteralType` are `Character`,
    /// `String`, and `StaticString`.
    public typealias ExtendedGraphemeClusterLiteralType = String

    /// A type that represents a Unicode scalar literal.
    ///
    /// Valid types for `UnicodeScalarLiteralType` are `Unicode.Scalar`,
    /// `Character`, `String`, and `StaticString`.
    public typealias UnicodeScalarLiteralType = String

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: LocalizedStringKey, b: LocalizedStringKey) -> Bool
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LocalizedStringKey.StringInterpolation {

    public mutating func appendInterpolation(_ image: Image)
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LocalizedStringKey.StringInterpolation {

    public mutating func appendInterpolation(_ date: Date, style: Text.DateStyle)

    public mutating func appendInterpolation(_ dates: ClosedRange<Date>)

    public mutating func appendInterpolation(_ interval: DateInterval)
}

/// A gesture that succeeds when the user performs a long press.
///
/// To recognize a long-press gesture on a view, create and configure the
/// gesture, then add it to the view using the ``View/gesture(_:including:)``
/// modifier.
///
/// Add a long-press gesture to a ``Circle`` to animate its color from blue to
/// red, and then change it to green when the gesture ends:
///
///     struct LongPressGestureView: View {
///         @GestureState var isDetectingLongPress = false
///         @State var completedLongPress = false
///
///         var longPress: some Gesture {
///             LongPressGesture(minimumDuration: 3)
///                 .updating($isDetectingLongPress) { currentstate, gestureState,
///                         transaction in
///                     gestureState = currentstate
///                     transaction.animation = Animation.easeIn(duration: 2.0)
///                 }
///                 .onEnded { finished in
///                     self.completedLongPress = finished
///                 }
///         }
///
///         var body: some View {
///             Circle()
///                 .fill(self.isDetectingLongPress ?
///                     Color.red :
///                     (self.completedLongPress ? Color.green : Color.blue))
///                 .frame(width: 100, height: 100, alignment: .center)
///                 .gesture(longPress)
///         }
///     }
@available(iOS 13.0, macOS 10.15, watchOS 6.0, tvOS 14.0, *)
public struct LongPressGesture : Gesture {

    /// The minimum duration of the long press that must elapse before the
    /// gesture succeeds.
    public var minimumDuration: Double

    /// The maximum distance that the long press can move before the gesture
    /// fails.
    @available(tvOS, unavailable)
    public var maximumDistance: CGFloat

    /// Creates a long-press gesture with a minimum duration and a maximum
    /// distance that the interaction can move before the gesture fails.
    ///
    /// - Parameters:
    ///   - minimumDuration: The minimum duration of the long press that must
    ///     elapse before the gesture succeeds.
    ///   - maximumDistance: The maximum distance that the fingers or cursor
    ///     performing the long press can move before the gesture fails.
    @available(tvOS, unavailable)
    public init(minimumDuration: Double = 0.5, maximumDistance: CGFloat = 10)

    /// The type representing the gesture's value.
    public typealias Value = Bool

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

/// A gesture that recognizes a magnification motion and tracks the amount of
/// magnification.
///
/// A magnification gesture tracks how a magnification event sequence changes.
/// To recognize a magnification gesture on a view, create and configure the
/// gesture, and then add it to the view using the
/// ``View/gesture(_:including:)`` modifier.
///
/// Add a magnification gesture to a ``Circle`` that changes its size while the
/// user performs the gesture:
///
///     struct MagnificationGestureView: View {
///
///         @GestureState var magnifyBy = CGFloat(1.0)
///
///         var magnification: some Gesture {
///             MagnificationGesture()
///                 .updating($magnifyBy) { currentState, gestureState, transaction in
///                     gestureState = currentState
///                 }
///         }
///
///         var body: some View {
///             Circle()
///                 .frame(width: 100 * magnifyBy,
///                        height: 100 * magnifyBy,
///                        alignment: .center)
///                 .gesture(magnification)
///         }
///     }
///
/// The circle's size resets to its original size when the gesture finishes.
@available(iOS 13.0, macOS 10.15, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct MagnificationGesture : Gesture {

    /// The minimum required delta before the gesture starts.
    public var minimumScaleDelta: CGFloat

    /// Creates a magnification gesture with a given minimum delta for the
    /// gesture to start.
    ///
    /// - Parameter minimumScaleDelta: The minimum scale delta required before
    ///   the gesture starts.
    public init(minimumScaleDelta: CGFloat = 0.01)

    /// The type representing the gesture's value.
    public typealias Value = CGFloat

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

/// A set of view properties that may be synchronized between views
/// using the `View.matchedGeometryEffect()` function.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct MatchedGeometryProperties : OptionSet {

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
    public let rawValue: UInt32

    /// Creates a new option set from the given raw value.
    ///
    /// This initializer always succeeds, even if the value passed as `rawValue`
    /// exceeds the static properties declared as part of the option set. This
    /// example creates an instance of `ShippingOptions` with a raw value beyond
    /// the highest element, with a bit mask that effectively contains all the
    /// declared static members.
    ///
    ///     let extraOptions = ShippingOptions(rawValue: 255)
    ///     print(extraOptions.isStrictSuperset(of: .all))
    ///     // Prints "true"
    ///
    /// - Parameter rawValue: The raw value of the option set to create. Each bit
    ///   of `rawValue` potentially represents an element of the option set,
    ///   though raw values may include bits that are not defined as distinct
    ///   values of the `OptionSet` type.
    @inlinable public init(rawValue: UInt32)

    /// The view's position, in window coordinates.
    public static let position: MatchedGeometryProperties

    /// The view's size, in local coordinates.
    public static let size: MatchedGeometryProperties

    /// Both the `position` and `size` properties.
    public static let frame: MatchedGeometryProperties

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = MatchedGeometryProperties

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = MatchedGeometryProperties

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = UInt32
}

/// A control for presenting a menu of actions.
///
/// The following example presents a menu of three buttons and a submenu, which
/// contains three buttons of its own.
///
///     Menu("Actions") {
///         Button("Duplicate", action: duplicate)
///         Button("Rename", action: rename)
///         Button("Delete…", action: delete)
///         Menu("Copy") {
///             Button("Copy", action: copy)
///             Button("Copy Formatted", action: copyFormatted)
///             Button("Copy Library Path", action: copyPath)
///         }
///     }
///
/// You can create the menu's title with a ``LocalizedStringKey``, as seen in
/// the previous example, or with a view builder that creates multiple views,
/// such as an image and a text view:
///
///     Menu {
///         Button("Open in Preview", action: openInPreview)
///         Button("Save as PDF", action: saveAsPDF)
///     } label: {
///         Image(systemName: "document")
///         Text("PDF")
///     }
///
/// ### Styling Menus
///
/// Use the ``View/menuStyle(_:)`` modifier to change the style of all menus
/// in a view. The following example shows how to apply a custom style:
///
///     Menu("Editing") {
///         Button("Set In Point", action: setInPoint)
///         Button("Set Out Point", action: setOutPoint)
///     }
///     .menuStyle(EditingControlsMenuStyle())
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct Menu<Label, Content> : View where Label : View, Content : View {

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Menu {

    /// Creates a menu with a custom label.
    ///
    /// - Parameters:
    ///     - content: A group of menu items.
    ///     - label: A view describing the content of the menu.
    public init(@ViewBuilder content: () -> Content, @ViewBuilder label: () -> Label)

    /// Creates a menu that generates its label from a localized string key.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the link's localized title, which describes
    ///         the contents of the menu.
    ///     - content: A group of menu items.
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content) where Label == Text

    /// Creates a menu that generates its label from a string.
    ///
    /// To create the label with a localized string key, use
    /// ``Menu/init(_:content:)-7v768`` instead.
    ///
    /// - Parameters:
    ///     - title: A string that describes the contents of the menu.
    ///     - content: A group of menu items.
    public init<S>(_ title: S, @ViewBuilder content: () -> Content) where Label == Text, S : StringProtocol
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Menu where Label == MenuStyleConfiguration.Label, Content == MenuStyleConfiguration.Content {

    /// Creates a menu based on a style configuration.
    ///
    /// Use this initializer within the ``MenuStyle/makeBody(configuration:)``
    /// method of a ``MenuStyle`` instance to create an instance of the menu
    /// being styled. This is useful for custom menu styles that modify the
    /// current menu style.
    ///
    /// For example, the following code creates a new, custom style that adds a
    /// red border around the current menu style:
    ///
    ///     struct RedBorderMenuStyle: MenuStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             Menu(configuration)
    ///                 .border(Color.red)
    ///         }
    ///     }
    ///
    public init(_ configuration: MenuStyleConfiguration)
}

/// A picker style that presents the options as a menu when the user presses a
/// button, or as a submenu when nested within a larger menu.
///
/// Use this style when there are more than five options. Consider using
/// ``InlinePickerStyle`` when there are fewer than five options.
///
/// The button itself indicates the selected option. You can include additional
/// controls in the set of options, such as a button to customize the list of
/// options.
///
/// To apply this style to a picker, or to a view that contains pickers, use the
/// ``View/pickerStyle(_:)`` modifier.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct MenuPickerStyle : PickerStyle {

    /// Creates a menu picker style.
    public init()
}

/// A type that applies standard interaction behavior and a custom appearance
/// to all menus within a view hierarchy.
///
/// To configure the current menu style for a view hiearchy, use the
/// ``View/menuStyle(_:)`` modifier.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol MenuStyle {

    /// A view that represents the body of a menu.
    associatedtype Body : View

    /// Creates a view that represents the body of a menu.
    ///
    /// - Parameter configuration: The properties of the menu.
    ///
    /// The system calls this method for each ``Menu`` instance in a view
    /// hierarchy where this style is the current menu style.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a menu.
    typealias Configuration = MenuStyleConfiguration
}

/// A configuration of a menu.
///
/// Use the ``Menu/init(_:)`` initializer of ``Menu`` to create an
/// instance using the current menu style, which you can modify to create a
/// custom style.
///
/// For example, the following code creates a new, custom style that adds a red
/// border to the current menu style:
///
///     struct RedBorderMenuStyle : MenuStyle {
///         func makeBody(configuration: Configuration) -> some View {
///             Menu(configuration)
///                 .border(Color.red)
///         }
///     }
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct MenuStyleConfiguration {

    /// A type-erased label of a menu.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A type-erased content of a menu.
    public struct Content : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }
}

/// A value with a modifier applied to it.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ModifiedContent<Content, Modifier> {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never

    /// The content that the modifier transforms into a new view or new
    /// view modifier.
    public var content: Content

    /// The view modifier.
    public var modifier: Modifier

    /// A structure that the defines the content and modifier needed to produce
    /// a new view or view modifier.
    ///
    /// If `content` is a ``View`` and `modifier` is a ``ViewModifier``, the
    /// result is a ``View``. If `content` and `modifier` are both view
    /// modifiers, then the result is a new ``ViewModifier`` combining them.
    ///
    /// - Parameters:
    ///     - content: The content that the modifier changes.
    ///     - modifier: The modifier to apply to the content.
    @inlinable public init(content: Content, modifier: Modifier)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Adds an accessibility action to this view.
    public func accessibilityAction(_ actionKind: AccessibilityActionKind = .default, _ handler: @escaping () -> Void) -> ModifiedContent<Content, Modifier>

    /// Adds a custom accessibility action to the view and all subviews.
    public func accessibilityAction(named name: Text, _ handler: @escaping () -> Void) -> ModifiedContent<Content, Modifier>
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Adds a custom accessibility action to the view and all subviews.
    public func accessibilityAction(named nameKey: LocalizedStringKey, _ handler: @escaping () -> Void) -> ModifiedContent<Content, Modifier>

    /// Adds a custom accessibility action to the view and all subviews.
    public func accessibilityAction<S>(named name: S, _ handler: @escaping () -> Void) -> ModifiedContent<Content, Modifier> where S : StringProtocol
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : Equatable where Content : Equatable, Modifier : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ModifiedContent<Content, Modifier>, b: ModifiedContent<Content, Modifier>) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : View where Content : View, Modifier : ViewModifier {

    /// The content and behavior of the view.
    public var body: ModifiedContent<Content, Modifier>.Body { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : ViewModifier where Content : ViewModifier, Modifier : ViewModifier {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : DynamicViewContent where Content : DynamicViewContent, Modifier : ViewModifier {

    /// The collection of underlying data.
    public var data: Content.Data { get }

    /// The type of the underlying collection of data.
    public typealias Data = Content.Data
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ModifiedContent : Scene where Content : Scene, Modifier : _SceneModifier {

    /// The content and behavior of the scene.
    ///
    /// For any scene that you create, provide a computed `body` property that
    /// defines the scene as a composition of other scenes. You can assemble a
    /// scene from primitive scenes that SwiftUI provides, as well as other
    /// scenes that you've defined.
    ///
    /// Swift infers the scene's ``SwiftUI/Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    public var body: ModifiedContent<Content, Modifier>.Body { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Specifies whether to hide this view from system accessibility features.
    public func accessibilityHidden(_ hidden: Bool) -> ModifiedContent<Content, Modifier>

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel(_ label: Text) -> ModifiedContent<Content, Modifier>

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue(_ value: Text) -> ModifiedContent<Content, Modifier>

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint(_ hint: Text) -> ModifiedContent<Content, Modifier>

    /// Sets alternate input labels with which users identify a view.
    ///
    /// If you don't specify any input labels, the user can still refer to the view using the accessibility
    /// label that you add with the accessibilityLabel() modifier. Provide labels in descending order
    /// of importance. Voice Control and Full Keyboard Access use the input labels.
    public func accessibilityInputLabels(_ inputLabels: [Text]) -> ModifiedContent<Content, Modifier>

    /// Adds the given traits to the view.
    public func accessibilityAddTraits(_ traits: AccessibilityTraits) -> ModifiedContent<Content, Modifier>

    /// Removes the given traits from this view.
    public func accessibilityRemoveTraits(_ traits: AccessibilityTraits) -> ModifiedContent<Content, Modifier>

    /// Uses the specified string to identify the view.
    ///
    /// Use this value for testing. It isn't visible to the user.
    public func accessibilityIdentifier(_ identifier: String) -> ModifiedContent<Content, Modifier>

    /// Sets the sort priority order for this view's accessibility
    /// element, relative to other elements at the same level.
    ///
    /// Higher numbers are sorted first. The default sort priority is zero.
    public func accessibilitySortPriority(_ sortPriority: Double) -> ModifiedContent<Content, Modifier>

    /// Specifies the point where activations occur in the view.
    public func accessibilityActivationPoint(_ activationPoint: CGPoint) -> ModifiedContent<Content, Modifier>

    /// Specifies the unit point where activations occur in the view.
    public func accessibilityActivationPoint(_ activationPoint: UnitPoint) -> ModifiedContent<Content, Modifier>
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel(_ labelKey: LocalizedStringKey) -> ModifiedContent<Content, Modifier>

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel<S>(_ label: S) -> ModifiedContent<Content, Modifier> where S : StringProtocol

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue(_ valueKey: LocalizedStringKey) -> ModifiedContent<Content, Modifier>

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue<S>(_ value: S) -> ModifiedContent<Content, Modifier> where S : StringProtocol

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint(_ hintKey: LocalizedStringKey) -> ModifiedContent<Content, Modifier>

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint<S>(_ hint: S) -> ModifiedContent<Content, Modifier> where S : StringProtocol

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// > Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   `accessibilityLabel()` modifier.
    public func accessibilityInputLabels(_ inputLabelKeys: [LocalizedStringKey]) -> ModifiedContent<Content, Modifier>

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// > Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   `accessibilityLabel()` modifier.
    public func accessibilityInputLabels<S>(_ inputLabels: [S]) -> ModifiedContent<Content, Modifier> where S : StringProtocol
}

extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Specifies whether to hide this view from system accessibility features.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    public func accessibility(hidden: Bool) -> ModifiedContent<Content, Modifier>

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    public func accessibility(label: Text) -> ModifiedContent<Content, Modifier>

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibility(label:),
    /// you can provide the current volume setting, like "60%", using accessibility(value:).
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    public func accessibility(value: Text) -> ModifiedContent<Content, Modifier>

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    public func accessibility(hint: Text) -> ModifiedContent<Content, Modifier>

    /// Sets alternate input labels with which users identify a view.
    ///
    /// If you don't specify any input labels, the user can still refer to the view using the accessibility
    /// label that you add with the accessibilityLabel() modifier. Provide labels in descending order
    /// of importance. Voice Control and Full Keyboard Access use the input labels.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    public func accessibility(inputLabels: [Text]) -> ModifiedContent<Content, Modifier>

    /// Adds the given traits to the view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    public func accessibility(addTraits traits: AccessibilityTraits) -> ModifiedContent<Content, Modifier>

    /// Removes the given traits from this view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    public func accessibility(removeTraits traits: AccessibilityTraits) -> ModifiedContent<Content, Modifier>

    /// Uses the specified string to identify the view.
    ///
    /// Use this value for testing. It isn't visible to the user.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    public func accessibility(identifier: String) -> ModifiedContent<Content, Modifier>

    @available(iOS, deprecated, introduced: 13.0)
    @available(macOS, deprecated, introduced: 10.15)
    @available(tvOS, deprecated, introduced: 13.0)
    @available(watchOS, deprecated, introduced: 6)
    public func accessibility(selectionIdentifier: AnyHashable) -> ModifiedContent<Content, Modifier>

    /// Sets the sort priority order for this view's accessibility
    /// element, relative to other elements at the same level.
    ///
    /// Higher numbers are sorted first. The default sort priority is zero.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    public func accessibility(sortPriority: Double) -> ModifiedContent<Content, Modifier>

    /// Specifies the point where activations occur in the view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    public func accessibility(activationPoint: CGPoint) -> ModifiedContent<Content, Modifier>

    /// Specifies the unit point where activations occur in the view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    public func accessibility(activationPoint: UnitPoint) -> ModifiedContent<Content, Modifier>
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Adds an accessibility scroll action to the view.
    public func accessibilityScrollAction(_ handler: @escaping (Edge) -> Void) -> ModifiedContent<Content, Modifier>
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Adds an accessibility adjustable action to the view.
    public func accessibilityAdjustableAction(_ handler: @escaping (AccessibilityAdjustmentDirection) -> Void) -> ModifiedContent<Content, Modifier>
}

/// A dynamic property type that allows access to a namespace defined
/// by the persistent identity of the object containing the property
/// (e.g. a view).
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen @propertyWrapper public struct Namespace : DynamicProperty {

    @inlinable public init()

    public var wrappedValue: Namespace.ID { get }

    /// A namespace defined by the persistent identity of an
    /// `@Namespace` dynamic property.
    @frozen public struct ID : Hashable {

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
        public func hash(into hasher: inout Hasher)

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Namespace.ID, b: Namespace.ID) -> Bool
    }
}

/// A configuration for a navigation bar that represents a view at the top of a
/// navigation stack.
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
public struct NavigationBarItem {

    /// A style for displaying the title of a navigation bar.
    public enum TitleDisplayMode {

        /// Inherit the display mode from the previous navigation item.
        case automatic

        /// Display the title within the standard bounds of the navigation bar.
        case inline

        /// Display a large title within an expanded navigation bar.
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        case large

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: NavigationBarItem.TitleDisplayMode, b: NavigationBarItem.TitleDisplayMode) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension NavigationBarItem.TitleDisplayMode : Equatable {
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension NavigationBarItem.TitleDisplayMode : Hashable {
}

/// A view that controls a navigation presentation.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct NavigationLink<Label, Destination> : View where Label : View, Destination : View {

    /// Creates an instance that presents `destination`.
    public init(destination: Destination, @ViewBuilder label: () -> Label)

    /// Creates an instance that presents `destination` when active.
    public init(destination: Destination, isActive: Binding<Bool>, @ViewBuilder label: () -> Label)

    /// Creates an instance that presents `destination` when `selection` is set
    /// to `tag`.
    public init<V>(destination: Destination, tag: V, selection: Binding<V?>, @ViewBuilder label: () -> Label) where V : Hashable

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension NavigationLink where Label == Text {

    /// Creates an instance that presents `destination`, with a `Text` label
    /// generated from a title string.
    public init(_ titleKey: LocalizedStringKey, destination: Destination)

    /// Creates an instance that presents `destination`, with a `Text` label
    /// generated from a title string.
    public init<S>(_ title: S, destination: Destination) where S : StringProtocol

    /// Creates an instance that presents `destination` when active, with a
    /// `Text` label generated from a title string.
    public init(_ titleKey: LocalizedStringKey, destination: Destination, isActive: Binding<Bool>)

    /// Creates an instance that presents `destination` when active, with a
    /// `Text` label generated from a title string.
    public init<S>(_ title: S, destination: Destination, isActive: Binding<Bool>) where S : StringProtocol

    /// Creates an instance that presents `destination` when `selection` is set
    /// to `tag`, with a `Text` label generated from a title string.
    public init<V>(_ titleKey: LocalizedStringKey, destination: Destination, tag: V, selection: Binding<V?>) where V : Hashable

    /// Creates an instance that presents `destination` when `selection` is set
    /// to `tag`, with a `Text` label generated from a title string.
    public init<S, V>(_ title: S, destination: Destination, tag: V, selection: Binding<V?>) where S : StringProtocol, V : Hashable
}

@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension NavigationLink {

    /// Sets whether or not the `NavigationLink` should present its destination
    /// as the "detail" component of the containing `NavigationView`.
    ///
    /// If not set, defaults to `true`.
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func isDetailLink(_ isDetailLink: Bool) -> some View

}

/// A view for presenting a stack of views representing a visible path in a
/// navigation hierarchy.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
public struct NavigationView<Content> : View where Content : View {

    public init(@ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A specification for the appearance and interaction of a `NavigationView`.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
public protocol NavigationViewStyle {
}

/// A property wrapper type that subscribes to an observable object and
/// invalidates a view whenever the observable object changes.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper @frozen public struct ObservedObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {

    /// A wrapper of the underlying observable object that can create bindings to
    /// its properties using dynamic member lookup.
    @dynamicMemberLookup @frozen public struct Wrapper {

        /// Returns a binding to the resulting value of a given key path.
        ///
        /// - Parameter keyPath  : A key path to a specific resulting value.
        ///
        /// - Returns: A new binding.
        public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> { get }
    }

    /// Creates an observed object with an initial value.
    ///
    /// - Parameter initialValue: An initial value.
    public init(initialValue: ObjectType)

    /// Creates an observed object with an initial wrapped value.
    ///
    /// You don't call this initializer directly. Instead, declare a property
    /// with the `@ObservedObject` attribute, and provide an initial value.
    ///
    /// - Parameter wrappedValue: An initial value.
    public init(wrappedValue: ObjectType)

    /// The underlying value referenced by the observed object.
    ///
    /// This property provides primary access to the value's data. However, you
    /// don't access `wrappedValue` directly. Instead, you use the property
    /// variable created with the `@ObservedObject` attribute.
    ///
    /// When a mutable value changes, the new value is immediately available.
    /// However, a view displaying the value is updated asynchronously and may
    /// not show the new value immediately.
    public var wrappedValue: ObjectType

    /// A projection of the observed object that creates bindings to its
    /// properties using dynamic member lookup.
    ///
    /// Use the projected value to pass a binding value down a view hierarchy.
    /// To get the `projectedValue`, prefix the property variable with `$`.
    public var projectedValue: ObservedObject<ObjectType>.Wrapper { get }
}

/// A shape with a translation offset transform applied to it.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct OffsetShape<Content> : Shape where Content : Shape {

    public var shape: Content

    public var offset: CGSize

    @inlinable public init(shape: Content, offset: CGSize)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<Content.AnimatableData, CGSize.AnimatableData>

    /// The data to animate.
    public var animatableData: OffsetShape<Content>.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension OffsetShape : InsettableShape where Content : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> OffsetShape<Content.InsetShape>

    /// The type of the inset shape.
    public typealias InsetShape = OffsetShape<Content.InsetShape>
}

/// Provides functionality for opening a URL.
///
/// The `OpenURLAction` instance in the app's ``Environment`` offers
/// a handler that you can use to open a URL in response to some action.
/// Use the ``EnvironmentValues/openURL`` environment value to get the handler.
/// Then call the action's handler when you need to open a URL. For example,
/// you can open a support URL in response to when a user taps a button:
///
///     struct OpenUrlActionView: View {
///         @Environment(\.openURL) var openURL
///
///         var body: some View {
///             Button(action: contactSupport) {
///                 Text("Email Support")
///                 Image(systemName: "envelope.open")
///             }
///         }
///
///         func contactSupport() {
///             guard let url = URL(string: "https://www.example.com") else {
///                 return
///             }
///             openURL(url)
///         }
///     }
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct OpenURLAction {

    /// Opens a URL, following system conventions.
    ///
    /// Use this method to attempt to open a URL. This function handles the
    /// calling of the platform specific URL handler contained in the
    /// `openURL` property stored the app's ``Environment``, and is used when
    /// you call the function ``openURL(:_)``.
    ///
    /// - Parameters:
    ///   - url: The URL to open.
    public func callAsFunction(_ url: URL)

    /// Asynchronously opens a URL, following system conventions.
    ///
    /// Use this method when attempting to asynchronously open a URL; the
    /// result indicates whether the system was able open the URL.
    /// The completion runs after the system decides that it can open the URL,
    /// but the full opening of the URL may not yet be complete when calling the
    /// completion handler.
    ///
    /// - Parameters:
    ///   - url: The URL to open.
    ///   - completion: A closure the method calls after determining if
    ///     it is possible to open the URL, although possibly before fully
    ///     opening the URL. The closure takes a Boolean that indicates whether
    ///     the URL can be opened.
    @available(watchOS, unavailable)
    public func callAsFunction(_ url: URL, completion: @escaping (Bool) -> Void)
}

/// A structure that computes views and disclosure groups on demand from an
/// underlying collection of tree-structured, identified data.
///
/// Use an outline group when you need a view that can represent a hierarchy
/// of data by using disclosure views. This allows the user to navigate the
/// tree structure by using the disclosure views to expand and collapse
/// branches.
///
/// In the following example, a tree structure of `FileItem` data offers a
/// simplified view of a file system. Passing the root of this tree and the
/// key path of its children allows you to quickly create a visual
/// representation of the file system.
///
///     struct FileItem: Hashable, Identifiable, CustomStringConvertible {
///         var id: Self { self }
///         var name: String
///         var children: [FileItem]? = nil
///         var description: String {
///             switch children {
///             case nil:
///                 return "📄 \(name)"
///             case .some(let children):
///                 return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
///             }
///         }
///     }
///
///     let data =
///       FileItem(name: "users", children:
///         [FileItem(name: "user1234", children:
///           [FileItem(name: "Photos", children:
///             [FileItem(name: "photo001.jpg"),
///              FileItem(name: "photo002.jpg")]),
///            FileItem(name: "Movies", children:
///              [FileItem(name: "movie001.mp4")]),
///               FileItem(name: "Documents", children: [])
///           ]),
///          FileItem(name: "newuser", children:
///            [FileItem(name: "Documents", children: [])
///            ])
///         ])
///
///     OutlineGroup(data, children: \.children) { item in
///         Text("\(item.description)")
///     }
///
/// ### Type Parameters
///
/// Five generic type constraints define a specific `OutlineGroup` instance:
///
/// - `Data`: The type of a collection containing the children of an element in
///   the tree-shaped data.
/// - `ID`: The type of the identifier for an element.
/// - `Parent`: The type of the visual representation of an element whose
///   children property is non-`nil`
/// - `Leaf`: The type of the visual representation of an element whose
///   children property is `nil`.
/// - `Subgroup`: A type of a view that groups a parent view and a view
///   representing its children, typically with some mechanism for showing and
///   hiding the children
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct OutlineGroup<Data, ID, Parent, Leaf, Subgroup> where Data : RandomAccessCollection, ID : Hashable {
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension OutlineGroup where ID == Data.Element.ID, Parent : View, Parent == Leaf, Subgroup == DisclosureGroup<Parent, OutlineSubgroupChildren>, Data.Element : Identifiable {

    /// Creates an outline group from a root data element and a key path to
    /// its children.
    ///
    /// This initializer creates an instance that uniquely identifies views
    /// across updates based on the identity of the underlying data element.
    ///
    /// All generated disclosure groups begin in the collapsed state.
    ///
    /// Make sure that the identifier of a data element only changes if you
    /// mean to replace that element with a new element, one with a new
    /// identity. If the ID of an element changes, then the content view
    /// generated from that element will lose any current state and animations.
    ///
    /// - Parameters:
    ///   - root: The root of a collection of tree-structured, identified
    ///     data.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes an element
    ///     capable of having children that's currently childless, such as an
    ///     empty directory in a file system. On the other hand, if the property
    ///     at the key path is `nil`, then the outline group treats `data` as a
    ///     leaf in the tree, like a regular file in a file system.
    ///   - content: A view builder that produces a content view based on an
    ///    element in `data`.
    public init<DataElement>(_ root: DataElement, children: KeyPath<DataElement, Data?>, @ViewBuilder content: @escaping (DataElement) -> Leaf) where ID == DataElement.ID, DataElement : Identifiable, DataElement == Data.Element

    /// Creates an outline group from a collection of root data elements and
    /// a key path to its children.
    ///
    /// This initializer creates an instance that uniquely identifies views
    /// across updates based on the identity of the underlying data element.
    ///
    /// All generated disclosure groups begin in the collapsed state.
    ///
    /// Make sure that the identifier of a data element only changes if you
    /// mean to replace that element with a new element, one with a new
    /// identity. If the ID of an element changes, then the content view
    /// generated from that element will lose any current state and animations.
    ///
    /// - Parameters:
    ///   - data: A collection of tree-structured, identified data.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes an element
    ///     capable of having children that's currently childless, such as an
    ///     empty directory in a file system. On the other hand, if the property
    ///     at the key path is `nil`, then the outline group treats `data` as a
    ///     leaf in the tree, like a regular file in a file system.
    ///   - content: A view builder that produces a content view based on an
    ///    element in `data`.
    public init<DataElement>(_ data: Data, children: KeyPath<DataElement, Data?>, @ViewBuilder content: @escaping (DataElement) -> Leaf) where ID == DataElement.ID, DataElement : Identifiable, DataElement == Data.Element
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension OutlineGroup where Parent : View, Parent == Leaf, Subgroup == DisclosureGroup<Parent, OutlineSubgroupChildren> {

    /// Creates an outline group from a root data element, the key path to its
    /// identifier, and a key path to its children.
    ///
    /// This initializer creates an instance that uniquely identifies views
    /// across updates based on the identity of the underlying data element.
    ///
    /// All generated disclosure groups begin in the collapsed state.
    ///
    /// Make sure that the identifier of a data element only changes if you
    /// mean to replace that element with a new element, one with a new
    /// identity. If the ID of an element changes, then the content view
    /// generated from that element will lose any current state and animations.
    ///
    /// - Parameters:
    ///   - root: The root of a collection of tree-structured, identified
    ///     data.
    ///   - id: The key path to a data element's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes an element
    ///     capable of having children that's currently childless, such as an
    ///     empty directory in a file system. On the other hand, if the property
    ///     at the key path is `nil`, then the outline group treats `data` as a
    ///     leaf in the tree, like a regular file in a file system.
    ///   - content: A view builder that produces a content view based on an
    ///    element in `data`.
    public init<DataElement>(_ root: DataElement, id: KeyPath<DataElement, ID>, children: KeyPath<DataElement, Data?>, @ViewBuilder content: @escaping (DataElement) -> Leaf) where DataElement == Data.Element

    /// Creates an outline group from a collection of root data elements, the
    /// key path to a data element's identifier, and a key path to its children.
    ///
    /// This initializer creates an instance that uniquely identifies views
    /// across updates based on the identity of the underlying data element.
    ///
    /// All generated disclosure groups begin in the collapsed state.
    ///
    /// Make sure that the identifier of a data element only changes if you
    /// mean to replace that element with a new element, one with a new
    /// identity. If the ID of an element changes, then the content view
    /// generated from that element will lose any current state and animations.
    ///
    /// - Parameters:
    ///   - data: A collection of tree-structured, identified data.
    ///   - id: The key path to a data element's identifier.
    ///   - children: A key path to a property whose non-`nil` value gives the
    ///     children of `data`. A non-`nil` but empty value denotes an element
    ///     capable of having children that's currently childless, such as an
    ///     empty directory in a file system. On the other hand, if the property
    ///     at the key path is `nil`, then the outline group treats `data` as a
    ///     leaf in the tree, like a regular file in a file system.
    ///   - content: A view builder that produces a content view based on an
    ///    element in `data`.
    public init<DataElement>(_ data: Data, id: KeyPath<DataElement, ID>, children: KeyPath<DataElement, Data?>, @ViewBuilder content: @escaping (DataElement) -> Leaf) where DataElement == Data.Element
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension OutlineGroup : View where Parent : View, Leaf : View, Subgroup : View {

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

/// A type-erased view representing the children in an outline subgroup.
///
/// ``OutlineGroup`` uses this type as a generic constraint for the `Content`
/// of the ``DisclosureGroup`` instances it creates.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct OutlineSubgroupChildren : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// An index view style that places a page index view over its content.
@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct PageIndexViewStyle : IndexViewStyle {

    /// The background style for the page index view.
    public struct BackgroundDisplayMode {

        /// Background will use the default for the platform.
        public static let automatic: PageIndexViewStyle.BackgroundDisplayMode

        /// Background is only shown while the index view is interacted with.
        public static let interactive: PageIndexViewStyle.BackgroundDisplayMode

        /// Background is always displayed behind the page index view.
        public static let always: PageIndexViewStyle.BackgroundDisplayMode

        /// Background is never displayed behind the page index view.
        public static let never: PageIndexViewStyle.BackgroundDisplayMode
    }

    /// Creates a page index view style.
    ///
    /// - Parameter backgroundDisplayMode: The display mode of the background of any
    /// page index views receiving this style
    public init(backgroundDisplayMode: PageIndexViewStyle.BackgroundDisplayMode = .automatic)
}

/// A `TabViewStyle` that implements a paged scrolling `TabView`.
@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
@available(macOS, unavailable)
public struct PageTabViewStyle : TabViewStyle {

    /// A style for displaying the page index view
    public struct IndexDisplayMode {

        /// Displays an index view when there are more than one page
        public static let automatic: PageTabViewStyle.IndexDisplayMode

        /// Always display an index view regardless of page count
        @available(watchOS, unavailable)
        public static let always: PageTabViewStyle.IndexDisplayMode

        /// Never display an index view
        @available(watchOS, unavailable)
        public static let never: PageTabViewStyle.IndexDisplayMode
    }

    /// Creates a new `PageTabViewStyle` with an index display mode
    public init(indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic)
}

/// The outline of a 2D shape.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Path : Equatable, LosslessStringConvertible {

    /// Creates an empty path.
    public init()

    /// Creates a path from an immutable shape path.
    public init(_ path: CGPath)

    /// Creates a path from a copy of a mutable shape path.
    public init(_ path: CGMutablePath)

    /// Creates a path as the given rectangle.
    public init(_ rect: CGRect)

    /// Creates a path as the given rounded rectangle.
    public init(roundedRect rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .circular)

    /// Creates a path as the given rounded rectangle.
    public init(roundedRect rect: CGRect, cornerRadius: CGFloat, style: RoundedCornerStyle = .circular)

    /// Creates a path as an ellipse inscribed within the given rectangle.
    public init(ellipseIn rect: CGRect)

    /// Creates an empty path, and then executes the closure to add the initial
    /// elements.
    public init(_ callback: (inout Path) -> ())

    /// Initializes from the result of a previous call to
    /// `Path.stringRepresentation`. Fails if the `string` does not
    /// describe a valid path.
    public init?(_ string: String)

    /// A description of the path that may be used to recreate the path
    /// via `init?(_:)`.
    public var description: String { get }

    /// An immutable path representing the elements in the path.
    public var cgPath: CGPath { get }

    /// A Boolean value indicating whether the path contains zero elements.
    public var isEmpty: Bool { get }

    /// A rectangle containing all path segments.
    public var boundingRect: CGRect { get }

    /// Returns true if the path contains a specified point.
    ///
    /// If `eoFill` is true, this method uses the even-odd rule to define which
    /// points are inside the path. Otherwise, it uses the non-zero rule.
    public func contains(_ p: CGPoint, eoFill: Bool = false) -> Bool

    /// An element of a path.
    @frozen public enum Element : Equatable {

        /// A path element that terminates the current subpath (without closing
        /// it) and defines a new current point.
        case move(to: CGPoint)

        /// A line from the previous current point to the given point, which
        /// becomes the new current point.
        case line(to: CGPoint)

        /// A quadratic Bézier curve from the previous current point to the
        /// given end-point, using the single control point to define the curve.
        ///
        /// The end-point of the curve becomes the new current point.
        case quadCurve(to: CGPoint, control: CGPoint)

        /// A cubic Bézier curve from the previous current point to the given
        /// end-point, using the two control points to define the curve.
        ///
        /// The end-point of the curve becomes the new current point.
        case curve(to: CGPoint, control1: CGPoint, control2: CGPoint)

        /// A line from the start point of the current subpath (if any) to the
        /// current point, which terminates the subpath.
        ///
        /// After closing the subpath, the current point becomes undefined.
        case closeSubpath

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Path.Element, b: Path.Element) -> Bool
    }

    /// Calls `body` with each element in the path.
    public func forEach(_ body: (Path.Element) -> Void)

    /// Returns a stroked copy of the path using `style` to define how the
    /// stroked outline is created.
    public func strokedPath(_ style: StrokeStyle) -> Path

    /// Returns a partial copy of the path.
    ///
    /// The returned path contains the region between `from` and `to`, both of
    /// which must be fractions between zero and one defining points
    /// linearly-interpolated along the path.
    public func trimmedPath(from: CGFloat, to: CGFloat) -> Path

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Path, b: Path) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Path : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in _: CGRect) -> Path

    /// The type defining the data to animate.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Path {

    /// Begins a new subpath at the specified point.
    public mutating func move(to p: CGPoint)

    /// Appends a straight line segment from the current point to the specified
    /// point.
    public mutating func addLine(to p: CGPoint)

    /// Adds a quadratic Bézier curve to the path, with the specified end point
    /// and control point.
    public mutating func addQuadCurve(to p: CGPoint, control cp: CGPoint)

    /// Adds a cubic Bézier curve to the path, with the specified end point and
    /// control points.
    public mutating func addCurve(to p: CGPoint, control1 cp1: CGPoint, control2 cp2: CGPoint)

    /// Closes and completes the current subpath.
    public mutating func closeSubpath()

    /// Adds a rectangular subpath to the path.
    public mutating func addRect(_ rect: CGRect, transform: CGAffineTransform = .identity)

    /// Adds a rounded rectangle to the path.
    public mutating func addRoundedRect(in rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .circular, transform: CGAffineTransform = .identity)

    /// Adds an ellipse to the path.
    public mutating func addEllipse(in rect: CGRect, transform: CGAffineTransform = .identity)

    /// Adds a sequence of rectangular subpaths to the path.
    public mutating func addRects(_ rects: [CGRect], transform: CGAffineTransform = .identity)

    /// Adds a sequence of connected straight-line segments to the path.
    public mutating func addLines(_ lines: [CGPoint])

    /// Adds an arc of a circle to the path, specified with a radius and a
    /// difference in angle.
    public mutating func addRelativeArc(center: CGPoint, radius: CGFloat, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity)

    /// Adds an arc of a circle to the path, specified with a radius and angles.
    public mutating func addArc(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool, transform: CGAffineTransform = .identity)

    /// Adds an arc of a circle to the path, specified with a radius and two
    /// tangent lines.
    public mutating func addArc(tangent1End p1: CGPoint, tangent2End p2: CGPoint, radius: CGFloat, transform: CGAffineTransform = .identity)

    /// Appends a copy of the given path to this path.
    public mutating func addPath(_ path: Path, transform: CGAffineTransform = .identity)

    /// Returns the last point in the path, or nil if the path contains
    /// no points.
    public var currentPoint: CGPoint? { get }

    /// Returns a path constructed by applying the transform to all points of
    /// the path.
    public func applying(_ transform: CGAffineTransform) -> Path

    /// Returns a path constructed by translating `self` by `(dx, dy)`.
    public func offsetBy(dx: CGFloat, dy: CGFloat) -> Path
}

/// A control for selecting from a set of mutually exclusive values.
///
/// You create a picker by providing a selection binding, a label, and the
/// content for the picker to display. Set the `selection` parameter to a bound
/// property that provides the value to display as the current selection. Set
/// the label to a view that visually describes the purpose of selecting content
/// in the picker, and then provide the content for the picker to display.
///
/// For example, consider the following enumeration of ice cream flavors:
///
///     enum Flavor: String, CaseIterable, Identifiable {
///         case chocolate
///         case vanilla
///         case strawberry
///
///         var id: String { self.rawValue }
///     }
///
/// You can create a picker to select among these values by providing ``Text``
/// views in the picker initializer's content. You can optionally provide a
/// string as the first parameter; if you do, the picker creates a ``Text``
/// label using this string:
///
///     @State private var selectedFlavor = Flavor.chocolate
///
///     Picker("Flavor", selection: $selectedFlavor) {
///         Text("Chocolate").tag(Flavor.chocolate)
///         Text("Vanilla").tag(Flavor.vanilla)
///         Text("Strawberry").tag(Flavor.strawberry)
///     }
///     Text("Selected flavor: \(selectedFlavor.rawValue)")
///
/// You append a tag to each text view so that the type of each selection
/// matches the type of the bound state variable.
///
/// ### Iterating Over a Picker’s Options
///
/// To provide selection values for the `Picker` without explicitly listing
/// each option, you can create the picker with a ``ForEach`` construct, like
/// this:
///
///     Picker("Flavor", selection: $selectedFlavor) {
///         ForEach(Flavor.allCases) { flavor in
///             Text(flavor.rawValue.capitalized)
///         }
///     }
///
/// In this case, ``ForEach`` automatically assigns a tag to the selection
/// views, using each option's `id`, which it can do because `Flavor` conforms
/// to the <doc://com.apple.documentation/documentation/Swift/Identifiable>
/// protocol.
///
/// On the other hand, if the selection type doesn't match the input to the
/// ``ForEach``, you need to provide an explicit tag. The following example
/// shows a picker that's bound to a `Topping` type, even though the options
/// are all `Flavor` instances. Each option uses ``View/tag(_:)`` to associate
/// a topping with the flavor it displays.
///
///     enum Topping: String, CaseIterable, Identifiable {
///         case nuts
///         case cookies
///         case blueberries
///
///         var id: String { self.rawValue }
///     }
///     extension Flavor {
///         var suggestedTopping: Topping {
///             switch self {
///             case .chocolate: return .nuts
///             case .vanilla: return .cookies
///             case .strawberry: return .blueberries
///             }
///         }
///     }
///     @State var suggestedTopping: Topping = .cookies
///
///     Picker("Suggest a topping for:", selection: $suggestedTopping) {
///         ForEach(Flavor.allCases) { flavor in
///             Text(flavor.rawValue.capitalized)
///                 .tag(flavor.suggestedTopping)
///         }
///     }
///     Text("suggestedTopping: \(suggestedTopping.rawValue)")
///
/// ### Styling Pickers
///
/// You can customize the appearance and interaction of pickers by creating
/// styles that conform to the ``PickerStyle`` protocol. You create your own style
/// or use one of the styles provided by SwiftUI, like ``SegmentedPickerStyle``
/// or ``PopUpButtonPickerStyle``.
///
/// To set a specific style for all picker instances within a view, use the
/// ``View/pickerStyle(_:)`` modifier. The following example adds a second binding
/// type, `Topping`, and applies the ``SegmentedPickerStyle`` to two pickers:
///
///     @State private var selectedFlavor = Flavor.chocolate
///     @State private var selectedTopping = Topping.nuts
///
///     VStack {
///         Picker("Flavor", selection: $selectedFlavor) {
///             ForEach(Flavor.allCases) { flavor in
///                 Text(flavor.rawValue.capitalized)
///             }
///         }
///         Picker("Topping", selection: $selectedTopping) {
///             ForEach(Topping.allCases) { flavor in
///                 Text(flavor.rawValue.capitalized)
///             }
///         }
///
///         Text("Selected flavor: \(selectedFlavor.rawValue)")
///         Text("Selected toppping: \(selectedTopping.rawValue)")
///     }
///     .pickerStyle(SegmentedPickerStyle())
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Picker<Label, SelectionValue, Content> : View where Label : View, SelectionValue : Hashable, Content : View {

    /// Creates a picker that displays a custom label.
    ///
    /// - Parameters:
    ///     - selection: A binding to a property that determines the
    ///       currently-selected option.
    ///     - label: A view that describes the purpose of selecting an option.
    ///     - content: A view that contains the set of options.
    public init(selection: Binding<SelectionValue>, label: Label, @ViewBuilder content: () -> Content)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Picker where Label == Text {

    /// Creates a picker that generates its label from a localized string key.
    ///
    /// - Parameters:
    ///     - titleKey: A localized string key that describes the purpose of
    ///       selecting an option.
    ///     - selection: A binding to a property that determines the
    ///       currently-selected option.
    ///     - content: A view that contains the set of options.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:tableName:bundle:comment:)``. See
    /// ``Text`` for more information about localizing strings.
    ///
    /// To initialize a picker with a string variable, use
    /// ``init(_:selection:content:)-5njtq`` instead.
    public init(_ titleKey: LocalizedStringKey, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content)

    /// Creates a picker that generates its label from a string.
    ///
    /// - Parameters:
    ///     - title: A string that describes the purpose of selecting an option.
    ///     - selection: A binding to a property that determines the
    ///       currently-selected option.
    ///     - content: A view that contains the set of options.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// title similar to ``Text/init(_:)-9d1g4``. See ``Text`` for more
    /// information about localizing strings.
    ///
    /// To initialize a picker with a localized string key, use
    /// ``init(_:selection:content:)-6lwfn`` instead.
    public init<S>(_ title: S, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) where S : StringProtocol
}

/// A type that specifies the appearance and interaction of all pickers within
/// a view hierarchy.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PickerStyle {
}

/// A set of view types that may be pinned to the bounds of a scroll view.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct PinnedScrollableViews : OptionSet {

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
    public let rawValue: UInt32

    /// Creates a new option set from the given raw value.
    ///
    /// This initializer always succeeds, even if the value passed as `rawValue`
    /// exceeds the static properties declared as part of the option set. This
    /// example creates an instance of `ShippingOptions` with a raw value beyond
    /// the highest element, with a bit mask that effectively contains all the
    /// declared static members.
    ///
    ///     let extraOptions = ShippingOptions(rawValue: 255)
    ///     print(extraOptions.isStrictSuperset(of: .all))
    ///     // Prints "true"
    ///
    /// - Parameter rawValue: The raw value of the option set to create. Each bit
    ///   of `rawValue` potentially represents an element of the option set,
    ///   though raw values may include bits that are not defined as distinct
    ///   values of the `OptionSet` type.
    public init(rawValue: UInt32)

    /// The header view of each `Section` will be pinned.
    public static let sectionHeaders: PinnedScrollableViews

    /// The footer view of each `Section` will be pinned.
    public static let sectionFooters: PinnedScrollableViews

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = PinnedScrollableViews

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = PinnedScrollableViews

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = UInt32
}

/// A button style that doesn't style or decorate its content while idle, but
/// may apply a visual effect to indicate the pressed, focused, or enabled state
/// of the button.
///
/// To apply this style to a button, or to a view that contains buttons, use the
/// ``View/buttonStyle(_:)-66fbx`` modifier.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlainButtonStyle : PrimitiveButtonStyle {

    /// Creates a plain button style.
    public init()

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: PlainButtonStyle.Configuration) -> some View


    /// A view that represents the body of a button.
    public typealias Body = some View
}

/// The instance that describes the behavior and appearance of a plain list.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlainListStyle : ListStyle {

    /// Creates a plain list style.
    public init()
}

/// A text field style with no decoration.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlainTextFieldStyle : TextFieldStyle {

    public init()
}

/// An attachment anchor for a popover.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum PopoverAttachmentAnchor {

    case rect(Anchor<CGRect>.Source)

    case point(UnitPoint)
}

/// A named value produced by a view.
///
/// A view with multiple children automatically combines its values for a given
/// preference into a single value visible to its ancestors.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PreferenceKey {

    /// The type of value produced by this preference.
    associatedtype Value

    /// The default value of the preference.
    ///
    /// Views that have no explicit value for the key produce this default
    /// value. Combining child views may remove an implicit value produced by
    /// using the default. This means that `reduce(value: &x, nextValue:
    /// {defaultValue})` shouldn't change the meaning of `x`.
    static var defaultValue: Self.Value { get }

    /// Combines a sequence of values by modifying the previously-accumulated
    /// value with the result of a closure that provides the next value.
    ///
    /// This method receives its values in view-tree order. Conceptually, this
    /// combines the preference value from one tree with that of its next
    /// sibling.
    ///
    /// - Parameters:
    ///   - value: The value accumulated through previous calls to this method.
    ///     The implementation should modify this value.
    ///   - nextValue: A closure that returns the next value in the sequence.
    static func reduce(value: inout Self.Value, nextValue: () -> Self.Value)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreferenceKey where Self.Value : ExpressibleByNilLiteral {

    /// Let nil-expressible values default-initialize to nil.
    public static var defaultValue: Self.Value { get }
}

/// A key for specifying the preferred color scheme.
@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
public struct PreferredColorSchemeKey : PreferenceKey {

    /// The type of value produced by this preference.
    public typealias Value = ColorScheme?

    /// Combines a sequence of values by modifying the previously-accumulated
    /// value with the result of a closure that provides the next value.
    ///
    /// This method receives its values in view-tree order. Conceptually, this
    /// combines the preference value from one tree with that of its next
    /// sibling.
    ///
    /// - Parameters:
    ///   - value: The value accumulated through previous calls to this method.
    ///     The implementation should modify this value.
    ///   - nextValue: A closure that returns the next value in the sequence.
    public static func reduce(value: inout PreferredColorSchemeKey.Value, nextValue: () -> PreferredColorSchemeKey.Value)
}

/// An indication whether a view is currently presented by another view.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PresentationMode {

    /// Indicates whether a view is currently presented.
    public var isPresented: Bool { get }

    /// Dismisses the view if it is currently presented.
    ///
    /// If `isPresented` is false, `dismiss()` is a no-op.
    public mutating func dismiss()
}

/// A specification for the context of a `PreviewContext`
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol PreviewContext {

    /// Returns the context's value of `Key`, or `Key.defaultValue`
    /// if the context does not define a value for the key.
    subscript<Key>(key: Key.Type) -> Key.Value where Key : PreviewContextKey { get }
}

/// The key for a preview context.
///
/// The default value is nil.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol PreviewContextKey {

    /// The type of the value returned by the key.
    associatedtype Value

    /// The default value of the key.
    static var defaultValue: Self.Value { get }
}

/// The simulator device that runs a preview.
///
/// Refer to a preview device by its name as shown Xcode's run destination menu,
/// like "iPhone X", or using a model number, like "iPad8,1".
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PreviewDevice : RawRepresentable, ExpressibleByStringLiteral {

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
    public let rawValue: String

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
    public init(rawValue: String)

    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral: String)

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = String

    /// A type that represents a string literal.
    ///
    /// Valid types for `StringLiteralType` are `String` and `StaticString`.
    public typealias StringLiteralType = String

    /// A type that represents an extended grapheme cluster literal.
    ///
    /// Valid types for `ExtendedGraphemeClusterLiteralType` are `Character`,
    /// `String`, and `StaticString`.
    public typealias ExtendedGraphemeClusterLiteralType = String

    /// A type that represents a Unicode scalar literal.
    ///
    /// Valid types for `UnicodeScalarLiteralType` are `Unicode.Scalar`,
    /// `Character`, `String`, and `StaticString`.
    public typealias UnicodeScalarLiteralType = String
}

/// The size constraint for a preview.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum PreviewLayout {

    /// Center the preview in a container the size of the device on which the
    /// preview is running.
    case device

    /// Fit the container to the size of the preview when offered the size of
    /// the device on which the preview is running.
    case sizeThatFits

    /// Center the preview in a fixed size container.
    case fixed(width: CGFloat, height: CGFloat)
}

/// The operating system on which to run the preview.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum PreviewPlatform {

    case iOS

    case macOS

    case tvOS

    case watchOS

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: PreviewPlatform, b: PreviewPlatform) -> Bool

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
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreviewPlatform : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreviewPlatform : Hashable {
}

/// A type that produces view previews in Xcode.
///
/// Xcode statically discovers types that conform to the ``PreviewProvider``
/// protocol in your app, and generates previews for each provider it discovers.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PreviewProvider : _PreviewProvider {

    /// The type to preview.
    associatedtype Previews : View

    /// Generates a collection of previews.
    ///
    /// The following code shows how to create a preview provider that previews
    /// a view called `MyView` for iPhone X:
    ///
    ///     struct MyPreviews : PreviewProvider {
    ///         static var previews: some View {
    ///             MyView()
    ///                 .previewDevice("iPhone X")
    ///         }
    ///     }
    @ViewBuilder static var previews: Self.Previews { get }

    /// The platform on which to run the provider.
    ///
    /// If the preview provider returns `nil` for this property, Xcode infers
    /// the platform based on the file in which the ``PreviewProvider`` is
    /// defined. Return `nil` only when the file is in a target that supports
    /// multiple platforms.
    static var platform: PreviewPlatform? { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreviewProvider {

    /// The platform on which to run the provider.
    ///
    /// If the preview provider returns `nil` for this property, Xcode infers
    /// the platform based on the file in which the ``PreviewProvider`` is
    /// defined. Return `nil` only when the file is in a target that supports
    /// multiple platforms.
    public static var platform: PreviewPlatform? { get }
}

/// A type that applies custom interaction behavior and a custom appearance to
/// all buttons within a view hierarchy.
///
/// To configure the current button style for a view hierarchy, use the
/// ``View/buttonStyle(_:)-66fbx`` modifier. Specify a style that conforms to
/// ``PrimitiveButtonStyle`` to create a button with custom interaction
/// behavior. To create a button with the standard button interaction behavior
/// defined for each platform, use ``ButtonStyle`` instead.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PrimitiveButtonStyle {

    /// A view that represents the body of a button.
    associatedtype Body : View

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a button.
    typealias Configuration = PrimitiveButtonStyleConfiguration
}

/// The properties of a button.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PrimitiveButtonStyleConfiguration {

    /// A type-erased label of a button.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A view that describes the effect of calling the button's action.
    public let label: PrimitiveButtonStyleConfiguration.Label

    /// Performs the button's action.
    public func trigger()
}

/// A view that shows the progress towards completion of a task.
///
/// Use a progress view to show that a task is making progress towards
/// completion. A progress view can show both determinate (percentage complete)
/// and indeterminate (progressing or not) types of progress.
///
/// Create a determinate progress view by initializing a `ProgressView` with
/// a binding to a numeric value that indicates the progress, and a `total`
/// value that represents completion of the task. By default, the progress is
/// `0.0` and the total is `1.0`.
///
/// The example below uses the state property `progress` to show progress in
/// a determinate `ProgressView`. The progress view uses its default total of
/// `1.0`, and because `progress` starts with an initial value of `0.5`,
/// the progress view begins half-complete. A "More" button below the progress
/// view allows the user to increment the progress in 5% increments:
///
///     @State private var progress = 0.5
///
///     VStack {
///         ProgressView(value: progress)
///         Button("More", action: { progress += 0.05 })
///     }
///
/// To create an indeterminate progress view, use an initializer that doesn't
/// take a progress value:
///
///     var body: some View {
///         ProgressView()
///     }
///
/// ### Styling Progress Views
///
/// You can customize the appearance and interaction of progress views by
/// creating styles that conform to the ``ProgressViewStyle`` protocol. To set a
/// specific style for all progress view instances within a view, use the
/// ``View/progressViewStyle(_:)`` modifier. In the following example, a custom
/// style adds a dark blue shadow to all progress views within the enclosing
/// ``VStack``:
///
///     struct ShadowedProgressViews: View {
///         var body: some View {
///             VStack {
///                 ProgressView(value: 0.25)
///                 ProgressView(value: 0.75)
///             }
///             .progressViewStyle(DarkBlueShadowProgressViewStyle())
///         }
///     }
///
///     struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
///         func makeBody(configuration: Configuration) -> some View {
///             ProgressView(configuration)
///                 .shadow(color: Color(red: 0, green: 0, blue: 0.6),
///                         radius: 4.0, x: 1.0, y: 2.0)
///         }
///     }
///
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ProgressView<Label, CurrentValueLabel> : View where Label : View, CurrentValueLabel : View {

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressView where CurrentValueLabel == EmptyView {

    /// Creates a progress view for showing indeterminate progress, without a
    /// label.
    public init() where Label == EmptyView

    /// Creates a progress view for showing indeterminate progress that displays
    /// a custom label.
    ///
    /// - Parameters:
    ///     - label: A view builder that creates a view that describes the task
    ///       in progress.
    public init(@ViewBuilder label: () -> Label)

    /// Creates a progress view for showing indeterminate progress that
    /// generates its label from a localized string.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:tableName:bundle:comment:)``. See
    /// ``Text`` for more information about localizing strings. To initialize a
    /// indeterminate progress view with a string variable, use
    /// the corresponding initializer that takes a `StringProtocol` instance.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the progress view's localized title that
    ///       describes the task in progress.
    public init(_ titleKey: LocalizedStringKey) where Label == Text

    /// Creates a progress view for showing indeterminate progress that
    /// generates its label from a string.
    ///
    /// - Parameters:
    ///     - title: A string that describes the task in progress.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// title similar to ``Text/init(verbatim:)``. See ``Text`` for more
    /// information about localizing strings. To initialize a progress view with
    /// a localized string key, use the corresponding initializer that takes a
    /// `LocalizedStringKey` instance.
    public init<S>(_ title: S) where Label == Text, S : StringProtocol
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressView {

    /// Creates a progress view for showing determinate progress.
    ///
    /// If the value is non-`nil`, but outside the range of `0.0` through
    /// `total`, the progress view pins the value to those limits, rounding to
    /// the nearest possible bound. A value of `nil` represents indeterminate
    /// progress, in which case the progress view ignores `total`.
    ///
    /// - Parameters:
    ///     - value: The completed amount of the task to this point, in a range
    ///       of `0.0` to `total`, or `nil` if the progress is indeterminate.
    ///     - total: The full amount representing the complete scope of the
    ///       task, meaning the task is complete if `value` equals `total`. The
    ///       default value is `1.0`.
    public init<V>(value: V?, total: V = 1.0) where Label == EmptyView, CurrentValueLabel == EmptyView, V : BinaryFloatingPoint

    /// Creates a progress view for showing determinate progress, with a
    /// custom label.
    ///
    /// If the value is non-`nil`, but outside the range of `0.0` through
    /// `total`, the progress view pins the value to those limits, rounding to
    /// the nearest possible bound. A value of `nil` represents indeterminate
    /// progress, in which case the progress view ignores `total`.
    ///
    /// - Parameters:
    ///     - value: The completed amount of the task to this point, in a range
    ///       of `0.0` to `total`, or `nil` if the progress is indeterminate.
    ///     - total: The full amount representing the complete scope of the
    ///       task, meaning the task is complete if `value` equals `total`. The
    ///       default value is `1.0`.
    ///     - label: A view builder that creates a view that describes the task
    ///       in progress.
    public init<V>(value: V?, total: V = 1.0, @ViewBuilder label: () -> Label) where CurrentValueLabel == EmptyView, V : BinaryFloatingPoint

    /// Creates a progress view for showing determinate progress, with a
    /// custom label.
    ///
    /// If the value is non-`nil`, but outside the range of `0.0` through
    /// `total`, the progress view pins the value to those limits, rounding to
    /// the nearest possible bound. A value of `nil` represents indeterminate
    /// progress, in which case the progress view ignores `total`.
    ///
    /// - Parameters:
    ///     - value: The completed amount of the task to this point, in a range
    ///       of `0.0` to `total`, or `nil` if the progress is indeterminate.
    ///     - total: The full amount representing the complete scope of the
    ///       task, meaning the task is complete if `value` equals `total`. The
    ///       default value is `1.0`.
    ///     - label: A view builder that creates a view that describes the task
    ///       in progress.
    ///     - currentValueLabel: A view builder that creates a view that
    ///       describes the level of completed progress of the task.
    public init<V>(value: V?, total: V = 1.0, @ViewBuilder label: () -> Label, @ViewBuilder currentValueLabel: () -> CurrentValueLabel) where V : BinaryFloatingPoint

    /// Creates a progress view for showing determinate progress that generates
    /// its label from a localized string.
    ///
    /// If the value is non-`nil`, but outside the range of `0.0` through
    /// `total`, the progress view pins the value to those limits, rounding to
    /// the nearest possible bound. A value of `nil` represents indeterminate
    /// progress, in which case the progress view ignores `total`.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:tableName:bundle:comment:)``. See
    /// ``Text`` for more information about localizing strings. To initialize a
    ///  determinate progress view with a string variable, use
    ///  the corresponding initializer that takes a `StringProtocol` instance.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the progress view's localized title that
    ///       describes the task in progress.
    ///     - value: The completed amount of the task to this point, in a range
    ///       of `0.0` to `total`, or `nil` if the progress is
    ///       indeterminate.
    ///     - total: The full amount representing the complete scope of the
    ///       task, meaning the task is complete if `value` equals `total`. The
    ///       default value is `1.0`.
    public init<V>(_ titleKey: LocalizedStringKey, value: V?, total: V = 1.0) where Label == Text, CurrentValueLabel == EmptyView, V : BinaryFloatingPoint

    /// Creates a progress view for showing determinate progress that generates
    /// its label from a string.
    ///
    /// If the value is non-`nil`, but outside the range of `0.0` through
    /// `total`, the progress view pins the value to those limits, rounding to
    /// the nearest possible bound. A value of `nil` represents indeterminate
    /// progress, in which case the progress view ignores `total`.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// title similar to ``Text/init(verbatim:)``. See ``Text`` for more
    /// information about localizing strings. To initialize a determinate
    /// progress view with a localized string key, use the corresponding
    /// initializer that takes a `LocalizedStringKey` instance.
    ///
    /// - Parameters:
    ///     - title: The string that describes the task in progress.
    ///     - value: The completed amount of the task to this point, in a range
    ///       of `0.0` to `total`, or `nil` if the progress is
    ///       indeterminate.
    ///     - total: The full amount representing the complete scope of the
    ///       task, meaning the task is complete if `value` equals `total`. The
    ///       default value is `1.0`.
    public init<S, V>(_ title: S, value: V?, total: V = 1.0) where Label == Text, CurrentValueLabel == EmptyView, S : StringProtocol, V : BinaryFloatingPoint
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressView {

    /// Creates a progress view for visualizing the given progress instance.
    ///
    /// The progress view synthesizes a default label using the
    /// `localizedDescription` of the given progress instance.
    public init(_ progress: Progress) where Label == EmptyView, CurrentValueLabel == EmptyView
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ProgressView {

    /// Creates a progress view based on a style configuration.
    ///
    /// You can use this initializer within the
    /// ``ProgressViewStyle/makeBody(configuration:)`` method of a
    /// ``ProgressViewStyle`` to create an instance of the styled progress view.
    /// This is useful for custom progress view styles that only modify the
    /// current progress view style, as opposed to implementing a brand new
    /// style.
    ///
    /// For example, the following style adds a dark blue shadow to the progress
    /// view, but otherwise preserves the progress view's current style:
    ///
    ///     struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             ProgressView(configuration)
    ///                 .shadow(color: Color(red: 0, green: 0, blue: 0.6),
    ///                         radius: 4.0, x: 1.0, y: 2.0)
    ///         }
    ///     }
    ///
    public init(_ configuration: ProgressViewStyleConfiguration) where Label == ProgressViewStyleConfiguration.Label, CurrentValueLabel == ProgressViewStyleConfiguration.CurrentValueLabel
}

/// A type that applies standard interaction behavior to all progress views
/// within a view hierarchy.
///
/// To configure the current progress view style for a view hiearchy, use the
/// ``View/progressViewStyle(_:)`` modifier.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol ProgressViewStyle {

    /// A view representing the body of a progress view.
    associatedtype Body : View

    /// Creates a view representing the body of a progress view.
    ///
    /// - Parameter configuration: The properties of the progress view being
    ///   created.
    ///
    /// The view hierarchy calls this method for each progress view where this
    /// style is the current progress view style.
    ///
    /// - Parameter configuration: The properties of the progress view, such as
    ///  its preferred progress type.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// A type alias for the properties of a progress view instance.
    typealias Configuration = ProgressViewStyleConfiguration
}

/// The properties of a progress view instance.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ProgressViewStyleConfiguration {

    /// A type-erased label describing the task represented by the progress
    /// view.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A type-erased label that describes the current value of a progress view.
    public struct CurrentValueLabel : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// The completed fraction of the task represented by the progress view,
    /// from `0.0` (not yet started) to `1.0` (fully complete), or `nil` if the
    /// progress is indeterminate.
    public let fractionCompleted: Double?

    /// A view that describes the task represented by the progress view.
    ///
    /// If `nil`, then the task is self-evident from the surrounding context,
    /// and the style does not need to provide any additional description.
    ///
    /// If the progress view is defined using a `Progress` instance, then this
    /// label is equivalent to its `localizedDescription`.
    public var label: ProgressViewStyleConfiguration.Label?

    /// A view that describes the current value of a progress view.
    ///
    /// If `nil`, then the value of the progress view is either self-evident
    /// from the surrounding context or unknown, and the style does not need to
    /// provide any additional description.
    ///
    /// If the progress view is defined using a `Progress` instance, then this
    /// label is equivalent to its `localizedAdditionalDescription`.
    public var currentValueLabel: ProgressViewStyleConfiguration.CurrentValueLabel?
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ProjectionTransform {

    public var m11: CGFloat

    public var m12: CGFloat

    public var m13: CGFloat

    public var m21: CGFloat

    public var m22: CGFloat

    public var m23: CGFloat

    public var m31: CGFloat

    public var m32: CGFloat

    public var m33: CGFloat

    @inlinable public init()

    @inlinable public init(_ m: CGAffineTransform)

    @inlinable public init(_ m: CATransform3D)

    @inlinable public var isIdentity: Bool { get }

    @inlinable public var isAffine: Bool { get }

    public mutating func invert() -> Bool

    public func inverted() -> ProjectionTransform
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ProjectionTransform : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ProjectionTransform, b: ProjectionTransform) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ProjectionTransform {

    @inlinable public func concatenating(_ rhs: ProjectionTransform) -> ProjectionTransform
}

/// A radial gradient.
///
/// The gradient applies the color function as the distance from a center point,
/// scaled to fit within the defined start and end radii. The gradient maps the
/// unit-space center point into the bounding rectangle of each shape filled
/// with the gradient.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct RadialGradient : ShapeStyle, View {

    public init(gradient: Gradient, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

/// A rectangular shape aligned inside the frame of the view containing it.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Rectangle : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    @inlinable public init()

    /// The type defining the data to animate.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Rectangle : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// The reasons to apply a redaction to data displayed on screen.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct RedactionReasons : OptionSet {

    /// The raw value.
    public let rawValue: Int

    /// Creates a new set from a raw value.
    ///
    /// - Parameter rawValue: The raw value with which to create the
    ///   reasons for redaction.
    public init(rawValue: Int)

    /// Displayed data should appear as generic placeholders.
    ///
    /// Text and images will be automatically masked to appear as
    /// generic placeholders, though maintaining their original size and shape.
    /// Use this to create a placeholder UI without directly exposing
    /// placeholder data to users.
    public static let placeholder: RedactionReasons

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = RedactionReasons

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = RedactionReasons

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int
}

/// A document model definition used to serialize reference type documents to
/// and from file contents.
///
/// Conformance to `ReferenceFileDocument` is expected to be thread-safe, and
/// deserialization and serialization will be done on a background thread.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol ReferenceFileDocument : ObservableObject {

    /// A type of the document snapshot that can be used for serialization
    /// in parallel to the main document being editable.
    ///
    /// - See Also: `snapshot(contentType:)`
    associatedtype Snapshot

    /// The types the document is able to open.
    static var readableContentTypes: [UTType] { get }

    /// The types the document is able to save or export to.
    ///
    /// Defaults to `readableContentTypes`.
    static var writableContentTypes: [UTType] { get }

    /// Initialize self by reading from the contents of a given `ReadConfiguration`.
    init(configuration: Self.ReadConfiguration) throws

    /// The configuration for reading document contents.
    typealias ReadConfiguration = FileDocumentReadConfiguration

    /// Create a snapshot of the current state of the document, which will be
    /// used for serialization while `self` becomes editable by the user.
    ///
    /// When saving a `ReferenceFileDocument`, edits to the document are blocked
    /// until snapshot with a copy of any mutable references can be created.
    /// Once the snapshot is created, the document becomes editable in parallel
    /// to the snapshot being serialized using `write(snaphot:to:contentType:)`.
    ///
    /// - Parameter contentType: The content type being written, for which the
    ///   snapshot should be created.
    func snapshot(contentType: UTType) throws -> Self.Snapshot

    /// Serialize the snapshot to file contents for a specified `type`.
    ///
    /// - Parameters:
    ///   - snapshot: The snapshot of the document containing the state required
    ///     to be saved.
    ///   - configuration: The configuration for the current document contents.
    ///
    /// - Returns: The destination to serialize the document contents to. The
    ///   value can be a newly created `FileWrapper` or an updated `FileWrapper`
    ///   of the one provided in `configuration`.
    func fileWrapper(snapshot: Self.Snapshot, configuration: Self.WriteConfiguration) throws -> FileWrapper

    /// The configurations for serializing document contents.
    typealias WriteConfiguration = FileDocumentWriteConfiguration
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ReferenceFileDocument {

    /// The types the document is able to save or export to.
    ///
    /// Defaults to `readableContentTypes`.
    public static var writableContentTypes: [UTType] { get }
}

/// The properties of an open reference file document.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ReferenceFileDocumentConfiguration<Document> where Document : ReferenceFileDocument {

    /// The current document model.
    ///
    /// Changes to the document are observed and on change dirty the document
    /// state for resaving. Undo actions are not automatically registered and
    /// need to be done explicitly.
    public var document: Document

    public var $document: ObservedObject<Document>.Wrapper { get }

    /// The url of the open file document.
    public var fileURL: URL?

    /// Whether the document is able to be edited.
    ///
    /// This can return `false` if the document is in viewing mode or if the
    /// file is unable to be written to.
    public var isEditable: Bool
}

/// A shape with a rotation transform applied to it.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct RotatedShape<Content> : Shape where Content : Shape {

    public var shape: Content

    public var angle: Angle

    public var anchor: UnitPoint

    @inlinable public init(shape: Content, angle: Angle, anchor: UnitPoint = .center)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<Content.AnimatableData, AnimatablePair<Angle.AnimatableData, UnitPoint.AnimatableData>>

    /// The data to animate.
    public var animatableData: RotatedShape<Content>.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension RotatedShape : InsettableShape where Content : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> RotatedShape<Content.InsetShape>

    /// The type of the inset shape.
    public typealias InsetShape = RotatedShape<Content.InsetShape>
}

/// A gesture that recognizes a rotation motion and tracks the angle of the
/// rotation.
///
/// A rotation gesture tracks how a rotation event sequence changes. To
/// recognize a rotation gesture on a view, create and configure the gesture,
/// and then add it to the view using the ``View/gesture(_:including:)``
/// modifier.
///
/// Add a rotation gesture to a ``Rectangle`` and apply a rotation effect:
///
///     struct RotationGestureView: View {
///         @State var angle = Angle(degrees: 0.0)
///
///         var rotation: some Gesture {
///             RotationGesture()
///                 .onChanged { angle in
///                     self.angle = angle
///                 }
///         }
///
///         var body: some View {
///             Rectangle()
///                 .frame(width: 200, height: 200, alignment: .center)
///                 .rotationEffect(self.angle)
///                 .gesture(rotation)
///         }
///     }
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct RotationGesture : Gesture {

    /// The minimum delta required before the gesture succeeds.
    public var minimumAngleDelta: Angle

    /// Creates a rotation gesture with a minimum delta for the gesture to
    /// start.
    ///
    /// - Parameter minimumAngleDelta: The minimum delta required before the
    ///   gesture starts. The default value is a one-degree angle.
    public init(minimumAngleDelta: Angle = .degrees(1))

    /// The type representing the gesture's value.
    public typealias Value = Angle

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

/// A text field style with a system-defined rounded border.
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct RoundedBorderTextFieldStyle : TextFieldStyle {

    public init()
}

/// Defines the shape of a rounded rectangle's corners.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum RoundedCornerStyle {

    /// Quarter-circle rounded rect corners.
    case circular

    /// Continuous curvature rounded rect corners.
    case continuous

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: RoundedCornerStyle, b: RoundedCornerStyle) -> Bool

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
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension RoundedCornerStyle : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension RoundedCornerStyle : Hashable {
}

/// A rectangular shape with rounded corners, aligned inside the frame of the
/// view containing it.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct RoundedRectangle : Shape {

    public var cornerSize: CGSize

    public var style: RoundedCornerStyle

    @inlinable public init(cornerSize: CGSize, style: RoundedCornerStyle = .circular)

    @inlinable public init(cornerRadius: CGFloat, style: RoundedCornerStyle = .circular)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    /// The data to animate.
    public var animatableData: CGSize.AnimatableData

    /// The type defining the data to animate.
    public typealias AnimatableData = CGSize.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension RoundedRectangle : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// A set of symbolic safe area regions.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct SafeAreaRegions : OptionSet {

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
    public let rawValue: UInt

    /// Creates a new option set from the given raw value.
    ///
    /// This initializer always succeeds, even if the value passed as `rawValue`
    /// exceeds the static properties declared as part of the option set. This
    /// example creates an instance of `ShippingOptions` with a raw value beyond
    /// the highest element, with a bit mask that effectively contains all the
    /// declared static members.
    ///
    ///     let extraOptions = ShippingOptions(rawValue: 255)
    ///     print(extraOptions.isStrictSuperset(of: .all))
    ///     // Prints "true"
    ///
    /// - Parameter rawValue: The raw value of the option set to create. Each bit
    ///   of `rawValue` potentially represents an element of the option set,
    ///   though raw values may include bits that are not defined as distinct
    ///   values of the `OptionSet` type.
    @inlinable public init(rawValue: UInt)

    /// The safe area defined by the device and containers within the
    /// user interface, including elements such as top and bottom bars.
    public static let container: SafeAreaRegions

    /// The safe area matching the current extent of any software
    /// keyboard displayed over the view content.
    public static let keyboard: SafeAreaRegions

    /// All safe area regions.
    public static let all: SafeAreaRegions

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = SafeAreaRegions

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = SafeAreaRegions

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = UInt
}

/// A dynamic property that scales a numeric value.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@propertyWrapper public struct ScaledMetric<Value> : DynamicProperty where Value : BinaryFloatingPoint {

    /// Creates the scaled metric with an unscaled value and a text style to
    /// scale relative to.
    public init(wrappedValue: Value, relativeTo textStyle: Font.TextStyle)

    /// Creates the scaled metric with an unscaled value using the default
    /// scaling.
    public init(wrappedValue: Value)

    /// The value scaled based on the current environment.
    public var wrappedValue: Value { get }
}

/// A shape with a scale transform applied to it.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ScaledShape<Content> : Shape where Content : Shape {

    public var shape: Content

    public var scale: CGSize

    public var anchor: UnitPoint

    @inlinable public init(shape: Content, scale: CGSize, anchor: UnitPoint = .center)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<Content.AnimatableData, AnimatablePair<CGSize.AnimatableData, UnitPoint.AnimatableData>>

    /// The data to animate.
    public var animatableData: ScaledShape<Content>.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

/// A part of an app's user interface with a life cycle managed by the
/// system.
///
/// You create an ``SwiftUI/App`` by combining one or more instances
/// that conform to the `Scene` protocol in the app's
/// ``SwiftUI/App/body-swift.property``. You can use the primitive scenes that
/// SwiftUI provides, like ``SwiftUI/WindowGroup``, along with custom scenes
/// that you compose from other scenes. To create a custom scene, declare a
/// type that conforms to the `Scene` protocol. Implement the required
/// ``SwiftUI/Scene/body-swift.property`` computed property and provide the
/// content for your custom scene:
///
///     struct MyScene: Scene {
///         var body: some Scene {
///             WindowGroup {
///                 MyRootView()
///             }
///         }
///     }
///
/// A scene acts as a container for a view hierarchy that you want to display
/// to the user. The system decides when and how to present the view hierarchy
/// in the user interface in a way that's platform-appropriate and dependent
/// on the current state of the app. For example, for the window group shown
/// above, the system lets the user create or remove windows that contain
/// `MyRootView` on platforms like macOS and iPadOS. On other platforms, the
/// same view hierarchy might consume the entire display when active.
///
/// Read the ``SwiftUI/EnvironmentValues/scenePhase`` environment
/// value from within a scene or one of its views to check whether a scene is
/// active or in some other state. You can create a property that contains the
/// scene phase, which is one of the values in the ``SwiftUI/ScenePhase``
/// enumeration, using the ``SwiftUI/Environment`` attribute:
///
///     struct MyScene: Scene {
///         @Environment(\.scenePhase) private var scenePhase
///
///         // ...
///     }
///
/// The `Scene` protocol provides scene modifiers, defined as protocol methods
/// with default implementations, that you use to configure a scene. For
/// example, you can use the ``SwiftUI/Scene/onChange(of:perform:)`` modifier to
/// trigger an action when a value changes. The following code empties a cache
/// when all of the scenes in the window group have moved to the background:
///
///     struct MyScene: Scene {
///         @Environment(\.scenePhase) private var scenePhase
///         @StateObject private var cache = DataCache()
///
///         var body: some Scene {
///             WindowGroup {
///                 MyRootView()
///             }
///             .onChange(of: scenePhase) { newScenePhase in
///                 if newScenePhase == .background {
///                     cache.empty()
///                 }
///             }
///         }
///     }
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol Scene {

    /// The type of scene that represents the body of this scene.
    ///
    /// When you create a custom scene, Swift infers this type from your
    /// implementation of the required ``SwiftUI/Scene/body-swift.property``
    /// property.
    associatedtype Body : Scene

    /// The content and behavior of the scene.
    ///
    /// For any scene that you create, provide a computed `body` property that
    /// defines the scene as a composition of other scenes. You can assemble a
    /// scene from primitive scenes that SwiftUI provides, as well as other
    /// scenes that you've defined.
    ///
    /// Swift infers the scene's ``SwiftUI/Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    @SceneBuilder var body: Self.Body { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Scene {

    /// Adds an action to perform when the given value changes.
    ///
    /// Use this modifier to trigger a side effect when a value changes, like
    /// the value associated with an ``SwiftUI/Environment`` key or a
    /// ``SwiftUI/Binding``. For example, you can clear a cache when you notice
    /// that a scene moves to the background:
    ///
    ///     struct MyScene: Scene {
    ///         @Environment(\.scenePhase) private var scenePhase
    ///         @StateObject private var cache = DataCache()
    ///
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 MyRootView()
    ///             }
    ///             .onChange(of: scenePhase) { newScenePhase in
    ///                 if newScenePhase == .background {
    ///                     cache.empty()
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// The system calls the `action` closure on the main thread, so avoid
    /// long-running tasks in the closure. If you need to perform such tasks,
    /// dispatch to a background queue:
    ///
    ///     .onChange(of: scenePhase) { newScenePhase in
    ///         if newScenePhase == .background {
    ///             DispatchQueue.global(qos: .background).async {
    ///                 // ...
    ///             }
    ///         }
    ///     }
    ///
    /// The system passes the new value into the closure. If you need the old
    /// value, capture it in the closure.
    ///
    /// - Parameters:
    ///   - value: The value to check when determining whether to run the
    ///     closure. The value must conform to the
    ///     <doc://com.apple.documentation/documentation/Swift/Equatable>
    ///     protocol.
    ///   - action: A closure to run when the value changes. The closure
    ///     provides a single `newValue` parameter that indicates the changed
    ///     value.
    ///
    /// - Returns: A scene that triggers an action in response to a change.
    @inlinable public func onChange<V>(of value: V, perform action: @escaping (V) -> Void) -> some Scene where V : Equatable

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {

    /// Adds commands to the scene.
    ///
    /// Commands are realized in different ways on different platforms. On
    /// macOS, the main menu uses the available command menus and groups to
    /// organize its main menu items. Each menu is represented as a top-level
    /// menu bar menu, and each command group has a corresponding set of menu
    /// items in one of the top-level menus, delimited by separator menu items.
    ///
    /// On iPadOS, commands with keyboard shortcuts are exposed in the shortcut
    /// discoverability HUD that users see when they hold down the Command (⌘)
    /// key.
    public func commands<Content>(@CommandsBuilder content: () -> Content) -> some Scene where Content : Commands

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Scene {

    /// The default store used by `AppStorage` contained within the scene and
    /// its view content.
    ///
    /// If unspecified, the default store for a view hierarchy is
    /// `UserDefaults.standard`, but can be set a to a custom one. For example,
    /// sharing defaults between an app and an extension can override the
    /// default store to one created with `UserDefaults.init(suiteName:_)`.
    ///
    /// - Parameter store: The user defaults to use as the default
    ///   store for `AppStorage`.
    public func defaultAppStorage(_ store: UserDefaults) -> some Scene

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {

    /// Specifies a modifier to indicate if this Scene can be used
    /// when creating a new Scene for the received External Event.
    ///
    /// This modifier is only supported for WindowGroup Scene types.
    ///
    /// For DocumentGroups, the received External Event must have a URL
    /// for the DocumentGroup to be considered. (Either via openURL, or
    /// the webPageURL property of an NSUserActivity). The UTI for the URL
    /// is implicitly matched against the DocumentGroup's supported types.
    ///
    /// If the modifier evaluates to true, an instance of the
    /// Scene will be used.
    ///
    /// If the modifier evaluates to false, on macOS the Scene
    /// will not be used even if no other Scenes are available.
    /// This case is considered an error. On iOS, the first Scene
    /// specified in the body property for the App will be used.
    ///
    /// If no modifier is set, the Scene will be used if all
    /// other WindowGroups with a modifier evaluate to false.
    ///
    /// On platforms that only allow a single Window/Scene, this method is
    /// ignored.
    ///
    /// - Parameter matching: A Set of Strings that are checked to see
    /// if they are contained in the targetContentIdenfifier. The empty Set
    /// and empty Strings never match. The String value "*" always matches.
    public func handlesExternalEvents(matching conditions: Set<String>) -> some Scene

}

/// A function builder for composing a collection of scenes into a single
/// composite scene.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@_functionBuilder public struct SceneBuilder {

    /// Passes a single scene written as a child scene through unmodified.
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : Scene
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some Scene where C0 : Scene, C1 : Scene

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene, C5 : Scene

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene, C5 : Scene, C6 : Scene

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene, C5 : Scene, C6 : Scene, C7 : Scene

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene, C5 : Scene, C6 : Scene, C7 : Scene, C8 : Scene

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some Scene where C0 : Scene, C1 : Scene, C2 : Scene, C3 : Scene, C4 : Scene, C5 : Scene, C6 : Scene, C7 : Scene, C8 : Scene, C9 : Scene

}

/// An indication of a scene's operational state.
///
/// The system moves your app's ``Scene`` instances through phases that reflect
/// a scene's operational state. You can trigger actions when the phase changes.
/// Read the current phase by observing the ``EnvironmentValues/scenePhase``
/// value in the ``Environment``:
///
///     @Environment(\.scenePhase) private var scenePhase
///
/// How you interpret the value depends on where it's read from.
/// If you read the phase from inside a ``View`` instance, you obtain a value
/// that reflects the phase of the scene that contains the view. The following
/// example uses the ``SwiftUI/View/onChange(of:perform:)`` method to enable
/// a timer whenever the enclosing scene enters the ``ScenePhase/active`` phase
/// and disable the timer when entering any other phase:
///
///     struct MyView: View {
///         @ObservedObject var model: DataModel
///         @Environment(\.scenePhase) private var scenePhase
///
///         var body: some View {
///             TimerView()
///                 .onChange(of: scenePhase) { phase in
///                     model.isTimerRunning = (phase == .active)
///                 }
///         }
///     }
///
/// If you read the phase from within an ``App`` instance, you obtain an
/// aggregate value that reflects the phases of all the scenes in your app. The
/// app reports a value of ``ScenePhase/active`` if any scene is active, or a
/// value of ``ScenePhase/inactive`` when no scenes are active. This includes
/// multiple scene instances created from a single scene declaration; for
/// example, from a ``WindowGroup``. When an app enters the
/// ``ScenePhase/background`` phase, expect the app to terminate soon after.
/// You can use that opportunity to free any resources:
///
///     @main
///     struct MyApp: App {
///         @Environment(\.scenePhase) private var scenePhase
///
///         var body: some Scene {
///             WindowGroup {
///                 MyRootView()
///             }
///             .onChange(of: scenePhase) { phase in
///                 if phase == .background {
///                     // Perform cleanup when all scenes within
///                     // MyApp go to the background.
///                 }
///             }
///         }
///     }
///
/// If you read the phase from within a custom ``Scene`` instance, the value
/// similarly reflects an aggregation of all the scenes that make up the custom
/// scene:
///
///     struct MyScene: Scene {
///         @Environment(\.scenePhase) private var scenePhase
///
///         var body: some Scene {
///             WindowGroup {
///                 MyRootView()
///             }
///             .onChange(of: scenePhase) { phase in
///                 if phase == .background {
///                     // Perform cleanup when all scenes within
///                     // MyScene go to the background.
///                 }
///             }
///         }
///     }
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public enum ScenePhase : Comparable {

    /// The scene isn't currently visible in the UI.
    ///
    /// Do as little as possible in a scene that's in the `background` phase.
    /// The `background` phase can precede termination, so do any cleanup work
    /// immediately upon entering this state. For example, close any open files
    /// and network connections. However, a scene can also return to the
    /// the ``ScenePhase/active`` phase from the background.
    ///
    /// Expect an app that enters the `background` phase to terminate.
    case background

    /// The scene is in the foreground but should pause its work.
    ///
    /// A scene in this phase doesn't receive events and should pause
    /// timers and free any unnecessary resources. The scene might be completely
    /// hidden in the user interface or otherwise unavailable to the user.
    /// In macOS, scenes only pass through this phase temporarily on their way
    /// to the ``ScenePhase/background`` phase.
    ///
    /// An app or custom scene in this phase contains no scene instances in the
    /// ``ScenePhase/active`` phase.
    case inactive

    /// The scene is in the foreground and interactive.
    ///
    /// An active scene isn't necessarily front-most. For example, a macOS
    /// window might be active even if it doesn't currently have focus.
    /// Nevertheless, all scenes should operate normally in this phase.
    ///
    /// An app or custom scene in this phase contains at least one active scene
    /// instance.
    case active

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ScenePhase, b: ScenePhase) -> Bool

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
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (a: ScenePhase, b: ScenePhase) -> Bool
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ScenePhase : Hashable {
}

/// A property wrapper type that reads and writes to persisted, per-scene
/// storage.
///
/// You use `SceneStorage` when you need automatic state restoration of the
/// value.  `SceneStorage` works very similar to `State`, except its initial
/// value is restored by the system if it was previously saved, and the value is·
/// shared with other `SceneStorage` variables in the same scene.
///
/// The system manages the saving and restoring of `SceneStorage` on your
/// behalf. The underlying data that backs `SceneStorage` is not available to
/// you, so you must access it via the `SceneStorage` property wrapper. The
/// system makes no guarantees as to when and how often the data will be
/// persisted.
///
/// Each `Scene` has its own notion of `SceneStorage`, so data is not shared
/// between scenes.
///
/// Ensure that the data you use with `SceneStorage` is lightweight. Data of a
/// large size, such as model data, should not be stored in `SceneStorage`, as
/// poor performance may result.
///
/// If the `Scene` is explictly destroyed (e.g. the switcher snapshot is
/// destroyed on iPadOS or the window is closed on macOS), the data is also
/// destroyed. Do not use `SceneStorage` with sensitive data.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen @propertyWrapper public struct SceneStorage<Value> : DynamicProperty {

    /// The underlying value referenced by the state variable.
    ///
    /// This works identically to `State.wrappedValue`.
    ///
    /// - SeeAlso: State.wrappedValue
    public var wrappedValue: Value { get nonmutating set }

    /// A binding to the state value.
    ///
    /// This works identically to `State.projectedValue`.
    ///
    /// - SeeAlso: State.projectedValue
    public var projectedValue: Binding<Value> { get }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneStorage {

    /// Creates a property that can save and restore a boolean.
    ///
    /// - Parameter wrappedValue: The default value if a boolean is not
    ///   available for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == Bool

    /// Creates a property that can save and restore an integer.
    ///
    /// - Parameter wrappedValue: The default value if an integer is not
    ///   available for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == Int

    /// Creates a property that can save and restore a double.
    ///
    /// - Parameter wrappedValue: The default value if a double is not available
    ///   for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == Double

    /// Creates a property that can save and restore a string.
    ///
    /// - Parameter wrappedValue: The default value if a string is not available
    ///   for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == String

    /// Creates a property that can save and restore a URL.
    ///
    /// - Parameter wrappedValue: The default value if a URL is not available
    ///   for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == URL

    /// Creates a property that can save and restore data.
    ///
    /// Avoid storing large data blobs, such as image data, as it can negatively
    /// affect performance of your app.
    ///
    /// - Parameter wrappedValue: The default value if data is not available
    ///   for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value == Data

    /// Creates a property that can save and restore an integer, transforming it
    /// to a `RawRepresentable` data type.
    ///
    /// A common usage is with enumerations:
    ///
    ///    enum MyEnum: Int {
    ///        case a
    ///        case b
    ///        case c
    ///    }
    ///    struct MyView: View {
    ///        @SceneStorage("MyEnumValue") private var value = MyEnum.a
    ///        var body: some View { ... }
    ///    }
    ///
    /// - Parameter wrappedValue: The default value if an integer value is not
    ///   available for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value : RawRepresentable, Value.RawValue == Int

    /// Creates a property that can save and restore a string, transforming it
    /// to a `RawRepresentable` data type.
    ///
    /// A common usage is with enumerations:
    ///
    ///    enum MyEnum: String {
    ///        case a
    ///        case b
    ///        case c
    ///    }
    ///    struct MyView: View {
    ///        @SceneStorage("MyEnumValue") private var value = MyEnum.a
    ///        var body: some View { ... }
    ///    }
    ///
    /// - Parameter wrappedValue: The default value if a String value is not
    ///   available for the given key.
    /// - Parameter key: a key used to save and restore the value.
    public init(wrappedValue: Value, _ key: String) where Value : RawRepresentable, Value.RawValue == String
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension SceneStorage where Value : ExpressibleByNilLiteral {

    /// Creates a property that can save and restore an Optional boolean.
    ///
    /// Defaults to nil if there is no restored value
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == Bool?

    /// Creates a property that can save and restore an Optional integer.
    ///
    /// Defaults to nil if there is no restored value
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == Int?

    /// Creates a property that can save and restore an Optional double.
    ///
    /// Defaults to nil if there is no restored value
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == Double?

    /// Creates a property that can save and restore an Optional string.
    ///
    /// Defaults to nil if there is no restored value
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == String?

    /// Creates a property that can save and restore an Optional URL.
    ///
    /// Defaults to nil if there is no restored value
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == URL?

    /// Creates a property that can save and restore an Optional data.
    ///
    /// Defaults to nil if there is no restored value
    ///
    /// - Parameter key: a key used to save and restore the value.
    public init(_ key: String) where Value == Data?
}

/// A scrollable view.
///
/// The scroll view displays its content within the scrollable content region.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ScrollView<Content> : View where Content : View {

    /// The scroll view's content.
    public var content: Content

    /// The scrollable axes of the scroll view.
    ///
    /// The default value is ``Axis/vertical``.
    public var axes: Axis.Set

    /// A value that indicates whether the scroll view displays the scrollable
    /// component of the content offset, in a way that's suitable for the
    /// platform.
    ///
    /// The default is `true`.
    public var showsIndicators: Bool

    /// Creates a new instance that's scrollable in the direction of the given
    /// axis and can show indicators while scrolling.
    ///
    /// - Parameters:
    ///   - axes: The scroll view's scrollable axis. The default axis is the
    ///     vertical axis.
    ///   - showsIndicators: A Boolean value that indicates whether the scroll
    ///     view displays the scrollable component of the content offset, in a way
    ///     suitable for the platform. The default value for this parameter is
    ///     `true`.
    ///   - content: The view builder that creates the scrollable view.
    public init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true, @ViewBuilder content: () -> Content)

    /// The content and behavior of the scroll view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

/// A proxy value allowing the scrollable views within a view hierarchy
/// to be scrolled programmatically.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ScrollViewProxy {

    /// Scans all scroll views contained by the proxy for the first
    /// with a child view with identifier `id`, and then scrolls to
    /// that view.
    ///
    /// If `anchor` is nil the container of the identified view will be
    /// scrolled the minimum amount to make the identified view wholly
    /// visible.
    ///
    /// If `anchor` is non-nil it defines the points in the identified
    /// view and the scroll view that will be aligned, e.g. `.top`
    /// aligns the top of the identified view to the top of the scroll
    /// view, `.bottom` aligns the bottom of the identified view to the
    /// bottom of the scroll view, and so on.
    ///
    public func scrollTo<ID>(_ id: ID, anchor: UnitPoint? = nil) where ID : Hashable
}

/// A view whose child is defined as a function of a `ScrollViewProxy`
/// targeting the scrollable views within the child.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct ScrollViewReader<Content> : View where Content : View {

    public var content: (ScrollViewProxy) -> Content

    /// Initializes with the closure `content`. The proxy passed to the
    /// closure may NOT be messaged while `content` is executing (this
    /// will cause a runtime error) but only from actions created
    /// within `content` such as gesture handlers or the `onChange()`
    /// function.
    @inlinable public init(@ViewBuilder content: @escaping (ScrollViewProxy) -> Content)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

/// An affordance for creating hierarchical view content.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Section<Parent, Content, Footer> {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section : View where Parent : View, Content : View, Footer : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never

    public init(header: Parent, footer: Footer, @ViewBuilder content: () -> Content)

    public var internalBody: some View { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section where Parent == EmptyView, Content : View, Footer : View {

    public init(footer: Footer, @ViewBuilder content: () -> Content)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section where Parent : View, Content : View, Footer == EmptyView {

    public init(header: Parent, @ViewBuilder content: () -> Content)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section where Parent == EmptyView, Content : View, Footer == EmptyView {

    public init(@ViewBuilder content: () -> Content)
}

/// A control into which the user securely enters private text.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SecureField<Label> : View where Label : View {

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SecureField where Label == Text {

    /// Creates an instance.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of `self`, describing
    ///     its purpose.
    ///   - text: The text to be displayed and edited.
    ///   - onCommit: The action to perform when the user performs an action
    ///     (usually the return key) while the `SecureField` has focus.
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onCommit: @escaping () -> Void = {})

    /// Creates an instance.
    ///
    /// - Parameters:
    ///   - title: The title of `self`, describing its purpose.
    ///   - text: The text to be displayed and edited.
    ///   - onCommit: The action to perform when the user performs an action
    ///     (usually the return key) while the `SecureField` has focus.
    public init<S>(_ title: S, text: Binding<String>, onCommit: @escaping () -> Void = {}) where S : StringProtocol
}

/// A picker style that presents the options in a segmented control.
///
/// To apply this style to a picker, or to a view that contains pickers, use the
/// ``View/pickerStyle(_:)`` modifier.
///
/// > Note: The segmented picker style supports ``Text`` and ``Image`` segments only.
/// Any other view results in a visible, but empty, segment.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct SegmentedPickerStyle : PickerStyle {

    /// Creates a segmented picker style.
    public init()
}

/// A gesture that's a sequence of two gestures.
///
/// Read <doc:Composing-SwiftUI-Gestures> to learn how you can create a sequence
/// of two gestures.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct SequenceGesture<First, Second> : Gesture where First : Gesture, Second : Gesture {

    /// The value of a sequence gesture that helps to detect whether the first
    /// gesture succeeded, so the second gesture can start.
    @frozen public enum Value {

        /// The first gesture hasn't ended.
        case first(First.Value)

        /// The first gesture has ended.
        case second(First.Value, Second.Value?)
    }

    /// The first gesture in a sequence of two gestures.
    public var first: First

    /// The second gesture in a sequence of two gestures.
    public var second: Second

    /// Creates a sequence gesture with two gestures.
    ///
    /// - Parameters:
    ///   - first: The first gesture of the sequence.
    ///   - second: The second gesture of the sequence.
    @inlinable public init(_ first: First, _ second: Second)

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SequenceGesture.Value : Equatable where First.Value : Equatable, Second.Value : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SequenceGesture<First, Second>.Value, b: SequenceGesture<First, Second>.Value) -> Bool
}

/// A 2D shape that you can use when drawing a view.
///
/// Shapes without an explicit fill or stroke get a default fill based on the
/// foreground color.
///
/// You can define shapes in relation to an implicit frame of reference, such as
/// the natural size of the view that contains it. Alternatively, you can define
/// shapes in terms of absolute coordinates.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol Shape : Animatable, View {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    func path(in rect: CGRect) -> Path
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Trims this shape by a fractional amount based on its representation as a
    /// path.
    ///
    /// To create a `Shape` instance, you define the shape's path using lines and
    /// curves. Use the `trim(from:to:)` method to draw a portion of a shape by
    /// ignoring portions of the beginning and ending of the shape's path.
    ///
    /// For example, if you're drawing a figure eight or infinity symbol (∞)
    /// starting from its center, setting the `startFraction` and `endFraction`
    /// to different values determines the parts of the overall shape.
    ///
    /// The following example shows a simplified infinity symbol that draws
    /// only three quarters of the full shape. That is, of the two lobes of the
    /// symbol, one lobe is complete and the other is half complete.
    ///
    ///     Path { path in
    ///         path.addLines([
    ///             .init(x: 2, y: 1),
    ///             .init(x: 1, y: 0),
    ///             .init(x: 0, y: 1),
    ///             .init(x: 1, y: 2),
    ///             .init(x: 3, y: 0),
    ///             .init(x: 4, y: 1),
    ///             .init(x: 3, y: 2),
    ///             .init(x: 2, y: 1)
    ///         ])
    ///     }
    ///     .trim(from: 0.25, to: 1.0)
    ///     .scale(50, anchor: .topLeading)
    ///     .stroke(Color.black, lineWidth: 3)
    ///
    /// Changing the parameters of `trim(from:to:)` to
    /// `.trim(from: 0, to: 1)` draws the full infinity symbol, while
    /// `.trim(from: 0, to: 0.5)` draws only the left lobe of the symbol.
    ///
    /// - Parameters:
    ///   - startFraction: The fraction of the way through drawing this shape
    ///     where drawing starts.
    ///   - endFraction: The fraction of the way through drawing this shape
    ///     where drawing ends.
    /// - Returns: A shape built by capturing a portion of this shape's path.
    @inlinable public func trim(from startFraction: CGFloat = 0, to endFraction: CGFloat = 1) -> some Shape

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Changes the relative position of this shape using the specified size.
    ///
    /// The following example renders two circles. It places one circle at its
    /// default position. The second circle is outlined with a stroke,
    /// positioned on top of the first circle and offset by 100 points to the
    /// left and 50 points below.
    ///
    ///     Circle()
    ///     .overlay(
    ///         Circle()
    ///         .offset(CGSize(width: -100, height: 50))
    ///         .stroke()
    ///     )
    ///
    /// - Parameter offset: The amount, in points, by which you offset the
    ///   shape. Negative numbers are to the left and up; positive numbers are
    ///   to the right and down.
    ///
    /// - Returns: A shape offset by the specified amount.
    @inlinable public func offset(_ offset: CGSize) -> OffsetShape<Self>

    /// Changes the relative position of this shape using the specified point.
    ///
    /// The following example renders two circles. It places one circle at its
    /// default position. The second circle is outlined with a stroke,
    /// positioned on top of the first circle and offset by 100 points to the
    /// left and 50 points below.
    ///
    ///     Circle()
    ///     .overlay(
    ///         Circle()
    ///         .offset(CGPoint(x: -100, y: 50))
    ///         .stroke()
    ///     )
    ///
    /// - Parameter offset: The amount, in points, by which you offset the
    ///   shape. Negative numbers are to the left and up; positive numbers are
    ///   to the right and down.
    ///
    /// - Returns: A shape offset by the specified amount.
    @inlinable public func offset(_ offset: CGPoint) -> OffsetShape<Self>

    /// Changes the relative position of this shape using the specified point.
    ///
    /// The following example renders two circles. It places one circle at its
    /// default position. The second circle is outlined with a stroke,
    /// positioned on top of the first circle and offset by 100 points to the
    /// left and 50 points below.
    ///
    ///     Circle()
    ///     .overlay(
    ///         Circle()
    ///         .offset(x: -100, y: 50)
    ///         .stroke()
    ///     )
    ///
    /// - Parameters:
    ///   - x: The horizontal amount, in points, by which you offset the shape.
    ///     Negative numbers are to the left and positive numbers are to the
    ///     right.
    ///   - y: The vertical amount, in points, by which you offset the shape.
    ///     Negative numbers are up and positive numbers are down.
    ///
    /// - Returns: A shape offset by the specified amount.
    @inlinable public func offset(x: CGFloat = 0, y: CGFloat = 0) -> OffsetShape<Self>

    /// Scales this shape without changing its bounding frame.
    ///
    /// Both the `x` and `y` multiplication factors halve their respective
    /// dimension's size when set to `0.5`, maintain their existing size when
    /// set to `1`, double their size when set to `2`, and so forth.
    ///
    /// - Parameters:
    ///   - x: The multiplication factor used to resize this shape along its
    ///     x-axis.
    ///   - y: The multiplication factor used to resize this shape along its
    ///     y-axis.
    ///
    /// - Returns: A scaled form of this shape.
    @inlinable public func scale(x: CGFloat = 1, y: CGFloat = 1, anchor: UnitPoint = .center) -> ScaledShape<Self>

    /// Scales this shape without changing its bounding frame.
    ///
    /// - Parameter scale: The multiplication factor used to resize this shape.
    ///   A value of `0` scales the shape to have no size, `0.5` scales to half
    ///   size in both dimensions, `2` scales to twice the regular size, and so
    ///   on.
    ///
    /// - Returns: A scaled form of this shape.
    @inlinable public func scale(_ scale: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self>

    /// Rotates this shape around an anchor point at the angle you specify.
    ///
    /// The following example rotates a square by 45 degrees to the right to
    /// create a diamond shape:
    ///
    ///     RoundedRectangle(cornerRadius: 10)
    ///     .rotation(Angle(degrees: 45))
    ///     .aspectRatio(1.0, contentMode: .fit)
    ///
    /// - Parameters:
    ///   - angle: The angle of rotation to apply. Positive angles rotate
    ///     clockwise; negative angles rotate counterclockwise.
    ///   - anchor: The point to rotate the shape around.
    ///
    /// - Returns: A rotated shape.
    @inlinable public func rotation(_ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self>

    /// Applies an affine transform to this shape.
    ///
    /// Affine transforms present a mathematical approach to applying
    /// combinations of rotation, scaling, translation, and skew to shapes.
    ///
    /// - Parameter transform: The affine transformation matrix to apply to this
    ///   shape.
    ///
    /// - Returns: A transformed shape, based on its matrix values.
    @inlinable public func transform(_ transform: CGAffineTransform) -> TransformedShape<Self>
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Returns a new version of self representing the same shape, but
    /// that will ask it to create its path from a rect of `size`. This
    /// does not affect the layout properties of any views created from
    /// the shape (e.g. by filling it).
    @inlinable public func size(_ size: CGSize) -> some Shape


    /// Returns a new version of self representing the same shape, but
    /// that will ask it to create its path from a rect of size
    /// `(width, height)`. This does not affect the layout properties
    /// of any views created from the shape (e.g. by filling it).
    @inlinable public func size(width: CGFloat, height: CGFloat) -> some Shape

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Fills this shape with a color or gradient.
    ///
    /// - Parameters:
    ///   - content: The color or gradient to use when filling this shape.
    ///   - style: The style options that determine how the fill renders.
    /// - Returns: A shape filled with the color or gradient you supply.
    @inlinable public func fill<S>(_ content: S, style: FillStyle = FillStyle()) -> some View where S : ShapeStyle


    /// Fills this shape with the foreground color.
    ///
    /// - Parameter style: The style options that determine how the fill
    ///   renders.
    /// - Returns: A shape filled with the foreground color.
    @inlinable public func fill(style: FillStyle = FillStyle()) -> some View


    /// Traces the outline of this shape with a color or gradient.
    ///
    /// The following example adds a dashed purple stroke to a `Capsule`:
    ///
    ///     Capsule()
    ///     .stroke(
    ///         Color.purple,
    ///         style: StrokeStyle(
    ///             lineWidth: 5,
    ///             lineCap: .round,
    ///             lineJoin: .miter,
    ///             miterLimit: 0,
    ///             dash: [5, 10],
    ///             dashPhase: 0
    ///         )
    ///     )
    ///
    /// - Parameters:
    ///   - content: The color or gradient with which to stroke this shape.
    ///   - style: The stroke characteristics --- such as the line's width and
    ///     whether the stroke is dashed --- that determine how to render this
    ///     shape.
    /// - Returns: A stroked shape.
    @inlinable public func stroke<S>(_ content: S, style: StrokeStyle) -> some View where S : ShapeStyle


    /// Traces the outline of this shape with a color or gradient.
    ///
    /// The following example draws a circle with a purple stroke:
    ///
    ///     Circle().stroke(Color.purple, lineWidth: 5)
    ///
    /// - Parameters:
    ///   - content: The color or gradient with which to stroke this shape.
    ///   - lineWidth: The width of the stroke that outlines this shape.
    /// - Returns: A stroked shape.
    @inlinable public func stroke<S>(_ content: S, lineWidth: CGFloat = 1) -> some View where S : ShapeStyle

}

/// A shape acts as view by filling itself with the foreground color and
/// default fill style.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// The content and behavior of the view.
    public var body: _ShapeView<Self, ForegroundStyle> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Returns a new shape that is a stroked copy of `self`, using the
    /// contents of `style` to define the stroke characteristics.
    @inlinable public func stroke(style: StrokeStyle) -> some Shape


    /// Returns a new shape that is a stroked copy of `self` with
    /// line-width defined by `lineWidth` and all other properties of
    /// `StrokeStyle` having their default values.
    @inlinable public func stroke(lineWidth: CGFloat = 1) -> some Shape

}

/// A way to turn a shape into a view.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ShapeStyle {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ShapeStyle {

    /// Return a new paint value matching `self` except using `rect` to
    /// map unit-space coordinates to absolute coordinates.
    @inlinable public func `in`(_ rect: CGRect) -> some ShapeStyle

}

/// Default View.body implementation to fill a Rectangle with `self`.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ShapeStyle where Self : View, Self.Body == _ShapeView<Rectangle, Self> {

    public var body: _ShapeView<Rectangle, Self> { get }
}

/// A built-in set of commands for manipulating window sidebars.
///
/// These commands are optional and can be explicitly requested by passing a
/// value of this type to the `Scene.commands(_:)` modifier.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SidebarCommands : Commands {

    /// A new value describing the built-in sidebar-related commands.
    public init()

    /// The composition of commands that comprise the command group.
    public var body: some Commands { get }

    /// The type of command group representing the body of this command group.
    public typealias Body = some Commands
}

/// The behavior and appearance of a sidebar or source list.
@available(iOS 14.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SidebarListStyle : ListStyle {

    /// Creates a sidebar list style.
    public init()
}

/// A gesture containing two gestures that can happen at the same time with
/// neither of them preceeding the other.
///
/// A simultaneous gesture is a container-event handler that evaluates its two
/// child gestures at the same time. Its value is a struct with two optional
/// values, each representing the phases of one of the two gestures.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct SimultaneousGesture<First, Second> : Gesture where First : Gesture, Second : Gesture {

    /// The value of a simultaneous gesture that indicates which of its two
    /// gestures receives events.
    @frozen public struct Value {

        /// The value of the first gesture.
        public var first: First.Value?

        /// The value of the second gesture.
        public var second: Second.Value?
    }

    /// The first of two gestures that can happen simultaneously.
    public var first: First

    /// The second of two gestures that can happen simultaneously.
    public var second: Second

    /// Creates a gesture with two gestures that can receive updates or succeed
    /// independently of each other.
    ///
    /// - Parameters:
    ///   - first: The first of two gestures that can happen simultaneously.
    ///   - second: The second of two gestures that can happen simultaneously.
    @inlinable public init(_ first: First, _ second: Second)

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SimultaneousGesture.Value : Equatable where First.Value : Equatable, Second.Value : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SimultaneousGesture<First, Second>.Value, b: SimultaneousGesture<First, Second>.Value) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SimultaneousGesture.Value : Hashable where First.Value : Hashable, Second.Value : Hashable {

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
    public func hash(into hasher: inout Hasher)
}

/// A control for selecting a value from a bounded linear range of values.
@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct Slider<Label, ValueLabel> : View where Label : View, ValueLabel : View {

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension Slider {

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///   - minimumValueLabel: A `View` that describes `bounds.lowerBound`.
    ///   - maximumValueLabel: A `View` that describes `bounds.lowerBound`.
    ///   - label: A `View` that describes the purpose of the instance.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, minimumValueLabel: ValueLabel, maximumValueLabel: ValueLabel, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///   - minimumValueLabel: A `View` that describes `bounds.lowerBound`.
    ///   - maximumValueLabel: A `View` that describes `bounds.lowerBound`.
    ///   - label: A `View` that describes the purpose of the instance.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, minimumValueLabel: ValueLabel, maximumValueLabel: ValueLabel, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
}

@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension Slider where ValueLabel == EmptyView {

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///   - label: A `View` that describes the purpose of the instance.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///   - label: A `View` that describes the purpose of the instance.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
}

@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension Slider where Label == EmptyView, ValueLabel == EmptyView {

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///   - value: The selected value within `bounds`.
    ///   - bounds: The range of the valid values. Defaults to `0...1`.
    ///   - step: The distance between each valid value.
    ///   - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
}

/// A flexible space that expands along the major axis of its containing stack
/// layout, or on both axes if not contained in a stack.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Spacer {

    /// The minimum length this spacer can be shrunk to, along the axis or axes
    /// of expansion.
    ///
    /// If `nil`, the system default spacing between views is used.
    public var minLength: CGFloat?

    @inlinable public init(minLength: CGFloat? = nil)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Spacer : View {
}

/// A navigation view style represented by a view stack that only shows a
/// single top view at a time.
@available(iOS 13.0, tvOS 13.0, watchOS 7.0, *)
@available(macOS, unavailable)
public struct StackNavigationViewStyle : NavigationViewStyle {

    public init()
}

/// A property wrapper type that can read and write a value managed by SwiftUI.
///
/// SwiftUI manages the storage of any property you declare as a state. When the
/// state value changes, the view invalidates its appearance and recomputes the
/// body. Use the state as the single source of truth for a given view.
///
/// A ``State`` instance isn't the value itself; it's a means of reading and
/// writing the value. To access a state's underlying value, use its variable
/// name, which returns the ``State/wrappedValue`` property value.
///
/// You should only access a state property from inside the view's body, or from
/// methods called by it. For this reason, declare your state properties as
/// private, to prevent clients of your view from accessing them. It is safe to
/// mutate state properties from any thread.
///
/// To pass a state property to another view in the view hierarchy, use the
/// variable name with the `$` prefix operator. This retrieves a binding of the
/// state property from its ``State/projectedValue`` property. For example, in
/// the following code example `PlayerView` passes its state property
/// `isPlaying` to `PlayButton` using `$isPlaying`:
///
///     struct PlayerView: View {
///         var episode: Episode
///         @State private var isPlaying: Bool = false
///
///         var body: some View {
///             VStack {
///                 Text(episode.title)
///                 Text(episode.showTitle)
///                 PlayButton(isPlaying: $isPlaying)
///             }
///         }
///     }
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen @propertyWrapper public struct State<Value> : DynamicProperty {

    /// Creates the state with an initial wrapped value.
    ///
    /// You don't call this initializer directly. Instead, declare a property
    /// with the `@State` attribute, and provide an initial value; for example,
    /// `@State private var isPlaying: Bool = false`.
    ///
    /// - Parameter wrappedValue: An initial wrappedValue for a state.
    public init(wrappedValue value: Value)

    /// Creates the state with an initial value.
    ///
    /// - Parameter value: An initial value of the state.
    public init(initialValue value: Value)

    /// The underlying value referenced by the state variable.
    ///
    /// This property provides primary access to the value's data. However, you
    /// don't access `wrappedValue` directly. Instead, you use the property
    /// variable created with the `@State` attribute. For example, in the
    /// following code example the button's actions toggles the value of
    /// `showingProfile`, which toggles `wrappedValue`:
    ///
    ///     @State private var showingProfile = false
    ///
    ///     var profileButton: some View {
    ///         Button(action: { self.showingProfile.toggle() }) {
    ///             Image(systemName: "person.crop.circle")
    ///                 .imageScale(.large)
    ///                 .accessibilityLabel(Text("User Profile"))
    ///                 .padding()
    ///         }
    ///     }
    ///
    /// When a mutable binding value changes, the new value is immediately
    /// available. However, updates to a view displaying the value happens
    /// asynchronously, so the view may not show the change immediately.
    public var wrappedValue: Value { get nonmutating set }

    /// A binding to the state value.
    ///
    /// Use the projected value to pass a binding value down a view hierarchy.
    /// To get the `projectedValue`, prefix the property variable with `$`. For
    /// example, in the following code example `PlayerView` projects a binding
    /// of the state property `isPlaying` to the `PlayButton` view using
    /// `$isPlaying`.
    ///
    ///     struct PlayerView: View {
    ///         var episode: Episode
    ///         @State private var isPlaying: Bool = false
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Text(episode.title)
    ///                 Text(episode.showTitle)
    ///                 PlayButton(isPlaying: $isPlaying)
    ///             }
    ///         }
    ///     }
    public var projectedValue: Binding<Value> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension State where Value : ExpressibleByNilLiteral {

    /// Creates a state without an initial value.
    @inlinable public init()
}

/// A property wrapper type that instantiates an observable object.
///
/// Create a state object in a ``SwiftUI/View``, ``SwiftUI/App``, or
/// ``SwiftUI/Scene`` by applying the `@StateObject` attribute to a property
/// declaration and providing an initial value that conforms to the
/// <doc://com.apple.documentation/documentation/Combine/ObservableObject>
/// protocol:
///
///     @StateObject var model = DataModel()
///
/// SwiftUI creates a new instance of the object only once for each instance of
/// the structure that declares the object. When published properties of the
/// observable object change, SwiftUI updates the parts of any view that depend
/// on those properties:
///
///     Text(model.title) // Updates the view any time `title` changes.
///
/// You can pass the state object into a property that has the
/// ``SwiftUI/ObservedObject`` attribute. You can alternatively add the object
/// to the environment of a view hierarchy by applying the
/// ``SwiftUI/View/environmentObject(_:)`` modifier:
///
///     ContentView()
///         .environmentObject(model)
///
/// If you create an environment object as shown in the code above, you can
/// read the object inside `ContentView` or any of its descendants
/// using the ``SwiftUI/EnvironmentObject`` attribute:
///
///     @EnvironmentObject var model: DataModel
///
/// Get a ``SwiftUI/Binding`` to one of the state object's properties using the
/// `$` operator. Use a binding when you want to create a two-way connection to
/// one of the object's properties. For example, you can let a
/// ``SwiftUI/Toggle`` control a Boolean value called `isEnabled` stored in the
/// model:
///
///     Toggle("Enabled", isOn: $model.isEnabled)
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen @propertyWrapper public struct StateObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {

    /// Creates a new state object with an initial wrapped value.
    ///
    /// You don’t call this initializer directly. Instead, declare a property
    /// with the `@StateObject` attribute in a ``SwiftUI/View``,
    /// ``SwiftUI/App``, or ``SwiftUI/Scene``, and provide an initial value:
    ///
    ///     struct MyView: View {
    ///         @StateObject var model = DataModel()
    ///
    ///         // ...
    ///     }
    ///
    /// SwiftUI creates only one instance of the state object for each
    /// container instance that you declare. In the code above, SwiftUI
    /// creates `model` only the first time it initializes a particular instance
    /// of `MyView`. On the other hand, each different instance of `MyView`
    /// receives a distinct copy of the data model.
    ///
    /// - Parameter thunk: An initial value for the state object.
    @inlinable public init(wrappedValue thunk: @autoclosure @escaping () -> ObjectType)

    /// The underlying value referenced by the state object.
    ///
    /// The wrapped value property provides primary access to the value's data.
    /// However, you don't access `wrappedValue` directly. Instead, use the
    /// property variable created with the `@StateObject` attribute:
    ///
    ///     @StateObject var contact = Contact()
    ///
    ///     var body: some View {
    ///         Text(contact.name) // Accesses contact's wrapped value.
    ///     }
    ///
    /// When you change a property of the wrapped value, you can access the new
    /// value immediately. However, SwiftUI updates views displaying the value
    /// asynchronously, so the user interface might not update immediately.
    public var wrappedValue: ObjectType { get }

    /// A projection of the state object that creates bindings to its
    /// properties.
    ///
    /// Use the projected value to pass a binding value down a view hierarchy.
    /// To get the projected value, prefix the property variable with `$`. For
    /// example, you can get a binding to a model's `isEnabled` Boolean so that
    /// a ``SwiftUI/Toggle`` view can control the value:
    ///
    ///     struct MyView: View {
    ///         @StateObject var model = DataModel()
    ///
    ///         var body: some View {
    ///             Toggle("Enabled", isOn: $model.isEnabled)
    ///         }
    ///     }
    public var projectedValue: ObservedObject<ObjectType>.Wrapper { get }
}

/// A control that performs increment and decrement actions.
///
/// Use a stepper control when you want the user to have granular control while
/// incrementing or decrementing a value. For example, you can use a stepper
/// to:
///
///  * Change a value up or down by `1`.
///  * Operate strictly over a prescribed range.
///  * Step by specific amounts over a stepper's range of possible values.
///
/// The example below uses an array that holds a number of ``Color`` values,
/// a local state variable, `value`, to set the control's background
/// color, and title label. When the user clicks or taps on the stepper's
/// increment or decrement buttons SwiftUI executes the relevant
/// closure that updates `value`, wrapping the `value` to prevent overflow.
/// SwiftUI then re-renders the view, updating the text and background
/// color to match the current index:
///
///     struct StepperView: View {
///         @State private var value = 0
///         let colors: [Color] = [.orange, .red, .gray, .blue,
///                                .green, .purple, .pink]
///
///         func incrementStep() {
///             value += 1
///             if value >= colors.count { value = 0 }
///         }
///
///         func decrementStep() {
///             value -= 1
///             if value < 0 { value = colors.count - 1 }
///         }
///
///         var body: some View {
///             Stepper(onIncrement: incrementStep,
///                 onDecrement: decrementStep) {
///                 Text("Value: \(value) Color: \(colors[value].description)")
///             }
///             .padding(5)
///             .background(colors[value])
///         }
///    }
///
/// ![A view displaying a stepper that uses a text view for stepper's title
///   and that changes the background color of its view when incremented or
///   decremented. The view selects the new background color from a
///    predefined array of colors using the stepper's value as the
///   index.](SwiftUI-Stepper-increment-decrement-closures.png)
///
/// The following example shows a stepper that displays the effect of
/// incrementing or decrementing a value with the step size of `step` with
/// the bounds defined by `range`:
///
///     struct StepperView: View {
///         @State private var value = 0
///         let step = 5
///         let range = 1...50
///
///         var body: some View {
///             Stepper(value: $value,
///                     in: range,
///                     step: step) {
///                 Text("Current: \(value) in \(range.description) " +
///                      "stepping by \(step)")
///             }
///                 .padding(10)
///         }
///     }
///
/// ![A view displaying a stepper with a step size of five, and a
/// prescribed range of 1 though 50.](SwiftUI-Stepper-value-step-range.png)
///
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct Stepper<Label> : View where Label : View {

    /// Creates a stepper instance that performs the closures you provide when
    /// the user increments or decrements the stepper.
    ///
    /// Use this initializer to create a control with a custom title that
    /// executes closures you provide when the user clicks or taps the
    /// stepper's increment or decrement buttons.
    ///
    /// The example below uses an array that holds a number of ``Color`` values,
    /// a local state variable, `value`, to set the control's background
    /// color, and title label. When the user clicks or taps on the stepper's
    /// increment or decrement buttons SwiftUI executes the relevant
    /// closure that updates `value`, wrapping the `value` to prevent overflow.
    /// SwiftUI then re-renders the view, updating the text and background
    /// color to match the current index:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let colors: [Color] = [.orange, .red, .gray, .blue, .green,
    ///                                .purple, .pink]
    ///
    ///         func incrementStep() {
    ///             value += 1
    ///             if value >= colors.count { value = 0 }
    ///         }
    ///
    ///         func decrementStep() {
    ///             value -= 1
    ///             if value < 0 { value = colors.count - 1 }
    ///         }
    ///
    ///         var body: some View {
    ///             Stepper(onIncrement: incrementStep,
    ///                 onDecrement: decrementStep) {
    ///                 Text("Value: \(value) Color: \(colors[value].description)")
    ///             }
    ///             .padding(5)
    ///             .background(colors[value])
    ///         }
    ///    }
    ///
    /// ![A view displaying a stepper that uses a text view for stepper's title
    ///   and that changes the background color of its view when incremented or
    ///   decremented. The view selects the new background color from a
    ///    predefined array of colors using the stepper's value as the
    ///   index.](SwiftUI-Stepper-increment-decrement-closures.png)
    ///
    /// - Parameters:
    ///     - onIncrement: The closure to execute when the user clicks or taps
    ///       the control's plus button.
    ///     - onDecrement: The closure to execute when the user clicks or taps
    ///       the control's minus button.
    ///     - onEditingChanged: A closure called when editing begins and ends.
    ///       For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a `Stepper` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    ///     - label: A view describing the purpose of this stepper.
    public init(onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Stepper {

    /// Creates a stepper configured to increment or decrement a binding to a
    /// value using a step value you provide.
    ///
    /// Use this initializer to create a stepper that increments or decrements
    /// a bound value by a specific amount each time the user
    /// clicks or taps the stepper's increment or decrement buttons.
    ///
    /// In the example below, a stepper increments or decrements `value` by the
    /// `step` value of 5 at each click or tap of the control's increment or
    /// decrement button:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///         var body: some View {
    ///             Stepper(value: $value,
    ///                     step: step) {
    ///                 Text("Current value: \(value), step: \(step)")
    ///             }
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements a value by
    ///   a specified amount each time the user clicks or taps the stepper's
    ///   increment or decrement buttons.](SwiftUI-Stepper-value-step.png)
    ///
    /// - Parameters:
    ///   - value: The ``Binding`` to a value that you provide.
    ///   - step: The amount to increment or decrement `value` each time the
    ///     user clicks or taps the stepper's increment or decrement buttons.
    ///     Defaults to `1`.
    ///   - onEditingChanged: A closure that's called when editing begins and
    ///     ends. For example, on iOS, the user may touch and hold the increment
    ///     or decrement buttons on a stepper which causes the execution
    ///     of the `onEditingChanged` closure at the start and end of
    ///     the gesture.
    ///   - label: A view describing the purpose of this stepper.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<V>(value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : Strideable

    /// Creates a stepper configured to increment or decrement a binding to a
    /// value using a step value and within a range of values you provide.
    ///
    /// Use this initializer to create a stepper that increments or decrements
    /// a binding to value by the step size you provide within the given bounds.
    /// By setting the bounds, you ensure that the value never goes below or
    /// above the lowest or highest value, respectively.
    ///
    /// The example below shows a stepper that displays the effect of
    /// incrementing or decrementing a value with the step size of `step`
    /// with the bounds defined by `range`:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             Stepper(value: $value,
    ///                     in: range,
    ///                     step: step) {
    ///                 Text("Current: \(value) in \(range.description) " +
    ///                      "stepping by \(step)")
    ///             }
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper with a step size of five, and a
    /// prescribed range of 1 though 50.](SwiftUI-Stepper-value-step-range.png)
    ///
    /// - Parameters:
    ///   - value: A ``Binding`` to a value that you provide.
    ///   - bounds: A closed range that describes the upper and lower bounds
    ///     permitted by the stepper.
    ///   - step: The amount to increment or decrement the stepper when the
    ///     user clicks or taps the stepper's increment or decrement buttons,
    ///     respectively.
    ///   - onEditingChanged: A closure that's called when editing begins and
    ///     ends. For example, on iOS, the user may touch and hold the increment
    ///     or decrement buttons on a stepper which causes the execution
    ///     of the `onEditingChanged` closure at the start and end of
    ///     the gesture.
    ///   - label: A view describing the purpose of this stepper.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : Strideable
}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Stepper where Label == Text {

    /// Creates a stepper that uses a title key and executes the closures
    /// you provide when the user clicks or taps the stepper's increment and
    /// decrement buttons.
    ///
    /// Use this initializer to create a stepper with a custom title that
    /// executes closures you provide when either of the stepper's increment
    /// or decrement buttons are pressed. This version of ``Stepper`` doesn't
    /// take a binding to a value, nor does it allow you to specify a range of
    /// acceptable values, or a step value -- it simply calls the closures you
    /// provide when the control's buttons are pressed.
    ///
    /// The example below uses an array that holds a number of ``Color`` values,
    /// a local state variable, `value`, to set the control's background
    /// color, and title label. When the user clicks or taps on the stepper's
    /// increment or decrement buttons SwiftUI executes the relevant
    /// closure that updates `value`, wrapping the `value` to prevent overflow.
    /// SwiftUI then re-renders the view, updating the text and background
    /// color to match the current index:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let colors: [Color] = [.orange, .red, .gray, .blue, .green,
    ///                                .purple, .pink]
    ///
    ///         func incrementStep() {
    ///             value += 1
    ///             if value >= colors.count { value = 0 }
    ///         }
    ///
    ///         func decrementStep() {
    ///             value -= 1
    ///             if value < 0 { value = colors.count - 1 }
    ///         }
    ///
    ///         var body: some View {
    ///             Stepper("Value: \(value) Color: \(colors[value].description)",
    ///                      onIncrement: incrementStep,
    ///                      onDecrement: decrementStep)
    ///             .padding(5)
    ///             .background(colors[value])
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that uses a title key for the stepper's
    /// localized title and that changes the background color of its view
    /// when incremented or decremented selecting a color from a predefined
    /// array using the stepper value as the
    /// index.](SwiftUI-Stepper-increment-decrement-closures.png)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - onIncrement: The closure to execute when the user clicks or taps the
    ///       control's plus button.
    ///     - onDecrement: The closure to execute when the user clicks or taps the
    ///       control's minus button.
    ///    - onEditingChanged: A closure that's called when editing begins and
    ///      ends. For example, on iOS, the user may touch and hold the increment
    ///      or decrement buttons on a `Stepper` which causes the execution
    ///      of the `onEditingChanged` closure at the start and end of
    ///      the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in })

    /// Creates a stepper using a title string and that executes closures
    /// you provide when the user clicks or taps the stepper's increment or
    /// decrement buttons.
    ///
    /// Use `Stepper(_:onIncrement:onDecrement:onEditingChanged:)` to create a
    /// control with a custom title that executes closures you provide when
    /// the user clicks or taps on the stepper's increment or decrement buttons.
    ///
    /// The example below uses an array that holds a number of ``Color`` values,
    /// a local state variable, `value`, to set the control's background
    /// color, and title label. When the user clicks or taps on the stepper's
    /// increment or decrement buttons SwiftUI executes the relevant
    /// closure that updates `value`, wrapping the `value` to prevent overflow.
    /// SwiftUI then re-renders the view, updating the text and background
    /// color to match the current index:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let title: String
    ///         let colors: [Color] = [.orange, .red, .gray, .blue, .green,
    ///                                .purple, .pink]
    ///
    ///         func incrementStep() {
    ///             value += 1
    ///             if value >= colors.count { value = 0 }
    ///         }
    ///
    ///         func decrementStep() {
    ///             value -= 1
    ///             if value < 0 { value = colors.count - 1 }
    ///         }
    ///
    ///         var body: some View {
    ///             Stepper(title, onIncrement: incrementStep, onDecrement: decrementStep)
    ///                 .padding(5)
    ///                 .background(colors[value])
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that uses a string for the stepper's title
    ///   and that changes the background color of its view when incremented or
    ///   decremented selecting a color from a predefined array using the
    ///   stepper's value as the
    ///   index.](SwiftUI-Stepper-increment-decrement-closures.png)
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - onIncrement: The closure to execute when the user clicks or taps the
    ///       control's plus button.
    ///     - onDecrement: The closure to execute when the user clicks or taps the
    ///       control's minus button.
    ///    - onEditingChanged: A closure that's called when editing begins and
    ///      ends. For example, on iOS, the user may touch and hold the increment
    ///      or decrement buttons on a `Stepper` which causes the execution
    ///      of the `onEditingChanged` closure at the start and end of
    ///      the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol

    /// Creates a stepper with a title key and configured to increment and
    /// decrement a binding to a value and step amount you provide.
    ///
    /// Use `Stepper(_:value:step:onEditingChanged:)` to create a stepper with a
    /// custom title that increments or decrements a binding to value by the
    /// step size you specify.
    ///
    /// In the example below, the stepper increments or decrements the binding
    /// value by `5` each time the user clicks or taps on the control's
    /// increment or decrement buttons, respectively:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///
    ///         var body: some View {
    ///             Stepper("Current value: \(value), step: \(step)",
    ///                     value: $value,
    ///                     step: step)
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements by 5 each
    ///   time the user clicks or taps on the control's increment or decrement
    ///   buttons, respectively.](SwiftUI-Stepper-value-step.png)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that you provide.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's plus or minus button,
    ///       respectively.  Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the
    ///       increment or decrement buttons on a `Stepper` which causes the
    ///       execution of the `onEditingChanged` closure at the start and end
    ///       of the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable

    /// Creates a stepper with a title and configured to increment and
    /// decrement a binding to a value and step amount you provide.
    ///
    /// Use `Stepper(_:value:step:onEditingChanged:)` to create a stepper with a
    /// custom title that increments or decrements a binding to value by the
    /// step size you specify.
    ///
    /// In the example below, the stepper increments or decrements the binding
    /// value by `5` each time one of the user clicks or taps the control's
    /// increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///         let title: String
    ///
    ///         var body: some View {
    ///             Stepper(title, value: $value, step: step)
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements by 1 each
    ///   time the control's buttons
    ///   are pressed.](SwiftUI-Stepper-value-step.png)
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - value: The ``Binding`` to a value that you provide.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the
    ///       increment or decrement buttons on a `Stepper` which causes the
    ///       execution of the `onEditingChanged` closure at the start and end
    ///       of the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S, V>(_ title: S, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, V : Strideable

    /// Creates a stepper instance that increments and decrements a binding to
    /// a value, by a step size and within a closed range that you provide.
    ///
    /// Use `Stepper(_:value:in:step:onEditingChanged:)` to create a stepper
    /// that increments or decrements a value within a specific range of values
    /// by a specific step size. In the example below, a stepper increments or
    /// decrements a binding to value over a range of `1...50` by `5` at each
    /// press of the stepper's increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         @State private var titleKey = "Stepper"
    ///
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             VStack(spacing: 20) {
    ///                 Text("Current Stepper Value: \(value)")
    ///                 Stepper(titleKey, value: $value, in: range, step: step)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements within a
    ///   specified range and step size.](SwiftUI-Stepper-value-step-range.png)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that your provide.
    ///     - bounds: A closed range that describes the upper and lower bounds
    ///       permitted by the stepper.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a `Stepper` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable

    /// Creates a stepper instance that increments and decrements a binding to
    /// a value, by a step size and within a closed range that you provide.
    ///
    /// Use `Stepper(_:value:in:step:onEditingChanged:)` to create a stepper
    /// that increments or decrements a value within a specific range of values
    /// by a specific step size. In the example below, a stepper increments or
    /// decrements a binding to value over a range of `1...50` by `5` each time
    /// the user clicks or taps the stepper's increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             Stepper("Current: \(value) in \(range.description) stepping by \(step)",
    ///                     value: $value,
    ///                     in: range,
    ///                     step: step)
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements within a
    ///   specified range and step size.](SwiftUI-Stepper-value-step-range.png)
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that your provide.
    ///     - bounds: A closed range that describes the upper and lower bounds
    ///       permitted by the stepper.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a `Stepper` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S, V>(_ title: S, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, V : Strideable
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct StrokeStyle : Equatable {

    public var lineWidth: CGFloat

    public var lineCap: CGLineCap

    public var lineJoin: CGLineJoin

    public var miterLimit: CGFloat

    public var dash: [CGFloat]

    public var dashPhase: CGFloat

    public init(lineWidth: CGFloat = 1, lineCap: CGLineCap = .butt, lineJoin: CGLineJoin = .miter, miterLimit: CGFloat = 10, dash: [CGFloat] = [CGFloat](), dashPhase: CGFloat = 0)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: StrokeStyle, b: StrokeStyle) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension StrokeStyle : Animatable {

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>

    /// The data to animate.
    public var animatableData: StrokeStyle.AnimatableData
}

/// A view that subscribes to a publisher with an action.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct SubscriptionView<PublisherType, Content> : View where PublisherType : Publisher, Content : View, PublisherType.Failure == Never {

    /// The content view.
    public var content: Content

    /// The `Publisher` that is being subscribed.
    public var publisher: PublisherType

    /// The `Action` executed when `publisher` emits an event.
    public var action: (PublisherType.Output) -> Void

    @inlinable public init(content: Content, publisher: PublisherType, action: @escaping (PublisherType.Output) -> Void)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A toggle style that displays a leading label and a trailing switch.
///
/// To apply this style to a toggle, or to a view that contains toggles, use the
/// ``View/toggleStyle(_:)`` modifier.
@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct SwitchToggleStyle : ToggleStyle {

    /// Creates a switch toggle style.
    public init()

    /// Creates a switch style with a tint color.
    @available(iOS 14.0, macOS 11.0, watchOS 7.0, *)
    @available(tvOS, unavailable)
    public init(tint: Color)

    /// Creates a view representing the body of a toggle.
    ///
    /// The system calls this method for each ``Toggle`` instance in a view
    /// hierarchy where this style is the current toggle style.
    ///
    /// - Parameter configuration: The properties of the toggle, such as its
    ///   label and its “on” state.
    public func makeBody(configuration: SwitchToggleStyle.Configuration) -> some View


    /// A view that represents the appearance and interaction of a toggle.
    public typealias Body = some View
}

/// A view that switches between multiple child views using interactive user
/// interface elements.
///
/// To create a user interface with tabs, place views in a `TabView` and apply
/// the ``View/tabItem(_:)`` modifier to the contents of each tab. The following
/// creates a tab view with three tabs:
///
///     TabView {
///         Text("The First Tab")
///             .tabItem {
///                 Image(systemName: "1.square.fill")
///                 Text("First")
///             }
///         Text("Another Tab")
///             .tabItem {
///                 Image(systemName: "2.square.fill")
///                 Text("Second")
///             }
///         Text("The Last Tab")
///             .tabItem {
///                 Image(systemName: "3.square.fill")
///                 Text("Third")
///             }
///     }
///     .font(.headline)
///
/// Tab views only support tab items of type ``Text``, ``Image``, or an image
/// followed by text. Passing any other type of view results in a visible but
/// empty tab item.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
public struct TabView<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {

    /// Creates an instance that selects from content associated with
    /// `Selection` values.
    public init(selection: Binding<SelectionValue>?, @ViewBuilder content: () -> Content)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
extension TabView where SelectionValue == Int {

    public init(@ViewBuilder content: () -> Content)
}

/// A specification for the appearance and interaction of a `TabView`.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol TabViewStyle {
}

/// A gesture that recognizes one or more taps.
///
/// To recognize a tap gesture on a view, create and configure the gesture, and
/// then add it to the view using the ``View/gesture(_:including:)`` modifier.
/// The following code adds a tap gesture to a ``Circle`` that toggles the color
/// of the circle.
///
///     struct TapGestureView: View {
///         @State var tapped = false
///
///         var tap: some Gesture {
///             TapGesture(count: 1)
///                 .onEnded { _ in self.tapped = !self.tapped }
///         }
///
///         var body: some View {
///             Circle()
///                 .fill(self.tapped ? Color.blue : Color.red)
///                 .frame(width: 100, height: 100, alignment: .center)
///                 .gesture(tap)
///         }
///     }
@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct TapGesture : Gesture {

    /// The required number of tap events.
    public var count: Int

    /// Creates a tap gesture with the number of required taps.
    ///
    /// - Parameter count: The required number of taps to complete the tap
    ///   gesture.
    public init(count: Int = 1)

    /// The type representing the gesture's value.
    public typealias Value = ()

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

/// A view that displays one or more lines of read-only text.
///
/// A text view draws a string in your app's user interface using a
/// ``Font/body`` font that's appropriate for the current platform. You can
/// choose a different standard font, like ``Font/title`` or ``Font/caption``,
/// using the ``View/font(_:)`` view modifier.
///
///     Text("Hamlet")
///         .font(.title)
///
/// ![A text view showing the name "Hamlet" in a title
/// font.](SwiftUI-Text-title.png)
///
/// If you need finer control over the styling of the text, you can use the same
/// modifier to configure a system font or choose a custom font. You can also
/// apply view modifiers like ``Text/bold()`` or ``Text/italic()`` to further
/// adjust the formatting.
///
///     Text("by William Shakespeare")
///         .font(.system(size: 12, weight: .light, design: .serif))
///         .italic()
///
/// ![A text view showing by William Shakespeare in a 12 point, light, italic,
/// serif font.](SwiftUI-Text-font.png)
///
/// A text view always uses exactly the amount of space it needs to display its
/// rendered contents, but you can affect the view's layout. For example, you
/// can use the ``View/frame(width:height:alignment:)`` modifier to propose
/// specific dimensions to the view. If the view accepts the proposal but the
/// text doesn't fit into the available space, the view uses a combination of
/// wrapping, tightening, scaling, and truncation to make it fit. With a width
/// of `100` points but no constraint on the height, a text view might wrap a
/// long string:
///
///     Text("To be, or not to be, that is the question:")
///         .frame(width: 100)
///
/// ![A text view showing a quote from Hamlet split over three
/// lines.](SwiftUI-Text-split.png)
///
/// Use modifiers like ``View/lineLimit(_:)``, ``View/allowsTightening(_:)``,
/// ``View/minimumScaleFactor(_:)``, and ``View/truncationMode(_:)`` to
/// configure how the view handles space constraints. For example, combining a
/// fixed width and a line limit of `1` results in truncation for text that
/// doesn't fit in that space:
///
///     Text("Brevity is the soul of wit.")
///         .frame(width: 100)
///         .lineLimit(1)
///
/// ![A text view showing a truncated quote from Hamlet starting Brevity is t
/// and ending with three dots.](SwiftUI-Text-truncated.png)
///
/// ### Localizing Strings
///
/// If you initialize a text view with a string literal, the view uses the
/// ``Text/init(_:tableName:bundle:comment:)`` initializer, which interprets the
/// string as a localization key and searches for the key in the table you
/// specify, or in the default table if you don't specify one.
///
///     Text("pencil") // Searches the default table in the main bundle.
///
/// For an app localized in both English and Spanish, the above view displays
/// "pencil" and "lápiz" for English and Spanish users, respectively. If the
/// view can't perform localization, it displays the key instead. For example,
/// if the same app lacks Danish localization, the view displays "pencil" for
/// users in that locale. Similarly, an app that lacks any localization
/// information displays "pencil" in any locale.
///
/// To explicitly bypass localization for a string literal, use the
/// ``Text/init(verbatim:)`` initializer.
///
///     Text(verbatim: "pencil") // Displays the string "pencil" in any locale.
///
/// If you intialize a text view with a variable value, the view uses the
/// ``Text/init(_:)-9d1g4`` initializer, which doesn't localize the string. However,
/// you can request localization by creating a ``LocalizedStringKey`` instance
/// first, which triggers the ``Text/init(_:tableName:bundle:comment:)``
/// initializer instead:
///
///     // Don't localize a string variable...
///     Text(writingImplement)
///
///     // ...unless you explicitly convert it to a localized string key.
///     Text(LocalizedStringKey(writingImplement))
///
/// When localizing a string variable, you can use the default table by omitting
/// the optional initialization parameters — as in the above example — just like
/// you might for a string literal.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Text : Equatable {

    /// Creates a text view that displays a string literal without localization.
    ///
    /// Use this initializer to create a text view with a string literal without
    /// performing localization:
    ///
    ///     Text(verbatim: "pencil") // Displays the string "pencil" in any locale.
    ///
    /// If you want to localize a string literal before displaying it, use the
    /// ``Text/init(_:tableName:bundle:comment:)`` initializer instead. If you
    /// want to display a string variable, use the ``Text/init(_:)-9d1g4``
    /// initializer, which also bypasses localization.
    ///
    /// - Parameter content: A string to display without localization.
    @inlinable public init(verbatim content: String)

    /// Creates a text view that displays a stored string without localization.
    ///
    /// Use this intializer to create a text view that displays — without
    /// localization — the text in a string variable.
    ///
    ///     Text(someString) // Displays the contents of `someString` without localization.
    ///
    /// SwiftUI doesn't call the `init(_:)` method when you initialize a text
    /// view with a string literal as the input. Instead, a string literal
    /// triggers the ``Text/init(_:tableName:bundle:comment:)`` method — which
    /// treats the input as a ``LocalizedStringKey`` instance — and attempts to
    /// perform localization.
    ///
    /// By default, SwiftUI assumes that you don't want to localize stored
    /// strings, but if you do, you can first create a localized string key from
    /// the value, and initialize the text view with that. Using a key as input
    /// triggers the ``Text/init(_:tableName:bundle:comment:)`` method instead.
    ///
    /// - Parameter content: The string value to display without localization.
    public init<S>(_ content: S) where S : StringProtocol

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Text, b: Text) -> Bool
}

extension Text {

    /// Creates an instance that wraps an `Image`, suitable for concatenating
    /// with other `Text`
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public init(_ image: Image)
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text {

    /// Creates a text view that displays the formatted representation of a value.
    ///
    /// Use this initializer to create a text view that will format `subject`
    /// using `formatter`.
    public init<Subject>(_ subject: Subject, formatter: Formatter) where Subject : ReferenceConvertible

    /// Creates a text view that displays the formatted representation of a value.
    ///
    /// Use this initializer to create a text view that will format `subject`
    /// using `formatter`.
    public init<Subject>(_ subject: Subject, formatter: Formatter) where Subject : NSObject
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text {

    /// A predefined style used to display a `Date`.
    public struct DateStyle {

        /// A style displaying only the time component for a date.
        ///
        ///     Text(event.startDate, style: .time)
        ///
        /// Example output:
        ///     11:23PM
        public static let time: Text.DateStyle

        /// A style displaying a date.
        ///
        ///     Text(event.startDate, style: .date)
        ///
        /// Example output:
        ///     June 3, 2019
        public static let date: Text.DateStyle

        /// A style displaying a date as relative to now.
        ///
        ///     Text(event.startDate, style: .relative)
        ///
        /// Example output:
        ///     2 hours, 23 minutes
        ///     1 year, 1 month
        public static let relative: Text.DateStyle

        /// A style displaying a date as offset from now.
        ///
        ///     Text(event.startDate, style: .offset)
        ///
        /// Example output:
        ///     +2 hours
        ///     -3 months
        public static let offset: Text.DateStyle

        /// A style displaying a date as timer counting from now.
        ///
        ///     Text(event.startDate, style: .timer)
        ///
        /// Example output:
        ///    2:32
        ///    36:59:01
        public static let timer: Text.DateStyle
    }

    /// Creates an instance that displays localized dates and times using a specific style.
    ///
    /// - Parameters:
    ///     - date: The target date to display.
    ///     - style: The style used when displaying a date.
    public init(_ date: Date, style: Text.DateStyle)

    /// Creates an instance that displays a localized range between two dates.
    ///
    /// - Parameters:
    ///     - dates: The range of dates to display
    public init(_ dates: ClosedRange<Date>)

    /// Creates an instance that displays a localized time interval.
    ///
    ///     Text(DateInterval(start: event.startDate, duration: event.duration))
    ///
    /// Example output:
    ///     9:30AM - 3:30PM
    ///
    /// - Parameters:
    ///     - interval: The date interval to display
    public init(_ interval: DateInterval)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {

    /// Creates a text view that displays localized content identified by a key.
    ///
    /// Use this intializer to look for the `key` parameter in a localization
    /// table and display the associated string value in the initialized text
    /// view. If the initializer can't find the key in the table, or if no table
    /// exists, the text view displays the string representation of the key
    /// instead.
    ///
    ///     Text("pencil") // Localizes the key if possible, or displays "pencil" if not.
    ///
    /// When you initialize a text view with a string literal, the view triggers
    /// this initializer because it assumes you want the string localized, even
    /// when you don't explicitly specify a table, as in the above example. If
    /// you haven't provided localization for a particular string, you still get
    /// reasonable behavior, because the initializer displays the key, which
    /// typically contains the unlocalized string.
    ///
    /// If you initialize a text view with a string variable rather than a
    /// string literal, the view triggers the ``Text/init(_:)-9d1g4``
    /// initializer instead, because it assumes that you don't want localization
    /// in that case. If you do want to localize the value stored in a string
    /// variable, you can choose to call the `init(_:tableName:bundle:comment:)`
    /// initializer by first creating a ``LocalizedStringKey`` instance from the
    /// string variable:
    ///
    ///     Text(LocalizedStringKey(someString)) // Localizes the contents of `someString`.
    ///
    /// If you have a string literal that you don't want to localize, use the
    /// ``Text/init(verbatim:)`` initializer instead.
    ///
    /// - Parameters:
    ///   - key: The key for a string in the table identified by `tableName`.
    ///   - tableName: The name of the string table to search. If `nil`, use the
    ///     table in the `Localizable.strings` file.
    ///   - bundle: The bundle containing the strings file. If `nil`, use the
    ///     main bundle.
    ///   - comment: Contextual information about this key-value pair.
    public init(_ key: LocalizedStringKey, tableName: String? = nil, bundle: Bundle? = nil, comment: StaticString? = nil)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {

    /// Concatenates the text in two text views in a new text view.
    ///
    /// - Parameters:
    ///   - lhs: The first text view with text to combine.
    ///   - rhs: The second text view with text to combine.
    ///
    /// - Returns: A new text view containing the combined contents of the two
    ///   input text views.
    public static func + (lhs: Text, rhs: Text) -> Text
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {

    /// The type of truncation to apply to a line of text when it's too long to
    /// fit in the available space.
    ///
    /// When a text view contains more text than it's able to display, the view
    /// might truncate the text and place an ellipsis (...) at the truncation
    /// point. Use the ``View/truncationMode(_:)`` modifier with one of the
    /// `TruncationMode` values to indicate which part of the text to
    /// truncate, either at the beginning, in the middle, or at the end.
    public enum TruncationMode {

        /// Truncate at the beginning of the line.
        ///
        /// Use this kind of truncation to omit characters from the beginning of
        /// the string. For example, you could truncate the English alphabet as
        /// "...wxyz".
        case head

        /// Truncate at the end of the line.
        ///
        /// Use this kind of truncation to omit characters from the end of the
        /// string. For example, you could truncate the English alphabet as
        /// "abcd...".
        case tail

        /// Truncate in the middle of the line.
        ///
        /// Use this kind of truncation to omit characters from the middle of
        /// the string. For example, you could truncate the English alphabet as
        /// "ab...yz".
        case middle

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Text.TruncationMode, b: Text.TruncationMode) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }

    /// A scheme for transforming the capitalization of characters within text.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public enum Case {

        /// Displays text in all uppercase characters.
        ///
        /// For example, "Hello" would be displayed as "HELLO".
        ///
        /// - SeeAlso: `StringProtocol.uppercased(with:)`
        case uppercase

        /// Displays text in all lowercase characters.
        ///
        /// For example, "Hello" would be displayed as "hello".
        ///
        /// - SeeAlso: `StringProtocol.lowercased(with:)`
        case lowercase

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Text.Case, b: Text.Case) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {

    /// Sets the color of the text displayed by this view.
    ///
    /// Use this method to change the color of the text rendered by a text view.
    ///
    /// For example, you can display the names of the colors red, green, and
    /// blue in their respective colors:
    ///
    ///     HStack {
    ///         Text("Red").foregroundColor(.red)
    ///         Text("Green").foregroundColor(.green)
    ///         Text("Blue").foregroundColor(.blue)
    ///     }
    ///
    /// ![Three text views arranged horizontally, each containing
    ///     the name of a color displayed in that
    ///     color.](SwiftUI-Text-foregroundColor.png)
    ///
    /// - Parameter color: The color to use when displaying this text.
    /// - Returns: A text view that uses the color value you supply.
    public func foregroundColor(_ color: Color?) -> Text

    /// Sets the default font for text in the view.
    ///
    /// Use `font(_:)` to apply a specific font to an individual
    /// Text View, or all of the text views in a container.
    ///
    /// In the example below, the first text field has a font set directly,
    /// while the font applied to the following container applies to all of the
    /// text views inside that container:
    ///
    ///     VStack {
    ///         Text("Font applied to a text view.")
    ///             .font(.largeTitle)
    ///
    ///         VStack {
    ///             Text("These two text views have the same font")
    ///             Text("applied to their parent view.")
    ///         }
    ///         .font(.system(size: 16, weight: .light, design: .default))
    ///     }
    ///
    ///
    /// ![Applying a font to a single text view or a view container](SwiftUI-view-font.png)
    ///
    /// - Parameter font: The font to use when displaying this text.
    /// - Returns: Text that uses the font you specify.
    public func font(_ font: Font?) -> Text

    /// Sets the font weight of the text.
    ///
    /// - Parameter weight: One of the available font weights.
    ///
    /// - Returns: Text that uses the font weight you specify.
    public func fontWeight(_ weight: Font.Weight?) -> Text

    /// Applies a bold font weight to the text.
    ///
    /// - Returns: Bold text.
    public func bold() -> Text

    /// Applies italics to the text.
    ///
    /// - Returns: Italic text.
    public func italic() -> Text

    /// Applies a strikethrough to the text.
    ///
    /// - Parameters:
    ///   - active: A Boolean value that indicates whether the text has a
    ///     strikethrough applied.
    ///   - color: The color of the strikethrough. If `color` is `nil`, the
    ///     strikethrough uses the default foreground color.
    ///
    /// - Returns: Text with a line through its center.
    public func strikethrough(_ active: Bool = true, color: Color? = nil) -> Text

    /// Applies an underline to the text.
    ///
    /// - Parameters:
    ///   - active: A Boolean value that indicates whether the text has an
    ///     underline.
    ///   - color: The color of the underline. If `color` is `nil`, the
    ///     underline uses the default foreground color.
    ///
    /// - Returns: Text with a line running along its baseline.
    public func underline(_ active: Bool = true, color: Color? = nil) -> Text

    /// Sets the spacing, or kerning, between characters.
    ///
    /// Kerning defines the offset, in points, that a text view should shift
    /// characters from the default spacing. Use positive kerning to widen the
    /// spacing between characters. Use negative kerning to tighten the spacing
    /// between characters.
    ///
    ///     VStack(alignment: .leading) {
    ///         Text("ABCDEF").kerning(-3)
    ///         Text("ABCDEF")
    ///         Text("ABCDEF").kerning(3)
    ///     }
    ///
    /// The last character in the first case, which uses negative kerning,
    /// experiences cropping because the kerning affects the trailing edge of
    /// the text view as well.
    ///
    /// ![Three text views showing character groups, with progressively
    /// increasing spacing between the characters in each
    /// group.](SwiftUI-Text-kerning-1.png)
    ///
    /// Kerning attempts to maintain ligatures. For example, the Hoefler Text
    /// font uses a ligature for the letter combination _ffl_, as in the word
    /// _raffle_, shown here with a small negative and a small positive kerning:
    ///
    /// ![Two text views showing the word raffle in the Hoefler Text font, the
    /// first with small negative and the second with small positive kerning.
    /// The letter combination ffl has the same shape in both variants because
    /// it acts as a ligature.](SwiftUI-Text-kerning-2.png)
    ///
    /// The *ffl* letter combination keeps a constant shape as the other letters
    /// move together or apart. Beyond a certain point in either direction,
    /// however, kerning does disable nonessential ligatures.
    ///
    /// ![Two text views showing the word raffle in the Hoefler Text font, the
    /// first with large negative and the second with large positive kerning.
    /// The letter combination ffl does not act as a ligature in either
    /// case.](SwiftUI-Text-kerning-3.png)
    ///
    /// - Important: If you add both the ``Text/tracking(_:)`` and
    ///   ``Text/kerning(_:)`` modifiers to a view, the view applies the
    ///   tracking and ignores the kerning.
    ///
    /// - Parameter kerning: The spacing to use between individual characters in
    ///   this text.
    ///
    /// - Returns: Text with the specified amount of kerning.
    public func kerning(_ kerning: CGFloat) -> Text

    /// Sets the tracking for the text.
    ///
    /// Tracking adds space, measured in points, between the characters in the
    /// text view. A positive value increases the spacing between characters,
    /// while a negative value brings the characters closer together.
    ///
    ///     VStack(alignment: .leading) {
    ///         Text("ABCDEF").tracking(-3)
    ///         Text("ABCDEF")
    ///         Text("ABCDEF").tracking(3)
    ///     }
    ///
    /// The code above uses an unusually large amount of tracking to make it
    /// easy to see the effect.
    ///
    /// ![Three text views showing character groups with progressively
    /// increasing spacing between the characters in each
    /// group.](SwiftUI-Text-tracking.png)
    ///
    /// The effect of tracking resembles that of the ``Text/kerning(_:)``
    /// modifier, but adds or removes trailing whitespace, rather than changing
    /// character offsets. Also, using any nonzero amount of tracking disables
    /// nonessential ligatures, whereas kerning attempts to maintain ligatures.
    ///
    /// - Important: If you add both the ``Text/tracking(_:)`` and
    ///   ``Text/kerning(_:)`` modifiers to a view, the view applies the
    ///   tracking and ignores the kerning.
    ///
    /// - Parameter tracking: The amount of additional space, in points, that
    ///   the view should add to each character cluster after layout.
    ///
    /// - Returns: Text with the specified amount of tracking.
    public func tracking(_ tracking: CGFloat) -> Text

    /// Sets the vertical offset for the text relative to its baseline.
    ///
    /// Change the baseline offset to move the text in the view (in points) up
    /// or down relative to its baseline. The bounds of the view expand to
    /// contain the moved text.
    ///
    ///     HStack(alignment: .top) {
    ///         Text("Hello")
    ///             .baselineOffset(-10)
    ///             .border(Color.red)
    ///         Text("Hello")
    ///             .border(Color.green)
    ///         Text("Hello")
    ///             .baselineOffset(10)
    ///             .border(Color.blue)
    ///     }
    ///     .background(Color(white: 0.9))
    ///
    /// By drawing a border around each text view, you can see how the text
    /// moves, and how that affects the view.
    ///
    /// ![Three text views, each with the word "Hello" outlined by a border and
    /// aligned along the top edges. The first and last are larger than the
    /// second, with padding inside the border above the word "Hello" in the
    /// first case, and padding inside the border below the word in the last
    /// case.](SwiftUI-Text-baselineOffset.png)
    ///
    /// The first view, with a negative offset, grows downward to handle the
    /// lowered text. The last view, with a positive offset, grows upward. The
    /// enclosing ``HStack`` instance, shown in gray, ensures all the text views
    /// remain aligned at their top edge, regardless of the offset.
    ///
    /// - Parameter baselineOffset: The amount to shift the text vertically (up
    ///   or down) relative to its baseline.
    ///
    /// - Returns: Text that's above or below its baseline.
    public func baselineOffset(_ baselineOffset: CGFloat) -> Text
}

extension Text.DateStyle : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Text.DateStyle, b: Text.DateStyle) -> Bool
}

extension Text.DateStyle : Codable {

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: Decoder) throws
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text.TruncationMode : Equatable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text.TruncationMode : Hashable {
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text.Case : Equatable {
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text.Case : Hashable {
}

/// Aligns the child view within its bounds given anchor types
///
/// Child sizing: Respects the child's preferred size on the aligned axes. The child fills the context bounds on unaligned axes.
///
/// Preferred size: Child's preferred size
/// An alignment position for text along the horizontal axis.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public enum TextAlignment : Hashable, CaseIterable {

    case leading

    case center

    case trailing

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: TextAlignment, b: TextAlignment) -> Bool

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
    public func hash(into hasher: inout Hasher)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [TextAlignment]

    /// A collection of all values of this type.
    public static var allCases: [TextAlignment] { get }
}

/// A built-in group of commands for searching, editing, and transforming
/// selections of text.
///
/// These commands are optional and can be explicitly requested by passing a
/// value of this type to the `Scene.commands(_:)` modifier.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct TextEditingCommands : Commands {

    /// A new value describing the built-in text-editing commands.
    public init()

    /// The composition of commands that comprise the command group.
    public var body: some Commands { get }

    /// The type of command group representing the body of this command group.
    public typealias Body = some Commands
}

/// A view that can display and edit long-form text.
///
/// A text editor view allows you to display and edit multiline, scrollable
/// text in your app's user interface. By default, the text editor view styles
/// the text using characteristics inherited from the environment, like
/// ``View/font(_:)``, ``View/foregroundColor(_:)``, and
/// ``View/multilineTextAlignment(_:)``.
///
/// You create a text editor by adding a `TextEditor` instance to the
/// body of your view, and initialize it by passing in a
/// ``Binding`` to a string variable in your app:
///
///     struct TextEditingView: View {
///         @State private var fullText: String = "This is some editable text..."
///
///         var body: some View {
///             TextEditor(text: $fullText)
///         }
///     }
///
/// To style the text, use the standard view modifiers to configure a system
/// font, set a custom font, or change the color of the view's text.
///
/// In this example, the view renders the editor's text in gray with a
/// custom font:
///
///     struct TextEditingView: View {
///         @State private var fullText: String = "This is some editable text..."
///
///         var body: some View {
///             TextEditor(text: $fullText)
///                 .foregroundColor(Color.gray)
///                 .font(.custom("HelveticaNeue", size: 13))
///         }
///     }
///
/// If you want to change the spacing or font scaling aspects of the text, you
/// can use modifiers like ``View/lineLimit(_:)``,
/// ``View/lineSpacing(_:)``, and ``View/minimumScaleFactor(_:)`` to configure
/// how the view displays text depending on the space constraints. For example,
/// here the ``View/lineSpacing(_:)`` modifier sets the spacing between lines
/// to 5 points:
///
///     struct TextEditingView: View {
///         @State private var fullText: String = "This is some editable text..."
///
///         var body: some View {
///             TextEditor(text: $fullText)
///                 .foregroundColor(Color.gray)
///                 .font(.custom("HelveticaNeue", size: 13))
///                 .lineSpacing(5)
///         }
///     }
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct TextEditor : View {

    /// Creates a plain text editor.
    ///
    /// Use a ``TextEditor`` instance to create a view in which users can enter
    /// and edit long-form text.
    ///
    /// In this example, the text editor renders gray text using the 13
    /// point Helvetica Neue font with 5 points of spacing between each line:
    ///
    ///     struct TextEditingView: View {
    ///         @State private var fullText: String = "This is some editable text..."
    ///
    ///         var body: some View {
    ///             TextEditor(text: $fullText)
    ///                 .foregroundColor(Color.gray)
    ///                 .font(.custom("HelveticaNeue", size: 13))
    ///                 .lineSpacing(5)
    ///         }
    ///     }
    ///
    /// You can define the styling for the text within the view, including the
    /// text color, font, and line spacing. You define these styles by applying
    /// standard view modifiers to the view.
    ///
    /// The default text editor doesn't support rich text, such as styling of
    /// individual elements within the editor's view. The styles you set apply
    /// globally to all text in the view.
    ///
    /// - Parameter text: A ``Binding`` to the variable containing the
    ///    text to edit.
    public init(text: Binding<String>)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

/// A control that displays an editable text interface.
///
/// You can customize the appearance and interaction of a text field using a
/// ``TextFieldStyle`` instance. The system resolves this configuration at
/// runtime. Each platform provides a default style that reflects the platform
/// style, but you can provide a new style that redefines all text field
/// instances within a particular environment.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct TextField<Label> : View where Label : View {

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension TextField where Label == Text {

    /// Creates a text field with a text label generated from a localized title
    /// string.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the text field,
    ///     describing its purpose.
    ///   - text: The text to be displayed and edited.
    ///   - onEditingChanged: An action thats called when the user
    ///     begins editing `text` and after the user finishes editing `text`.
    ///     The closure recieves a Boolean indicating whether the text field is
    ///     currently being edited.
    ///   - onCommit: An action to perform when the user performs an action
    ///     (for example, when the user hits the return key) while the text
    ///     field has focus.
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {})

    /// Creates a text field with a text label generated from a title string.
    ///
    /// - Parameters:
    ///   - title: The title of the text view, describing its purpose.
    ///   - text: The text to be displayed and edited.
    ///   - onEditingChanged: An action thats called when the user
    ///     begins editing `text` and after the user finishes editing `text`.
    ///     The closure recieves a Boolean indicating whether the text field is
    ///     currently being edited.
    ///   - onCommit: An action to perform when the user performs an action
    ///     (for example, when the user hits the return key) while the text
    ///     field has focus.
    public init<S>(_ title: S, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) where S : StringProtocol

    /// Create an instance which binds over an arbitrary type, `T`.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the text field,
    ///     describing its purpose.
    ///   - value: The underlying value to be edited.
    ///   - formatter: A formatter to use when converting between the
    ///     string the user edits and the underlying value of type `T`.
    ///     In the event that `formatter` is unable to perform the conversion,
    ///     `binding.value` isn't modified.
    ///   - onEditingChanged: An action thats called when the user
    ///     begins editing `text` and after the user finishes editing `text`.
    ///     The closure recieves a Boolean indicating whether the text field is
    ///     currently being edited.
    ///   - onCommit: An action to perform when the user performs an action
    ///     (for example, when the user hits the return key) while the text
    ///     field has focus.
    public init<T>(_ titleKey: LocalizedStringKey, value: Binding<T>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {})

    /// Create an instance which binds over an arbitrary type, `T`.
    ///
    /// - Parameters:
    ///   - title: The title of the text field, describing its purpose.
    ///   - value: The underlying value to be edited.
    ///   - formatter: A formatter to use when converting between the
    ///     string the user edits and the underlying value of type `T`.
    ///     In the event that `formatter` is unable to perform the conversion,
    ///     `binding.value` isn't modified.
    ///   - onEditingChanged: An action thats called when the user
    ///     begins editing `text` and after the user finishes editing `text`.
    ///     The closure recieves a Boolean indicating whether the text field is
    ///     currently being edited.
    ///   - onCommit: An action to perform when the user performs an action
    ///     (for example, when the user hits the return key) while the text
    ///     field has focus.
    public init<S, T>(_ title: S, value: Binding<T>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) where S : StringProtocol
}

/// A specification for the appearance and interaction of a text field.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol TextFieldStyle {
}

/// A built-in set of commands for transforming the styles applied to selections
/// of text.
///
/// These commands are optional and can be explicitly requested by passing a
/// value of this type to the `Scene.commands(_:)` modifier.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct TextFormattingCommands : Commands {

    /// A new value describing the built-in text-formatting commands.
    public init()

    /// The composition of commands that comprise the command group.
    public var body: some Commands { get }

    /// The type of command group representing the body of this command group.
    public typealias Body = some Commands
}

/// A label style that only displays the title of the label.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct TitleOnlyLabelStyle : LabelStyle {

    /// Creates a title-only label style.
    public init()

    /// Creates a view that represents the body of a label.
    ///
    /// The system calls this method for each ``Label`` instance in a view
    /// hierarchy where this style is the current label style.
    ///
    /// - Parameter configuration: The properties of the label.
    public func makeBody(configuration: TitleOnlyLabelStyle.Configuration) -> some View


    /// A view that represents the body of a label.
    public typealias Body = some View
}

/// A control that toggles between on and off states.
///
/// You create a toggle by providing an `isOn` binding and a label. Bind `isOn`
/// to a Boolean property that determines whether the toggle is on or off. Set
/// the label to a view that visually describes the purpose of switching between
/// toggle states. For example:
///
///     @State private var vibrateOnRing = false
///
///     var body: some View {
///         Toggle(isOn: $vibrateOnRing) {
///             Text("Vibrate on Ring")
///         }
///     }
///
/// For the common case of text-only labels, you can use the convenience
/// initializer that takes a title string (or localized string key) as its first
/// parameter, instead of a trailing closure:
///
///     @State private var vibrateOnRing = true
///
///     var body: some View {
///         Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
///     }
///
/// ### Styling Toggles
///
/// You can customize the appearance and interaction of toggles by creating
/// styles that conform to the ``ToggleStyle`` protocol. To set a specific style
/// for all toggle instances within a view, use the ``View/toggleStyle(_:)``
/// modifier:
///
///     VStack {
///         Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
///         Toggle("Vibrate on Silent", isOn: $vibrateOnSilent)
///     }
///     .toggleStyle(SwitchToggleStyle())
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Toggle<Label> : View where Label : View {

    /// Creates a toggle that displays a custom label.
    ///
    /// - Parameters:
    ///   - isOn: A binding to a property that determines whether the toggle is on
    ///     or off.
    ///   - label: A view that describes the purpose of the toggle.
    public init(isOn: Binding<Bool>, @ViewBuilder label: () -> Label)

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Toggle where Label == ToggleStyleConfiguration.Label {

    /// Creates a toggle based on a toggle style configuration.
    ///
    /// You can use this initializer within the
    /// ``ToggleStyle/makeBody(configuration:)`` method of a ``ToggleStyle`` to
    /// create an instance of the styled toggle. This is useful for custom
    /// toggle styles that only modify the current toggle style, as opposed to
    /// implementing a brand new style.
    ///
    /// For example, the following style adds a red border around the toggle,
    /// but otherwise preserves the toggle's current style:
    ///
    ///     struct RedBorderedToggleStyle : ToggleStyle {
    ///         typealias Body = Toggle
    ///
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             Toggle(configuration)
    ///                 .border(Color.red)
    ///         }
    ///     }
    ///
    /// - Parameter configuration: A toggle style configuration.
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public init(_ configuration: ToggleStyleConfiguration)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Toggle where Label == Text {

    /// Creates a toggle that generates its label from a localized string key.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// localized key similar to ``Text/init(_:tableName:bundle:comment:)``. See
    /// `Text` for more information about localizing strings.
    ///
    /// To initialize a toggle with a string variable, use
    /// ``Toggle/init(_:isOn:)-2qurm`` instead.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the toggle's localized title, that describes
    ///     the purpose of the toggle.
    ///   - isOn: A binding to a property that indicates whether the toggle is
    ///    on or off.
    public init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>)

    /// Creates a toggle that generates its label from a string.
    ///
    /// This initializer creates a ``Text`` view on your behalf, and treats the
    /// title similar to ``Text/init(_:)-9d1g4``. See `Text` for more
    /// information about localizing strings.
    ///
    /// To initialize a toggle with a localized string key, use
    /// ``Toggle/init(_:isOn:)-8qx3l`` instead.
    ///
    /// - Parameters:
    ///   - title: A string that describes the purpose of the toggle.
    ///   - isOn: A binding to a property that indicates whether the toggle is
    ///    on or off.
    public init<S>(_ title: S, isOn: Binding<Bool>) where S : StringProtocol
}

/// A type that specifies the appearance and interaction of all toggles within a
/// view hierarchy.
///
/// To configure the current toggle style for a view hiearchy, use the
/// ``View/toggleStyle(_:)`` modifier.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ToggleStyle {

    /// A view that represents the appearance and interaction of a toggle.
    associatedtype Body : View

    /// Creates a view that represents the body of a toggle.
    ///
    /// The system calls this method for each ``Toggle`` instance in a view
    /// hierarchy where this style is the current toggle style.
    ///
    /// - Parameter configuration: The properties of the toggle, such as its
    ///   label and its “on” state.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a toggle instance.
    typealias Configuration = ToggleStyleConfiguration
}

/// The properties of a toggle instance.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ToggleStyleConfiguration {

    /// A type-erased label of a toggle.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A view that describes the effect of switching the toggle between its
    /// on and off states.
    public let label: ToggleStyleConfiguration.Label

    /// A binding to a state property that indicates whether the toggle is on or
    /// off.
    public var isOn: Bool { get nonmutating set }

    public var $isOn: Binding<Bool> { get }
}

/// A built-in set of commands for manipulating window toolbars.
///
/// These commands are optional and can be explicitly requested by passing a
/// value of this type to the `Scene.commands(_:)` modifier.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ToolbarCommands : Commands {

    /// A new value describing the built-in toolbar-related commands.
    public init()

    /// The composition of commands that comprise the command group.
    public var body: some Commands { get }

    /// The type of command group representing the body of this command group.
    public typealias Body = some Commands
}

/// Conforming types represent items that can be placed in various locations
/// in a toolbar.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol ToolbarContent {

    /// The type of content representing the body of this toolbar content.
    associatedtype Body : ToolbarContent

    /// The composition of content that comprise the toolbar content.
    @ToolbarContentBuilder var body: Self.Body { get }
}

/// Constructs a toolbar item set from multi-expression closures.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@_functionBuilder public struct ToolbarContentBuilder {

    public static func buildBlock<Content>(_ content: Content) -> some ToolbarContent where Content : ToolbarContent


    public static func buildBlock<Content>(_ content: Content) -> some CustomizableToolbarContent where Content : CustomizableToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent, C5 : ToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent, C5 : ToolbarContent, C6 : ToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent, C5 : ToolbarContent, C6 : ToolbarContent, C7 : ToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent, C5 : ToolbarContent, C6 : ToolbarContent, C7 : ToolbarContent, C8 : ToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some ToolbarContent where C0 : ToolbarContent, C1 : ToolbarContent, C2 : ToolbarContent, C3 : ToolbarContent, C4 : ToolbarContent, C5 : ToolbarContent, C6 : ToolbarContent, C7 : ToolbarContent, C8 : ToolbarContent, C9 : ToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent, C5 : CustomizableToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent, C5 : CustomizableToolbarContent, C6 : CustomizableToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent, C5 : CustomizableToolbarContent, C6 : CustomizableToolbarContent, C7 : CustomizableToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent, C5 : CustomizableToolbarContent, C6 : CustomizableToolbarContent, C7 : CustomizableToolbarContent, C8 : CustomizableToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarContentBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some CustomizableToolbarContent where C0 : CustomizableToolbarContent, C1 : CustomizableToolbarContent, C2 : CustomizableToolbarContent, C3 : CustomizableToolbarContent, C4 : CustomizableToolbarContent, C5 : CustomizableToolbarContent, C6 : CustomizableToolbarContent, C7 : CustomizableToolbarContent, C8 : CustomizableToolbarContent, C9 : CustomizableToolbarContent

}

/// A model that represents an item which can be placed in the toolbar
/// or navigation bar.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ToolbarItem<ID, Content> : ToolbarContent where Content : View {

    /// The type of content representing the body of this toolbar content.
    public typealias Body = Never
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarItem where ID == Void {

    /// Creates a toolbar item with the specified placement and content.
    ///
    /// - Parameters:
    ///   - placement: Which section of the toolbar
    ///     the item should be placed in.
    ///   - content: The content of the item.
    public init(placement: ToolbarItemPlacement = .automatic, @ViewBuilder content: () -> Content)
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarItem : CustomizableToolbarContent where ID == String {

    /// Creates a toolbar item with the specified placement and content,
    /// which allows for user customization.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for this item.
    ///   - placement: Which section of the toolbar
    ///     the item should be placed in.
    ///   - showsByDefault: Whether the item appears by default in the toolbar,
    ///     or only shows if the user explicitly adds it via customization.
    ///   - content: The content of the item.
    public init(id: String, placement: ToolbarItemPlacement = .automatic, showsByDefault: Bool = true, @ViewBuilder content: () -> Content)
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToolbarItem : Identifiable where ID : Hashable {

    /// The stable identity of the entity associated with this instance.
    public var id: ID { get }
}

/// A model that represents a group of `ToolbarItem`s which can be placed in
/// the toolbar or navigation bar.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ToolbarItemGroup<Content> : ToolbarContent where Content : View {

    /// Creates a toolbar item group with a specified placement and content.
    ///
    /// - Parameters:
    ///  - placement: Which section of the toolbar all of its vended
    ///    `ToolbarItem`s should be placed in.
    ///  - content: The content of the group. Each view specified in the
    ///    `ViewBuilder` will be given its own `ToolbarItem` in the toolbar.
    public init(placement: ToolbarItemPlacement = .automatic, @ViewBuilder content: () -> Content)

    /// The type of content representing the body of this toolbar content.
    public typealias Body = Never
}

/// A structure which defines the placement of a toolbar item.
///
/// There are two types of placements:
/// - Semantic placements, such as `.principal` and `.navigation`,
///   which denote the intent of the item being added.
///   SwiftUI will determine the appropriate placement for the item
///   based on this intent, as well as the current platform.
/// - Positional placements, such as `.navigationBarLeading`,
///   which denote a precise placement for the item,
///   usually for a particular platform.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ToolbarItemPlacement {

    /// The item is placed automatically, depending on many factors including
    /// the platform, size class, or presence of other items.
    ///
    /// On macOS and Mac Catalyst, items are placed in the current toolbar
    /// section in order of leading to trailing. On watchOS, only the first
    /// item will appear, pinned beneath the navigation bar.
    ///
    /// On iOS, iPadOS and tvOS, items are placed in the trailing position of
    /// the navigation bar.
    ///
    /// In compact horizontal size classes, both the leading and the trailing
    /// positions of the navigation bar are limited to a single item each.
    public static let automatic: ToolbarItemPlacement

    /// The item is placed in the principal item section.
    ///
    /// Principal actions receive prominent placement.
    /// As an example, the location field for a web browser would be
    /// considered a principal item.
    ///
    /// On macOS and Mac Catalyst, the principal item will be placed in the
    /// center of the toolbar.
    ///
    /// On iOS, iPadOS, and tvOS, the principal item will be placed in
    /// the center of the navigation bar. This item will take precendent over
    /// a title specified through `.navigationTitle()`.
    @available(watchOS, unavailable)
    public static let principal: ToolbarItemPlacement

    /// The item represents a navigation action.
    ///
    /// Navigation actions allow the user to move between contexts.
    /// For example, the forward and back buttons of a web browser
    /// are considered navigation actions.
    ///
    /// On macOS and Mac Catalyst, navigation items will be placed in the
    /// leading edge of the toolbar ahead of the inline title if that is
    /// present in the toolbar.
    ///
    /// On iOS, iPadOS, and tvOS, navigation items will appear in the leading
    /// edge of the navigation bar. If a system navigation item like a back
    /// button is present in a compact width, they will instead appear in
    /// the .primaryAction placement.
    @available(watchOS, unavailable)
    public static let navigation: ToolbarItemPlacement

    /// The item represents a primary action.
    ///
    /// A primary action is considered to be a more frequently used action
    /// for the current context. For example, a button which allows the user
    /// to compose a new message in a chat application.
    ///
    /// On macOS and Mac Catalyst, the primary action is considered to be the
    /// leading edge of the toolbar.
    ///
    /// On iOS, iPadOS and tvOS, the primary action is considered to be
    /// the trailing edge of the navigation bar.
    ///
    /// On watchOS, the primary action is placed beneath the navigation
    /// bar and revealed by scrolling.
    public static let primaryAction: ToolbarItemPlacement

    /// The item represents a change in status for the current context.
    ///
    /// Status items are informational in nature,
    /// and do not represent an action that can be taken by the user.
    /// For example, a message indicating the last time the server has been
    /// checked for new messages.
    ///
    /// On macOS and Mac Catalyst, status items will be placed in the center
    /// of the toolbar.
    ///
    /// On iOS and iPadOS, status items will be placed in the center of the
    /// bottom toolbar.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let status: ToolbarItemPlacement

    /// The item represents a confirmation action for a modal interface.
    ///
    /// Confirmation actions are used to receive user confirmation of a
    /// particular action. An example of a confirmation action would be
    /// an action with the label "Add" to add a new event to the calendar.
    ///
    /// On macOS and Mac Catalyst, confirmationAction items will be placed
    /// on the trailing edge in the trailing-most position of the sheet
    /// and gain the apps accent color as a background color.
    ///
    /// On iOS, iPadOS, and tvOS, confirmationAction items will be placed in
    /// the same location as a `.primaryAction` placement.
    ///
    /// On watchOS, confirmationAction items will be placed in the trailing
    /// edge of the navigation bar.
    public static let confirmationAction: ToolbarItemPlacement

    /// The item represents a cancellation action for a modal interface.
    ///
    /// Cancellation actions can be used to dismiss the modal interface
    /// without taking any action, usually via a 'Cancel' button.
    ///
    /// On macOS and Mac Catalyst, cancellationAction items will be placed
    /// on the trailing edge of the sheet but be placed before any
    /// confirmationAction items.
    ///
    /// On iOS, iPadOS, tvOS and watchOS, cancellationAction items will
    /// be placed on the leading edge of the navigation bar.
    public static let cancellationAction: ToolbarItemPlacement

    /// The item represents a destructive action for a modal interface.
    ///
    /// Destructive actions are used represent the opposite of a
    /// confirmational action. For example, a button labeled 'Don't Save',
    /// which declines to save the current document before quitting.
    ///
    /// On macOS and Mac Catalyst, destructiveAction items will be placed in
    /// the leading edge of the sheet and will be given a special appearance
    /// to caution against accidental use.
    ///
    /// On iOS, tvOS and watchOS, destructiveAction items will be placed in the
    /// trailing edge of the navigation bar.
    public static let destructiveAction: ToolbarItemPlacement

    /// The item is placed in the leading edge of the navigation bar. Applies
    /// to iOS, iPadOS, tvOS, and Mac Catalyst.
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public static let navigationBarLeading: ToolbarItemPlacement

    /// The item is placed in the trailing edge of the navigation bar. Applies
    /// to iOS, iPadOS, tvOS, and Mac Catalyst.
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public static let navigationBarTrailing: ToolbarItemPlacement

    /// The item is placed in the bottom toolbar. Applies to iOS, iPadOS, and
    /// Mac Catalyst.
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let bottomBar: ToolbarItemPlacement
}

/// The context of the current state-processing update.
///
/// Use a transaction to pass an animation between views in a view hierarchy.
///
/// The root transaction for a state change comes from the binding that changed,
/// plus any global values set by calling ``withTransaction(_:_:)`` or
/// ``withAnimation(_:_:)``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Transaction {

    /// Creates a transaction.
    @inlinable public init()
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Transaction {

    /// Creates a transaction and assigns its animation property.
    ///
    /// - Parameter animation: The animation to perform when the current state
    ///   changes.
    public init(animation: Animation?)

    /// The animation, if any, associated with the current state change.
    public var animation: Animation?

    /// A Boolean value that indicates whether views should disable animations.
    ///
    /// This value is `true` during the initial phase of a two-part transition
    /// update, to prevent ``View/animation(_:)`` from inserting new animations
    /// into the transaction.
    public var disablesAnimations: Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Transaction {

    /// A Boolean value that indicates whether the transaction originated from
    /// an action that produces a sequence of values.
    ///
    /// This value is `true` if a continuous action created the transaction, and
    /// is `false` otherwise. Continuous actions include things like dragging a
    /// slider or pressing and holding a stepper, as opposed to tapping a
    /// button.
    public var isContinuous: Bool
}

/// A shape with an affine transform applied to it.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct TransformedShape<Content> : Shape where Content : Shape {

    public var shape: Content

    public var transform: CGAffineTransform

    @inlinable public init(shape: Content, transform: CGAffineTransform)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    /// The type defining the data to animate.
    public typealias AnimatableData = Content.AnimatableData

    /// The data to animate.
    public var animatableData: TransformedShape<Content>.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

/// A View created from a swift tuple of View values.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct TupleView<T> : View {

    public var value: T

    @inlinable public init(_ value: T)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A property wrapper that is used in `App` to provide a delegate from UIKit.
@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@propertyWrapper public struct UIApplicationDelegateAdaptor<DelegateType> : DynamicProperty where DelegateType : NSObject, DelegateType : UIApplicationDelegate {

    /// The underlying delegate.
    public var wrappedValue: DelegateType { get }

    /// Creates an `UIApplicationDelegateAdaptor` using a UIKit Application
    /// Delegate.
    ///
    /// The framework will initialize the provided delegate and manage its
    /// lifetime, calling out to it when appropriate after performing its
    /// own work.
    ///
    /// - Parameter delegate: the type of `UIApplicationDelegate` to use.
    public init(_ delegateType: DelegateType.Type = DelegateType.self)
}

@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension UIApplicationDelegateAdaptor where DelegateType : ObservableObject {

    /// Creates an `UIApplicationDelegateAdaptor` using a UIKit
    /// Application Delegate.
    ///
    /// The framework will initialize the provided delegate and manage its
    /// lifetime, calling out to it when appropriate after performing its
    /// own work.
    ///
    /// - Parameter delegate: the type of `UIApplicationDelegate` to use.
    /// - Note: the instantiated delegate will be placed in the Environment
    ///   and may be accessed by using the `@EnvironmentObject` property wrapper
    ///   in the view hierarchy.
    public init(_ delegateType: DelegateType.Type = DelegateType.self)

    /// A projection of the observed object that creates bindings to its
    /// properties using dynamic member lookup.
    ///
    /// Use the projected value to pass a binding value down a view
    /// hierarchy. To get the `projectedValue`, prefix the property
    /// variable with `$`.
    public var projectedValue: ObservedObject<DelegateType>.Wrapper { get }
}

/// A UIKit view controller that manages a SwiftUI view hierarchy.
///
/// Create a `UIHostingController` object when you want to integrate SwiftUI
/// views into a UIKit view hierarchy. At creation time, specify the SwiftUI
/// view you want to use as the root view for this view controller; you can
/// change that view later using the ``SwiftUI/UIHostingController/rootView``
/// property. Use the hosting controller like you would any other view
/// controller, by presenting it or embedding it as a child view controller
/// in your interface.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
open class UIHostingController<Content> : UIViewController where Content : View {

    @objc override dynamic open var keyCommands: [UIKeyCommand]? { get }

    /// Creates a hosting controller object that wraps the specified SwiftUI
    /// view.
    ///
    /// - Parameter rootView: The root view of the SwiftUI view hierarchy that
    ///   you want to manage using the hosting view controller.
    ///
    /// - Returns: A `UIHostingController` object initialized with the
    ///   specified SwiftUI view.
    public init(rootView: Content)

    /// Creates a hosting controller object from an archive and the specified
    /// SwiftUI view.
    /// - Parameters:
    ///   - coder: The decoder to use during initialization.
    ///   - rootView: The root view of the SwiftUI view hierarchy that you want
    ///     to manage using this view controller.
    ///
    /// - Returns: A `UIViewController` object that you can present from your
    ///   interface.
    public init?(coder aDecoder: NSCoder, rootView: Content)

    /// Creates a hosting controller object from the contents of the specified
    /// archive.
    ///
    /// The default implementation of this method throws an exception. To create
    /// your view controller from an archive, override this method and
    /// initialize the superclass using the ``init(coder:rootView:)`` method
    /// instead.
    ///
    /// -Parameter coder: The decoder to use during initialization.
    @objc required dynamic public init?(coder aDecoder: NSCoder)

    /// Notifies the view controller that its view is about to be added to a
    /// view hierarchy.
    ///
    /// SwiftUI calls this method before adding the hosting controller's root
    /// view to the view hierarchy. You can override this method to perform
    /// custom tasks asssociated with the appearance of the view. If you
    /// override this method, you must call `super` at some point in your
    /// implementation.
    ///
    /// - Parameter animated: If `true`, the view is being added
    ///   using an animation.
    @objc override dynamic open func viewWillAppear(_ animated: Bool)

    /// Notifies the view controller that its view has been added to a
    /// view hierarchy.
    ///
    /// SwiftUI calls this method after adding the hosting controller's root
    /// view to the view hierarchy. You can override this method to perform
    /// custom tasks asssociated with the appearance of the view. If you
    /// override this method, you must call `super` at some point in your
    /// implementation.
    ///
    /// - Parameter animated: If `true`, the view is being added
    ///   using an animation.
    @objc override dynamic open func viewDidAppear(_ animated: Bool)

    /// Notifies the view controller that its view will be removed from a
    /// view hierarchy.
    ///
    /// SwiftUI calls this method before removing the hosting controller's root
    /// view from the view hierarchy. You can override this method to perform
    /// custom tasks asssociated with the disappearance of the view. If you
    /// override this method, you must call `super` at some point in your
    /// implementation.
    ///
    /// - Parameter animated: If `true`, the view is being removed
    ///   using an animation.
    @objc override dynamic open func viewWillDisappear(_ animated: Bool)

    @objc override dynamic open func viewWillLayoutSubviews()

    /// The root view of the SwiftUI view hierarchy managed by this view
    /// controller.
    public var rootView: Content

    /// Calculates and returns the most appropriate size for the current view.
    ///
    /// - Parameter size: The proposed new size for the view.
    ///
    /// - Returns: The size that offers the best fit for the root view and its
    ///   contents.
    public func sizeThatFits(in size: CGSize) -> CGSize

    @objc override dynamic open func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer)

    /// The preferred status bar style for the view controller.
    @objc override dynamic open var preferredStatusBarStyle: UIStatusBarStyle { get }

    /// A Boolean value that indicates whether the view controller prefers the
    /// status bar to be hidden or shown.
    @objc override dynamic open var prefersStatusBarHidden: Bool { get }

    /// The animation style to use when hiding or showing the status bar for
    /// this view controller.
    @objc override dynamic open var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { get }

    @objc override dynamic open var childForStatusBarHidden: UIViewController? { get }

    @objc override dynamic open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)

    @objc override dynamic open func willMove(toParent parent: UIViewController?)

    @objc override dynamic open func didMove(toParent parent: UIViewController?)

    @objc override dynamic open func target(forAction action: Selector, withSender sender: Any?) -> Any?

    @objc override dynamic public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
}

/// A view that represents a UIKit view controller.
///
/// Use a ``UIViewControllerRepresentable`` instance to create and manage a
/// <doc://com.apple.documentation/documentation/UIKit/UIViewController> object in your
/// SwiftUI interface. Adopt this protocol in one of your app's custom
/// instances, and use its methods to create, update, and tear down your view
/// controller. The creation and update processes parallel the behavior of
/// SwiftUI views, and you use them to configure your view controller with your
/// app's current state information. Use the teardown process to remove your
/// view controller cleanly from your SwiftUI. For example, you might use the
/// teardown process to notify other objects that the view controller is
/// disappearing.
///
/// To add your view controller into your SwiftUI interface, create your
/// ``UIViewControllerRepresentable`` instance and add it to your SwiftUI
/// interface. The system calls the methods of your custom instance at
/// appropriate times.
///
/// The system doesn't automatically communicate changes occurring within your
/// view controller to other parts of your SwiftUI interface. When you want your
/// view controller to coordinate with other SwiftUI views, you must provide a
/// ``NSViewControllerRepresentable/Coordinator`` instance to facilitate those
/// interactions. For example, you use a coordinator to forward target-action
/// and delegate messages from your view controller to any SwiftUI views.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public protocol UIViewControllerRepresentable : View where Self.Body == Never {

    /// The type of view controller to present.
    associatedtype UIViewControllerType : UIViewController

    /// Creates the view controller object and configures its initial state.
    ///
    /// You must implement this method and use it to create your view controller
    /// object. Create the view controller using your app's current data and
    /// contents of the `context` parameter. The system calls this method only
    /// once, when it creates your view controller for the first time. For all
    /// subsequent updates, the system calls the
    /// ``UIViewControllerRepresentable/updateUIViewController(_:context:)``
    /// method.
    ///
    /// - Parameter context: A context structure containing information about
    ///   the current state of the system.
    ///
    /// - Returns: Your UIKit view controller configured with the provided
    ///   information.
    func makeUIViewController(context: Self.Context) -> Self.UIViewControllerType

    /// Updates the state of the specified view controller with new information
    /// from SwiftUI.
    ///
    /// When the state of your app changes, SwiftUI updates the portions of your
    /// interface affected by those changes. SwiftUI calls this method for any
    /// changes affecting the corresponding AppKit view controller. Use this
    /// method to update the configuration of your view controller to match the
    /// new state information provided in the `context` parameter.
    ///
    /// - Parameters:
    ///   - uiViewController: Your custom view controller object.
    ///   - context: A context structure containing information about the current
    ///     state of the system.
    func updateUIViewController(_ uiViewController: Self.UIViewControllerType, context: Self.Context)

    /// Cleans up the presented view controller (and coordinator) in
    /// anticipation of their removal.
    ///
    /// Use this method to perform additional clean-up work related to your
    /// custom view controller. For example, you might use this method to remove
    /// observers or update other parts of your SwiftUI interface.
    ///
    /// - Parameters:
    ///   - uiViewController: Your custom view controller object.
    ///   - coordinator: The custom coordinator instance you use to communicate
    ///     changes back to SwiftUI. If you do not use a custom coordinator, the
    ///     system provides a default instance.
    static func dismantleUIViewController(_ uiViewController: Self.UIViewControllerType, coordinator: Self.Coordinator)

    /// A type to coordinate with the view controller.
    associatedtype Coordinator = Void

    /// Creates the custom instance that you use to communicate changes from
    /// your view controller to other parts of your SwiftUI interface.
    ///
    /// Implement this method if changes to your view controller might affect
    /// other parts of your app. In your implementation, create a custom Swift
    /// instance that can communicate with other parts of your interface. For
    /// example, you might provide an instance that binds its variables to
    /// SwiftUI properties, causing the two to remain synchronized. If your view
    /// controller doesn't interact with other parts of your app, providing a
    /// coordinator is unnecessary.
    ///
    /// SwiftUI calls this method before calling the
    /// ``UIViewControllerRepresentable/makeUIViewController(context:)`` method.
    /// The system provides your coordinator either directly or as part of a
    /// context structure when calling the other methods of your representable
    /// instance.
    func makeCoordinator() -> Self.Coordinator

    typealias Context = UIViewControllerRepresentableContext<Self>
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewControllerRepresentable where Self.Coordinator == Void {

    /// Creates the custom instance that you use to communicate changes from
    /// your view controller to other parts of your SwiftUI interface.
    ///
    /// Implement this method if changes to your view controller might affect
    /// other parts of your app. In your implementation, create a custom Swift
    /// instance that can communicate with other parts of your interface. For
    /// example, you might provide an instance that binds its variables to
    /// SwiftUI properties, causing the two to remain synchronized. If your view
    /// controller doesn't interact with other parts of your app, providing a
    /// coordinator is unnecessary.
    ///
    /// SwiftUI calls this method before calling the
    /// ``UIViewControllerRepresentable/makeUIViewController(context:)`` method.
    /// The system provides your coordinator either directly or as part of a
    /// context structure when calling the other methods of your representable
    /// instance.
    public func makeCoordinator() -> Self.Coordinator
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewControllerRepresentable {

    /// Cleans up the presented view controller (and coordinator) in
    /// anticipation of their removal.
    ///
    /// Use this method to perform additional clean-up work related to your
    /// custom view controller. For example, you might use this method to remove
    /// observers or update other parts of your SwiftUI interface.
    ///
    /// - Parameters:
    ///   - uiViewController: Your custom view controller object.
    ///   - coordinator: The custom coordinator instance you use to communicate
    ///     changes back to SwiftUI. If you do not use a custom coordinator, the
    ///     system provides a default instance.
    public static func dismantleUIViewController(_ uiViewController: Self.UIViewControllerType, coordinator: Self.Coordinator)

    /// Declares the content and behavior of this view.
    public var body: Never { get }
}

/// Contextual information about the state of the system that you use to create
/// and update your UIKit view controller.
///
/// A ``UIViewControllerRepresentableContext`` structure contains details about
/// the current state of the system. When creating and updating your view
/// controller, the system creates one of these structures and passes it to the
/// appropriate method of your custom ``UIViewControllerRepresentable``
/// instance. Use the information in this structure to configure your view
/// controller. For example, use the provided environment values to configure
/// the appearance of your view controller and views. Don't create this
/// structure yourself.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct UIViewControllerRepresentableContext<Representable> where Representable : UIViewControllerRepresentable {

    /// The view's associated coordinator.
    public let coordinator: Representable.Coordinator

    /// The current transaction.
    public var transaction: Transaction { get }

    /// Environment values that describe the current state of the system.
    ///
    /// Use the environment values to configure the state of your UIKit view
    /// controller when creating or updating it.
    public var environment: EnvironmentValues { get }
}

/// A wrapper for a UIKit view that you use to integrate that view into your
/// SwiftUI view hierarchy.
///
/// Use a ``UIViewRepresentable`` instance to create and manage a
/// <doc://com.apple.documentation/documentation/UIKit/UIView> object in your SwiftUI
/// interface. Adopt this protocol in one of your app's custom instances, and
/// use its methods to create, update, and tear down your view. The creation and
/// update processes parallel the behavior of SwiftUI views, and you use them to
/// configure your view with your app's current state information. Use the
/// teardown process to remove your view cleanly from your SwiftUI. For example,
/// you might use the teardown process to notify other objects that the view is
/// disappearing.
///
/// To add your view into your SwiftUI interface, create your
/// ``UIViewRepresentable`` instance and add it to your SwiftUI interface. The
/// system calls the methods of your representable instance at appropriate times
/// to create and update the view. The following example shows the inclusion of
/// a custom `MyRepresentedCustomView` structure in the view hierarchy.
///
///     struct ContentView: View {
///        var body: some View {
///           VStack {
///              Text("Global Sales")
///              MyRepresentedCustomView()
///           }
///        }
///     }
///
/// The system doesn't automatically communicate changes occurring within your
/// view to other parts of your SwiftUI interface. When you want your view to
/// coordinate with other SwiftUI views, you must provide a
/// ``NSViewControllerRepresentable/Coordinator`` instance to facilitate those
/// interactions. For example, you use a coordinator to forward target-action
/// and delegate messages from your view to any SwiftUI views.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public protocol UIViewRepresentable : View where Self.Body == Never {

    /// The type of view to present.
    associatedtype UIViewType : UIView

    /// Creates the view object and configures its initial state.
    ///
    /// You must implement this method and use it to create your view object.
    /// Configure the view using your app's current data and contents of the
    /// `context` parameter. The system calls this method only once, when it
    /// creates your view for the first time. For all subsequent updates, the
    /// system calls the ``UIViewRepresentable/updateUIView(_:context:)``
    /// method.
    ///
    /// - Parameter context: A context structure containing information about
    ///   the current state of the system.
    ///
    /// - Returns: Your UIKit view configured with the provided information.
    func makeUIView(context: Self.Context) -> Self.UIViewType

    /// Updates the state of the specified view with new information from
    /// SwiftUI.
    ///
    /// When the state of your app changes, SwiftUI updates the portions of your
    /// interface affected by those changes. SwiftUI calls this method for any
    /// changes affecting the corresponding UIKit view. Use this method to
    /// update the configuration of your view to match the new state information
    /// provided in the `context` parameter.
    ///
    /// - Parameters:
    ///   - uiView: Your custom view object.
    ///   - context: A context structure containing information about the current
    ///     state of the system.
    func updateUIView(_ uiView: Self.UIViewType, context: Self.Context)

    /// Cleans up the presented UIKit view (and coordinator) in anticipation of
    /// their removal.
    ///
    /// Use this method to perform additional clean-up work related to your
    /// custom view. For example, you might use this method to remove observers
    /// or update other parts of your SwiftUI interface.
    ///
    /// - Parameters:
    ///   - uiView: Your custom view object.
    ///   - coordinator: The custom coordinator instance you use to communicate
    ///     changes back to SwiftUI. If you do not use a custom coordinator, the
    ///     system provides a default instance.
    static func dismantleUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator)

    /// A type to coordinate with the view.
    associatedtype Coordinator = Void

    /// Creates the custom instance that you use to communicate changes from
    /// your view to other parts of your SwiftUI interface.
    ///
    /// Implement this method if changes to your view might affect other parts
    /// of your app. In your implementation, create a custom Swift instance that
    /// can communicate with other parts of your interface. For example, you
    /// might provide an instance that binds its variables to SwiftUI
    /// properties, causing the two to remain synchronized. If your view doesn't
    /// interact with other parts of your app, providing a coordinator is
    /// unnecessary.
    ///
    /// SwiftUI calls this method before calling the
    /// ``UIViewRepresentable/makeUIView(context:)`` method. The system provides
    /// your coordinator either directly or as part of a context structure when
    /// calling the other methods of your representable instance.
    func makeCoordinator() -> Self.Coordinator

    typealias Context = UIViewRepresentableContext<Self>
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewRepresentable where Self.Coordinator == Void {

    /// Creates the custom instance that you use to communicate changes from
    /// your view to other parts of your SwiftUI interface.
    ///
    /// Implement this method if changes to your view might affect other parts
    /// of your app. In your implementation, create a custom Swift instance that
    /// can communicate with other parts of your interface. For example, you
    /// might provide an instance that binds its variables to SwiftUI
    /// properties, causing the two to remain synchronized. If your view doesn't
    /// interact with other parts of your app, providing a coordinator is
    /// unnecessary.
    ///
    /// SwiftUI calls this method before calling the
    /// ``UIViewRepresentable/makeUIView(context:)`` method. The system provides
    /// your coordinator either directly or as part of a context structure when
    /// calling the other methods of your representable instance.
    public func makeCoordinator() -> Self.Coordinator
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewRepresentable {

    /// Cleans up the presented UIKit view (and coordinator) in anticipation of
    /// their removal.
    ///
    /// Use this method to perform additional clean-up work related to your
    /// custom view. For example, you might use this method to remove observers
    /// or update other parts of your SwiftUI interface.
    ///
    /// - Parameters:
    ///   - uiView: Your custom view object.
    ///   - coordinator: The custom coordinator instance you use to communicate
    ///     changes back to SwiftUI. If you do not use a custom coordinator, the
    ///     system provides a default instance.
    public static func dismantleUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator)

    /// Declares the content and behavior of this view.
    public var body: Never { get }
}

/// Contextual information about the state of the system that you use to create
/// and update your UIKit view.
///
/// A ``UIViewRepresentableContext`` structure contains details about the
/// current state of the system. When creating and updating your view, the
/// system creates one of these structures and passes it to the appropriate
/// method of your custom ``UIViewRepresentable`` instance. Use the information
/// in this structure to configure your view. For example, use the provided
/// environment values to configure the appearance of your view. Don't create
/// this structure yourself.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct UIViewRepresentableContext<Representable> where Representable : UIViewRepresentable {

    /// The view's associated coordinator.
    public let coordinator: Representable.Coordinator

    /// The current transaction.
    public var transaction: Transaction { get }

    /// The current environment.
    ///
    /// Use the environment values to configure the state of your view when
    /// creating or updating it.
    public var environment: EnvironmentValues { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct UnitPoint : Hashable {

    public var x: CGFloat

    public var y: CGFloat

    @inlinable public init()

    @inlinable public init(x: CGFloat, y: CGFloat)

    public static let zero: UnitPoint

    public static let center: UnitPoint

    public static let leading: UnitPoint

    public static let trailing: UnitPoint

    public static let top: UnitPoint

    public static let bottom: UnitPoint

    public static let topLeading: UnitPoint

    public static let topTrailing: UnitPoint

    public static let bottomLeading: UnitPoint

    public static let bottomTrailing: UnitPoint

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
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: UnitPoint, b: UnitPoint) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension UnitPoint : Animatable {

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<CGFloat, CGFloat>

    /// The data to animate.
    public var animatableData: UnitPoint.AnimatableData
}

/// A set of values that indicate the visual size available to the view.
@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public enum UserInterfaceSizeClass {

    /// The compact size class.
    case compact

    /// The regular size class.
    case regular

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: UserInterfaceSizeClass, b: UserInterfaceSizeClass) -> Bool

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
    public func hash(into hasher: inout Hasher)
}

extension UserInterfaceSizeClass {

    /// Create a size class from its UIUserInterfaceSizeClass equivalent.
    @available(iOS 14.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init?(_ uiUserInterfaceSizeClass: UIUserInterfaceSizeClass)
}

@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension UserInterfaceSizeClass : Equatable {
}

@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension UserInterfaceSizeClass : Hashable {
}

/// A view that arranges its children in a vertical line.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct VStack<Content> : View where Content : View {

    /// Creates an instance with the given spacing and horizontal alignment.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. It has
    ///     the same horizontal screen coordinate for all children.
    ///   - spacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - content: A view builder that creates the content of this stack.
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A type that can serve as the animatable data of an animatable type.
///
/// `VectorArithmetic` extends the `AdditiveArithmetic` protocol with scalar
/// multiplication and a way to query the vector magnitude of the value. Use
/// this type as the `animatableData` associated type of a type that conforms to
/// the ``Animatable`` protocol.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol VectorArithmetic : AdditiveArithmetic {

    /// Multiplies each component of this value by the given value.
    mutating func scale(by rhs: Double)

    /// Returns the dot-product of this vector arithmetic instance with itself.
    var magnitudeSquared: Double { get }
}

/// An alignment position along the horizontal axis.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct VerticalAlignment : Equatable {

    /// Creates an instance with the given identifier.
    ///
    /// Each instance needs a unique identifier.
    ///
    /// - Parameter id: An identifier that uniquely identifies the vertical
    ///   alignment.
    public init(_ id: AlignmentID.Type)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: VerticalAlignment, b: VerticalAlignment) -> Bool
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension VerticalAlignment {

    /// A guide marking the top edge of the view.
    public static let top: VerticalAlignment

    /// A guide marking the vertical center of the view.
    public static let center: VerticalAlignment

    /// A guide marking the bottom edge of the view.
    public static let bottom: VerticalAlignment

    /// A guide marking the topmost text baseline view.
    public static let firstTextBaseline: VerticalAlignment

    /// A guide marking the bottom-most text baseline in a view.
    public static let lastTextBaseline: VerticalAlignment
}

/// A type that represents part of your app's user interface and provides
/// modifiers that you use to configure views.
///
/// You create custom views by declaring types that conform to the ``View``
/// protocol. Implement the required ``View/body-swift.property`` computed
/// property to provide the content for your custom view.
///
///     struct MyView: View {
///         var body: some View {
///             Text("Hello, World!")
///         }
///     }
///
/// Assemble the view's body by combining one or more of the primitive views
/// provided by SwiftUI, like the ``Text`` instance in the example above, plus
/// other custom views that you define, into a hierarchy of views.
///
/// The ``View`` protocol provides a large set of modifiers, defined as protocol
/// methods with default implementations, that you use to position and configure
/// views in the layout of your app. Modifiers typically work by wrapping the
/// view instance on which you call them in another view with the specified
/// characteristics. For example, adding the ``View/opacity(_:)`` modifier to a
/// text view returns a new view with some amount of transparency:
///
///     Text("Hello, World!")
///         .opacity(0.5) // Display partially transparent text.
///
/// The effects of a modifier typically propagate to any child views that don't
/// explicitly override the modifier. For example, a ``VStack`` instance on its
/// own acts only to vertically stack other views, and has no text to display.
/// Therefore, a ``View/font(_:)`` modifier that you apply to the stack has no
/// effect on the stack itself. Yet the font modifier does apply to any of the
/// stack's child views, some of which might display text. On the other hand,
/// you can locally override the stack's modifier by adding another to a
/// specific child view:
///
///     VStack {
///         Text("Title")
///             .font(.headline) // Override the font of this one view.
///         Text("First body line.")
///         Text("Second body line.")
///     }
///     .font(.body) // Set a default for text in the stack.
///
/// You commonly chain modifiers, each wrapping the result of the previous one.
/// For example, you can wrap a text view in an invisible box with a given width
/// using the ``View/frame(width:height:alignment:)`` modifier to influence its
/// layout, and then use the ``View/border(_:width:)`` modifier to draw an
/// outline around that:
///
///     Text("Title")
///         .frame(width: 100)
///         .border(Color.gray)
///
/// The order in which you apply modifiers matters. For example, the border that
/// results from the above code outlines the full width of the frame.
///
/// ![A screenshot of a text view displaying the string "Title", outlined by a
/// gray rectangle that's wider than the string it encloses, leaving empty space
/// inside the rectangle on either side of the string. A caption reads, "Apply
/// the frame first."](SwiftUI-View-1.png)
///
/// If you instead apply the border first, it outlines the text view, which
/// never takes more space than it needs to render its contents.
///
///     Text("Title")
///         .border(Color.gray) // Apply the border first this time.
///         .frame(width: 100)
///
/// Wrapping that view in another invisible one with a fixed 100 point width
/// affects the layout of the composite view, but has no effect on the border.
///
/// ![A screenshot of a text view displaying the string "Title", outlined by a
/// gray rectangle that hugs the text. A caption reads, "Apply the border
/// first."](SwiftUI-View-2.png)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    associatedtype Body : View

    /// The content and behavior of the view.
    @ViewBuilder var body: Self.Body { get }
}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets the style for date pickers within this view.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func datePickerStyle<S>(_ style: S) -> some View where S : DatePickerStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Presents a sheet using the given item as a data source
    /// for the sheet's content.
    ///
    /// - Parameters:
    ///   - item: A binding to an optional source of truth for the sheet.
    ///     When representing a non-`nil` item, the system uses `content` to
    ///     create a sheet representation of the item.
    ///     If the identity changes, the system dismisses a
    ///     currently-presented sheet and replaces it with a new sheet.
    ///   - onDismiss: A closure executed when the sheet dismisses.
    ///   - content: A closure returning the content of the sheet.
    public func sheet<Item, Content>(item: Binding<Item?>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item : Identifiable, Content : View


    /// Presents a sheet when a given condition is true.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the sheet is presented.
    ///   - onDismiss: A closure executed when the sheet dismisses.
    ///   - content: A closure returning the content of the sheet.
    public func sheet<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View

}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
@available(macOS, unavailable)
extension View {

    /// Presents a modal view that covers as much of the screen as
    /// possible using the given item as a data source for the sheet's content.
    ///
    /// - Parameters:
    ///   - item: A binding to an optional source of truth for the cover
    ///     modal view. When representing a non-nil item, the system uses
    ///     `content` to create a modal representation of the item.
    ///     If the identity of `item` changes, the system will dismiss a
    ///     currently-presented modal view and replace it by a new modal view.
    ///   - onDismiss: A closure executed when the modal view dismisses.
    ///   - content: A closure returning the content of the modal view.
    public func fullScreenCover<Item, Content>(item: Binding<Item?>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item : Identifiable, Content : View


    /// Presents a modal view that covers as much of the screen as
    /// possible when a given condition is true.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the modal view is presented.
    ///   - onDismiss: A closure executed when the modal view dismisses.
    ///   - content: A closure returning the content of the modal view.
    public func fullScreenCover<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View

}

@available(iOS 13.0, macOS 10.15, watchOS 6.0, tvOS 14.0, *)
extension View {

    /// Adds an action to perform when this view recognizes a long press
    /// gesture.
    @available(tvOS, unavailable)
    public func onLongPressGesture(minimumDuration: Double = 0.5, maximumDistance: CGFloat = 10, pressing: ((Bool) -> Void)? = nil, perform action: @escaping () -> Void) -> some View

}

extension View {

    /// Sets whether to disable autocorrection for this view.
    ///
    /// Use `disableAutocorrection(_:)` when the effect of autocorrection would
    /// make it more difficult for the user to input information. The entry of
    /// proper names and street addresses are examples where autocorrection can
    /// negatively affect the user's ability complete a data entry task.
    ///
    /// In the example below configures a ``TextField`` with the `.default`
    /// keyboard. Disabling autocorrection allows the user to enter arbitrary
    /// text without the autocorrection system offering suggestions or
    /// attempting to override their input.
    ///
    ///     TextField("1234 Main St.", text: $address)
    ///         .keyboardType(.default)
    ///         .disableAutocorrection(true)
    ///
    /// - Parameter enabled: A Boolean value that indicates whether
    ///   autocorrection is disabled for this view.
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
    @available(watchOS, unavailable)
    public func disableAutocorrection(_ disable: Bool?) -> some View

}

@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets the style for the index view within the current environment.
    ///
    /// - Parameter style: The style to apply to this view.
    public func indexViewStyle<S>(_ style: S) -> some View where S : IndexViewStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Provides a closure that vends the drag representation to be used for a
    /// particular data element.
    @inlinable public func itemProvider(_ action: (() -> NSItemProvider?)?) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a condition for whether the view's view hierarchy is deletable.
    @inlinable public func deleteDisabled(_ isDisabled: Bool) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a condition for whether the view's view hierarchy is movable.
    @inlinable public func moveDisabled(_ isDisabled: Bool) -> some View

}

@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Activates this view as the source of a drag and drop operation.
    ///
    /// Applying the `onDrag(_:)` modifier adds the appropriate gestures for
    /// drag and drop to this view. When a drag operation begins, a rendering of
    /// this view is generated and used as the preview image.
    ///
    /// - Parameter data: A closure that returns a single
    /// <doc://com.apple.documentation/documentation/Foundation/NSItemProvider> that
    /// represents the draggable data from this view.
    ///
    /// - Returns: A view that activates this view as the source of a drag and
    ///   drop operation, beginning with user gesture input.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onDrag(_ data: @escaping () -> NSItemProvider) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an accessibility action to this view.
    public func accessibilityAction(_ actionKind: AccessibilityActionKind = .default, _ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Adds a custom accessibility action to the view and all subviews.
    public func accessibilityAction(named name: Text, _ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Adds a custom accessibility action to the view and all subviews.
    public func accessibilityAction(named nameKey: LocalizedStringKey, _ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Adds a custom accessibility action to the view and all subviews.
    public func accessibilityAction<S>(named name: S, _ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Sets the style for the tab view within the the current environment.
    ///
    /// - Parameter style: The style to apply to this tab view.
    public func tabViewStyle<S>(_ style: S) -> some View where S : TabViewStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for buttons within this view to a button style with a
    /// custom appearance and custom interaction behavior.
    ///
    /// To set a specific style for all button instances within a view, use the
    /// ``View/buttonStyle(_:)-66fbx`` modifier:
    ///
    ///     HStack {
    ///         Button("Sign In", action: signIn)
    ///         Button("Register", action: register)
    ///     }
    ///     .buttonStyle(BorderedButtonStyle())
    public func buttonStyle<S>(_ style: S) -> some View where S : PrimitiveButtonStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an action to perform when this view detects data emitted by the
    /// given publisher.
    ///
    /// - Parameters:
    ///   - publisher: The publisher to subscribe to.
    ///   - action: The action to perform when an event is emitted by
    ///     `publisher`. The event emitted by publisher is passed as a
    ///     parameter to `action`.
    ///
    /// - Returns: A view that triggers `action` when `publisher` emits an
    ///   event.
    @inlinable public func onReceive<P>(_ publisher: P, perform action: @escaping (P.Output) -> Void) -> some View where P : Publisher, P.Failure == Never

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies a modifier to a view and returns a new view.
    ///
    /// Use this modifier to combine a ``View`` and a ``ViewModifier``, to
    /// create a new view. For example, if you create a view modifier for
    /// a new kind of caption with blue text surrounded by a rounded rectangle:
    ///
    ///     struct BorderedCaption: ViewModifier {
    ///         func body(content: Content) -> some View {
    ///             content
    ///                 .font(.caption2)
    ///                 .padding(10)
    ///                 .overlay(
    ///                     RoundedRectangle(cornerRadius: 15)
    ///                         .stroke(lineWidth: 1)
    ///                 )
    ///                 .foregroundColor(Color.blue)
    ///         }
    ///     }
    ///
    /// You can use ``modifier(_:)`` to extend ``View`` to create new modifier
    /// for applying the `BorderedCaption` defined above:
    ///
    ///     extension View {
    ///         func borderedCaption() -> some View {
    ///             modifier(BorderedCaption())
    ///         }
    ///     }
    ///
    /// Then you can apply the bordered caption to any view:
    ///
    ///     Image(systemName: "bus")
    ///         .resizable()
    ///         .frame(width:50, height:50)
    ///     Text("Downtown Bus")
    ///         .borderedCaption()
    ///
    /// ![A screenshot showing the image of a bus with a caption reading
    /// Downtown Bus. A view extension, using custom a modifier, renders the
    ///  caption in blue text surrounded by a rounded
    ///  rectangle.](SwiftUI-View-ViewModifier.png)
    ///
    /// - Parameter modifier: The modifier to apply to this view.
    @inlinable public func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T>
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Sets whether this view should ignore the system Smart Invert setting.
    ///
    /// Use this modifier to suppress Smart Invert in a view that shouldn't
    /// be inverted. Or pass an `active` argument of `false` to begin following
    /// the Smart Invert setting again when it was previously disabled.
    ///
    /// - Parameter active: A true value ignores the system Smart Invert
    ///   setting. A false value follows the system setting.
    @inlinable public func accessibilityIgnoresInvertColors(_ active: Bool = true) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Configures whether this view participates in hit test operations.
    @inlinable public func allowsHitTesting(_ enabled: Bool) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an action to perform when this view appears.
    ///
    /// - Parameter action: The action to perform. If `action` is `nil`, the
    ///   call has no effect.
    ///
    /// - Returns: A view that triggers `action` when this view appears.
    @inlinable public func onAppear(perform action: (() -> Void)? = nil) -> some View


    /// Adds an action to perform when this view disappears.
    ///
    /// - Parameter action: The action to perform. If `action` is `nil`, the
    ///   call has no effect.
    ///
    /// - Returns: A view that triggers `action` when this view disappears.
    @inlinable public func onDisappear(perform action: (() -> Void)? = nil) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View where Self : Equatable {

    /// Prevents the view from updating its child view when its new value is the
    /// same as its old value.
    @inlinable public func equatable() -> EquatableView<Self>
}

@available(iOS 13.0, macOS 10.15, tvOS 14.0, *)
@available(watchOS, introduced: 6.0, deprecated: 7.0)
extension View {

    /// Adds a context menu to the view.
    ///
    /// Use contextual menus to add actions that change depending on the user's
    /// current focus and task.
    ///
    /// The following example creates a ``Text`` view with a contextual menu.
    /// Note that the actions invoked by the menu selection could be coded
    /// directly inside the button closures or, as shown below, invoked via
    /// function references.
    ///
    ///     func selectHearts() {
    ///         // Act on hearts selection.
    ///     }
    ///     func selectClubs() { ... }
    ///     func selectSpades() { ... }
    ///     func selectDiamonds() { ... }
    ///
    ///     Text("Favorite Card Suit")
    ///         .padding()
    ///         .contextMenu {
    ///             Button("♥️ - Hearts", action: selectHearts)
    ///             Button("♣️ - Clubs", action: selectClubs)
    ///             Button("♠️ - Spades", action: selectSpades)
    ///             Button("♦️ - Diamonds", action: selectDiamonds)
    ///         }
    ///
    /// ![A context menu showing four menu items.](SwiftUI-contextMenu.png)
    ///
    /// - Parameter menuItems: A `contextMenu` that contains one or more menu items.
    /// - Returns: A view that adds a contextual menu to this view.
    public func contextMenu<MenuItems>(@ViewBuilder menuItems: () -> MenuItems) -> some View where MenuItems : View

}

@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use `contextMenu(menuItems:)` instead.")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use `contextMenu(menuItems:)` instead.")
@available(tvOS, unavailable)
@available(watchOS, introduced: 6.0, deprecated: 7.0)
extension View {

    /// Attaches a context menu and its children to the view.
    ///
    /// Use `contextMenu(_:)` to attach a contextual menu struct and its
    /// children to the view. This modifier allows for the contextual menu to be
    /// conditionally available by passing `nil` as the value for `contextMenu`.
    ///
    /// In the example below a ``ContextMenu`` that contains four menu items is
    /// created and is passed into the `contextMenu(_:)` modifier. The
    /// attachment of context menu is controlled by the Boolean value
    /// `shouldShowMenu` which is `true`, enabling the contextual menu.
    ///
    /// Note that the actions invoked by the menu selection could be coded
    /// directly inside the button closures or, as shown below, invoked via
    /// function references.
    ///
    ///     func selectHearts() {
    ///         // Act on hearts selection.
    ///     }
    ///     func selectClubs() { ... }
    ///     func selectSpades() { ... }
    ///     func selectDiamonds() { ... }
    ///
    ///     let menuItems = ContextMenu {
    ///         Button("♥️ - Hearts", action: selectHearts)
    ///         Button("♣️ - Clubs", action: selectClubs)
    ///         Button("♠️ - Spades", action: selectSpades)
    ///         Button("♦️ - Diamonds", action: selectDiamonds)
    ///     }
    ///
    ///     struct ContextMenuMenuItems: View {
    ///         private var shouldShowMenu = true
    ///         var body: some View {
    ///             VStack {
    ///                 Text("Favorite Card Suit")
    ///                     .padding()
    ///                     .contextMenu(shouldShowMenu ? menuItems : nil)
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameter contextMenu: A context menu container for views that you
    ///   present as menu items in a contextual menu.
    ///
    /// - Returns: A view that adds a contextual menu to this view.
    public func contextMenu<MenuItems>(_ contextMenu: ContextMenu<MenuItems>?) -> some View where MenuItems : View

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets the style for menus within this view.
    ///
    /// To set a specific style for all menu instances within a view, use the
    /// `menuStyle(_:)` modifier:
    ///
    ///     Menu("PDF") {
    ///         Button("Open in Preview", action: openInPreview)
    ///         Button("Save as PDF", action: saveAsPDF)
    ///     }
    ///     .menuStyle(ButtonMenuStyle())
    ///
    public func menuStyle<S>(_ style: S) -> some View where S : MenuStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Attaches a gesture to the view with a lower precedence than gestures
    /// defined by the view.
    public func gesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture


    /// Attaches a gesture to the view with a higher precedence than gestures
    /// defined by the view.
    public func highPriorityGesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture


    /// Attaches a gesture to the view to process simultaneously with gestures
    /// defined by the view.
    public func simultaneousGesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Presents a system interface for allowing the user to import an existing
    /// file.
    ///
    /// In order for the interface to appear, `isPresented` must be `true`. When
    /// the operation is finished, `isPresented` will be set to `false` before
    /// `onCompletion` is called. If the user cancels the operation,
    /// `isPresented` will be set to `false` and `onCompletion` will not be
    /// called.
    ///
    /// - Note: Changing `allowedContentTypes` while the file importer is
    ///   presented will have no immediate effect, however will apply the next
    ///   time it is presented.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - allowedContentTypes: The list of supported content types which can
    ///     be imported.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileImporter(isPresented: Binding<Bool>, allowedContentTypes: [UTType], onCompletion: @escaping (Result<URL, Error>) -> Void) -> some View


    /// Presents a system interface for allowing the user to import multiple
    /// files.
    ///
    /// In order for the interface to appear, `isPresented` must be `true`. When
    /// the operation is finished, `isPresented` will be set to `false` before
    /// `onCompletion` is called. If the user cancels the operation,
    /// `isPresented` will be set to `false` and `onCompletion` will not be
    /// called.
    ///
    /// - Note: Changing `allowedContentTypes` or `allowsMultipleSelection`
    ///   while the file importer is presented will have no immediate effect,
    ///   however will apply the next time it is presented.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - allowedContentTypes: The list of supported content types which can
    ///     be imported.
    ///   - allowsMultipleSelection: Whether the importer allows the user to
    ///     select more than one file to import.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileImporter(isPresented: Binding<Bool>, allowedContentTypes: [UTType], allowsMultipleSelection: Bool, onCompletion: @escaping (Result<[URL], Error>) -> Void) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for buttons within this view to a button style with a
    /// custom appearance and standard interaction behavior.
    ///
    /// To set a specific style for all button instances within a view, use the
    /// ``View/buttonStyle(_:)-66fbx`` modifier:
    ///
    ///     HStack {
    ///         Button("Sign In", action: signIn)
    ///         Button("Register", action: register)
    ///     }
    ///     .buttonStyle(BorderedButtonStyle())
    public func buttonStyle<S>(_ style: S) -> some View where S : ButtonStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func transformAnchorPreference<A, K>(key _: K.Type = K.self, value: Anchor<A>.Source, transform: @escaping (inout K.Value, Anchor<A>) -> Void) -> some View where K : PreferenceKey

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Adds a reason to apply a redaction to this view hierarchy.
    ///
    /// Adding a redaction is an additive process: any redaction
    /// provided will be added to the reasons provided by the parent.
    public func redacted(reason: RedactionReasons) -> some View


    /// Removes any reason to apply a redaction to this view hierarchy.
    public func unredacted() -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func background<Background>(_ background: Background, alignment: Alignment = .center) -> some View where Background : View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func overlay<Overlay>(_ overlay: Overlay, alignment: Alignment = .center) -> some View where Overlay : View


    /// Adds a border to this view with the specified style and width.
    ///
    /// Use `border(_:width:)` to draw a border of a specified width around the
    /// view's frame. By default, the border appears inside the bounds of this
    /// view. In this example, the four-point wide border covers the text:
    ///
    ///     Text("Purple border inside the view bounds")
    ///         .border(Color.purple, width: 4)
    ///
    /// ![A screenshot showing showing border styles and thickness around a
    /// view.](SwiftUI-View-border-1.png)
    ///
    /// To place a border around the outside of this view, apply padding of the
    /// same width before adding the border:
    ///
    ///     Text("Purple border outside the view bounds.")
    ///         .padding(4)
    ///         .border(Color.purple, width: 4)
    ///
    /// ![A screenshot showing showing padded border styles and
    /// thickness.](SwiftUI-View-border-2.png)
    ///
    /// - Parameters:
    ///   - content: The border style.
    ///   - width: The thickness of the border; if not provided, the default is
    ///     1 pixel.
    ///
    /// - Returns: A view that adds a border with the specified style and width
    ///   to this view.
    @inlinable public func border<S>(_ content: S, width: CGFloat = 1) -> some View where S : ShapeStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Constrains this view's dimensions to the specified aspect ratio.
    ///
    /// Use `aspectRatio(_:contentMode:)` to constrain a view's dimensions to an
    /// aspect ratio specified by a
    /// <doc://com.apple.documentation/documentation/CoreGraphics/CGFloat> using the specified
    /// content mode.
    ///
    /// If this view is resizable, the resulting view will have `aspectRatio` as
    /// its aspect ratio. In this example, the purple ellipse has a 3:4
    /// width-to-height ratio, and scales to fit its frame:
    ///
    ///     Ellipse()
    ///         .fill(Color.purple)
    ///         .aspectRatio(0.75, contentMode: .fit)
    ///         .frame(width: 200, height: 200)
    ///         .border(Color(white: 0.75))
    ///
    /// ![A view showing a purple ellipse that has a 3:4 width-to-height ratio,
    /// and scales to fit its frame.](SwiftUI-View-aspectRatio-cgfloat.png)
    ///
    /// - Parameters:
    ///   - aspectRatio: The ratio of width to height to use for the resulting
    ///     view. Use `nil` to maintain the current aspect ratio in the
    ///     resulting view.
    ///   - contentMode: A flag that indicates whether this view fits or fills
    ///     the parent context.
    ///
    /// - Returns: A view that constrains this view's dimensions to the aspect
    ///   ratio of the given size using `contentMode` as its scaling algorithm.
    @inlinable public func aspectRatio(_ aspectRatio: CGFloat? = nil, contentMode: ContentMode) -> some View


    /// Constrains this view's dimensions to the aspect ratio of the given size.
    ///
    /// Use `aspectRatio(_:contentMode:)` to contstrain a view's dimentsions to
    /// an aspect ratio specified by a
    /// <doc://com.apple.documentation/documentation/CoreGraphics/CGSize>.
    ///
    /// If this view is resizable, the resulting view uses `aspectRatio` as its
    /// own aspect ratio. In this example, the purple ellipse has a 3:4
    /// width-to-height ratio, and scales to fill its frame:
    ///
    ///     Ellipse()
    ///         .fill(Color.purple)
    ///         .aspectRatio(CGSize(width: 3, height: 4), contentMode: .fill)
    ///         .frame(width: 200, height: 200)
    ///         .border(Color(white: 0.75))
    ///
    /// ![A view showing a purple ellipse that has a 3:4 width-to-height ratio,
    /// and scales to fill its frame.](SwiftUI-View-aspectRatio.png)
    ///
    /// - Parameters:
    ///   - aspectRatio: A size that specifies the ratio of width to height to
    ///     use for the resulting view.
    ///   - contentMode: A flag indicating whether this view should fit or fill
    ///     the parent context.
    ///
    /// - Returns: A view that constrains this view's dimensions to
    ///   `aspectRatio`, using `contentMode` as its scaling algorithm.
    @inlinable public func aspectRatio(_ aspectRatio: CGSize, contentMode: ContentMode) -> some View


    /// Scales this view to fit its parent.
    ///
    /// Use `scaledToFit()` to scale this view to fit its parent, while
    /// maintaining the view's aspect ratio as the view scales.
    ///
    ///     Circle()
    ///         .fill(Color.pink)
    ///         .scaledToFit()
    ///         .frame(width: 300, height: 150)
    ///         .border(Color(white: 0.75))
    ///
    /// ![A screenshot of pink circle scaled to fit its
    /// frame.](SwiftUI-View-scaledToFit-1.png)
    ///
    /// This method is equivalent to calling
    /// ``View/aspectRatio(_:contentMode:)-5ehx6`` with a `nil` aspectRatio and
    /// a content mode of ``ContentMode/fit``.
    ///
    /// - Returns: A view that scales this view to fit its parent, maintaining
    ///   this view's aspect ratio.
    @inlinable public func scaledToFit() -> some View


    /// Scales this view to fill its parent.
    ///
    /// Use `scaledToFill()` to scale this view to fill its parent, while
    /// maintaining the view's aspect ratio as the view scales:
    ///
    ///     Circle()
    ///         .fill(Color.pink)
    ///         .scaledToFill()
    ///         .frame(width: 300, height: 150)
    ///         .border(Color(white: 0.75))
    ///
    /// ![A screenshot of pink circle scaled to fill its
    /// frame.](SwiftUI-View-scaledToFill-1.png)
    ///
    /// This method is equivalent to calling
    /// ``View/aspectRatio(_:contentMode:)-5ehx6`` with a `nil` aspectRatio and
    /// a content mode of ``ContentMode/fill``.
    ///
    /// - Returns: A view that scales this view to fill its parent, maintaining
    ///   this view's aspect ratio.
    @inlinable public func scaledToFill() -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Fixes this view at its ideal size in the specified dimensions.
    ///
    /// This function behaves like ``View/fixedSize()``, except with
    /// `fixedSize(horizontal:vertical:)` the fixing of the axes can be
    /// optionally specified in one or both dimensions. For example, if you
    /// horizontally fix a text view before wrapping it in the frame view,
    /// you're telling the text view to maintain its ideal _width_. The view
    /// calculates this to be the space needed to represent the entire string.
    ///
    ///     Text("A single line of text, too long to fit in a box.")
    ///         .fixedSize(horizontal: true, vertical: false)
    ///         .frame(width: 200, height: 200)
    ///         .border(Color.gray)
    ///
    /// This can result in the view exceeding the parent's bounds, which may or
    /// may not be the effect you want.
    ///
    /// ![A screenshot showing a text view exceeding the bounds of its
    /// parent.](SwiftUI-View-fixedSize-3.png)
    ///
    /// - Parameters:
    ///   - horizontal: A Boolean value that indicates whether to fix the width
    ///     of the view.
    ///   - vertical: A Boolean value that indicates whether to fix the height
    ///     of the view.
    ///
    /// - Returns: A view that fixes this view at its ideal size in the
    ///   dimensions specified by `horizontal` and `vertical`.
    @inlinable public func fixedSize(horizontal: Bool, vertical: Bool) -> some View


    /// Fixes this view at its ideal size.
    ///
    /// During the layout of the view hierarchy, each view proposes a size to
    /// each child view it contains. If the child view doesn't need a fixed size
    /// it can accept and conform to the size offered by the parent.
    ///
    /// For example, a ``Text`` view placed in an explicitly sized frame wraps
    /// and truncates its string to remain within its parent's bounds:
    ///
    ///     Text("A single line of text, too long to fit in a box.")
    ///         .frame(width: 200, height: 200)
    ///         .border(Color.gray)
    ///
    /// ![A screenshot showing the text in a text view contained within its
    /// parent.](SwiftUI-View-fixedSize-1.png)
    ///
    /// The `fixedSize()` modifier can be used to create a view that maintains
    /// the *ideal size* of its children both dimensions:
    ///
    ///     Text("A single line of text, too long to fit in a box.")
    ///         .fixedSize()
    ///         .frame(width: 200, height: 200)
    ///         .border(Color.gray)
    ///
    /// This can result in the view exceeding the parent's bounds, which may or
    /// may not be the effect you want.
    ///
    /// ![A screenshot showing a text view exceeding the bounds of its
    /// parent.](SwiftUI-View-fixedSize-2.png)
    ///
    /// You can think of `fixedSize()` as the creation of a *counter proposal*
    /// to the view size proposed to a view by its parent. The ideal size of a
    /// view, and the specific effects of `fixedSize()` depends on the
    /// particular view and how you have configured it.
    ///
    /// To create a view that fixes the view's size in either the horizontal or
    /// vertical dimensions, see ``View/fixedSize(horizontal:vertical:)``.
    ///
    /// - Returns: A view that fixes this view at its ideal size.
    @inlinable public func fixedSize() -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the color of the foreground elements displayed by this view.
    ///
    /// - Parameter color: The foreground color to use when displaying this
    ///   view. Pass `nil` to remove any custom foreground color and to allow
    ///   the system or the container to provide its own foreground color.
    ///   If a container-specific override doesn't exist, the system uses
    ///   the primary color.
    ///
    /// - Returns: A view that uses the foreground color you supply.
    @inlinable public func foregroundColor(_ color: Color?) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for pickers within this view.
    public func pickerStyle<S>(_ style: S) -> some View where S : PickerStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Pads this view using the edges and padding amount you specify.
    ///
    /// Use `padding(_:)` to add a specified amount of padding to one or more
    /// edges of the view. For example, you can add padding of specific amounts
    /// to specified edges of a view:
    ///
    ///     VStack {
    ///         Text("20 point padding on the left and bottom edges.")
    ///             .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0))
    ///             .border(Color.gray)
    ///         Text("Unpadded text")
    ///             .border(Color.yellow)
    ///     }
    ///
    /// ![A view showing padding added to leading/bottom edge
    /// insets.](SwiftUI-View-padding-insets.png)
    ///
    /// To pad selected outside edges of a view with an amount you specify, see
    /// ``View/padding(_:_:)``. To pad all outside edges of a view with an
    /// amount you specify, see ``View/padding(_:)-9f33x``.
    ///
    /// - Parameter insets: The edges and amounts to inset.
    ///
    /// - Returns: A view that pads this view using the specified edge insets
    ///   with specified amount of padding.
    @inlinable public func padding(_ insets: EdgeInsets) -> some View


    /// A view that pads this view inside the specified edge insets with a
    /// system-calculated amount of padding.
    ///
    /// Use `padding(_:)` to add a system-calculated amount of padding inside
    /// one or more of the view's edges by passing either a single edge name, or
    /// an `OptionSet` describing which edges should be padded. For example you
    /// can add padding to the bottom of a text view:
    ///
    ///     VStack {
    ///         Text("Text padded on the bottom edge.")
    ///             .padding(.bottom)
    ///             .border(Color.gray)
    ///         Text("Unpadded text")
    ///             .border(Color.yellow)
    ///     }
    ///
    /// ![A view showing padding added to the view's bottom
    /// edge.](SwiftUI-View-padding-2.png)
    ///
    /// To pad the view's insets, which affects the amount of padding _inside_
    /// the edges of the view, see ``View/padding(_:)-6pgqq``. To pad all
    /// outside edges of a view with an amount you specify, see
    /// ``View/padding(_:)-9f33x``.
    ///
    /// - Parameters:
    ///   - edges: The set of edges along which to pad this view; if `nil` the
    ///     specified or system-calculated mount is applied to all edges.
    ///   - length: The amount to inset this view on the specified edges. If
    ///     `nil`, the amount is the system-default amount.
    ///
    /// - Returns: A view that pads this view using the specified edge insets
    ///   with specified amount of padding.
    @inlinable public func padding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View


    /// Pads the view along all edges by the specified amount.
    ///
    /// Use `padding(_:)` to add a specific amount of padding around all edges
    /// of the view.
    ///
    ///     VStack {
    ///         Text("Text padded by 10 points on each edge.")
    ///             .padding(10.0)
    ///             .border(Color.gray)
    ///         Text("Unpadded text")
    ///             .border(Color.yellow)
    ///     }
    ///
    /// ![A view showing 10 points of padding to all
    /// edges.](SwiftUI-View-padding-1.png)
    ///
    /// - Parameter length: The amount to pad this view on each edge.
    ///
    /// - Returns: A view that pads this view by the amount you specify.
    @inlinable public func padding(_ length: CGFloat) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Offset this view by the horizontal and vertical amount specified in the
    /// offset parameter.
    ///
    /// Use `offset(_:)` to to shift the displayed contents by the amount
    /// specified in the `offset` parameter.
    ///
    /// The original dimensions of the view aren't changed by offsetting the
    /// contents; in the example below the gray border drawn by this view
    /// surrounds the original position of the text:
    ///
    ///     Text("Offset by passing CGSize()")
    ///         .border(Color.green)
    ///         .offset(CGSize(width: 20, height: 25))
    ///         .border(Color.gray)
    ///
    /// ![A screenshot showing a view that offset from its original position a
    /// CGPoint to specify the x and y offset.](SwiftUI-View-offset.png)
    ///
    /// - Parameter offset: The distance to offset this view.
    ///
    /// - Returns: A view that offsets this view by `offset`.
    @inlinable public func offset(_ offset: CGSize) -> some View


    /// Offset this view by the specified horizontal and vertical distances.
    ///
    /// Use `offset(x:y:)` to to shift the displayed contents by the amount
    /// specified in the `x` and `y` parameters.
    ///
    /// The original dimensions of the view aren't changed by offsetting the
    /// contents; in the example below the gray border drawn by this view
    /// surrounds the original position of the text:
    ///
    ///     Text("Offset by passing horizontal & vertical distance")
    ///         .border(Color.green)
    ///         .offset(x: 20, y: 50)
    ///         .border(Color.gray)
    ///
    /// ![A screenshot showing a view that offset from its original position
    /// using and x and y offset.](swiftui-offset-xy.png)
    ///
    /// - Parameters:
    ///   - x: The horizontal distance to offset this view.
    ///   - y: The vertical distance to offset this view.
    ///
    /// - Returns: A view that offsets this view by `x` and `y`.
    @inlinable public func offset(x: CGFloat = 0, y: CGFloat = 0) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the view's horizontal alignment.
    ///
    /// Use `alignmentGuide(_:computeValue:)` to calculate specific offsets
    /// to reposition views in relationship to one another. You can return a
    /// constant or can use the ``ViewDimensions`` argument to the closure to
    /// calculate a return value.
    ///
    /// In the example below, the ``HStack`` is offset by a constant of 50
    /// points to the right of center:
    ///
    ///     VStack {
    ///         Text("Today's Weather")
    ///             .font(.title)
    ///             .border(Color.gray)
    ///         HStack {
    ///             Text("🌧")
    ///             Text("Rain & Thunderstorms")
    ///             Text("⛈")
    ///         }
    ///         .alignmentGuide(HorizontalAlignment.center) { _ in  50 }
    ///         .border(Color.gray)
    ///     }
    ///     .border(Color.gray)
    ///
    /// Changing the alignment of one view may have effects on surrounding
    /// views. Here the offset values inside a stack and its contained views is
    /// the difference of their absolute offsets.
    ///
    /// ![A view showing the two emoji offset from a text element using a
    /// horizontal alignment guide.](SwiftUI-View-HAlignmentGuide.png)
    ///
    /// - Parameters:
    ///   - g: A ``HorizontalAlignment`` value at which to a base the offset.
    ///   - computeValue: A closure that returns the offset value to apply to
    ///     this view.
    ///
    /// - Returns: A view modified with respect to its horizontal alignment
    ///   according to the computation performed in the method's closure.
    @inlinable public func alignmentGuide(_ g: HorizontalAlignment, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View


    /// Sets the view's vertical alignment.
    ///
    /// Use `alignmentGuide(_:computeValue:)` to calculate specific offsets
    /// to reposition views in relationship to one another. You can return a
    /// constant or can use the ``ViewDimensions`` argument to the closure to
    /// calculate a return value.
    ///
    /// In the example below, the weather emoji are offset 20 points from the
    /// vertical center of the ``HStack``.
    ///
    ///     VStack {
    ///         Text("Today's Weather")
    ///             .font(.title)
    ///             .border(Color.gray)
    ///
    ///         HStack {
    ///             Text("🌧")
    ///                 .alignmentGuide(VerticalAlignment.center) { _ in -20 }
    ///             Text("Rain & Thunderstorms")
    ///                 .border(Color.gray)
    ///             Text("⛈")
    ///                 .alignmentGuide(VerticalAlignment.center) { _ in 20 }
    ///                 .border(Color.gray)
    ///         }
    ///     }
    ///
    /// Changing the alignment of one view may have effects on surrounding
    /// views. Here the offset values inside a stack and its contained views is
    /// the difference of their absolute offsets.
    ///
    /// ![A view showing the two emoji offset from a text element using a
    /// vertical alignment guide.](SwiftUI-View-VAlignmentGuide.png)
    ///
    /// - Parameters:
    ///   - g: A ``VerticalAlignment`` value at which to a base the offset.
    ///   - computeValue: A closure that returns the offset value to apply to
    ///     this view.
    ///
    /// - Returns: A view modified with respect to its vertical alignment
    ///   according to the computation performed in the method's closure.
    @inlinable public func alignmentGuide(_ g: VerticalAlignment, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Positions the center of this view at the specified point in its parent's
    /// coordinate space.
    ///
    /// Use the `position(_:)` modifier to place the center of a view at a
    /// specific coordinate in the parent view using a
    /// <doc://com.apple.documentation/documentation/CoreGraphics/CGPoint> to specify the `x`
    /// and `y` offset.
    ///
    ///     Text("Position by passing a CGPoint()")
    ///         .position(CGPoint(x: 175, y: 100))
    ///         .border(Color.gray)
    ///
    /// - Parameter position: The point at which to place the center of this
    ///   view.
    ///
    /// - Returns: A view that fixes the center of this view at `position`.
    @inlinable public func position(_ position: CGPoint) -> some View


    /// Positions the center of this view at the specified coordinates in its
    /// parent's coordinate space.
    ///
    /// Use the `position(x:y:)` modifier to place the center of a view at a
    /// specific coordinate in the parent view using an `x` and `y` offset.
    ///
    ///     Text("Position by passing the x and y coordinates")
    ///         .position(x: 175, y: 100)
    ///         .border(Color.gray)
    ///
    /// - Parameters:
    ///   - x: The x-coordinate at which to place the center of this view.
    ///   - y: The y-coordinate at which to place the center of this view.
    ///
    /// - Returns: A view that fixes the center of this view at `x` and `y`.
    @inlinable public func position(x: CGFloat = 0, y: CGFloat = 0) -> some View

}

@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use ignoresSafeArea(_:edges:) instead.")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use ignoresSafeArea(_:edges:) instead.")
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use ignoresSafeArea(_:edges:) instead.")
@available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use ignoresSafeArea(_:edges:) instead.")
extension View {

    /// Changes the view's proposed area to extend outside the screen's safe
    /// areas.
    ///
    /// Use `edgesIgnoringSafeArea(_:)` to change the area proposed for this
    /// view so that — were the proposal accepted — this view could extend
    /// outside the safe area to the bounds of the screen for the specified
    /// edges.
    ///
    /// For example, you can propose that a text view ignore the safe area's top
    /// inset:
    ///
    ///     VStack {
    ///         Text("This text is outside of the top safe area.")
    ///             .edgesIgnoringSafeArea([.top])
    ///             .border(Color.purple)
    ///         Text("This text is inside VStack.")
    ///             .border(Color.yellow)
    ///     }
    ///     .border(Color.gray)
    ///
    /// ![A screenshot showing a view whose bounds exceed the safe area of the
    /// screen.](SwiftUI-View-edgesIgnoringSafeArea.png)
    ///
    /// Depending on the surrounding view hierarchy, SwiftUI may not honor an
    /// `edgesIgnoringSafeArea(_:)` request. This can happen, for example, if
    /// the view is inside a container that respects the screen's safe area. In
    /// that case you may need to apply `edgesIgnoringSafeArea(_:)` to the
    /// container instead.
    ///
    /// - Parameter edges: The set of the edges in which to expand the size
    ///   requested for this view.
    ///
    /// - Returns: A view that may extend outside of the screen's safe area
    ///   on the edges specified by `edges`.
    @inlinable public func edgesIgnoringSafeArea(_ edges: Edge.Set) -> some View

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Expands the view out of its safe area.
    ///
    /// - Parameters:
    ///   - regions: the kinds of rectangles removed from the safe area
    ///     that should be ignored (i.e. added back to the safe area
    ///     of the new child view.
    ///   - edges: the edges of the view that may be outset, any edges
    ///     not in this set will be unchanged, even if that edge is
    ///     abutting a safe area listed in `regions`.
    ///
    /// - Returns: a new view with its safe area expanded.
    ///
    @inlinable public func ignoresSafeArea(_ regions: SafeAreaRegions = .all, edges: Edge.Set = .all) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the environment value of the specified key path to the given value.
    ///
    /// Use this modifier to set one of the writable properties of the
    /// ``EnvironmentValues`` structure, including custom values that you
    /// create. For example, you can set the value associated with the
    /// ``EnvironmentValues/truncationMode`` key:
    ///
    ///     MyView()
    ///         .environment(\.truncationMode, .head)
    ///
    /// You then read the value inside `MyView` or one of its descendants
    /// using the ``Environment`` property wrapper:
    ///
    ///     struct MyView: View {
    ///         @Environment(\.truncationMode) var truncationMode: Text.TruncationMode
    ///
    ///         var body: some View { ... }
    ///     }
    ///
    /// SwiftUI provides dedicated view modifiers for setting most
    /// environment values, like the ``View/truncationMode(_:)``
    /// modifier which sets the ``EnvironmentValues/truncationMode`` value:
    ///
    ///     MyView()
    ///         .truncationMode(.head)
    ///
    /// Prefer the dedicated modifier when available, and offer your own when
    /// defining custom environment values, as described in
    /// ``EnvironmentKey``.
    ///
    /// The ``View/environment(_:_:)`` modifier affects the given view,
    /// as well as that view's descendant views. It has no effect
    /// outside the view hierarchy on which you call it.
    ///
    /// - Parameters:
    ///   - keyPath: A key path that indicates the property of the
    ///     ``EnvironmentValues`` structure to update.
    ///   - value: The new value to set for the item specified by `keyPath`.
    ///
    /// - Returns: A view that has the given value set in its environment.
    @inlinable public func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Controls the display order of overlapping views.
    ///
    /// Use `zIndex(_:)` when you want to control the front-to-back ordering of
    /// views.
    ///
    /// In this example there are two overlapping rotated rectangles. The
    /// frontmost is represented by the larger index value.
    ///
    ///     VStack {
    ///         Rectangle()
    ///             .fill(Color.yellow)
    ///             .frame(width: 100, height: 100, alignment: .center)
    ///             .zIndex(1) // Top layer.
    ///
    ///         Rectangle()
    ///             .fill(Color.red)
    ///             .frame(width: 100, height: 100, alignment: .center)
    ///             .rotationEffect(.degrees(45))
    ///             // Here a zIndex of 0 is the default making
    ///             // this the bottom layer.
    ///     }
    ///
    /// ![A screenshot showing two overlapping rectangles. The frontmost view is
    /// represented by the larger zIndex value.](SwiftUI-View-zIndex.png)
    ///
    /// - Parameter value: A relative front-to-back ordering for this view; the
    ///   default is `0`.
    @inlinable public func zIndex(_ value: Double) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies an affine transformation to this view's rendered output.
    ///
    /// Use `transformEffect(_:)` to rotate, scale, translate, or skew the
    /// output of the view according to the provided
    /// <doc://com.apple.documentation/documentation/CoreGraphics/CGAffineTransform>.
    ///
    /// In the example below, the text is rotated at -30˚ on the `y` axis.
    ///
    ///     let transform = CGAffineTransform(rotationAngle: -30 * (.pi / 180))
    ///
    ///     Text("Projection effect using transforms")
    ///         .transformEffect(transform)
    ///         .border(Color.gray)
    ///
    /// ![A screenshot of a view showing text that is rotated at -30 degrees on
    /// the y axis.](SwiftUI-View-transformEffect.png)
    ///
    /// - Parameter transform: A
    /// <doc://com.apple.documentation/documentation/CoreGraphics/CGAffineTransform> to
    /// apply to the view.
    @inlinable public func transformEffect(_ transform: CGAffineTransform) -> some View

}

extension View {

    /// Presents an action sheet using the given item as a data source for the
    /// sheet's content.
    ///
    /// - Parameters:
    ///   - item: A binding to an optional source of truth for the action
    ///     sheet. When representing a non-`nil` item, the system uses
    ///     `content` to create an action sheet representation of the item.
    ///     If the identity changes, the system dismisses a currently-presented
    ///     action sheet and replace it with a new one.
    ///   - content: A closure returning the action sheet to present.
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    @available(macOS, unavailable)
    public func actionSheet<T>(item: Binding<T?>, content: (T) -> ActionSheet) -> some View where T : Identifiable


    /// Presents an action sheet when a given condition is true.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the action sheet should be
    ///     shown.
    ///   - content: A closure returning the `ActionSheet` to present.
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    @available(macOS, unavailable)
    public func actionSheet(isPresented: Binding<Bool>, content: () -> ActionSheet) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the accent color for this view and the views it contains.
    ///
    /// Use `accentColor(_:)` when you want to apply a broad theme color to
    /// your app's user interface. Some styles of controls use the accent color
    /// as a default tint color.
    ///
    /// On macOS, customization of the accent color is only applied if the
    /// "Multicolor" accent color is selected in System Preferences.
    ///
    /// In the example below, the outer ``VStack`` contains two child views, the
    /// first is a ``VStack`` containing a default accented button. The second
    /// ``VStack`` contains a button and a slider both of which adopt the purple
    /// accent color of their containing view. Note that the ``Text`` element
    /// used as a label alongside the `Slider` retains its default color.
    ///
    ///     VStack {
    ///         VStack {
    ///             Button(action: {}) {
    ///                 Text("Regular Button")
    ///             }
    ///         }.padding()
    ///         VStack {
    ///             Button(action: {}) {
    ///                 Text("Accented Button")
    ///             }
    ///             HStack {
    ///                 Text("Accented Slider")
    ///                 Slider(value: $sliderValue, in: -100...100, step: 0.1)
    ///             }
    ///         }.accentColor(.purple)
    ///     }
    ///
    /// ![A VStack showing two child views: one VStack containing a default
    /// accented button, and a second VStack where the VStack has a purple
    /// accent color applied. The accent color modifies the enclosed button and
    /// slider, but not the color of a Text item used as a label for the
    /// slider.](SwiftUI-View-accentColor.png)
    ///
    /// - Parameter accentColor: The color to use as an accent color. If `nil`,
    ///   the accent color continues to be inherited
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    @inlinable public func accentColor(_ accentColor: Color?) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a condition that controls whether users can interact with this
    /// view.
    ///
    /// The higher views in a view hierarchy can override the value you set on
    /// this view. In the following example, the button isn't interactive
    /// because the outer `disabled(_:)` modifier overrides the inner one:
    ///
    ///     HStack {
    ///         Button(Text("Press")) {}
    ///         .disabled(false)
    ///     }
    ///     .disabled(true)
    ///
    /// - Parameter disabled: A Boolean value that determines whether users can
    ///   interact with this view.
    ///
    /// - Returns: A view that controls whether users can interact with this
    ///   view.
    @inlinable public func disabled(_ disabled: Bool) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Rotates this view's rendered output around the specified point.
    ///
    /// Use `rotationEffect(_:anchor:)` to rotate the view by a specific amount.
    ///
    /// In the example below, the text is rotated by 22˚.
    ///
    ///     Text("Rotation by passing an angle in degrees")
    ///         .rotationEffect(.degrees(22))
    ///         .border(Color.gray)
    ///
    /// ![A screenshot showing rotation effect rotating the text 22 degrees with
    /// respect to its view.](SwiftUI-View-rotationEffect.png)
    ///
    /// - Parameters:
    ///   - angle: The angle at which to rotate the view.
    ///   - anchor: The location with a default of ``UnitPoint/center`` that
    ///     defines a point at which the rotation is anchored.
    @inlinable public func rotationEffect(_ angle: Angle, anchor: UnitPoint = .center) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Scales this view's rendered output by the given vertical and horizontal
    /// size amounts, relative to an anchor point.
    ///
    /// Use `scaleEffect(_:anchor:)` to scale a view by applying a scaling
    /// transform of a specific size, specified by `scale`.
    ///
    ///     Image(systemName: "envelope.badge.fill")
    ///         .resizable()
    ///         .frame(width: 100, height: 100, alignment: .center)
    ///         .foregroundColor(Color.red)
    ///         .scaleEffect(CGSize(x: 0.9, y: 1.3), anchor: .leading)
    ///         .border(Color.gray)
    ///
    /// ![A screenshot showing a red envelope scaled to a size of 90x130
    /// pixels.](SwiftUI-View-scaleEffect.png)
    ///
    /// - Parameters:
    ///   - scale: A <doc://com.apple.documentation/documentation/CoreGraphics/CGSize> that
    ///     represents the horizontal and vertical amount to scale the view.
    ///   - anchor: The point with a default of ``UnitPoint/center`` that
    ///     defines the location within the view from which to apply the
    ///     transformation.
    @inlinable public func scaleEffect(_ scale: CGSize, anchor: UnitPoint = .center) -> some View


    /// Scales this view's rendered output by the given amount in both the
    /// horizontal and vertical directions, relative to an anchor point.
    ///
    /// Use `scaleEffect(_:anchor:)` to apply a horizontally and vertically
    /// scaling transform to a view.
    ///
    ///     Image(systemName: "envelope.badge.fill")
    ///         .resizable()
    ///         .frame(width: 100, height: 100, alignment: .center)
    ///         .foregroundColor(Color.red)
    ///         .scaleEffect(2, anchor: .leading)
    ///         .border(Color.gray)
    ///
    /// ![A screenshot showing a 100x100 pixel red envelope scaled up to 2x the
    /// size of its view.](SwiftUI-View-scaleEffect-cgfloat.png)
    ///
    /// - Parameters:
    ///   - s: The amount to scale the view in the view in both the horizontal
    ///     and vertical directions.
    ///   - anchor: The anchor point with a default of ``UnitPoint/center`` that
    ///     indicates the starting position for the scale operation.
    @inlinable public func scaleEffect(_ s: CGFloat, anchor: UnitPoint = .center) -> some View


    /// Scales this view's rendered output by the given horizontal and vertical
    /// amounts, relative to an anchor point.
    ///
    /// Use `scaleEffect(x:y:anchor:)` to apply a scaling transform to a view by
    /// a specific horizontal and vertical amount.
    ///
    ///     Image(systemName: "envelope.badge.fill")
    ///         .resizable()
    ///         .frame(width: 100, height: 100, alignment: .center)
    ///         .foregroundColor(Color.red)
    ///         .scaleEffect(x: 0.5, y: 0.5, anchor: .bottomTrailing)
    ///         .border(Color.gray)
    ///
    /// ![A screenshot showing a 100x100 pixel red envelope scaled down 50% in
    /// both the x and y axes.](SwiftUI-View-scaleEffect-xy.png)
    ///
    /// - Parameters:
    ///   - x: An amount that represents the horizontal amount to scale the
    ///     view. The default value is `1.0`.
    ///   - y: An amount that represents the vertical amount to scale the view.
    ///     The default value is `1.0`.
    ///   - anchor: The anchor point that indicates the starting position for
    ///     the scale operation.
    @inlinable public func scaleEffect(x: CGFloat = 1.0, y: CGFloat = 1.0, anchor: UnitPoint = .center) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies a Gaussian blur to this view.
    ///
    /// Use `blur(radius:opaque:)` to apply a gaussian blur effect to the
    /// rendering of this view.
    ///
    /// The example below shows two ``Text`` views, the first with no blur
    /// effects, the second with `blur(radius:opaque:)` applied with the
    /// `radius` set to `2`. The larger the radius, the more diffuse the
    /// effect.
    ///
    ///     struct Blur: View {
    ///         var body: some View {
    ///             VStack {
    ///                 Text("This is some text.")
    ///                     .padding()
    ///                 Text("This is some blurry text.")
    ///                     .blur(radius: 2.0)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot showing the effect of applying gaussian blur effect to
    /// the rendering of a view.](SwiftUI-View-blurRadius.png)
    ///
    /// - Parameters:
    ///   - radius: The radial size of the blur. A blur is more diffuse when its
    ///     radius is large.
    ///   - opaque: A Boolean value that indicates whether the blur renderer
    ///     permits transparency in the blur output. Set to `true` to create an
    ///     opaque blur, or set to `false` to permit transparency.
    @inlinable public func blur(radius: CGFloat, opaque: Bool = false) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Brightens this view by the specified amount.
    ///
    /// Use `brightness(_:)` to brighten the intensity of the colors in a view.
    /// The example below shows a series of red squares, with their brightness
    /// increasing from 0 (fully red) to 100% (white) in 20% increments.
    ///
    ///     struct Brightness: View {
    ///         var body: some View {
    ///             HStack {
    ///                 ForEach(0..<6) {
    ///                     Color.red.frame(width: 60, height: 60, alignment: .center)
    ///                         .brightness(Double($0) * 0.2)
    ///                         .overlay(Text("\(Double($0) * 0.2 * 100, specifier: "%.0f")%"),
    ///                                  alignment: .bottom)
    ///                         .border(Color.gray)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![Rendering showing the effects of brightness adjustments in 20%
    /// increments from fully-red to white.](SwiftUI-View-brightness.png)
    ///
    /// - Parameter amount: A value between 0 (no effect) and 1 (full white
    ///   brightening) that represents the intensity of the brightness effect.
    ///
    /// - Returns: A view that brightens this view by the specified amount.
    @inlinable public func brightness(_ amount: Double) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Inverts the colors in this view.
    ///
    /// The `colorInvert()` modifier inverts all of the colors in a view so that
    /// each color displays as its complementary color. For example, blue
    /// converts to yellow, and white converts to black.
    ///
    /// In the example below, two red squares each have an interior green
    /// circle. The inverted square shows the effect of the square's colors:
    /// complimentary colors for red and green — teal and purple.
    ///
    ///     struct InnerCircleView: View {
    ///         var body: some View {
    ///             Circle()
    ///                 .fill(Color.green)
    ///                 .frame(width: 40, height: 40, alignment: .center)
    ///         }
    ///     }
    ///
    ///     struct ColorInvert: View {
    ///         var body: some View {
    ///             HStack {
    ///                 Color.red.frame(width: 100, height: 100, alignment: .center)
    ///                     .overlay(InnerCircleView(), alignment: .center)
    ///                     .overlay(Text("Normal")
    ///                                  .font(.callout),
    ///                              alignment: .bottom)
    ///                     .border(Color.gray)
    ///
    ///                 Spacer()
    ///
    ///                 Color.red.frame(width: 100, height: 100, alignment: .center)
    ///                     .overlay(InnerCircleView(), alignment: .center)
    ///                     .colorInvert()
    ///                     .overlay(Text("Inverted")
    ///                                  .font(.callout),
    ///                              alignment: .bottom)
    ///                     .border(Color.gray)
    ///             }
    ///             .padding(50)
    ///         }
    ///     }
    ///
    /// ![Two red squares with centered green circles with one showing the
    /// effect of color inversion, which yields teal and purple replacing the
    /// red and green colors.](SwiftUI-View-colorInvert.png)
    ///
    /// - Returns: A view that inverts its colors.
    @inlinable public func colorInvert() -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a color multiplication effect to this view.
    ///
    /// The following example shows two versions of the same image side by side;
    /// at left is the original, and at right is a duplicate with the
    /// `colorMultiply(_:)` modifier applied with ``Color/purple``.
    ///
    ///     struct InnerCircleView: View {
    ///         var body: some View {
    ///             Circle()
    ///                 .fill(Color.green)
    ///                 .frame(width: 40, height: 40, alignment: .center)
    ///         }
    ///     }
    ///
    ///     struct ColorMultiply: View {
    ///         var body: some View {
    ///             HStack {
    ///                 Color.red.frame(width: 100, height: 100, alignment: .center)
    ///                     .overlay(InnerCircleView(), alignment: .center)
    ///                     .overlay(Text("Normal")
    ///                                  .font(.callout),
    ///                              alignment: .bottom)
    ///                     .border(Color.gray)
    ///
    ///                 Spacer()
    ///
    ///                 Color.red.frame(width: 100, height: 100, alignment: .center)
    ///                     .overlay(InnerCircleView(), alignment: .center)
    ///                     .colorMultiply(Color.purple)
    ///                     .overlay(Text("Multiply")
    ///                                 .font(.callout),
    ///                              alignment: .bottom)
    ///                     .border(Color.gray)
    ///             }
    ///             .padding(50)
    ///         }
    ///     }
    ///
    /// ![A screenshot showing two images showing the effect of multiplying the
    /// colors of an image with another color.](SwiftUI-View-colorMultiply.png)
    ///
    /// - Parameter color: The color to bias this view toward.
    ///
    /// - Returns: A view with a color multiplication effect.
    @inlinable public func colorMultiply(_ color: Color) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the contrast and separation between similar colors in this view.
    ///
    /// Apply contrast to a view to increase or decrease the separation between
    /// similar colors in the view.
    ///
    /// In the example below, the `contrast(_:)` modifier is applied to a set of
    /// red squares each containing a contrasting green inner circle. At each
    /// step in the loop, the `contrast(_:)` modifier changes the contrast of
    /// the circle/square view in 20% increments. This ranges from -20% contrast
    /// (yielding inverted colors — turning the red square to pale-green and the
    /// green circle to mauve), to neutral-gray at 0%, to 100% contrast
    /// (bright-red square / bright-green circle). Applying negative contrast
    /// values, as shown in the -20% square, will apply contrast in addition to
    /// inverting colors.
    ///
    ///     struct CircleView: View {
    ///         var body: some View {
    ///             Circle()
    ///                 .fill(Color.green)
    ///                 .frame(width: 25, height: 25, alignment: .center)
    ///         }
    ///     }
    ///
    ///     struct Contrast: View {
    ///         var body: some View {
    ///             HStack {
    ///                 ForEach(-1..<6) {
    ///                     Color.red.frame(width: 50, height: 50, alignment: .center)
    ///                         .overlay(CircleView(), alignment: .center)
    ///                         .contrast(Double($0) * 0.2)
    ///                         .overlay(Text("\(Double($0) * 0.2 * 100, specifier: "%.0f")%")
    ///                                      .font(.callout),
    ///                                  alignment: .bottom)
    ///                         .border(Color.gray)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![Demonstration of the effect of contrast on a view applying contrast
    /// values from -20% to 100% contrast.](SwiftUI-View-contrast.png)
    ///
    /// - Parameter amount: The intensity of color contrast to apply. negative
    ///   values invert colors in addition to applying contrast.
    ///
    /// - Returns: A view that applies color contrast to this view.
    @inlinable public func contrast(_ amount: Double) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a grayscale effect to this view.
    ///
    /// A grayscale effect reduces the intensity of colors in this view.
    ///
    /// The example below shows a series of red squares with their grayscale
    /// effect increasing from 0 (reddest) to 99% (fully desaturated) in
    /// approximate 20% increments:
    ///
    ///     struct Saturation: View {
    ///         var body: some View {
    ///             HStack {
    ///                 ForEach(0..<6) {
    ///                     Color.red.frame(width: 60, height: 60, alignment: .center)
    ///                         .grayscale(Double($0) * 0.1999)
    ///                         .overlay(Text("\(Double($0) * 0.1999 * 100, specifier: "%.4f")%"),
    ///                                  alignment: .bottom)
    ///                         .border(Color.gray)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![Rendering showing the effects of grayscale adjustments in
    /// approximately 20% increments from fully-red at 0% to fully desaturated
    /// at 99%.](SwiftUI-View-grayscale.png)
    ///
    /// - Parameter amount: The intensity of grayscale to apply from 0.0 to less
    ///   than 1.0. Values closer to 0.0 are more colorful, and values closer to
    ///   1.0 are less colorful.
    ///
    /// - Returns: A view that adds a grayscale effect to this view.
    @inlinable public func grayscale(_ amount: Double) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies a hue rotation effect to this view.
    ///
    /// Use hue rotation effect to shift all of the colors in a view according
    /// to the angle you specify.
    ///
    /// The example below shows a series of squares filled with a linear
    /// gradient. Each square shows the effect of a 36˚ hueRotation (a total of
    /// 180˚ across the 5 squares) on the gradient:
    ///
    ///     struct HueRotation: View {
    ///         var body: some View {
    ///             HStack {
    ///                 ForEach(0..<6) {
    ///                     Rectangle()
    ///                         .fill(LinearGradient(gradient:
    ///                             Gradient(colors: [.blue, .red, .green]),
    ///                                              startPoint: .top, endPoint: .bottom))
    ///                         .hueRotation((.degrees(Double($0 * 36))))
    ///                         .frame(width: 60, height: 60, alignment: .center)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![Shows the effect of hueRotation on a linear
    /// gradient.](SwiftUI-hueRotation.png)
    ///
    /// - Parameter angle: The hue rotation angle to apply to the colors in this
    ///   view.
    ///
    /// - Returns: A view that applies a hue rotation effect to this view.
    @inlinable public func hueRotation(_ angle: Angle) -> some View

}

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the preferred color scheme for this presentation.
    ///
    /// The color scheme applies to the nearest enclosing presentation, such as
    /// a popover or window. Views may read the color scheme using the
    /// `colorScheme` environment value.
    ///
    /// In the example below the presentation containing the ``VStack`` has its
    /// color scheme set to ``ColorScheme/dark``:
    ///
    ///     VStack {
    ///         Button(action: {}) {
    ///             Text(" Button")
    ///         }
    ///         HStack {
    ///             Text(" Slider").accentColor(Color.green)
    ///             Slider(value: $sliderValue, in: -100...100, step: 0.1)
    ///         }
    ///     }.preferredColorScheme(.dark)
    ///
    /// - Parameter colorScheme: The color scheme for this view.
    ///
    /// - Returns: A view that wraps this view and sets the color scheme.
    @inlinable public func preferredColorScheme(_ colorScheme: ColorScheme?) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a luminance to alpha effect to this view.
    ///
    /// The `luminanceToAlpha()` modifier creates a semitransparent mask out of
    /// the view to which you you apply. The dark regions in a view become
    /// transparent, and the bright regions become opaque black. Medium
    /// brightness regions become a partially opaque gray color.
    ///
    /// The example below shows two views: the first is a red square with an
    /// overlaid green circle; the second is a copy of the first view with where
    /// the `luminanceToAlpha()` modifier's masking operation transforms the
    /// view's brightness levels into an equivalent grayscale version of the
    /// first view:
    ///
    ///     struct LuminanceCircleView: View {
    ///         var body: some View {
    ///             Circle()
    ///                 .fill(Color.green)
    ///                 .frame(width: 40, height: 40, alignment: .center)
    ///         }
    ///     }
    ///
    ///     struct LuminanceToAlpha: View {
    ///         var body: some View {
    ///             HStack {
    ///                 Color.red.frame(width: 60, height: 60, alignment: .center)
    ///                     .overlay(LuminanceCircleView(), alignment: .center)
    ///                     .padding()
    ///
    ///                 Color.red.frame(width: 60, height: 60, alignment: .center)
    ///                     .overlay(LuminanceCircleView(), alignment: .center)
    ///                     .luminanceToAlpha()
    ///             }
    ///         }
    ///     }
    ///
    /// ![The example below shows two views: the first is a red square with an
    /// overlaid green circle; the second is a copy of the first view with where
    /// the luminanceToAlpha() modifier transforms the view's brightness levels
    /// into an equivalent grayscale version of the
    /// view.](SwiftUI-luminanceToAlpha.png)
    ///
    /// - Returns: A view that applies a luminance to alpha effect to this view.
    @inlinable public func luminanceToAlpha() -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adjusts the color saturation of this view.
    ///
    /// Use color saturation to increase or decrease the intensity of colors in
    /// a view.
    ///
    /// The example below shows a series of red squares with their saturation
    /// increasing from 0 (gray) to 100% (fully-red) in 20% increments:
    ///
    ///     struct Saturation: View {
    ///         var body: some View {
    ///             HStack {
    ///                 ForEach(0..<6) {
    ///                     Color.red.frame(width: 60, height: 60, alignment: .center)
    ///                         .saturation(Double($0) * 0.2)
    ///                         .overlay(Text("\(Double($0) * 0.2 * 100, specifier: "%.0f")%"),
    ///                                  alignment: .bottom)
    ///                         .border(Color.gray)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![Rendering showing the effects of saturation adjustments in 20%
    /// increments from gray at 0% to fully-red at
    /// 100%.](SwiftUI-View-saturation.png)
    ///
    /// - SeeAlso: `contrast(_:)`
    /// - Parameter amount: The amount of saturation to apply to this view.
    ///
    /// - Returns: A view that adjusts the saturation of this view.
    @inlinable public func saturation(_ amount: Double) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Associates a transition with the view.
    @inlinable public func transition(_ t: AnyTransition) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the transparency of this view.
    ///
    /// Apply opacity to reveal views that are behind another view or to
    /// de-emphasize a view.
    ///
    /// When applying the `opacity(_:)` modifier to a view that has already had
    /// its opacity transformed, the modifier multiplies the effect of the
    /// underlying opacity transformation.
    ///
    /// The example below shows yellow and red rectangles configured to overlap.
    /// The top yellow rectangle has its opacity set to 50%, allowing the
    /// occluded portion of the bottom rectangle to be visible:
    ///
    ///     struct Opacity: View {
    ///         var body: some View {
    ///             VStack {
    ///                 Color.yellow.frame(width: 100, height: 100, alignment: .center)
    ///                     .zIndex(1)
    ///                     .opacity(0.5)
    ///
    ///                 Color.red.frame(width: 100, height: 100, alignment: .center)
    ///                     .padding(-40)
    ///             }
    ///         }
    ///     }
    ///
    /// ![Two overlaid rectangles, where the topmost has its opacity set to 50%,
    /// which allows the occluded portion of the bottom rectangle to be
    /// visible.](SwiftUI-View-opacity.png)
    ///
    /// - Parameter opacity: A value between 0 (fully transparent) and 1 (fully
    ///   opaque).
    ///
    /// - Returns: A view that sets the transparency of this view.
    @inlinable public func opacity(_ opacity: Double) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies the given animation to this view when the specified value
    /// changes.
    ///
    /// - Parameters:
    ///   - animation: The animation to apply. If `animation` is `nil`, the view
    ///     doesn't animate.
    ///   - value: A value to monitor for changes.
    ///
    /// - Returns: A view that applies `animation` to this view whenever `value`
    ///   changes.
    @inlinable public func animation<V>(_ animation: Animation?, value: V) -> some View where V : Equatable

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the unique tag value of this view.
    ///
    /// Use `tag(_:)` to differentiate between a number of views for the purpose
    /// of selecting controls like pickers and lists. Tag values can be of any
    /// type that conforms to the <doc://com.apple.documentation/documentation/Swift/Hashable>
    /// protocol.
    ///
    /// In the example below, the ``ForEach`` loop in the ``Picker`` view
    /// builder iterates over the `Flavor` enumeration. It extracts the text raw
    /// value of each enumeration element for use as the row item label and uses
    /// the enumeration item itself as input to the `tag(_:)` modifier.
    /// The tag identifier can be any value that conforms to the
    /// <doc://com.apple.documentation/documentation/Swift/Hashable> protocol:
    ///
    ///     struct FlavorPicker: View {
    ///         enum Flavor: String, CaseIterable, Identifiable {
    ///             var id: String { self.rawValue }
    ///             case vanilla, chocolate, strawberry
    ///         }
    ///
    ///         @State private var selectedFlavor: Flavor? = nil
    ///         var body: some View {
    ///             Picker("Flavor", selection: $selectedFlavor) {
    ///                 ForEach(Flavor.allCases) {
    ///                     Text($0.rawValue).tag($0)
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// - SeeAlso: `List`, `Picker`, `Hashable`
    /// - Parameter tag: A <doc://com.apple.documentation/documentation/Swift/Hashable> value
    ///   to use as the view's tag.
    ///
    /// - Returns: A view with the specified tag set.
    @inlinable public func tag<V>(_ tag: V) -> some View where V : Hashable

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the blend mode for compositing this view with overlapping views.
    ///
    /// Use `blendMode(_:)` to combine overlapping views and use a different
    /// visual effect to produce the result. The ``BlendMode`` enumeration
    /// defines many possible effects.
    ///
    /// In the example below, the two overlapping rectangles have a
    /// ``BlendMode\colorBurn`` effect applied, which effectively removes the
    /// non-overlapping portion of the second image:
    ///
    ///     HStack {
    ///         Color.yellow.frame(width: 50, height: 50, alignment: .center)
    ///
    ///         Color.red.frame(width: 50, height: 50, alignment: .center)
    ///             .rotationEffect(.degrees(45))
    ///             .padding(-20)
    ///             .blendMode(.colorBurn)
    ///     }
    ///
    /// ![Two overlapping rectangles showing the effect of the blend mode view
    /// modifier applying the colorBurn effect.](SwiftUI-blendMode.png)
    ///
    /// - Parameter blendMode: The ``BlendMode`` for compositing this view.
    ///
    /// - Returns: A view that applies `blendMode` to this view.
    @inlinable public func blendMode(_ blendMode: BlendMode) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Places a custom background view behind a list row item.
    ///
    /// Use `listRowBackground(_:)` to place a custom background view behind a
    /// list row item.
    ///
    /// In the example below, the `Flavor` enumeration provides content for list
    /// items. The SwiftUI ``List`` builder iterates over the `Flavor`
    /// enumeration and extracts the raw value of each of its elements using the
    /// resulting text to create each list row item. After the list builder
    /// finishes, the `listRowBackground(_:)` modifier places the view you
    /// supply behind each of the list row items.
    ///
    ///     struct ListRowBackground: View {
    ///
    ///         enum Flavor: String, CaseIterable, Identifiable {
    ///             var id: String { self.rawValue }
    ///             case vanilla, chocolate, strawberry
    ///         }
    ///
    ///         var body: some View {
    ///             List(Flavor.allCases, id: \.self) {
    ///                 Text($0.rawValue)
    ///             }
    ///             .listRowBackground(Image(systemName: "sparkles"))
    ///         }
    ///     }
    ///
    /// - Parameter view: The ``View`` to use as the background behind the list
    ///   row view.
    ///
    /// - Returns: A list row view with `view` as its background view.
    @inlinable public func listRowBackground<V>(_ view: V?) -> some View where V : View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Composites this view's contents into an offscreen image before final
    /// display.
    ///
    /// The `drawingGroup(opaque:colorMode:)` modifier flattens a subtree of
    /// views into a single view before rendering it.
    ///
    /// In the example below, the contents of the view are composited to a
    /// single bitmap; the bitmap is then displayed in place of the view:
    ///
    ///     VStack {
    ///         ZStack {
    ///             Text("DrawingGroup")
    ///                 .foregroundColor(.black)
    ///                 .padding(20)
    ///                 .background(Color.red)
    ///             Text("DrawingGroup")
    ///                 .blur(radius: 2)
    ///         }
    ///         .font(.largeTitle)
    ///         .compositingGroup()
    ///         .opacity(1.0)
    ///     }
    ///      .background(Color.white)
    ///      .drawingGroup()
    ///
    /// > Note: Views backed by native platform views may not render into the
    ///   image. Instead, they log a warning and display a placeholder image to
    ///   highlight the error.
    ///
    /// ![A screenshot showing the effects on several stacks configured as a
    /// drawing group.](SwiftUI-View-drawingGroup.png)
    ///
    /// - Parameters:
    ///   - opaque: A Boolean value that indicates whether the image is opaque.
    ///     The default is `false`; if set to `true`, the alpha channel of the
    ///     image must be `1`.
    ///   - colorMode: One of the working color space and storage formats
    ///     defined in ``ColorRenderingMode``. The default is
    ///     ``ColorRenderingMode/nonLinear``.
    ///
    /// - Returns: A view that composites this view's contents into an offscreen
    ///   image before display.
    public func drawingGroup(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Wraps this view in a compositing group.
    ///
    /// A compositing group makes compositing effects in this view's ancestor
    /// views, such as opacity and the blend mode, take effect before this view
    /// is rendered.
    ///
    /// Use `compositingGroup()` to apply effects to a parent view before
    /// applying effects to this view.
    ///
    /// In the example below the `compositingGroup()` modifier separates the
    /// application of effects into stages. It applies the ``View/opacity(_:)``
    /// effect to the VStack before the `blur(radius:)` effect is applied to the
    /// views inside the enclosed ``ZStack``. This limits the scope of the
    /// opacity change to the outermost view.
    ///
    ///     VStack {
    ///         ZStack {
    ///             Text("CompositingGroup")
    ///                 .foregroundColor(.black)
    ///                 .padding(20)
    ///                 .background(Color.red)
    ///             Text("CompositingGroup")
    ///                 .blur(radius: 2)
    ///         }
    ///         .font(.largeTitle)
    ///         .compositingGroup()
    ///         .opacity(0.9)
    ///     }
    ///
    /// ![A view showing the effect of the compositingGroup modifier in applying
    /// compositing effects to parent views before child views are
    /// rendered.](SwiftUI-View-compositingGroup.png)
    ///
    /// - Returns: A view that wraps this view in a compositing group.
    @inlinable public func compositingGroup() -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Overrides the device for a preview.
    ///
    /// If you set the preview device to `nil`, as it is by default, Xcode
    /// automatically chooses an appropriate device based on your target.
    ///
    /// You can get a list of supported values, like "iPhone 11",
    /// "iPad Pro (11-inch)", and "Apple Watch Series 5 - 44mm" by using the
    /// `xcrun` command in the Terminal app:
    ///
    ///     % xcrun simctl list devicetypes
    ///
    /// Additionally, the following values are supported for macOS platform
    /// development:
    ///  - "Mac"
    ///  - "Mac Catalyst"
    @inlinable public func previewDevice(_ value: PreviewDevice?) -> some View


    /// Overrides the size of the container for the preview.
    ///
    /// The default value is ``PreviewLayout/device``.
    @inlinable public func previewLayout(_ value: PreviewLayout) -> some View


    /// Provides a user visible name shown in the editor.
    ///
    /// The default value is `nil`.
    @inlinable public func previewDisplayName(_ value: String?) -> some View


    /// Declares a context for the preview.
    ///
    /// - Parameter value: The context for the preview; the default is `nil`.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @inlinable public func previewContext<C>(_ value: C) -> some View where C : PreviewContext

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func anchorPreference<A, K>(key _: K.Type = K.self, value: Anchor<A>.Source, transform: @escaping (Anchor<A>) -> K.Value) -> some View where K : PreferenceKey

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets a clipping shape for this view.
    ///
    /// Use `clipShape(_:style:)` to clip the view to the provided shape. By
    /// applying a clipping shape to a view, you preserve the parts of the view
    /// covered by the shape, while eliminating other parts of the view. The
    /// clipping shape itself isn't visible.
    ///
    /// For example, this code applies a circular clipping shape to a `Text`
    /// view:
    ///
    ///     Text("Clipped text in a circle")
    ///         .frame(width: 175, height: 100)
    ///         .foregroundColor(Color.white)
    ///         .background(Color.black)
    ///         .clipShape(Circle())
    ///
    /// The resulting view shows only the portion of the text that lies within
    /// the bounds of the circle.
    ///
    /// ![A screenshot of text clipped to the shape of a
    /// circle.](SwiftUI-View-clipShape.png)
    ///
    /// - Parameters:
    ///   - shape: The clipping shape to use for this view. The `shape` fills
    ///     the view's frame, while maintaining its aspect ratio.
    ///   - style: The fill style to use when rasterizing `shape`.
    ///
    /// - Returns: A view that clips this view to `shape`, using `style` to
    ///   define the shape's rasterization.
    @inlinable public func clipShape<S>(_ shape: S, style: FillStyle = FillStyle()) -> some View where S : Shape


    /// Clips this view to its bounding rectangular frame.
    ///
    /// Use the `clipped(antialiased:)` modifier to hide any content that
    /// extends beyond the layout bounds of the shape.
    ///
    /// By default, a view's bounding frame is used only for layout, so any
    /// content that extends beyond the edges of the frame is still visible.
    ///
    ///     Text("This long text string is clipped")
    ///         .fixedSize()
    ///         .frame(width: 175, height: 100)
    ///         .clipped()
    ///         .border(Color.gray)
    ///
    /// ![Screenshot showing text clipped to its
    /// frame.](SwiftUI-View-clipped.png)
    ///
    /// - Parameter antialiased: A Boolean value that indicates whether the
    ///   rendering system applies smoothing to the edges of the clipping
    ///   rectangle.
    ///
    /// - Returns: A view that clips this view to its bounding frame.
    @inlinable public func clipped(antialiased: Bool = false) -> some View


    /// Clips this view to its bounding frame, with the specified corner radius.
    ///
    /// By default, a view's bounding frame only affects its layout, so any
    /// content that extends beyond the edges of the frame remains visible. Use
    /// `cornerRadius(_:antialiased:)` to hide any content that extends beyond
    /// these edges while applying a corner radius.
    ///
    /// The following code applies a corner radius of 25 to a text view:
    ///
    ///     Text("Rounded Corners")
    ///         .frame(width: 175, height: 75)
    ///         .foregroundColor(Color.white)
    ///         .background(Color.black)
    ///         .cornerRadius(25)
    ///
    /// ![A screenshot of a rectangle with rounded corners bounding a text
    /// view.](SwiftUI-View-cornerRadius.png)
    ///
    /// - Parameter antialiased: A Boolean value that indicates whether the
    ///   rendering system applies smoothing to the edges of the clipping
    ///   rectangle.
    ///
    /// - Returns: A view that clips this view to its bounding frame with the
    ///   specified corner radius.
    @inlinable public func cornerRadius(_ radius: CGFloat, antialiased: Bool = true) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a shadow to this view.
    ///
    /// The example below a series shows of boxes with increasing degrees of
    /// shadow ranging from 0 (no shadow) to 5 points of shadow, offset down and
    /// to the right of the views:
    ///
    ///     struct Shadow: View {
    ///         var body: some View {
    ///             HStack {
    ///                 ForEach(0..<6) {
    ///                     Color.red.frame(width: 60, height: 60, alignment: .center)
    ///                         .overlay(Text("\($0)"),
    ///                                  alignment: .bottom)
    ///                         .shadow(color: Color.gray,
    ///                                 radius: 1.0,
    ///                                 x: CGFloat($0),
    ///                                 y: CGFloat($0))
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A series of boxes showing the effect of increasing level of shadow
    /// applied to each box.](SwiftUI-View-shadow.png)
    ///
    /// - Parameters:
    ///   - color: The shadow's color.
    ///   - radius: The shadow's size.
    ///   - x: A horizontal offset you use to position the shadow relative to
    ///     this view.
    ///   - y: A vertical offset you use to position the shadow relative to this
    ///     view.
    ///
    /// - Returns: A view that adds a shadow to this view.
    @inlinable public func shadow(color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33), radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for toggles within this view.
    ///
    /// To set a specific style for all toggle instances within a view, use the
    /// ``View/toggleStyle(_:)`` modifier, as follows:
    ///
    ///     VStack {
    ///         Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
    ///         Toggle("Vibrate on Silent", isOn: $vibrateOnSilent)
    ///     }
    ///     .toggleStyle(SwitchToggleStyle())
    ///
    /// - Parameter style: The style to set.
    public func toggleStyle<S>(_ style: S) -> some View where S : ToggleStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets this view's color scheme.
    ///
    /// Use `colorScheme(_:)` to set the color scheme for the view to which you
    /// apply it and any subviews. If you want to set the color scheme for all
    /// views in the presentation, use ``View/preferredColorScheme(_:)``
    /// instead.
    ///
    /// - Parameter colorScheme: The color scheme for this view.
    ///
    /// - Returns: A view that sets this view's color scheme.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "preferredColorScheme(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "preferredColorScheme(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "preferredColorScheme(_:)")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "preferredColorScheme(_:)")
    @inlinable public func colorScheme(_ colorScheme: ColorScheme) -> some View


    /// Scales images within the view according to one of the relative sizes
    /// available including small, medium, and large images sizes.
    ///
    /// The example below shows the relative scaling effect. The system renders
    /// the image at a relative size based on the available space and
    /// configuration options of the image it is scaling.
    ///
    ///     VStack {
    ///         HStack {
    ///             Image(systemName: "heart.fill")
    ///                 .imageScale(.small)
    ///             Text("Small")
    ///         }
    ///         HStack {
    ///             Image(systemName: "heart.fill")
    ///                 .imageScale(.medium)
    ///             Text("Medium")
    ///         }
    ///
    ///         HStack {
    ///             Image(systemName: "heart.fill")
    ///                 .imageScale(.large)
    ///             Text("Large")
    ///         }
    ///     }
    ///
    /// ![A view showing small, medium, and large hearts rendered at a size
    /// relative to the available space.](SwiftUI-View-imageScale.png)
    ///
    /// - Parameter scale: One of the relative sizes provided by the image scale
    ///   enumeration.
    @available(macOS 11.0, *)
    @inlinable public func imageScale(_ scale: Image.Scale) -> some View


    /// Sets the default font for text in this view.
    ///
    /// Use `font(_:)` to apply a specific font to all of the text in a view.
    ///
    /// The example below shows the effects of applying fonts to individual
    /// views and to view hierarchies. Font information flows down the view
    /// hierarchy as part of the environment, and remains in effect unless
    /// overridden at the level of an individual view or view container.
    ///
    /// Here, the outermost ``VStack`` applies a 16-point system font as a
    /// default font to views contained in that ``VStack``. Inside that stack,
    /// the example applies a ``Font/largeTitle`` font to just the first text
    /// view; this explicitly overrides the default. The remaining stack and the
    /// views contained with it continue to use the 16-point system font set by
    /// their containing view:
    ///
    ///     VStack {
    ///         Text("Font applied to a text view.")
    ///             .font(.largeTitle)
    ///
    ///         VStack {
    ///             Text("These 2 text views have the same font")
    ///             Text("applied to their parent hierarchy")
    ///         }
    ///     }
    ///     .font(.system(size: 16, weight: .light, design: .default))
    ///
    /// ![A screenshot showing the application fonts to an individual text field
    /// and view hierarchy.](SwiftUI-view-font.png)
    ///
    /// - Parameter font: The default font to use in this view.
    ///
    /// - Returns: A view with the default font set to the value you supply.
    @inlinable public func font(_ font: Font?) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Positions this view within an invisible frame with the specified size.
    ///
    /// Use this method to specify a fixed size for a view's width, height, or
    /// both. If you only specify one of the dimensions, the resulting view
    /// assumes this view's sizing behavior in the other dimension.
    ///
    /// For example, the following code lays out an ellipse in a fixed 200 by
    /// 100 frame. Because a shape always occupies the space offered to it by
    /// the layout system, the first ellipse is 200x100 points. The second
    /// ellipse is laid out in a frame with only a fixed height, so it occupies
    /// that height, and whatever width the layout system offers to its parent.
    ///
    ///     VStack {
    ///         Ellipse()
    ///             .fill(Color.purple)
    ///             .frame(width: 200, height: 100)
    ///         Ellipse()
    ///             .fill(Color.blue)
    ///             .frame(height: 100)
    ///     }
    ///
    /// ![A screenshot showing the effect of frame size options: a purple
    /// ellipse shows the effect of a fixed frame size, while a blue ellipse
    /// shows the effect of constraining a view in one
    /// dimension.](SwiftUI-View-frame-1.png)
    ///
    /// `The alignment` parameter specifies this view's alignment within the
    /// frame.
    ///
    ///     Text("Hello world!")
    ///         .frame(width: 200, height: 30, alignment: .topLeading)
    ///         .border(Color.gray)
    ///
    /// In the example above, the text is positioned at the top, leading corner
    /// of the frame. If the text is taller than the frame, its bounds may
    /// extend beyond the bottom of the frame's bounds.
    ///
    /// ![A screenshot showing the effect of frame size options on a text view
    /// showing a fixed frame size with a specified
    /// alignment.](SwiftUI-View-frame-2.png)
    ///
    /// - Parameters:
    ///   - width: A fixed width for the resulting view. If `width` is `nil`,
    ///     the resulting view assumes this view's sizing behavior.
    ///   - height: A fixed height for the resulting view. If `height` is `nil`,
    ///     the resulting view assumes this view's sizing behavior.
    ///   - alignment: The alignment of this view inside the resulting view.
    ///     `alignment` applies if this view is smaller than the size given by
    ///     the resulting frame.
    ///
    /// - Returns: A view with fixed dimensions of `width` and `height`, for the
    ///   parameters that are non-`nil`.
    @inlinable public func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View


    /// Positions this view within an invisible frame.
    ///
    /// Use ``SwiftUI/View/frame(width:height:alignment:)`` or
    /// ``SwiftUI/View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)``
    /// instead.
    @available(*, deprecated, message: "Please pass one or more parameters.")
    @inlinable public func frame() -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Positions this view within an invisible frame having the specified size
    /// constraints.
    ///
    /// Always specify at least one size characteristic when calling this
    /// method. Pass `nil` or leave out a characteristic to indicate that the
    /// frame should adopt this view's sizing behavior, constrained by the other
    /// non-`nil` arguments.
    ///
    /// The size proposed to this view is the size proposed to the frame,
    /// limited by any constraints specified, and with any ideal dimensions
    /// specified replacing any corresponding unspecified dimensions in the
    /// proposal.
    ///
    /// If no minimum or maximum constraint is specified in a given dimension,
    /// the frame adopts the sizing behavior of its child in that dimension. If
    /// both constraints are specified in a dimension, the frame unconditionally
    /// adopts the size proposed for it, clamped to the constraints. Otherwise,
    /// the size of the frame in either dimension is:
    ///
    /// - If a minimum constraint is specified and the size proposed for the
    ///   frame by the parent is less than the size of this view, the proposed
    ///   size, clamped to that minimum.
    /// - If a maximum constraint is specified and the size proposed for the
    ///   frame by the parent is greater than the size of this view, the
    ///   proposed size, clamped to that maximum.
    /// - Otherwise, the size of this view.
    ///
    /// - Parameters:
    ///   - minWidth: The minimum width of the resulting frame.
    ///   - idealWidth: The ideal width of the resulting frame.
    ///   - maxWidth: The maximum width of the resulting frame.
    ///   - minHeight: The minimum height of the resulting frame.
    ///   - idealHeight: The ideal height of the resulting frame.
    ///   - maxHeight: The maximum height of the resulting frame.
    ///   - alignment: The alignment of this view inside the resulting frame.
    ///     Note that most alignment values have no apparent effect when the
    ///     size of the frame happens to match that of this view.
    ///
    /// - Returns: A view with flexible dimensions given by the call's non-`nil`
    ///   parameters.
    @inlinable public func frame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> some View

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets the style for group boxes within this view.
    ///
    /// - Parameter style: The style to apply to boxes within this view.
    public func groupBoxStyle<S>(_ style: S) -> some View where S : GroupBoxStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
extension View {

    /// Sets the tab bar item associated with this view.
    ///
    /// Use `tabItem(_:)` to configure a view as a tab bar item in a
    /// ``TabView``. The example below adds two views as tabs in a ``TabView``:
    ///
    ///     struct View1: View {
    ///         var body: some View {
    ///             Text("View 1")
    ///         }
    ///     }
    ///
    ///     struct View2: View {
    ///         var body: some View {
    ///             Text("View 2")
    ///         }
    ///     }
    ///
    ///     struct TabItem: View {
    ///         var body: some View {
    ///             TabView {
    ///                 View1()
    ///                     .tabItem {
    ///                         Image(systemName: "list.dash")
    ///                         Text("Menu")
    ///                     }
    ///
    ///                 View2()
    ///                     .tabItem {
    ///                         Image(systemName: "square.and.pencil")
    ///                         Text("Order")
    ///                     }
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot of a two views configured as tab items in a tab
    /// view.](SwiftUI-View-tabItem.png)
    ///
    /// - Parameter label: The tab bar item to associate with this view.
    public func tabItem<V>(@ViewBuilder _ label: () -> V) -> some View where V : View

}

@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Presents a popover using the given item as a data source for the
    /// popover's content.
    ///
    /// - Parameters:
    ///   - item: A binding to an optional source of truth for the popover.
    ///     When representing a non-`nil` item, the system uses `content` to
    ///     create a popover representation of the item.
    ///     If the identity changes, the system dismisses a
    ///     currently-presented popover and replace it by a new popover.
    ///   - attachmentAnchor: The positioning anchor which defines where the
    ///     popover is attached.
    ///   - arrowEdge: The edge of the `attachmentAnchor` where the popover's
    ///     arrow is located.
    ///   - content: A closure returning the content of the popover.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func popover<Item, Content>(item: Binding<Item?>, attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge = .top, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item : Identifiable, Content : View


    /// Presents a popover when a given condition is true.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the popover is presented.
    ///   - attachmentAnchor: The positioning anchor which defines where the
    ///     popover is attached.
    ///   - arrowEdge: The edge of the `attachmentAnchor` where the popover's
    ///     arrow is located.
    ///   - content: A closure returning the content of the popover.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func popover<Content>(isPresented: Binding<Bool>, attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge = .top, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Sets the style for labels within this view.
    ///
    /// Use this modifier to set a specific style for all labels within a view:
    ///
    ///     VStack {
    ///         Label("Fire", systemImage: "flame.fill")
    ///         Label("Lightning", systemImage: "bolt.fill")
    ///     }
    ///     .labelStyle(MyCustomLabelStyle())
    ///
    public func labelStyle<S>(_ style: S) -> some View where S : LabelStyle

}

@available(iOS 13.4, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Adds an action to perform when the user moves the pointer over or away
    /// from the view's frame.
    ///
    /// Calling this method defines a region for detecting pointer movement with
    /// the size and position of this view.
    ///
    /// - Parameter action: The action to perform whenever the pointer enters or
    ///   exits this view's frame. If the pointer is in the view's frame, the
    ///   `action` closure passes `true` as a parameter; otherwise, `false`.
    ///
    /// - Returns: A view that triggers `action` when the pointer enters or
    ///   exits this view's frame.
    @inlinable public func onHover(perform action: @escaping (Bool) -> Void) -> some View

}

@available(iOS 13.4, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Applies a pointer hover effect to the view.
    ///
    /// > Note: The system may fall back to a more appropriate effect.
    @available(iOS 13.4, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func hoverEffect(_ effect: HoverEffect = .automatic) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Hides this view.
    ///
    /// Hidden views are invisible and can't receive or respond to interactions.
    ///
    /// - Returns: A hidden view.
    @inlinable public func hidden() -> some View

}

extension View {

    /// Sets the keyboard type for this view.
    ///
    /// Use `keyboardType(_:)` to specify the keyboard type to use for text
    /// entry. A number of different keyboard types are available to meet
    /// specialized input needs, such as entering email addresses or phone
    /// numbers.
    ///
    /// The example below presents a ``TextField`` to input an email address.
    /// Setting the text field's keyboard type to `.emailAddress` ensures the
    /// user can only enter correctly formatted email addresses.
    ///
    ///     TextField("someone@example.com", text: $emailAddress)
    ///         .keyboardType(.emailAddress)
    ///
    /// There are several different kinds of specialized keyboard types
    /// available though the
    /// <doc://com.apple.documentation/documentation/UIKit/UIKeyboardType> enumeration. To
    /// specify the default system keyboard type, use `.default`.
    ///
    /// ![A screenshot showing the use of a specialized keyboard type with a
    /// text field.](SwiftUI-View-keyboardType.png)
    ///
    /// - Parameter type: One of the keyboard types defined in the
    /// <doc://com.apple.documentation/documentation/UIKit/UIKeyboardType> enumeration.
    @available(iOS 13.0, tvOS 13.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public func keyboardType(_ type: UIKeyboardType) -> some View

}

extension View {

    /// Sets whether to apply auto-capitalization to this view.
    ///
    /// Use `autocapitalization(_:)` when you need to automatically capitalize
    /// words, sentences, or other text like proper nouns.
    ///
    /// In example below, as the user enters text each word is automatically
    /// capitalized:
    ///
    ///     TextField("Last, First", text: $fullName)
    ///         .autocapitalization(UITextAutocapitalizationType.words)
    ///
    /// The <doc://com.apple.documentation/documentation/UIKit/UITextAutocapitalizationType>
    /// enumeration defines the available capitalization modes. The default is
    /// <doc://com.apple.documentation/documentation/UIKit/UITextAutocapitalizationType/sentences>.
    ///
    /// - Parameter style: One of the autocapitalization modes defined in the
    /// <doc://com.apple.documentation/documentation/UIKit/UITextAutocapitalizationType>
    /// enumeration.
    @available(iOS 13.0, tvOS 13.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public func autocapitalization(_ style: UITextAutocapitalizationType) -> some View

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Defines a group of views with synchronized geometry using an
    /// identifier and namespace that you provide.
    ///
    /// This method sets the geometry of each view in the group from the
    /// inserted view with `isSource = true` (known as the "source" view),
    /// updating the values marked by `properties`.
    ///
    /// If inserting a view in the same transaction that another view
    /// with the same key is removed, the system will interpolate their
    /// frame rectangles in window space to make it appear that there
    /// is a single view moving from its old position to its new
    /// position. The usual transition mechanisms define how each of
    /// the two views is rendered during the transition (e.g. fade
    /// in/out, scale, etc), the `matchedGeometryEffect()` modifier
    /// only arranges for the geometry of the views to be linked, not
    /// their rendering.
    ///
    /// If the number of currently-inserted views in the group with
    /// `isSource = true` is not exactly one results are undefined, due
    /// to it not being clear which is the source view.
    ///
    /// - Parameters:
    ///   - id: The identifier, often derived from the identifier of
    ///     the data being displayed by the view.
    ///   - namespace: The namespace in which defines the `id`. New
    ///     namespaces are created by adding an `@Namespace()` variable
    ///     to a ``View`` type and reading its value in the view's body
    ///     method.
    ///   - properties: The properties to copy from the source view.
    ///   - anchor: The relative location in the view used to produce
    ///     its shared position value.
    ///   - isSource: True if the view should be used as the source of
    ///     geometry for other views in the group.
    ///
    /// - Returns: A new view that defines an entry in the global
    ///   database of views synchronizing their geometry.
    ///
    @inlinable public func matchedGeometryEffect<ID>(id: ID, in namespace: Namespace.ID, properties: MatchedGeometryProperties = .frame, anchor: UnitPoint = .center, isSource: Bool = true) -> some View where ID : Hashable

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an action to perform when the specified preference key's value
    /// changes.
    ///
    /// - Parameters:
    ///   - key: The key to monitor for value changes.
    ///   - action: The action to perform when the value for `key` changes. The
    ///     `action` closure passes the new value as its parameter.
    ///
    /// - Returns: A view that triggers `action` when the value for `key`
    ///   changes.
    @inlinable public func onPreferenceChange<K>(_ key: K.Type = K.self, perform action: @escaping (K.Value) -> Void) -> some View where K : PreferenceKey, K.Value : Equatable

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
extension View {

    /// Sets the style for navigation views within this view.
    @available(watchOS 7.0, *)
    public func navigationViewStyle<S>(_ style: S) -> some View where S : NavigationViewStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for lists within this view.
    public func listStyle<S>(_ style: S) -> some View where S : ListStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies a transformation to a preference value.
    @inlinable public func transformPreference<K>(_ key: K.Type = K.self, _ callback: @escaping (inout K.Value) -> Void) -> some View where K : PreferenceKey

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets whether this view flips its contents horizontally when the layout
    /// direction is right-to-left.
    ///
    /// Use `flipsForRightToLeftLayoutDirection(_:)` when you need the system to
    /// horizontally flip the contents of the view to support right-to-left
    /// layout.
    ///
    /// In the example below, the text flips horizontally when the layout system
    /// is right-to-left:
    ///
    ///     Text("שָׁלוֹם")
    ///        .flipsForRightToLeftLayoutDirection(true)
    ///
    /// - Parameter enabled: A Boolean value that indicates whether this view
    ///   flips its content horizontally when the layout direction is
    ///   right-to-left.
    ///
    /// - Returns: A view that conditionally flips its contents horizontally
    ///   when the layout direction is right-to-left.
    @inlinable public func flipsForRightToLeftLayoutDirection(_ enabled: Bool) -> some View

}

extension View {

    /// Sets the text content type for this view, which the system uses to
    /// offer suggestions while the user enters text on an iOS or tvOS device.
    ///
    /// Use `textContentType(_:)` to set the content type for this view.
    ///
    /// This example configures the `TextField` for the entry of email
    /// addresses:
    ///
    ///     TextField("billjames2@icloud.com", text: $emailAddress)
    ///         .textContentType(.emailAddress)
    ///     }
    ///
    /// - Parameter textContentType: One of the content types available in the
    ///   `UITextContentType` enumeration that identify the semantic meaning
    ///     expected for a text-entry area. These include support for email
    ///     addresses, location names, URLs, and telephone numbers to name
    ///     just a few.
    @available(iOS 13.0, tvOS 13.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @inlinable public func textContentType(_ textContentType: UITextContentType?) -> some View

}

extension View {

    /// Hides the labels of any controls contained within this view.
    ///
    /// Use `labelsHidden()` when it would not be appropriate to show a
    /// label near controls in the context of your user interface.
    ///
    /// Although the labels are not visually laid out alongside the controls,
    /// the control's label text is still often required, because it is used
    /// for other purposes including accessibility. This example shows two
    /// controls where the first control’s label is hidden.
    ///
    /// In the example below, one of the toggles has its label hidden:
    ///
    ///     VStack {
    ///         Toggle(isOn: $toggle1) {
    ///             Text("Toggle1")
    ///         }
    ///         .labelsHidden()
    ///
    ///         Toggle(isOn: $toggle2) {
    ///             Text("Toggle2")
    ///         }
    ///     }
    ///
    /// ![A screenshot showing a view with two toggle controls where one label
    ///   is visible and the other label is hidden.](SwiftUI-Vew-labelsHidden.png)
    ///
    /// > Note: This modifier does not work for all labels. It applies to
    ///   labels that are external/separate from the rest of the control's
    ///   interface like `Toggle`, but not to controls like a bordered button
    ///   where the label is inside the button's border.
    public func labelsHidden() -> some View

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Defines a keyboard shortcut and assigns it to the modified control.
    ///
    /// Pressing the control's shortcut while the control is anywhere in the
    /// frontmost window or scene, or anywhere in the macOS main menu, is
    /// equivalent to direct interaction with the control to perform its primary
    /// action.
    ///
    /// The target of a keyboard shortcut is resolved in a leading-to-trailing,
    /// depth-first traversal of one or more view hierarchies. On macOS, the
    /// system looks in the key window first, then the main window, and then the
    /// command groups; on other platforms, the system looks in the active
    /// scene, and then the command groups.
    ///
    /// If multiple controls are associated with the same shortcut, the first
    /// one found is used.
    public func keyboardShortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command) -> some View


    /// Assigns a keyboard shortcut to the modified control.
    ///
    /// Pressing the control's shortcut while the control is anywhere in the
    /// frontmost window or scene, or anywhere in the macOS main menu, is
    /// equivalent to direct interaction with the control to perform its primary
    /// action.
    ///
    /// The target of a keyboard shortcut is resolved in a leading-to-trailing
    /// traversal of one or more view hierarchies. On macOS, the system looks in
    /// the key window first, then the main window, and then the command groups;
    /// on other platforms, the system looks in the active scene, and then the
    /// command groups.
    ///
    /// If multiple controls are associated with the same shortcut, the first
    /// one found is used.
    public func keyboardShortcut(_ shortcut: KeyboardShortcut) -> some View

}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension View {

    /// Hides the navigation bar for this view.
    ///
    /// Use `navigationBarHidden(_:)` to hide the navigation bar. This modifier
    /// only takes effect when this view is inside of and visible within a
    /// ``NavigationView``.
    ///
    /// - Parameter hidden: A Boolean value that indicates whether to hide the
    ///   navigation bar.
    @available(macOS, unavailable)
    public func navigationBarHidden(_ hidden: Bool) -> some View


    /// Sets the title in the navigation bar for this view.
    ///
    /// Use `navigationBarTitle(_:)` to set the title of the navigation bar.
    /// This modifier only takes effect when this view is inside of and visible
    /// within a ``NavigationView``.
    ///
    /// The example below shows setting the title of the navigation bar using a
    /// ``Text`` view:
    ///
    ///     struct FlavorView: View {
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip",
    ///                      "Pistachio"]
    ///         var body: some View {
    ///             NavigationView {
    ///                 List(items, id: \.self) {
    ///                     Text($0)
    ///                 }
    ///                 .navigationBarTitle(Text("Today's Flavors"))
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot showing the title of a navigation bar configured using a
    /// text view.](SwiftUI-navigationBarTitle-Text.png)
    ///
    /// - Parameter title: A description of this view to display in the
    ///   navigation bar.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    public func navigationBarTitle(_ title: Text) -> some View


    /// Sets the title of this view's navigation bar with a localized string.
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
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip",
    ///                      "Pistachio"]
    ///         var body: some View {
    ///             NavigationView {
    ///                 List(items, id: \.self) {
    ///                     Text($0)
    ///                 }
    ///                 .navigationBarTitle("Today's Flavors")
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameter titleKey: A key to a localized description of this view to
    ///   display in the navigation bar.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    public func navigationBarTitle(_ titleKey: LocalizedStringKey) -> some View


    /// Sets the title of this view's navigation bar with a string.
    ///
    /// Use `navigationBarTitle(_:)` to set the title of the navigation bar
    /// using a `String`. This modifier only takes effect when this view is
    /// inside of and visible within a ``NavigationView``.
    ///
    /// In the example below, text for the navigation bar title is provided
    /// using a string:
    ///
    ///     struct FlavorView: View {
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip",
    ///                      "Pistachio"]
    ///         let text = "Today's Flavors"
    ///         var body: some View {
    ///             NavigationView {
    ///                 List(items, id: \.self) {
    ///                     Text($0)
    ///                 }
    ///                 .navigationBarTitle(text)
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameter title: A title for this view to display in the navigation
    ///   bar.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "navigationTitle(_:)")
    public func navigationBarTitle<S>(_ title: S) -> some View where S : StringProtocol


    /// Sets the title and display mode in the navigation bar for this view.
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
    ///        let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip",
    ///                     "Pistachio"]
    ///        var body: some View {
    ///             NavigationView {
    ///                  List(items, id: \.self) {
    ///                      Text($0)
    ///                  }
    ///                 .navigationBarTitle(Text("Today's Flavors", displayMode: .inline)
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - title: A title for this view to display in the navigation bar.
    ///   - displayMode: The style to use for displaying the navigation bar title.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use navigationTitle(_:) with navigationBarTitleDisplayMode(_:)")
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func navigationBarTitle(_ title: Text, displayMode: NavigationBarItem.TitleDisplayMode) -> some View


    /// Sets the title and display mode in the navigation bar for this view.
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
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip",
    ///                      "Pistachio"]
    ///         var body: some View {
    ///             NavigationView {
    ///                  List(items, id: \.self) {
    ///                      Text($0)
    ///                  }
    ///                 .navigationBarTitle("Today's Flavors", displayMode: .inline)
    ///             }
    ///         }
    ///     }
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
    public func navigationBarTitle(_ titleKey: LocalizedStringKey, displayMode: NavigationBarItem.TitleDisplayMode) -> some View


    /// Sets the title and display mode in the navigation bar for this view.
    ///
    /// Use `navigationBarTitle(_:, displayMode)` to set the title of the
    /// navigation bar for this view and specify a display mode for the
    /// title from one of the `NavigationBarItem.Title.DisplayMode`
    /// styles. This modifier only takes effect when this view is inside of and
    /// visible within a `NavigationView`.
    ///
    /// In the example below, `navigationBarTitle(_:, displayMode)` uses a
    /// string to provide a title for the navigation bar. Setting the title's
    /// `displaymode` to `.inline` places the navigation bar title within the
    /// bounds of the navigation bar.
    ///
    /// In the example below, text for the navigation bar title is provided using
    /// a string. The navigation bar title's `displayMode` is set to
    /// `.inline` which places the navigation bar title in the bounds of the
    /// navigation bar.
    ///
    ///     struct FlavorView: View {
    ///         let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip",
    ///                      "Pistachio"]
    ///         let title = "Today's Flavors"
    ///         var body: some View {
    ///             NavigationView {
    ///                  List(items, id: \.self) {
    ///                      Text($0)
    ///                  }
    ///                 .navigationBarTitle(title, displayMode: .inline)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A screenshot of a navigation bar, showing the title within the bounds
    ///  of the navigation bar]
    /// (SwiftUI-navigationBarTitle-stringProtocol.png)
    ///
    /// - Parameters:
    ///   - title: A title for this view to display in the navigation bar.
    ///   - displayMode: The way to display the title.
    @available(iOS, introduced: 14.0, deprecated: 100000.0, message: "Use navigationTitle(_:) with navigationBarTitleDisplayMode(_:)")
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func navigationBarTitle<S>(_ title: S, displayMode: NavigationBarItem.TitleDisplayMode) -> some View where S : StringProtocol


    /// Hides the navigation bar back button for the view.
    ///
    /// Use `navigationBarBackButtonHidden(_:)` to hide the back button for this
    /// view.
    ///
    /// This modifier only takes effect when this view is inside of and visible
    /// within a ``NavigationView``.
    ///
    /// - Parameter hidesBackButton: A Boolean value that indicates whether to
    ///   hide the back button.
    @available(macOS, unavailable)
    public func navigationBarBackButtonHidden(_ hidesBackButton: Bool) -> some View

}

extension View {

    /// Modifies this view by injecting a value that you provide for use by
    /// other views whose state depends on the focused view hierarchy.
    ///
    /// - Parameters:
    ///   - keyPath: The key path to associate `value` with when adding
    ///     it to the existing table of exported focus values.
    ///   - value: The focus value to export.
    /// - Returns: A modified representation of this view.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public func focusedValue<Value>(_ keyPath: WritableKeyPath<FocusedValues, Value?>, _ value: Value) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the alignment of multiline text in this view.
    ///
    /// Use `multilineTextAlignment(_:)` to select an alignment for all of the
    /// text in this view or view hierarchy.
    ///
    /// In the example below, the contents of the ``Text`` view are center
    /// aligned. This also applies to the interpolated newline placed in the
    /// middle of the text since "multiple lines" refers to all of the text
    /// inside the view, regardless of any internal formatting or inclusion of
    /// interpolated text.
    ///
    ///     Text("This is a block of text that will show up in a text element as multiple lines.\("\n") Here we have chosen to center this text.")
    ///         .frame(width: 200, height: 200, alignment: .leading)
    ///         .multilineTextAlignment(.center)
    ///
    /// ![A screenshot showing the effect of text alignment in a
    /// view.](SwiftUI-view-multilineTextAlignment.png)
    ///
    /// - Parameter alignment: A value that you use to left-, right-, or
    ///   center-align the text within a view.
    ///
    /// - Returns: A view that aligns the lines of multiline ``Text`` instances
    ///   it contains.
    @inlinable public func multilineTextAlignment(_ alignment: TextAlignment) -> some View


    /// Sets the truncation mode for lines of text that are too long to fit in
    /// the available space.
    ///
    /// Use the `truncationMode(_:)` modifier to determine whether text in a
    /// long line is truncated at the beginning, middle, or end. Truncation is
    /// indicated by adding an ellipsis (…) to the line when removing text to
    /// indicate to readers that text is missing.
    ///
    /// In the example below, the bounds of text view constrains the amount of
    /// text that the view displays and the `truncationMode(_:)` specifies from
    /// which direction and where to display the truncation indicator:
    ///
    ///     Text("This is a block of text that will show up in a text element as multiple lines. The text will fill the available space, and then, eventually, be truncated.")
    ///         .frame(width: 150, height: 150)
    ///         .truncationMode(.tail)
    ///
    /// ![A screenshot showing the effect of truncation mode on text in a
    /// view.](SwiftUI-view-truncationMode.png)
    ///
    /// - Parameter mode: The truncation mode that specifies where to truncate
    ///   the text within the text view, if needed. You can truncate at the
    ///   beginning, middle, or end of the text view.
    ///
    /// - Returns: A view that truncates text at different points in a line
    ///   depending on the mode you select.
    @inlinable public func truncationMode(_ mode: Text.TruncationMode) -> some View


    /// Sets the amount of space between lines of text in this view.
    ///
    /// Use `lineSpacing(_:)` to set the amount of spacing from the bottom of
    /// one line to the top of the next for text elements in the view.
    ///
    /// In the ``Text`` view in the example below, 10 points separate the bottom
    /// of one line to the top of the next as the text field wraps inside this
    /// view. Applying `lineSpacing(_:)` to a view hierarchy applies the line
    /// spacing to all text elements contained in the view.
    ///
    ///     Text("This is a string in a TextField with 10 point spacing applied between the bottom of one line and the top of the next.")
    ///         .frame(width: 200, height: 200, alignment: .leading)
    ///         .lineSpacing(10)
    ///
    /// ![A screenshot showing the effects of setting line spacing on the text
    /// in a view.](SwiftUI-view-lineSpacing.png)
    ///
    /// - Parameter lineSpacing: The amount of space between the bottom of one
    ///   line and the top of the next line in points.
    @inlinable public func lineSpacing(_ lineSpacing: CGFloat) -> some View


    /// Sets whether text in this view can compress the space between characters
    /// when necessary to fit text in a line.
    ///
    /// Use `allowsTightening(_:)` to enable the compression of inter-character
    /// spacing of text in a view to try to fit the text in the view's bounds.
    ///
    /// In the example below, two identically configured text views show the
    /// effects of `allowsTightening(_:)` on the compression of the spacing
    /// between characters:
    ///
    ///     VStack {
    ///         Text("This is a wide text element")
    ///             .font(.body)
    ///             .frame(width: 200, height: 50, alignment: .leading)
    ///             .lineLimit(1)
    ///             .allowsTightening(true)
    ///
    ///         Text("This is a wide text element")
    ///             .font(.body)
    ///             .frame(width: 200, height: 50, alignment: .leading)
    ///             .lineLimit(1)
    ///             .allowsTightening(false)
    ///     }
    ///
    /// ![A screenshot showing the effect of enabling text tightening in a
    /// view.](SwiftUI-view-allowsTightening.png)
    ///
    /// - Parameter flag: A Boolean value that indicates whether the space
    ///   between characters compresses when necessary.
    ///
    /// - Returns: A view that can compress the space between characters when
    ///   necessary to fit text in a line.
    @inlinable public func allowsTightening(_ flag: Bool) -> some View


    /// Sets the maximum number of lines that text can occupy in this view.
    ///
    /// Use `lineLimit(_:)` to cap the number of lines that an individual text
    /// element can display.
    ///
    /// The line limit applies to all ``Text`` instances within a hierarchy. For
    /// example, an ``HStack`` with multiple pieces of text longer than three
    /// lines caps each piece of text to three lines rather than capping the
    /// total number of lines across the ``HStack``.
    ///
    /// In the example below, the `lineLimit(_:)` operator limits the very long
    /// line in the ``Text`` element to the 2 lines that fit within the view's
    /// bounds:
    ///
    ///     Text("This is a long string that demonstrates the effect of SwuiftUI's lineLimit(:_) operator.")
    ///      .frame(width: 200, height: 200, alignment: .leading)
    ///      .lineLimit(2)
    ///
    /// ![A screenshot showing showing the effect of the line limit operator on
    /// a very long string in a view.](SwiftUI-view-lineLimit.png)
    ///
    /// - Parameter number: The line limit. If `nil`, no line limit applies.
    ///
    /// - Returns: A view that limits the number of lines that ``Text``
    ///   instances display.
    @inlinable public func lineLimit(_ number: Int?) -> some View


    /// Sets the minimum amount that text in this view scales down to fit in the
    /// available space.
    ///
    /// Use the `minimumScaleFactor(_:)` modifier if the text you place in a
    /// view doesn't fit and it's okay if the text shrinks to accommodate. For
    /// example, a label with a minimum scale factor of `0.5` draws its text in
    /// a font size as small as half of the actual font if needed.
    ///
    /// In the example below, the ``HStack`` contains a ``Text`` label with a
    /// line limit of `1`, that is next to a ``TextField``. To allow the label
    /// to fit into the available space, the `minimumScaleFactor(_:)` modifier
    /// shrinks the text as needed to fit into the available space.
    ///
    ///     HStack {
    ///         Text("This is a long label that will be scaled to fit:")
    ///             .lineLimit(1)
    ///             .minimumScaleFactor(0.5)
    ///         TextField("My Long Text Field", text: $myTextField)
    ///     }
    ///
    /// ![A screenshot showing the effect of setting a minimumScaleFactor on
    /// text in a view.](SwiftUI-View-minimumScaleFactor.png)
    ///
    /// - Parameter factor: A fraction between 0 and 1 (inclusive) you use to
    ///   specify the minimum amount of text scaling that this view permits.
    ///
    /// - Returns: A view that limits the amount of text downscaling.
    @inlinable public func minimumScaleFactor(_ factor: CGFloat) -> some View


    /// Sets a transform for the case of the text contained in this view when
    /// displayed.
    ///
    /// The default value is `nil`, displaying the text without any case
    /// changes.
    ///
    /// - Parameter textCase: One of the ``Text/Case`` enumerations; the
    ///   default is `nil`.
    /// - Returns: A view that transforms the case of the text.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @inlinable public func textCase(_ textCase: Text.Case?) -> some View

}

@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension View {

    /// Adds an action to perform when this view recognizes a tap gesture.
    public func onTapGesture(count: Int = 1, perform action: @escaping () -> Void) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies an inset to the rows in a list.
    ///
    /// Use `listRowInsets(_:)` to change the default padding of the content of
    /// list items.
    ///
    /// In the example below, the `Flavor` enumeration provides content for list
    /// items. The SwiftUI ``List`` builder iterates over the `Flavor`
    /// enumeration and extracts the raw value of each of its elements using the
    /// resulting text to create each list row item. After the list builder
    /// finishes, the `listRowInsets(_:)` modifier changes the edge insets of
    /// each row of the list according to the ``EdgeInsets`` values you provide.
    ///
    ///     struct ListRowInsets: View {
    ///         enum Flavor: String, CaseIterable, Identifiable {
    ///             var id: String { self.rawValue }
    ///             case vanilla, chocolate, strawberry
    ///         }
    ///
    ///         var body: some View {
    ///             List(Flavor.allCases, id: \.self) {
    ///                 Text($0.rawValue)
    ///             }
    ///             .listRowInsets(EdgeInsets(top: 0, leading: 75, bottom: 0, trailing: 0))
    ///         }
    ///     }
    ///
    /// - Parameter insets: ``EdgeInsets`` to apply to the edges of the view.
    ///
    /// - Returns: A view that uses the given edge insets when used as a list
    ///   cell.
    @inlinable public func listRowInsets(_ insets: EdgeInsets?) -> some View

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Populates the toolbar or navigation bar with items
    /// whose content is the specified views.
    ///
    /// - Parameter content: The views representing the content of the toolbar.
    public func toolbar<Content>(@ViewBuilder content: () -> Content) -> some View where Content : View


    /// Populates the toolbar or navigation bar with the specified items.
    ///
    /// - Parameter items: The items representing the content of the toolbar.
    public func toolbar<Content>(@ToolbarContentBuilder content: () -> Content) -> some View where Content : ToolbarContent


    /// Populates the toolbar or navigation bar with the specified items,
    /// allowing for user customization.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for this toolbar.
    ///   - content: The content representing the content of the toolbar.
    public func toolbar<Content>(id: String, @ToolbarContentBuilder content: () -> Content) -> some View where Content : CustomizableToolbarContent

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Specifies whether to hide this view from system accessibility features.
    public func accessibilityHidden(_ hidden: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel(_ label: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue(_ value: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint(_ hint: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// > Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   `accessibilityLabel()` modifier.
    ///
    /// - Parameter inputLabels: An array of Text elements to use as input labels.
    public func accessibilityInputLabels(_ inputLabels: [Text]) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Adds the given traits to the view.
    public func accessibilityAddTraits(_ traits: AccessibilityTraits) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Removes the given traits from this view.
    public func accessibilityRemoveTraits(_ traits: AccessibilityTraits) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Uses the specified string to identify the view.
    ///
    /// Use this value for testing. It isn't visible to the user.
    public func accessibilityIdentifier(_ identifier: String) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Sets the sort priority order for this view's accessibility element,
    /// relative to other elements at the same level.
    ///
    /// Higher numbers are sorted first. The default sort priority is zero.
    public func accessibilitySortPriority(_ sortPriority: Double) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Specifies the point where activations occur in the view.
    public func accessibilityActivationPoint(_ activationPoint: CGPoint) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Specifies the unit point where activations occur in the view.
    public func accessibilityActivationPoint(_ activationPoint: UnitPoint) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel(_ labelKey: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    public func accessibilityLabel<S>(_ label: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue(_ valueKey: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibilityLabel(),
    /// you can provide the current volume setting, like "60%", using accessibilityValue().
    public func accessibilityValue<S>(_ value: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint(_ hintKey: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    public func accessibilityHint<S>(_ hint: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// > Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   `accessibilityLabel()` modifier.
    public func accessibilityInputLabels(_ inputLabelKeys: [LocalizedStringKey]) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// > Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   `accessibilityLabel()` modifier.
    public func accessibilityInputLabels<S>(_ inputLabels: [S]) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol
}

extension View {

    /// Specifies whether to hide this view from system accessibility features.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityHidden(_:)")
    public func accessibility(hidden: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Adds a label to the view that describes its contents.
    ///
    /// Use this method to provide an accessibility label for a view that doesn't display text, like an icon.
    /// For example, you could use this method to label a button that plays music with the text "Play".
    /// Don't include text in the label that repeats information that users already have. For example,
    /// don't use the label "Play button" because a button already has a trait that identifies it as a button.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityLabel(_:)")
    public func accessibility(label: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Adds a textual description of the value that the view contains.
    ///
    /// Use this method to describe the value represented by a view, but only if that's different than the
    /// view's label. For example, for a slider that you label as "Volume" using accessibility(label:),
    /// you can provide the current volume setting, like "60%", using accessibility(value:).
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityValue(_:)")
    public func accessibility(value: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Communicates to the user what happens after performing the view's
    /// action.
    ///
    /// Provide a hint in the form of a brief phrase, like "Purchases the item" or
    /// "Downloads the attachment".
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityHint(_:)")
    public func accessibility(hint: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Sets alternate input labels with which users identify a view.
    ///
    /// Provide labels in descending order of importance. Voice Control
    /// and Full Keyboard Access use the input labels.
    ///
    /// > Note: If you don't specify any input labels, the user can still
    ///   refer to the view using the accessibility label that you add with the
    ///   ``accessibility(label:)`` modifier.
    ///
    /// - Parameter inputLabels: An array of Text elements to use as input labels.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityInputLabels(_:)")
    public func accessibility(inputLabels: [Text]) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Adds the given traits to the view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityAddTraits(_:)")
    public func accessibility(addTraits traits: AccessibilityTraits) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Removes the given traits from this view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityRemoveTraits(_:)")
    public func accessibility(removeTraits traits: AccessibilityTraits) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Uses the specified string to identify the view.
    ///
    /// Use this value for testing. It isn't visible to the user.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityIdentifier(_:)")
    public func accessibility(identifier: String) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Sets a selection identifier for this view's accessibility element.
    ///
    /// Picker uses the value to determine what node to use for the
    /// accessibility value.
    @available(iOS, deprecated, introduced: 13.0)
    @available(macOS, deprecated, introduced: 10.15)
    @available(tvOS, deprecated, introduced: 13.0)
    @available(watchOS, deprecated, introduced: 6)
    public func accessibility(selectionIdentifier: AnyHashable) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Sets the sort priority order for this view's accessibility element,
    /// relative to other elements at the same level.
    ///
    /// Higher numbers are sorted first. The default sort priority is zero.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilitySortPriority(_:)")
    public func accessibility(sortPriority: Double) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Specifies the point where activations occur in the view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    public func accessibility(activationPoint: CGPoint) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Specifies the unit point where activations occur in the view.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    @available(watchOS, introduced: 6, deprecated: 100000.0, renamed: "accessibilityActivationPoint(_:)")
    public func accessibility(activationPoint: UnitPoint) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Binds a view's identity to the given proxy value.
    ///
    /// When the proxy value specified by the `id` parameter changes, the
    /// identity of the view — for example, its state — is reset.
    @inlinable public func id<ID>(_ id: ID) -> some View where ID : Hashable

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Uses the specified preference value from the view to produce another
    /// view as an overlay atop the first view.
    @inlinable public func overlayPreferenceValue<Key, T>(_ key: Key.Type = Key.self, @ViewBuilder _ transform: @escaping (Key.Value) -> T) -> some View where Key : PreferenceKey, T : View


    /// Uses the specified preference value from the view to produce another
    /// view as a background to the first view.
    @inlinable public func backgroundPreferenceValue<Key, T>(_ key: Key.Type = Key.self, @ViewBuilder _ transform: @escaping (Key.Value) -> T) -> some View where Key : PreferenceKey, T : View

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Adds a modifier for this view that fires an action when a specific
    /// value changes.
    ///
    /// You can use `onChange` to trigger a side effect as the result of a
    /// value changing, such as an `Environment` key or a `Binding`.
    ///
    /// `onChange` is called on the main thread. Avoid performing long-running
    /// tasks on the main thread. If you need to perform a long-running task in
    /// response to `value` changing, you should dispatch to a background queue.
    ///
    /// The new value is passed into the closure. The previous value may be
    /// captured by the closure to compare it to the new value. For example, in
    /// the following code example, `PlayerView` passes both the old and new
    /// values to the model.
    ///
    ///     struct PlayerView : View {
    ///         var episode: Episode
    ///         @State private var playState: PlayState = .paused
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Text(episode.title)
    ///                 Text(episode.showTitle)
    ///                 PlayButton(playState: $playState)
    ///             }
    ///             .onChange(of: playState) { [playState] newState in
    ///                 model.playStateDidChange(from: playState, to: newState)
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - value: The value to check against when determining whether
    ///     to run the closure.
    ///   - action: A closure to run when the value changes.
    ///   - newValue: The new value that failed the comparison check.
    ///
    /// - Returns: A view that fires an action when the specified value changes.
    @inlinable public func onChange<V>(of value: V, perform action: @escaping (V) -> Void) -> some View where V : Equatable

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Sets the style for progress views in this view.
    ///
    /// For example, the following code creates a progress view that uses the
    /// "circular" style:
    ///
    ///     ProgressView()
    ///         .progressViewStyle(CircularProgressViewStyle())
    ///
    /// - Parameter style: The progress view style to use for this view.
    public func progressViewStyle<S>(_ style: S) -> some View where S : ProgressViewStyle

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Presents a system interface for allowing the user to move an existing
    /// file to a new location.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `file` must not be `nil`. When the operation is finished,
    /// `isPresented` will be set to `false` before `onCompletion` is called. If
    /// the user cancels the operation, `isPresented` will be set to `false` and
    /// `onCompletion` will not be called.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - file: The `URL` of the file to be moved.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     has succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileMover(isPresented: Binding<Bool>, file: URL?, onCompletion: @escaping (Result<URL, Error>) -> Void) -> some View


    /// Presents a system interface for allowing the user to move a collection
    /// of existing files to a new location.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `files` must not be empty. When the operation is finished,
    /// `isPresented` will be set to `false` before `onCompletion` is called. If
    /// the user cancels the operation, `isPresented` will be set to `false` and
    /// `onCompletion` will not be called.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - files: A collection of `URL`s for the files to be moved.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     has succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileMover<C>(isPresented: Binding<Bool>, files: C, onCompletion: @escaping (Result<[URL], Error>) -> Void) -> some View where C : Collection, C.Element == URL

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Sets the tint effect associated with specific content in a list.
    ///
    /// The containing list's style will apply that tint as appropriate. watchOS
    /// uses the tint color for its background platter appearance. Sidebars on
    /// iOS and macOS apply the tint color to their `Label` icons, which
    /// otherwise use the accent color by default.
    ///
    /// - Parameter tint: The tint effect to use, or nil to not override the
    ///   inherited tint.
    @inlinable public func listItemTint(_ tint: ListItemTint?) -> some View


    /// Sets a fixed tint color associated with specific content in a list.
    ///
    /// This is equivalent to using a tint of `ListItemTint.fixed(_:)` with the
    /// provided `tint` color.
    ///
    /// The containing list's style will apply that tint as appropriate. watchOS
    /// uses the tint color for its background platter appearance. Sidebars on
    /// iOS and macOS apply the tint color to their `Label` icons, which
    /// otherwise use the accent color by default.
    ///
    /// - Parameter color: The color to use to tint the content, or nil to not
    ///   override the inherited tint.
    @inlinable public func listItemTint(_ tint: Color?) -> some View

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Links multiple accessibility elements so that the user can quickly
    /// navigate from one element to another, even when the elements are not near
    /// each other in the accessibility hierarchy.
    ///
    /// This can be useful to allow quickly jumping between content in a list and
    /// the same content shown in a detail view, for example. All elements marked
    /// with `accessibilityLinkedGroup` with the same namespace and identifier will be
    /// linked together.
    ///
    /// - Parameters:
    ///   - id: A hashable identifier used to separate sets of linked elements
    ///     within the same namespace. Elements with matching `namespace` and `id`
    ///     will be linked together.
    ///   - namespace: The namespace to use to organize linked accessibility
    ///     elements. All elements marked with `accessibilityLink` in this
    ///     namespace and with the specified `id` will be linked together.
    public func accessibilityLinkedGroup<ID>(id: ID, in namespace: Namespace.ID) -> some View where ID : Hashable


    /// Pairs an accessibility element representing a label with the element
    /// for the matching content.
    ///
    /// Use `accessibilityLabeledPair` with a role of `AccessibilityLabeledPairRole.label`
    /// to identify the label, and a role of `AccessibilityLabeledPairRole.content`
    /// to identify the content.
    /// This improves the behavior of accessibility features such as VoiceOver
    /// when navigating such elements, allowing users to better understand the
    /// relationship between them.
    ///
    /// - Parameters:
    ///   - role: Determines whether this element should be used as the label
    ///     in the pair, or the content in the pair.
    ///   - id: The identifier for the label / content pair. Elements with
    ///     matching identifiers within the same namespace will be paired
    ///     together.
    ///   - namespace: The namespace used to organize label and content. Label
    ///     and content under the same namespace with matching identifiers will
    ///     be paired together.
    public func accessibilityLabeledPair<ID>(role: AccessibilityLabeledPairRole, id: ID, in namespace: Namespace.ID) -> some View where ID : Hashable

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Rotates this view's rendered output in three dimensions around the given
    /// axis of rotation.
    ///
    /// Use `rotation3DEffect(_:axis:anchor:anchorZ:perspective:)` to rotate the
    /// view in three dimensions around the given axis of rotation, and
    /// optionally, position the view at a custom display order and perspective.
    ///
    /// In the example below, the text is rotated 45˚ about the `y` axis,
    /// front-most (the default `zIndex`) and default `perspective` (`1`):
    ///
    ///     Text("Rotation by passing an angle in degrees")
    ///         .rotation3DEffect(.degrees(45), axis: (x: 0.0, y: 1.0, z: 0.0))
    ///         .border(Color.gray)
    ///
    /// ![A screenshot showing the rotation of text 45 degrees about the
    /// y-axis.](SwiftUI-View-rotation3DEffect.png)
    ///
    /// - Parameters:
    ///   - angle: The angle at which to rotate the view.
    ///   - axis: The `x`, `y` and `z` elements that specify the axis of
    ///     rotation.
    ///   - anchor: The location with a default of ``UnitPoint/center`` that
    ///     defines a point in 3D space about which the rotation is anchored.
    ///   - anchorZ: The location with a default of `0` that defines a point in
    ///     3D space about which the rotation is anchored.
    ///   - perspective: The relative vanishing point with a default of `1` for
    ///     this rotation.
    @inlinable public func rotation3DEffect(_ angle: Angle, axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Transforms the environment value of the specified key path with the
    /// given function.
    @inlinable public func transformEnvironment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, transform: @escaping (inout V) -> Void) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an accessibility scroll action to the view.
    public func accessibilityScrollAction(_ handler: @escaping (Edge) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Assigns a name to the view's coordinate space, so other code can operate
    /// on dimensions like points and sizes relative to the named space.
    ///
    /// Use `coordinateSpace(name:)` to allow another function to find and
    /// operate on a view and operate on dimensions relative to that view.
    ///
    /// The example below demonstrates how a nested view can find and operate on
    /// its enclosing view's coordinate space:
    ///
    ///     struct ContentView: View {
    ///         @State var location = CGPoint.zero
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Color.red.frame(width: 100, height: 100)
    ///                     .overlay(circle)
    ///                 Text("Location: \(Int(location.x)), \(Int(location.y))")
    ///             }
    ///             .coordinateSpace(name: "stack")
    ///         }
    ///
    ///         var circle: some View {
    ///             Circle()
    ///                 .frame(width: 25, height: 25)
    ///                 .gesture(drag)
    ///                 .padding(5)
    ///         }
    ///
    ///         var drag: some Gesture {
    ///             DragGesture(coordinateSpace: .named("stack"))
    ///                 .onChanged { info in location = info.location }
    ///         }
    ///     }
    ///
    /// Here, the ``VStack`` in the `ContentView` named “stack” is composed of a
    /// red frame with a custom ``Circle`` view ``View/overlay(_:alignment:)``
    /// at its center.
    ///
    /// The `circle` view has an attached ``DragGesture`` that targets the
    /// enclosing VStack's coordinate space. As the gesture recognizer's closure
    /// registers events inside `circle` it stores them in the shared `location`
    /// state variable and the ``VStack`` displays the coordinates in a ``Text``
    /// view.
    ///
    /// ![A screenshot showing an example of finding a named view and tracking
    /// relative locations in that view.](SwiftUI-View-coordinateSpace.png)
    ///
    /// - Parameter name: A name used to identify this coordinate space.
    @inlinable public func coordinateSpace<T>(name: T) -> some View where T : Hashable

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Defines the content shape for hit testing.
    ///
    /// - Parameters:
    ///   - shape: The hit testing shape for the view.
    ///   - eoFill: A Boolean that indicates whether the shape is interpreted
    ///     with the even-odd winding number rule.
    ///
    /// - Returns: A view that uses the given shape for hit testing.
    @inlinable public func contentShape<S>(_ shape: S, eoFill: Bool = false) -> some View where S : Shape

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets a value for the given preference.
    @inlinable public func preference<K>(key: K.Type = K.self, value: K.Value) -> some View where K : PreferenceKey

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies the given transaction mutation function to all transactions used
    /// within the view.
    ///
    /// Use this modifier on leaf views rather than container views. The
    /// transformation applies to all child views within this view; calling
    /// `transaction(_:)` on a container view can lead to unbounded scope.
    ///
    /// - Parameter transform: The transformation to apply to transactions
    ///   within this view.
    ///
    /// - Returns: A view that wraps this view and applies `transformation` to
    ///   all transactions used within the view.
    @inlinable public func transaction(_ transform: @escaping (inout Transaction) -> Void) -> some View


    /// Applies the given animation to all animatable values within this view.
    ///
    /// Use this modifier on leaf views rather than container views. The
    /// animation applies to all child views within this view; calling
    /// `animation(_:)` on a container view can lead to unbounded scope.
    ///
    /// - Parameter animation: The animation to apply to animatable values
    ///   within this view.
    ///
    /// - Returns: A view that wraps this view and applies `animation` to all
    ///   animatable values used within the view.
    @inlinable public func animation(_ animation: Animation?) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Wraps this view as a new accessibility element.
    public func accessibilityElement(children: AccessibilityChildBehavior = .ignore) -> some View

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Advertises a user activity type.
    ///
    /// You can use `userActivity(_:isActive:_:)` to start, stop, or modify the
    /// advertisement of a specific type of user activity.
    ///
    /// The scope of the activity applies only to the scene or window the
    /// view is in.
    ///
    /// - Parameters:
    ///   - activityType: The type of activity to advertise.
    ///   - isActive: When `false`, avoids advertising the activity. Defaults
    ///     to `true`.
    ///   - update: A function that modifies the passed-in activity for
    ///     advertisement.
    public func userActivity(_ activityType: String, isActive: Bool = true, _ update: @escaping (NSUserActivity) -> ()) -> some View


    /// Advertises a user activity type.
    ///
    /// The scope of the activity applies only to the scene or window the
    /// view is in.
    ///
    /// - Parameters:
    ///   - activityType: The type of activity to advertise.
    ///   - element: If the element is `nil`, the handler will not be
    ///     associated with the activity (and if there are no handlers, no
    ///     activity is advertised). The method passes the non-`nil` element to
    ///     the handler as a convenience so the handlers don't all need to
    ///     implement an early exit with
    ///     `guard element = element else { return }`.
    ///    - update: A function that modifies the passed-in activity for
    ///    advertisement.
    public func userActivity<P>(_ activityType: String, element: P?, _ update: @escaping (P, NSUserActivity) -> ()) -> some View


    /// Registers a handler to invoke when the view receives the specified
    /// activity type for the scene or window the view is in.
    ///
    /// - Parameters:
    ///   - activityType: The type of activity to handle.
    ///   - action: A function to call that takes a
    ///     <doc://com.apple.documentation/documentation/Foundation/NSUserActivity>
    ///     object as its parameter
    ///     when delivering the activity to the scene or window the view is in.
    public func onContinueUserActivity(_ activityType: String, perform action: @escaping (NSUserActivity) -> ()) -> some View


    /// Registers a handler to invoke when the view receives a url for the
    /// scene or window the view is in.
    ///
    /// > Note: This method handles the reception of Universal Links,
    ///   rather than a
    ///   <doc://com.apple.documentation/documentation/Foundation/NSUserActivity>.
    ///
    /// - Parameter action: A function that takes a
    ///  <doc://com.apple.documentation/documentation/Foundation/URL>
    ///  object as its parameter when delivering the URL to the scene or window
    ///  the view is in.
    public func onOpenURL(perform action: @escaping (URL) -> ()) -> some View

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Specifies a modifier indicating the Scene this View
    /// is in can handle matching incoming External Events.
    ///
    /// If no modifier is set in any Views within a Scene, the behavior
    /// is platform dependent. On macOS, a new Scene will be created to
    /// use for the External Event. On iOS, the system will choose an
    /// existing Scene to use.
    ///
    /// On platforms that only allow a single Window/Scene, this method is
    /// ignored, and incoming External Events are always routed to the
    /// existing single Scene.
    ///
    /// - Parameter preferring: A Set of Strings that are checked to see
    /// if they are contained in the targetContentIdenfifier to see if
    /// the Scene this View is in prefers to handle the Exernal Event.
    /// The empty Set and empty Strings never match. The String value
    /// "*" always matches. The String comparisons are case/diacritic
    /// insensitive
    ///
    /// - Parameter allowing: A Set of Strings that are checked to see
    /// if they are contained in the targetContentIdenfifier to see if
    /// the Scene this View is in allows handling the External Event.
    /// The empty Set and empty Strings never match. The String value
    /// "*" always matches.
    public func handlesExternalEvents(preferring: Set<String>, allowing: Set<String>) -> some View

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Presents a system interface for allowing the user to export an in-memory
    /// document to a file on disk.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `document` must not be `nil`. When the operation is finished,
    /// `isPresented` will be set to `false` before `onCompletion` is called. If
    /// the user cancels the operation, `isPresented` will be set to `false` and
    /// `onCompletion` will not be called.
    ///
    /// The `contentType` provided must be included within the document type's
    /// `writableContentTypes`, otherwise the first valid writable content type
    /// will be used instead.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - document: The in-memory document to export.
    ///   - contentType: The content type to use for the exported file.
    ///   - defaultFilename: If provided, the default name to use for the
    ///     exported file, which will the user will have an opportunity to edit
    ///     prior to the export.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     has succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileExporter<D>(isPresented: Binding<Bool>, document: D?, contentType: UTType, defaultFilename: String? = nil, onCompletion: @escaping (Result<URL, Error>) -> Void) -> some View where D : FileDocument


    /// Presents a system interface for allowing the user to export a collection
    /// of in-memory documents to files on disk.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `documents` must not be empty. When the operation is finished,
    /// `isPresented` will be set to `false` before `onCompletion` is called. If
    /// the user cancels the operation, `isPresented` will be set to `false` and
    /// `onCompletion` will not be called.
    ///
    /// The `contentType` provided must be included within the document type's
    /// `writableContentTypes`, otherwise the first valid writable content type
    /// will be used instead.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - documents: The collection of in-memory documents to export.
    ///   - contentType: The content type to use for the exported file.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     has succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileExporter<C>(isPresented: Binding<Bool>, documents: C, contentType: UTType, onCompletion: @escaping (Result<[URL], Error>) -> Void) -> some View where C : Collection, C.Element : FileDocument


    /// Presents a system interface for allowing the user to export an in-memory
    /// document to a file on disk.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `document` must not be `nil`. When the operation is finished,
    /// `isPresented` will be set to `false` before `onCompletion` is called. If
    /// the user cancels the operation, `isPresented` will be set to `false` and
    /// `onCompletion` will not be called.
    ///
    /// The `contentType` provided must be included within the document type's
    /// `writableContentTypes`, otherwise the first valid writable content type
    /// will be used instead.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - document: The in-memory document to export.
    ///   - contentType: The content type to use for the exported file.
    ///   - defaultFilename: If provided, the default name to use for the
    ///     exported file, which will the user will have an opportunity to edit
    ///     prior to the export.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     has succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileExporter<D>(isPresented: Binding<Bool>, document: D?, contentType: UTType, defaultFilename: String? = nil, onCompletion: @escaping (Result<URL, Error>) -> Void) -> some View where D : ReferenceFileDocument


    /// Presents a system interface for allowing the user to export a collection
    /// of in-memory documents to files on disk.
    ///
    /// In order for the interface to appear, both `isPresented` must be `true`
    /// and `documents` must not be empty. When the operation is finished,
    /// `isPresented` will be set to `false` before `onCompletion` is called. If
    /// the user cancels the operation, `isPresented` will be set to `false` and
    /// `onCompletion` will not be called.
    ///
    /// The `contentType` provided must be included within the document type's
    /// `writableContentTypes`, otherwise the first valid writable content type
    /// will be used instead.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the interface should be shown.
    ///   - documents: The collection of in-memory documents to export.
    ///   - contentType: The content type to use for the exported file.
    ///   - onCompletion: A callback that will be invoked when the operation has
    ///     has succeeded or failed.
    ///   - result: A `Result` indicating whether the operation succeeded or
    ///     failed.
    public func fileExporter<C>(isPresented: Binding<Bool>, documents: C, contentType: UTType, onCompletion: @escaping (Result<[URL], Error>) -> Void) -> some View where C : Collection, C.Element : ReferenceFileDocument

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the priority by which a parent layout should apportion space to
    /// this child.
    ///
    /// Views typically have a default priority of `0` which causes space to be
    /// apportioned evenly to all sibling views. Raising a view's layout
    /// priority encourages the higher priority view to shrink later when the
    /// group is shrunk and stretch sooner when the group is stretched.
    ///
    ///     HStack {
    ///         Text("This is a moderately long string.")
    ///             .font(.largeTitle)
    ///             .border(Color.gray)
    ///
    ///         Spacer()
    ///
    ///         Text("This is a higher priority string.")
    ///             .font(.largeTitle)
    ///             .layoutPriority(1)
    ///             .border(Color.gray)
    ///     }
    ///
    /// In the example above, the first ``Text`` element has the default
    /// priority `0` which causes its view to shrink dramatically due to the
    /// higher priority of the second ``Text`` element, even though all of their
    /// other attributes (font, font size and character count) are the same.
    ///
    /// ![A screenshot showing twoText views different layout
    /// priorities.](SwiftUI-View-layoutPriority.png)
    ///
    /// A parent layout offers the child views with the highest layout priority
    /// all the space offered to the parent minus the minimum space required for
    /// all its lower-priority children.
    ///
    /// - Parameter value: The priority by which a parent layout apportions
    ///   space to the child.
    @inlinable public func layoutPriority(_ value: Double) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for text fields within this view.
    public func textFieldStyle<S>(_ style: S) -> some View where S : TextFieldStyle

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Masks this view using the alpha channel of the given view.
    ///
    /// Use `mask(_:)` when you want to apply the alpha (opacity) value of
    /// another view to the current view.
    ///
    /// This example shows an image masked by rectangle with a 10% opacity:
    ///
    ///     Image(systemName: "envelope.badge.fill")
    ///         .foregroundColor(Color.blue)
    ///         .font(.system(size: 128, weight: .regular))
    ///         .mask(Rectangle().opacity(0.1))
    ///
    /// ![A screenshot of a view masked by a rectangle with 10%
    /// opacity.](SwiftUI-View-mask.png)
    ///
    /// - Parameter mask: The view whose alpha the rendering system applies to
    ///   the specified view.
    @inlinable public func mask<Mask>(_ mask: Mask) -> some View where Mask : View

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Configures the view's title for purposes of navigation.
    ///
    /// A view's navigation title is used to visually display
    /// the current navigation state of an interface.
    /// On iOS and watchOS, when a view is navigated to inside
    /// of a navigation view, that view's title is displayed
    /// in the navigation bar. On iPadOS, the primary destination's
    /// navigation title is reflected as the window's title in the
    /// App Switcher. Similarly on macOS, the primary destination's title
    /// is used as the window title in the titlebar, Windows menu
    /// and Mission Control.
    ///
    /// - Parameter title: The title to display.
    public func navigationTitle(_ title: Text) -> some View


    /// Configures the view's title for purposes of navigation,
    /// using a localized string.
    ///
    /// A view's navigation title is used to visually display
    /// the current navigation state of an interface.
    /// On iOS and watchOS, when a view is navigated to inside
    /// of a navigation view, that view's title is displayed
    /// in the navigation bar. On iPadOS, the primary destination's
    /// navigation title is reflected as the window's title in the
    /// App Switcher. Similarly on macOS, the primary destination's title
    /// is used as the window title in the titlebar, Windows menu
    /// and Mission Control.
    ///
    /// - Parameter titleKey: The key to a localized string to display.
    public func navigationTitle(_ titleKey: LocalizedStringKey) -> some View


    /// Configures the view's title for purposes of navigation, using a string.
    ///
    /// A view's navigation title is used to visually display
    /// the current navigation state of an interface.
    /// On iOS and watchOS, when a view is navigated to inside
    /// of a navigation view, that view's title is displayed
    /// in the navigation bar. On iPadOS, the primary destination's
    /// navigation title is reflected as the window's title in the
    /// App Switcher. Similarly on macOS, the primary destination's title
    /// is used as the window title in the titlebar, Windows menu
    /// and Mission Control.
    ///
    /// - Parameter title: The string to display.
    public func navigationTitle<S>(_ title: S) -> some View where S : StringProtocol

}

@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Configures the title display mode for this view.
    ///
    /// - Parameter displayMode: The style to use for displaying the title.
    public func navigationBarTitleDisplayMode(_ displayMode: NavigationBarItem.TitleDisplayMode) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an accessibility adjustable action to the view.
    public func accessibilityAdjustableAction(_ handler: @escaping (AccessibilityAdjustmentDirection) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// The default store used by `AppStorage` contained within the view.
    ///
    /// If unspecified, the default store for a view hierarchy is
    /// `UserDefaults.standard`, but can be set a to a custom one. For example,
    /// sharing defaults between an app and an extension can override the
    /// default store to one created with `UserDefaults.init(suiteName:_)`.
    ///
    /// - Parameter store: The user defaults to use as the default
    ///   store for `AppStorage`.
    public func defaultAppStorage(_ store: UserDefaults) -> some View

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Defines the destination of a drag-and-drop operation that handles the
    /// dropped content with a closure that you specify.
    ///
    /// The drop destination is the same size and position as this view.
    ///
    /// - Parameters:
    ///   - supportedContentTypes: The uniform type identifiers that describe the
    ///     types of content this view can accept through drag and drop.
    ///     If the drag and drop operation doesn't contain any of the supported
    ///     types, then this drop destination doesn't activate and `isTargeted`
    ///     doesn't update.
    ///   - isTargeted: A binding that updates when a drag and drop operation
    ///     enters or exits the drop target area. The binding's value is `true` when
    ///     the cursor is inside the area, and `false` when the cursor is outside.
    ///   - action: A closure that takes the dropped content and responds
    ///     appropriately. The parameter to `action` contains the dropped
    ///     items, with types specified by `supportedContentTypes`. Return `true`
    ///     if the drop operation was successful; otherwise, return `false`.
    ///
    /// - Returns: A view that provides a drop destination for a drag
    ///   operation of the specified types.
    public func onDrop(of supportedContentTypes: [UTType], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider]) -> Bool) -> some View


    /// Defines the destination of a drag and drop operation that handles the
    /// dropped content with a closure that you specify.
    ///
    /// The drop destination is the same size and position as this view.
    ///
    /// - Parameters:
    ///   - supportedContentTypes: The uniform type identifiers that describe
    ///     the types of content this view can accept through drag and drop.
    ///     If the drag and drop operation doesn't contain any of the supported
    ///     types, then this drop destination doesn't activate and `isTargeted`
    ///     doesn't update.
    ///   - isTargeted: A binding that updates when a drag and drop operation
    ///     enters or exits the drop target area. The binding's value is `true` when
    ///     the cursor is inside the area, and `false` when the cursor is outside.
    ///   - action: A closure that takes the dropped content and responds
    ///     appropriately. The first parameter to `action` contains the dropped
    ///     items, with types specified by `supportedContentTypes`. The second
    ///     parameter contains the drop location in this view's coordinate
    ///     space. Return `true` if the drop operation was successful;
    ///     otherwise, return `false`.
    ///
    /// - Returns: A view that provides a drop destination for a drag
    ///   operation of the specified types.
    public func onDrop(of supportedContentTypes: [UTType], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider], CGPoint) -> Bool) -> some View


    /// Defines the destination of a drag and drop operation using behavior
    /// controlled by the delegate that you provide.
    ///
    /// The drop destination is the same size and position as this view.
    ///
    /// - Parameters:
    ///   - supportedContentTypes: The uniform type identifiers that describe the
    ///     types of content this view can accept through drag and drop.
    ///     If the drag and drop operation doesn't contain any of the supported
    ///     types, then this drop destination doesn't activate and `isTargeted`
    ///     doesn't update.
    ///   - delegate: A type that conforms to the ``DropDelegate`` protocol. You
    ///     have comprehensive control over drop behavior when you use a
    ///     delegate.
    ///
    /// - Returns: A view that provides a drop destination for a drag
    ///   operation of the specified types.
    public func onDrop(of supportedContentTypes: [UTType], delegate: DropDelegate) -> some View

}

@available(iOS, introduced: 13.4, deprecated: 100000.0, message: "Provide `UTType`s as the `supportedContentTypes` instead.")
@available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Provide `UTType`s as the `supportedContentTypes` instead.")
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Defines the destination for a drag and drop operation, using the same
    /// size and position as this view, handling dropped content with the given
    /// closure.
    ///
    /// - Parameters:
    ///   - supportedTypes: The uniform type identifiers that describe the
    ///     types of content this view can accept through drag and drop.
    ///     If the drag and drop operation doesn't contain any of the supported
    ///     types, then this drop destination doesn't activate and `isTargeted`
    ///     doesn't update.
    ///   - isTargeted: A binding that updates when a drag and drop operation
    ///     enters or exits the drop target area. The binding's value is `true`
    ///     when the cursor is inside the area, and `false` when the cursor is
    ///     outside.
    ///   - action: A closure that takes the dropped content and responds
    ///     appropriately. The parameter to `action` contains the dropped
    ///     items, with types specified by `supportedTypes`. Return `true`
    ///     if the drop operation was successful; otherwise, return `false`.
    /// - Returns: A view that provides a drop destination for a drag
    ///   operation of the specified types.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onDrop(of supportedTypes: [String], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider]) -> Bool) -> some View


    /// Defines the destination for a drag and drop operation with the same size
    /// and position as this view, handling dropped content and the drop
    /// location with the given closure.
    ///
    /// - Parameters:
    ///   - supportedTypes: The uniform type identifiers that describe the
    ///     types of content this view can accept through drag and drop.
    ///     If the drag and drop operation doesn't contain any of the supported
    ///     types, then this drop destination doesn't activate and `isTargeted`
    ///     doesn't update.
    ///   - isTargeted: A binding that updates when a drag and drop operation
    ///     enters or exits the drop target area. The binding's value is `true`
    ///     when the cursor is inside the area, and `false` when the cursor is
    ///     outside.
    ///   - action: A closure that takes the dropped content and responds
    ///     appropriately. The first parameter to `action` contains the dropped
    ///     items, with types specified by `supportedTypes`. The second
    ///     parameter contains the drop location in this view's coordinate
    ///     space. Return `true` if the drop operation was successful;
    ///     otherwise, return `false`.
    /// - Returns: A view that provides a drop destination for a drag
    ///   operation of the specified types.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onDrop(of supportedTypes: [String], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider], CGPoint) -> Bool) -> some View


    /// Defines the destination for a drag and drop operation with the same size
    /// and position as this view, with behavior controlled by the given
    /// delegate.
    ///
    /// - Parameters:
    ///   - supportedTypes: The uniform type identifiers that describe the
    ///     types of content this view can accept through drag and drop.
    ///     If the drag and drop operation doesn't contain any of the supported
    ///     types, then this drop destination doesn't activate and `isTargeted`
    ///     doesn't update.
    ///   - delegate: A type that conforms to the `DropDelegate` protocol. You
    ///     have comprehensive control over drop behavior when you use a
    ///     delegate.
    /// - Returns: A view that provides a drop destination for a drag
    ///   operation of the specified types.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onDrop(of supportedTypes: [String], delegate: DropDelegate) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies a projection transformation to this view's rendered output.
    ///
    /// Use `projectionEffect(_:)` to apply a 3D transformation to the view.
    ///
    /// The example below rotates the text 30˚ around the `z` axis, which is the
    /// axis pointing out of the screen:
    ///
    ///     // This transform represents a 30˚ rotation around the z axis.
    ///     let transform = CATransform3DMakeRotation(
    ///         -30 * (.pi / 180), 0.0, 0.0, 1.0)
    ///
    ///     Text("Projection effects using transforms")
    ///         .projectionEffect(.init(transform))
    ///         .border(Color.gray)
    ///
    /// ![A screenshot showing text rotated 30 degrees around the axis pointing
    /// out of the screen.](SwiftUI-View-projectionEffect.png)
    ///
    /// - Parameter transform: A ``ProjectionTransform`` to apply to the view.
    @inlinable public func projectionEffect(_ transform: ProjectionTransform) -> some View

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {

    /// Adds help text to a view using a localized string that you provide.
    ///
    /// Adding help to a view configures the view's accessibility hint and
    /// its tooltip ("help tag") on macOS.
    ///
    /// For more information on using help tags, see [Help]
    /// (https://developer.apple.com/design/human-interface-guidelines/macos/user-interaction/help/)
    /// in the macOS Human Interface Guidelines.
    ///
    ///     Button(action: composeMessage) {
    ///         Image(systemName: "square.and.pencil")
    ///     }
    ///     .help("Compose a new message")
    ///
    /// - Parameter textKey: The key for the localized text to use as help.
    public func help(_ textKey: LocalizedStringKey) -> some View


    /// Adds help text to a view using a text view that you provide.
    ///
    /// Adding help to a view configures the view's accessibility hint and
    /// its tooltip ("help tag") on macOS.
    ///
    /// For more information on using help tags, see [Help]
    /// (https://developer.apple.com/design/human-interface-guidelines/macos/user-interaction/help/)
    /// in the macOS Human Interface Guidelines.
    ///
    ///     Slider("Opacity", value: $selectedShape.opacity)
    ///         .help(Text("Adjust the opacity of the selected \(selectedShape.name)"))
    ///
    /// - Parameter text: The Text view to use as help.
    public func help(_ text: Text) -> some View


    /// Adds help text to a view using a string that you provide.
    ///
    /// Adding help to a view configures the view's accessibility hint and
    /// its tooltip ("help tag") on macOS.
    ///
    /// For more information on using help tags, see [Help]
    /// (https://developer.apple.com/design/human-interface-guidelines/macos/user-interaction/help/)
    /// in the macOS Human Interface Guidelines.
    ///
    ///     Image(systemName: "pin.circle")
    ///         .foregroundColor(pointOfInterest.tintColor)
    ///         .help(pointOfInterest.name)
    ///
    /// - Parameter text: The text to use as help.
    public func help<S>(_ text: S) -> some View where S : StringProtocol

}

@available(iOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
extension View {

    /// Sets the visibility of the status bar.
    ///
    /// Use `statusBar(hidden:)` to show or hide the status bar.
    ///
    /// - Parameter hidden: A Boolean value that indicates whether to hide the
    ///   status bar.
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func statusBar(hidden: Bool) -> some View

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Supplies an `ObservableObject` to a view subhierachy.
    ///
    /// The object can be read by any child by using `EnvironmentObject`.
    ///
    /// - Parameter object: the object to store and make available to
    ///     the view's subhiearchy.
    @inlinable public func environmentObject<T>(_ object: T) -> some View where T : ObservableObject

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Presents an alert to the user.
    ///
    /// - Parameters:
    ///   - item: A binding to an optional source of truth for the alert.
    ///     When representing a non-`nil` item, the system uses `content` to
    ///     create an alert representation of the item.
    ///     If the identity changes, the system dismisses a
    ///     currently-presented alert and replace it by a new alert.
    ///   - content: A closure returning the alert to present.
    public func alert<Item>(item: Binding<Item?>, content: (Item) -> Alert) -> some View where Item : Identifiable


    /// Presents an alert to the user.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to whether the alert should be shown.
    ///   - content: A closure returning the alert to present.
    public func alert(isPresented: Binding<Bool>, content: () -> Alert) -> some View

}

extension View {

    /// Sets the navigation bar items for this view.
    ///
    /// Use `navigationBarItems(leading:trailing:)` to add navigation bar items
    /// to the leading and trailing edges of the navigation bar for this view.
    ///
    /// This modifier only takes effect when this view is inside of and visible
    /// within a ``NavigationView``.
    ///
    /// On iOS 14 and later, the leading item supplements a visible back button,
    /// instead of replacing it, by default. To hide the back button, use
    /// ``View/navigationBarBackButtonHidden(_:)``.
    ///
    /// The example below adds buttons to the leading and trailing edges of
    /// the button area of the navigation view:
    ///
    ///     struct FlavorView: View {
    ///         var body: some View {
    ///             NavigationView {
    ///                 List {
    ///                     Text("Chocolate")
    ///                     Text("Vanilla")
    ///                     Text("Strawberry")
    ///                 }
    ///                 .navigationBarTitle(Text("Today‘s Flavors"))
    ///                 .navigationBarItems(leading:
    ///                     HStack {
    ///                         Button("Hours") {
    ///                             print("Hours tapped!")
    ///                         }
    ///                     }, trailing:
    ///                     HStack {
    ///                         Button("Favorites") {
    ///                             print("Favorites tapped!")
    ///                         }
    ///
    ///                         Button("Specials") {
    ///                             print("Specials tapped!")
    ///                         }
    ///                     }
    ///                 )
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - leading: A view that appears on the leading edge of the title.
    ///   - trailing: A view that appears on the trailing edge of the title.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use toolbar(_:) with navigationBarLeading or navigationBarTrailing placement")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use toolbar(_:) with navigationBarLeading or navigationBarTrailing placement")
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public func navigationBarItems<L, T>(leading: L, trailing: T) -> some View where L : View, T : View


    /// Sets the navigation bar items for this view.
    ///
    /// Use `navigationBarItems(leading:)` to add navigation bar items to the
    /// leading edge of the navigation bar for this view.
    ///
    /// This modifier only takes effect when this view is inside of and visible
    /// within a ``NavigationView``.
    ///
    /// On iOS 14 and later, the leading item supplements a visible back button,
    /// instead of replacing it, by default. To hide the back button, use
    /// ``View/navigationBarBackButtonHidden(_:)``.
    ///
    /// The example below adds buttons to the leading edge of the button area
    /// of the navigation view:
    ///
    ///     struct FlavorView: View {
    ///         var body: some View {
    ///             NavigationView {
    ///                 List {
    ///                     Text("Chocolate")
    ///                     Text("Vanilla")
    ///                     Text("Strawberry")
    ///                 }
    ///                 .navigationBarTitle(Text("Today's Flavors"))
    ///                 .navigationBarItems(leading:
    ///                     HStack {
    ///                         Button("Hours") {
    ///                             print("Hours tapped!")
    ///                         }
    ///
    ///                         Button("Help") {
    ///                             print("Help tapped!")
    ///                         }
    ///                     }
    ///                 )
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameter leading: A view that appears on the leading edge of the
    ///   title.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use toolbar(_:) with navigationBarLeading or navigationBarTrailing placement")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use toolbar(_:) with navigationBarLeading or navigationBarTrailing placement")
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public func navigationBarItems<L>(leading: L) -> some View where L : View


    /// Configures the navigation bar items for this view.
    ///
    /// Use `navigationBarItems(trailing:)` to add navigation bar items to the
    /// trailing edge of the navigation bar for this view. This modifier only
    /// takes effect when this view is inside of and visible within a
    /// ``NavigationView``.
    ///
    /// The example below adds buttons to the trailing edge of the button area
    /// of the navigation view:
    ///
    ///     struct FlavorView: View {
    ///         var body: some View {
    ///             NavigationView {
    ///                 List {
    ///                     Text("Chocolate")
    ///                     Text("Vanilla")
    ///                     Text("Strawberry")
    ///                 }
    ///                 .navigationBarTitle(Text("Today‘s Flavors"))
    ///                 .navigationBarItems(trailing:
    ///                     HStack {
    ///                         Button("Hours") {
    ///                             print("Hours tapped!")
    ///                         }
    ///
    ///                         Button("Help") {
    ///                             print("Help tapped!")
    ///                         }
    ///                     }
    ///                 )
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameter trailing: A view shown on the trailing edge of the title.
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use toolbar(_:) with navigationBarLeading or navigationBarTrailing placement")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use toolbar(_:) with navigationBarLeading or navigationBarTrailing placement")
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public func navigationBarItems<T>(trailing: T) -> some View where T : View

}

/// A custom parameter attribute that constructs views from closures.
///
/// You typically use ``ViewBuilder`` as a parameter attribute for child
/// view-producing closure parameters, allowing those closures to provide
/// multiple child views. For example, the following `contextMenu` function
/// accepts a closure that produces one or more views via the view builder.
///
///     func contextMenu<MenuItems : View>(
///         @ViewBuilder menuItems: () -> MenuItems
///     ) -> some View
///
/// Clients of this function can use multiple-statement closures to provide
/// several child views, as shown in the following example:
///
///     myView.contextMenu {
///         Text("Cut")
///         Text("Copy")
///         Text("Paste")
///         if isSymbol {
///             Text("Jump to Definition")
///         }
///     }
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@_functionBuilder public struct ViewBuilder {

    /// Builds an empty view from a block containing no statements.
    public static func buildBlock() -> EmptyView

    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`.
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf<Content>(_ content: Content?) -> Content? where Content : View

    /// Provides support for "if" statements in multi-statement closures,
    /// producing conditional content for the "then" branch.
    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View

    /// Provides support for "if-else" statements in multi-statement closures,
    /// producing conditional content for the "else" branch.
    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ViewBuilder {

    /// Provides support for "if" statements with `#available()` clauses in
    /// multi-statement closures, producing conditional content for the "then"
    /// branch, i.e. the conditionally-available branch.
    public static func buildLimitedAvailability<Content>(_ content: Content) -> AnyView where Content : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)> where C0 : View, C1 : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> TupleView<(C0, C1, C2)> where C0 : View, C1 : View, C2 : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> TupleView<(C0, C1, C2, C3)> where C0 : View, C1 : View, C2 : View, C3 : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> TupleView<(C0, C1, C2, C3, C4)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> TupleView<(C0, C1, C2, C3, C4, C5)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> TupleView<(C0, C1, C2, C3, C4, C5, C6)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View
}

/// A view's size and its alignment guides in its own coordinate space.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ViewDimensions {

    /// The view's width.
    public var width: CGFloat { get }

    /// The view's height.
    public var height: CGFloat { get }

    /// Gets the value of the given horizontal guide.
    public subscript(guide: HorizontalAlignment) -> CGFloat { get }

    /// Gets the value of the given vertical guide.
    public subscript(guide: VerticalAlignment) -> CGFloat { get }

    /// Gets the explicit value of the given alignment guide in this view, or
    /// `nil` if no such value exists.
    public subscript(explicit guide: HorizontalAlignment) -> CGFloat? { get }

    /// Gets the explicit value of the given alignment guide in this view, or
    /// `nil` if no such value exists.
    public subscript(explicit guide: VerticalAlignment) -> CGFloat? { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewDimensions : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ViewDimensions, rhs: ViewDimensions) -> Bool
}

/// A modifier that you apply to a view or another view modifier, producing a
/// different version of the original value.
///
/// Adopt the ``ViewModifier`` protocol when you want to create a reusable
/// modifier that you can apply to any view. The example below combines several
/// modifiers to create a new modifier that you can use to create blue caption
/// text surrounded by a rounded rectangle:
///
///     struct BorderedCaption: ViewModifier {
///         func body(content: Content) -> some View {
///             content
///                 .font(.caption2)
///                 .padding(10)
///                 .overlay(
///                     RoundedRectangle(cornerRadius: 15)
///                         .stroke(lineWidth: 1)
///                 )
///                 .foregroundColor(Color.blue)
///         }
///     }
///
/// You can apply ``modifier(_:)`` directly to a view, but a more common and
/// idiomatic approach uses ``modifier(_:)`` to define an extension to
/// ``View`` itself that incorporates the view modifier:
///
///     extension View {
///         func borderedCaption() -> some View {
///             modifier(BorderedCaption())
///         }
///     }
///
/// You can then apply the bordered caption to any view, similar to this:
///
///     Image(systemName: "bus")
///         .resizable()
///         .frame(width:50, height:50)
///     Text("Downtown Bus")
///         .borderedCaption()
///
/// ![A screenshot showing the image of a bus with a caption reading
/// Downtown Bus. A view extension, using custom a modifier, renders the
///  caption in blue text surrounded by a rounded
///  rectangle.](SwiftUI-View-ViewModifier.png)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ViewModifier {

    /// The type of view representing the body.
    associatedtype Body : View

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    func body(content: Self.Content) -> Self.Body

    /// The content view type passed to `body()`.
    typealias Content
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewModifier where Self.Body == Never {

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    public func body(content: Self.Content) -> Self.Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewModifier {

    /// Returns a new modifier that is the result of concatenating
    /// `self` with `modifier`.
    @inlinable public func concat<T>(_ modifier: T) -> ModifiedContent<Self, T>
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewModifier {

    /// Returns a new version of the modifier that will apply the
    /// transaction mutation function `transform` to all transactions
    /// within the modifier.
    @inlinable public func transaction(_ transform: @escaping (inout Transaction) -> Void) -> some ViewModifier


    /// Returns a new version of the modifier that will apply
    /// `animation` to all animatable values within the modifier.
    @inlinable public func animation(_ animation: Animation?) -> some ViewModifier

}

/// A system style of date picker that displays each component as columns
/// in a scrollable wheel.
@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WheelDatePickerStyle : DatePickerStyle {

    public init()
}

/// A picker style that presents the options in a scrollable wheel that shows
/// the selected option and a few neighboring options.
///
/// Because most options aren't visible, organize them in a predictable order,
/// such as alphabetically.
///
/// To apply this style to a picker, or to a view that contains pickers, use the
/// ``View/pickerStyle(_:)`` modifier.
@available(iOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
public struct WheelPickerStyle : PickerStyle {

    /// Sets the picker style to display an item wheel from which the user makes
    /// a selection.
    public init()
}

/// The configuration and content of a widget to display on the Home screen or
/// in Notification Center.
///
/// Widgets show glanceable and relevant content from your app right on the iOS
/// Home screen or in Notification Center on macOS. Users can add, configure, and
/// arrange widgets to suit their individual needs. You can provide multiple
/// types of widgets, each presenting a specific kind of information. When
/// users want more information, like to read the full article for a headline
/// or to see the details of a package delivery, the widget lets them get to
/// the information in your app quickly.
///
/// There are three key components to a widget:
///
/// * A configuration that determines whether the widget is configurable,
///   identifies the widget, and defines the SwiftUI views that show the
///   widget's content.
/// * A timeline provider that drives the process of updating the widget's view
///   over time.
/// * SwiftUI views used by WidgetKit to display the widget.
///
/// For information about adding a widget extension to your app, and keeping
/// your widget up to date, see
/// <doc://com.apple.documentation/documentation/WidgetKit/Creating-a-Widget-Extension>
/// and
/// <doc://com.apple.documentation/documentation/WidgetKit/Keeping-a-Widget-Up-To-Date>,
/// respectively.
///
/// By adding a custom SiriKit intent definition, you can let users customize
/// their widgets to show the information that's most relevant to them. If
/// you've already added support for Siri or Shortcuts, you're well on your way
/// to supporting customizable widgets. For more information, see
/// <doc://com.apple.documentation/documentation/WidgetKit/Making-a-Configurable-Widget>.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol Widget {

    /// The type of configuration representing the content of the widget.
    ///
    /// When you create a custom widget, Swift infers this type from your
    /// implementation of the required ``Widget/body-swift.property`` property.
    associatedtype Body : WidgetConfiguration

    /// Creates a widget using `body` as its content.
    init()

    /// The content and behavior of the widget.
    ///
    /// For any widgets that you create, provide a computed `body` property that
    /// defines the widget as a composition of SwiftUI views.
    ///
    /// Swift infers the widget's ``SwiftUI/Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    var body: Self.Body { get }
}

/// A container used to expose multiple widgets from a single widget extension.
///
/// To support multiple types of widgets, add the `@main` attribute to a
/// structure that conforms to `WidgetBundle`. For example, a game might have
/// one widget to display summary information about the game and a second
/// widget to display detailed information about individual characters.
///
///     @main
///     struct GameWidgets: WidgetBundle {
///        var body: some Widget {
///            GameStatusWidget()
///            CharacterDetailWidget()
///        }
///     }
///
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol WidgetBundle {

    /// The type of widget that represents the content of the bundle.
    ///
    /// When you support more than one widget, Swift infers this type from your
    /// implementation of the required ``WidgetBundle/body-swift.property``
    /// property.
    associatedtype Body : Widget

    /// Creates a widget bundle using the bundle's body as its content.
    init()

    /// Declares the group of widgets that an app supports.
    ///
    /// The order that the widgets appear in this property determines the order
    /// they are shown to the user when adding a widget. The following example
    /// shows how to use a widget bundle builder to define a body showing
    /// a game status widget first and a character detail widget second:
    ///
    ///     @main
    ///     struct GameWidgets: WidgetBundle {
    ///        var body: some Widget {
    ///            GameStatusWidget()
    ///            CharacterDetailWidget()
    ///        }
    ///     }
    ///
    @WidgetBundleBuilder var body: Self.Body { get }
}

/// A custom attribute that constructs a widget bundle's body.
///
/// Use the `@WidgetBundleBuilder` attribute to group multiple widgets listed
/// in the ``WidgetBundle/body-swift.property`` property of a widget bundle.
/// For example, the following code defines a widget bundle that consists of
/// two widgets.
///
///     @main
///     struct GameWidgets: WidgetBundle {
///        @WidgetBundleBuilder
///        var body: some Widget {
///            GameStatusWidget()
///            CharacterDetailWidget()
///        }
///     }
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@_functionBuilder public struct WidgetBundleBuilder {

    /// Builds an empty Widget from an block containing no statements, `{ }`.
    public static func buildBlock() -> some Widget


    /// Builds a single Widget written as a child view (e..g, `{ MyWidget() }`)
    /// through unmodified.
    public static func buildBlock<Content>(_ content: Content) -> some Widget where Content : Widget

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WidgetBundleBuilder {

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some Widget where C0 : Widget, C1 : Widget

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WidgetBundleBuilder {

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some Widget where C0 : Widget, C1 : Widget, C2 : Widget

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WidgetBundleBuilder {

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some Widget where C0 : Widget, C1 : Widget, C2 : Widget, C3 : Widget

}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WidgetBundleBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some Widget where C0 : Widget, C1 : Widget, C2 : Widget, C3 : Widget, C4 : Widget

}

/// A type that describes a widget's content.
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol WidgetConfiguration {

    /// The type of widget configuration representing the body of
    /// this configuration.
    ///
    /// When you create a custom widget, Swift infers this type from your
    /// implementation of the required `body` property.
    associatedtype Body : WidgetConfiguration

    /// The content and behavior of this widget.
    var body: Self.Body { get }
}

/// A scene that presents a group of identically structured windows.
///
/// Use a `WindowGroup` as a container for a view hierarchy presented by your
/// app. The hierarchy that you declare as the group's content serves as a
/// template for each window that the app creates from that group:
///
///     @main
///     struct Mail: App {
///         var body: some Scene {
///             WindowGroup {
///                 MailViewer() // Declare a view hierarchy here.
///             }
///         }
///     }
///
/// SwiftUI takes care of certain platform-specific behaviors. For example,
/// on platforms that support it, like macOS and iPadOS, users can open more
/// than one window from the group simultaneously. In macOS, users
/// can gather open windows together in a tabbed interface. Also in macOS,
/// window groups automatically provide commands for standard window
/// management.
///
/// Every window created from the group maintains independent state. For
/// example, for each new window created from the group the system allocates new
/// storage for any ``State`` or ``StateObject`` variables instantiated by the
/// scene's view hierarchy.
///
/// You typically use a window group for the main interface of an app that isn't
/// document-based. For document-based apps, use a ``DocumentGroup`` instead.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct WindowGroup<Content> : Scene where Content : View {

    /// Creates a window group with an identifier.
    ///
    /// The window group uses the given view as a
    /// template to form the content of each window in the group.
    ///
    /// - Parameters:
    ///   - id: A string that uniquely identifies the window group. Identifiers
    ///     must be unique among the window groups in your app.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init(id: String, @ViewBuilder content: () -> Content)

    /// Creates a window group with a localized title and an identifier.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    /// The system ignores any text styling in the title.
    ///
    /// - Parameters:
    ///   - title: The ``Text`` view to use for the group's title.
    ///   - id: A string that uniquely identifies the window group. Identifiers
    ///     must be unique among the window groups in your app.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init(_ title: Text, id: String, @ViewBuilder content: () -> Content)

    /// Creates a window group with a key for localized title string and an
    /// identifier.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    ///
    /// - Parameters:
    ///   - titleKey: The title key to use for the title of the group.
    ///   - id: A string that uniquely identifies the window group. Identifiers
    ///     must be unique among the window groups in your app.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init(_ titleKey: LocalizedStringKey, id: String, @ViewBuilder content: () -> Content)

    /// Creates a window group with a title string and an identifier.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    ///
    /// - Parameters:
    ///   - title: The string to use for the title of the group.
    ///   - id: A string that uniquely identifies the window group. Identifiers
    ///     must be unique among the window groups in your app.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init<S>(_ title: S, id: String, @ViewBuilder content: () -> Content) where S : StringProtocol

    /// Creates a window group.
    ///
    /// The window group using the given view as a template to form the
    /// content of each window in the group.
    ///
    /// - Parameter content: A closure that creates the content for each
    ///   instance of the group.
    public init(@ViewBuilder content: () -> Content)

    /// Creates a window group with a localized title.
    ///
    /// The window group uses the given view as a
    /// template to form the content of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    /// The system ignores any text styling in the title.
    ///
    /// - Parameters:
    ///   - title: The ``Text`` view to use for the group's title.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init(_ title: Text, @ViewBuilder content: () -> Content)

    /// Creates a window group with a key for localized title string.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    ///
    /// - Parameters:
    ///   - titleKey: The title key to use for the group's title.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content)

    /// Creates a window group with a title string.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    ///
    /// - Parameters:
    ///   - title: The string to use for the title of the group.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    public init<S>(_ title: S, @ViewBuilder content: () -> Content) where S : StringProtocol

    /// The content and behavior of the scene.
    ///
    /// For any scene that you create, provide a computed `body` property that
    /// defines the scene as a composition of other scenes. You can assemble a
    /// scene from primitive scenes that SwiftUI provides, as well as other
    /// scenes that you've defined.
    ///
    /// Swift infers the scene's ``SwiftUI/Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    public var body: some Scene { get }

    /// The type of scene that represents the body of this scene.
    ///
    /// When you create a custom scene, Swift infers this type from your
    /// implementation of the required ``SwiftUI/Scene/body-swift.property``
    /// property.
    public typealias Body = some Scene
}

/// A view that overlays its children, aligning them in both axes.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ZStack<Content> : View where Content : View {

    /// Creates an instance with the given alignment.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack on both
    ///     axis.
    ///   - content: A view builder that creates the content of this stack.
    @inlinable public init(alignment: Alignment = .center, @ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// Returns the result of recomputing the view's body with the provided
/// animation.
///
/// This function sets the given ``Animation`` as the ``Transaction/animation``
/// property of the thread's current ``Transaction``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public func withAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result

/// Executes a closure with the specified transaction and returns the result.
///
/// - Parameters:
///   - transaction : An instance of a transaction, set as the thread's current
///     transaction.
///   - body: A closure to execute.
///
/// - Returns: The result of executing the closure with the specified
///   transaction.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public func withTransaction<Result>(_ transaction: Transaction, _ body: () throws -> Result) rethrows -> Result

extension NSDirectionalEdgeInsets {

    /// Create edge insets from the equivalent EdgeInsets.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, *)
    @available(watchOS, unavailable)
    public init(_ edgeInsets: EdgeInsets)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Never {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never

    /// The content and behavior of the view.
    public var body: Never { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGPoint {

    public func applying(_ m: ProjectionTransform) -> CGPoint
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Never : Gesture {

    /// The type representing the gesture's value.
    public typealias Value = Never
}

/// Extends `T?` to conform to `Gesture` type if `T` also conforms to
/// `Gesture`. A nil value is mapped to an empty (i.e. failing)
/// gesture.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Optional : Gesture where Wrapped : Gesture {

    /// The type representing the gesture's value.
    public typealias Value = Wrapped.Value
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension NSUserActivity {

    /// Error types when getting/setting typed payload
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public enum TypedPayloadError : Error {

        /// UserInfo is empty or invalid
        case invalidContent

        /// Content failed to encode into a valid Dictionary
        case encodingError

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: NSUserActivity.TypedPayloadError, b: NSUserActivity.TypedPayloadError) -> Bool

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
        public func hash(into hasher: inout Hasher)
    }

    /// Given a Codable Swift type, return an instance decoded from the
    /// NSUserActivity's userInfo dictionary
    ///
    /// - Parameter type: the instance type to be decoded from userInfo
    /// - Returns: the type safe instance or raises if it can't be decoded
    public func typedPayload<T>(_ type: T.Type) throws -> T where T : Decodable, T : Encodable

    /// Given an instance of a Codable Swift type, encode it into the
    /// NSUserActivity's userInfo dictionary
    ///
    /// - Parameter payload: the instance to be converted to userInfo
    public func setTypedPayload<T>(_ payload: T) throws where T : Decodable, T : Encodable
}

extension Never : Scene {
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Never : WidgetConfiguration {
}

extension Never : ToolbarContent, CustomizableToolbarContent {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Optional : View where Wrapped : View {

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Never : View {
}

extension RangeReplaceableCollection where Self : MutableCollection {

    /// Removes all the elements at the specified offsets from the collection.
    ///
    /// - Complexity: O(*n*) where *n* is the length of the collection.
    public mutating func remove(atOffsets offsets: IndexSet)
}

extension MutableCollection {

    /// Moves all the elements at the specified offsets to the specified
    /// destination offset, preserving ordering.
    ///
    /// - Complexity: O(*n* log *n*), where *n* is the length of the collection.
    public mutating func move(fromOffsets source: IndexSet, toOffset destination: Int)
}

extension UIColor {

    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    @available(macOS, unavailable)
    public convenience init(_ color: Color)
}

extension UIUserInterfaceStyle {

    /// Creates a user interface style from its ColorScheme equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ colorScheme: ColorScheme?)
}

extension UIAccessibilityContrast {

    /// Create a contrast from its ColorSchemeContrast equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ colorSchemeContrast: ColorSchemeContrast?)
}

extension UIContentSizeCategory {

    /// Create a size category from its ContentSizeCategory equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ sizeCategory: ContentSizeCategory?)
}

extension UITraitEnvironmentLayoutDirection {

    /// Create a direction from its LayoutDirection equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ layoutDirection: LayoutDirection)
}

extension UILegibilityWeight {

    /// Creates a legibility weight from its LegibilityWeight equivalent.
    @available(iOS 14.0, tvOS 14.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ legibilityWeight: LegibilityWeight?)
}

extension UIUserInterfaceSizeClass {

    /// Create a size class from its UserInterfaceSizeClass equivalent.
    @available(iOS 14.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ sizeClass: UserInterfaceSizeClass?)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGPoint : Animatable {

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<CGFloat, CGFloat>

    /// The data to animate.
    public var animatableData: CGPoint.AnimatableData
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGSize : Animatable {

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<CGFloat, CGFloat>

    /// The data to animate.
    public var animatableData: CGSize.AnimatableData
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGRect : Animatable {

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<CGPoint.AnimatableData, CGSize.AnimatableData>

    /// The data to animate.
    public var animatableData: CGRect.AnimatableData
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Float : VectorArithmetic {

    /// Multiplies each component of this value by the given value.
    public mutating func scale(by rhs: Double)

    /// Returns the dot-product of this vector arithmetic instance with itself.
    public var magnitudeSquared: Double { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Double : VectorArithmetic {

    /// Multiplies each component of this value by the given value.
    public mutating func scale(by rhs: Double)

    /// Returns the dot-product of this vector arithmetic instance with itself.
    public var magnitudeSquared: Double { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGFloat : VectorArithmetic {

    /// Multiplies each component of this value by the given value.
    public mutating func scale(by rhs: Double)

    /// Returns the dot-product of this vector arithmetic instance with itself.
    public var magnitudeSquared: Double { get }
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Never : Commands {
}
