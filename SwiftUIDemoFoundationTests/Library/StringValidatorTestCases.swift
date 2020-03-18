//
//  StringValidatorTestCases.swift
//  SwiftUIDemoFoundationTests
//
//  Created by Wilson on 07.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftUIDemoFoundation

class EmailValidatorTestCase: SwiftUIDemoTestCaseBase {
    
  func testValidateEmails() {
    let validator: StringValidator = EmailStringValidator()
    
    XCTAssert(validator.validate("test@mail.com") == true)
    XCTAssert(validator.validate("test123@mail123.com") == true)
    XCTAssert(validator.validate("testmail.com") == false)
    XCTAssert(validator.validate("test@mailcom") == false)
    XCTAssert(validator.validate("test@@mail.com") == false)
    XCTAssert(validator.validate("test@mail..com") == false)
    XCTAssert(validator.validate(".test@mail.com") == false)
    XCTAssert(validator.validate("test@mail.com.") == false)
    XCTAssert(validator.validate("12345") == false)
    XCTAssert(validator.validate("qwerty") == false)
  }
}

class PasswordValidatorTestCase: SwiftUIDemoTestCaseBase {
  
  func testValidatePassword() {
    let validator: StringValidator = PasswordValidator()
    
    XCTAssert(validator.validate("Password1") == true)
    XCTAssert(validator.validate("Password") == false)
    XCTAssert(validator.validate("password1") == false)
    XCTAssert(validator.validate("PASSWORD1") == false)
    XCTAssert(validator.validate("Pass1") == false)
    XCTAssert(validator.validate("12345678") == false)
    XCTAssert(validator.validate("12345678a") == false)
  }
  
  func testValidatePasswordLength() {
    let validator: StringValidator = PasswordValidator(length: 10)
    
    XCTAssert(validator.validate("12345678Qw") == true)
    XCTAssert(validator.validate("1234567Qw") == false)
  }
}
