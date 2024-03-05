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


struct ORKOrderedTaskViewTests: View {
    @Environment(\.dismiss)
    var dismiss

    var trailMarkingTask: ORKOrderedTask {
        .trailmakingTask(
            withIdentifier: "your-trailmaking-task-id",
            intendedUseDescription: "Tests visual attention and task switching",
            trailmakingInstruction: nil,
            trailType: .B,
            options: []
        )
    }

    var stroopTask: ORKOrderedTask {
        .stroopTask(
            withIdentifier: "StroopTask",
            intendedUseDescription: "Tests selective attention capacity and processing speed",
            numberOfAttempts: 5,
            options: [.excludeAudio]
        )
    }

    var body: some View {
        ORKOrderedTaskView(tasks: stroopTask, tintColor: .accentColor) { result in
            // TODO: do something with the result?
            dismiss()

            // TODO: pass the result to the latest main view?
        }
    }
}


#Preview {
    // TODO: preview!
    ORKOrderedTaskViewTests()
}
