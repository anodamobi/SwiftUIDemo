//
//  Bundle+SwiftUIDemoFoundationTestCase.swift
//  SwiftUIDemoFoundationTests
//
//  Created by Wilson on 04.12.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftUIDemoFoundation

class SwiftUIDemoFoundationBundleTestCase: SwiftUIDemoTestCaseBase {
  func testShouldReturnValidBundle() {
    XCTAssert(Bundle(identifier: "com.wilsons.SwiftUIDemoFoundation") == Bundle.SwiftUIDemoFoundation)
  }
}
