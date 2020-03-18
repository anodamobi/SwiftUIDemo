//
//  Bundle+SwiftUIDemoPlatformTestCase.swift
//  SwiftUIDemoPlatformTests
//
//  Created by Wilson on 04.12.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftUIDemoPlatform

class SwiftUIDemoPlatformBundleTestCase: SwiftUIDemoTestCaseBase {
  
  func testShouldReturnValidBundle() {
    XCTAssert(Bundle(identifier: "com.wilsons.SwiftUIDemoPlatform") == Bundle.SwiftUIDemoPlatform)
  }
}
