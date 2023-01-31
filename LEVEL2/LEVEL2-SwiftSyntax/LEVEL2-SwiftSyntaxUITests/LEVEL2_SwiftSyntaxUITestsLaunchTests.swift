//
//  LEVEL2_SwiftSyntaxUITestsLaunchTests.swift
//  LEVEL2-SwiftSyntaxUITests
//
//  Created by 강우원 on 2023/01/31.
//

import XCTest

final class LEVEL2_SwiftSyntaxUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
