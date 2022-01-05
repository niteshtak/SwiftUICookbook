//
//  SwiftUIDSTests.swift
//  SwiftUIDSTests
//
//  Created by Nitesh Tak on 14/8/21.
//

import XCTest
@testable import SwiftUIDS

class AppButtonTests: XCTestCase {

    func testExample() throws {
        let subject = AppButton(title: "Hello SwitUI", type: .primary) {
            print("button pressed")
        }
        let text = subject.title
        XCTAssertEqual(text, "Hello SwitUI")
    }
}
