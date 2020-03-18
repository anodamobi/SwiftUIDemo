//
//  AuthServiceDoubles.swift
//  SwiftUIDemoFoundationTests
//
//  Created by Wilson on 08.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation
import Combine
@testable import SwiftUIDemoFoundation

class AuthServiceDummy: AuthService {
  var observers: WeakReferenceCollection<AuthServiceObserver> = []
  func verify(phoneNumber: String) -> AnyPublisher<String, Error> {
    fatalError("Dummy implementation")
  }
  func signIn(withPhone input: AuthPhoneInput) -> AnyPublisher<UserModel, Error> {
    fatalError("Dummy implementation")
  }
  func signOut() -> AnyPublisher<Void, Error> {
    fatalError("Dummy implementation")
  }
  func delete() -> AnyPublisher<Void, Error> {
    fatalError("Dummy implementation")
  }
}

class AuthServiceObserverSpy: AuthServiceObserver {
  var invokedDidSignIn = false
  var invokedDidSignInCount = 0
  var invokedDidSignInParameters: (authService: AuthService, Void)?
  var invokedDidSignInParametersList = [(authService: AuthService, Void)]()
  func didSignIn(authService: AuthService) {
    invokedDidSignIn = true
    invokedDidSignInCount += 1
    invokedDidSignInParameters = (authService, ())
    invokedDidSignInParametersList.append((authService, ()))
  }
  var invokedDidSignOut = false
  var invokedDidSignOutCount = 0
  var invokedDidSignOutParameters: (authService: AuthService, Void)?
  var invokedDidSignOutParametersList = [(authService: AuthService, Void)]()
  func didSignOut(authService: AuthService) {
    invokedDidSignOut = true
    invokedDidSignOutCount += 1
    invokedDidSignOutParameters = (authService, ())
    invokedDidSignOutParametersList.append((authService, ()))
  }
}
