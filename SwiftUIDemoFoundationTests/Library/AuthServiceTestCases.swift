//
//  AuthServiceTestCases.swift
//  SwiftUIDemoFoundationTests
//
//  Created by Wilson on 08.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftUIDemoFoundation

class AuthServiceTestCase: SwiftUIDemoTestCaseBase {
  
  private var serviceAuth: AuthService!
  private var observerSpyOne: AuthServiceObserverSpy!
  private var observerSpyTwo: AuthServiceObserverSpy!
  
  override func setUp() {
    super.setUp()
    
    observerSpyOne = AuthServiceObserverSpy()
    observerSpyTwo = AuthServiceObserverSpy()
    serviceAuth = AuthServiceDummy()
  }
  
  func testShouldAddObserver() {
    serviceAuth.addObserver(observerSpyOne)
    serviceAuth.addObserver(observerSpyTwo)
    
    XCTAssert(self.serviceAuth.observers.count == 2)
    XCTAssert(self.serviceAuth.observers.first === observerSpyOne)
    XCTAssert(self.serviceAuth.observers.last === observerSpyTwo)
  }
  
  func testShouldRemoveObserver() {
    serviceAuth.observers = [observerSpyOne, observerSpyTwo]
    
    serviceAuth.removeObserver(observerSpyOne)
    
    XCTAssert(self.serviceAuth.observers.count == 1)
    XCTAssert(self.serviceAuth.observers.first === observerSpyTwo)
  }
  
  func testShouldNotifySignIn() {
    serviceAuth.observers = [observerSpyOne, observerSpyTwo]
    
    serviceAuth.notifyDidSignIn()
    
    XCTAssert(self.observerSpyOne.invokedDidSignInCount == 1)
    XCTAssert(self.observerSpyOne.invokedDidSignInParameters?.0 === serviceAuth)
    XCTAssert(self.observerSpyTwo.invokedDidSignInCount == 1)
    XCTAssert(self.observerSpyTwo.invokedDidSignInParameters?.0 === serviceAuth)
  }
  
  func testShouldNotifySignOut() {
    serviceAuth.observers = [observerSpyOne, observerSpyTwo]
    
    serviceAuth.notifyDidSignOut()
    
    XCTAssert(self.observerSpyOne.invokedDidSignOutCount == 1)
    XCTAssert(self.observerSpyOne.invokedDidSignOutParameters?.0 === serviceAuth)
    XCTAssert(self.observerSpyTwo.invokedDidSignOutCount == 1)
    XCTAssert(self.observerSpyTwo.invokedDidSignOutParameters?.0 === serviceAuth)
  }
}
