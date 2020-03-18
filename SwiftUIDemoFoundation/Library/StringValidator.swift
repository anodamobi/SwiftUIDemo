//
//  StringValidator.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 07.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation

public protocol StringValidator {
  func validate(_ string: String) -> Bool
}

public struct RegExpStringValidator: StringValidator {
  
  public let regularExpression: NSRegularExpression
  
  public init(pattern: String) throws {
    self.regularExpression = try NSRegularExpression(pattern: pattern, options: [])
  }
  
  public func validate(_ string: String) -> Bool {
    let range = self.regularExpression.rangeOfFirstMatch(
      in: string, options: [],
      range: NSRange(location: 0, length: string.count)
    )
    return range.location == 0 && range.length == string.count
  }
}

public struct EmailStringValidator: StringValidator {
  
  private let regExpValidator: RegExpStringValidator
  
  public init() {
    let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    self.regExpValidator = try! RegExpStringValidator(pattern: emailRegEx)
  }
  
  public func validate(_ string: String) -> Bool {
    return self.regExpValidator.validate(string)
  }
}

public struct PhoneNumberValidator: StringValidator {
  
  private let regExpValidator: RegExpStringValidator
  
  public init() {
    let phoneNumberRegExp = "\\d{0,10}+"
    self.regExpValidator = try! RegExpStringValidator(pattern: phoneNumberRegExp)
  }
  
  public func validate(_ string: String) -> Bool {
    return self.regExpValidator.validate(string)
  }
}

public struct PasswordValidator: StringValidator {
  
  private let regExpValidator: RegExpStringValidator
  
  public init() {
    let passwordRegExp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
    self.regExpValidator = try! RegExpStringValidator(pattern: passwordRegExp)
  }
  
  public init(length: Int) {
    let passwordRegExp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{\(length),}$"
    self.regExpValidator = try! RegExpStringValidator(pattern: passwordRegExp)
  }
  
  public func validate(_ string: String) -> Bool {
    return self.regExpValidator.validate(string)
  }
}
