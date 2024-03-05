//
// This source file is part of the Stanford Biodesign Digital Health Group open-source organization
//
// SPDX-FileCopyrightText: 2024 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SwiftUI
import ResearchKit
import ResearchKitSwiftUI


@main
struct UITestsApp: App {
    @State private var showTask = false

    var body: some Scene {
        WindowGroup {
            List {
                Button("Show Task") {
                    showTask = true
                }
            }
                .sheet(isPresented: $showTask) {
                    ORKOrderedTaskViewTests()
                }
        }
    }
}
