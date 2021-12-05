//
//  SwiftUIDSTests.swift
//  SwiftUIDSTests
//
//  Created by Nitesh Tak on 14/8/21.
//

import XCTest
import ViewInspector
@testable import SwiftUIDS

class AppButtonTests: XCTestCase {

    func testExample() throws {
        let subject = AppButton(title: "Hello SwitUI", type: .primary) {
            print("button pressed")
        }
        let text = try subject.inspect().button().find(text: subject.title).string()
        XCTAssertEqual(text, "Hello SwitUI")
    }

}

extension AppButton: Inspectable {}
