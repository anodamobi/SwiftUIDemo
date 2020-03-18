//
//  AuthService.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 27.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import Combine

public protocol AuthServiceObserver: class {
  func didSignIn(authService: AuthService)
  func didSignOut(authService: AuthService)
}

public extension AuthServiceObserver {
  func didSignIn(authService: AuthService) {}
  func didSignOut(authService: AuthService) {}
}

public protocol AuthService: class {
  var observers: WeakReferenceCollection<AuthServiceObserver> { get set }
  
  func verify(phoneNumber: String) -> AnyPublisher<String, Error>
  func signIn(withPhone input: AuthPhoneInput) -> AnyPublisher<UserModel, Error>
  
  func signOut() -> AnyPublisher<Void, Error>
  func delete() -> AnyPublisher<Void, Error>
}

public extension AuthService {
  func addObserver(_ observer: AuthServiceObserver) {
    observers.append(observer)
  }
  
  func removeObserver(_ observer: AuthServiceObserver) {
    observers.remove(observer)
  }
  
  func notifyDidSignIn() {
    for observer in observers {
      observer.didSignIn(authService: self)
    }
  }
  
  func notifyDidSignOut() {
    for observer in observers {
      observer.didSignOut(authService: self)
    }
  }
}
