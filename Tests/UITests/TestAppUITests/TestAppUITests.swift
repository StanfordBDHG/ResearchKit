//
// This source file is part of the Stanford Biodesign Digital Health Group open-source organization
//
// SPDX-FileCopyrightText: 2024 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import XCTest


class TestAppUITests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = false
    }
    
    
    func testTemplatePackage() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.staticTexts["Stanford University"].waitForExistence(timeout: 0.1))
    }
}
