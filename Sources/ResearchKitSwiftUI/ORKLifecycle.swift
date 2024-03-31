//
// This source file is part of the Stanford Biodesign Digital Health Group open-source organization
//
// SPDX-FileCopyrightText: 2024 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import ResearchKit
import SwiftUI


private struct ORKWillAppearMethod: EnvironmentKey {
    static let defaultValue: ((ORKTaskViewController, ORKStepViewController) -> Void)? = nil
}

private struct ORKWillDisappearMethod: EnvironmentKey {
    static let defaultValue: ((ORKTaskViewController, ORKStepViewController, ORKStepViewControllerNavigationDirection) -> Void)? = nil
}


extension EnvironmentValues {
    var onStepWillAppear: ((ORKTaskViewController, ORKStepViewController) -> Void)? {
        get {
            self[ORKWillAppearMethod.self]
        }
        set {
            self[ORKWillAppearMethod.self] = newValue
        }
    }

    var onStepWillDisappear: ((ORKTaskViewController, ORKStepViewController, ORKStepViewControllerNavigationDirection) -> Void)? {
        get {
            self[ORKWillDisappearMethod.self]
        }
        set {
            self[ORKWillDisappearMethod.self] = newValue
        }
    }
}


extension View {
    /// Add an action every time a step appears.
    ///
    /// This method adds a closure that is called by the underlying `ORKTaskViewController` once a new step is about to be displayed.
    ///
    /// - Note: This method bridges the [`taskViewController:stepViewControllerWillAppear:`](https://researchkit.org/docs/Protocols/ORKTaskViewControllerDelegate.html#//api/name/taskViewController:stepViewControllerWillAppear:)
    /// of the underlying `ORKTaskViewControllerDelegate` to the SwiftUI environment.
    /// - Parameter perform: The closure to be execute before the step is presented.
    /// - Returns: The modified view.
    @_spi(ORK)
    public func onStepWillAppear(
        perform closure: @escaping (ORKTaskViewController, ORKStepViewController) -> Void
    ) -> some View {
        environment(\.onStepWillAppear, closure)
    }

    /// Adds an action every time a step disappears.
    ///
    /// Add an action every time a step appears.
    ///
    /// This method adds a closure that is called by the underlying `ORKTaskViewController` once a step is about to disappear.
    ///
    /// - Note: This method bridges the [`taskViewController:stepViewControllerWillDisappear:navigationDirection:`](https://researchkit.org/docs/Protocols/ORKTaskViewControllerDelegate.html#//api/name/taskViewController:stepViewControllerWillDisappear:navigationDirection:)
    /// of the underlying `ORKTaskViewControllerDelegate` to the SwiftUI environment.
    /// - Parameter perform: The closure to be execute before the step disappears.
    /// - Returns: The modified view.
    @_spi(ORK)
    public func onStepWillDisappear(
        perform closure: @escaping (ORKTaskViewController, ORKStepViewController, ORKStepViewControllerNavigationDirection) -> Void
    ) -> some View {
        environment(\.onStepWillDisappear, closure)
    }
}
