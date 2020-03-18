//
//  String+HelpersTestCase.swift
//  SwiftUIDemoFoundationTests
//
//  Created by Wilson on 08.12.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftUIDemoFoundation

class StringTestCase: SwiftUIDemoTestCaseBase {
  func testShouldBeTrimmed() {
    XCTAssert(" Qwerty123 ".trimmed == "Qwerty123")
    XCTAssert(" Qwerty123".trimmed == "Qwerty123")
    XCTAssert("Qwerty123 ".trimmed == "Qwerty123")
    XCTAssert("""
                Qwerty123
              """.trimmed == "Qwerty123")
  }
}
