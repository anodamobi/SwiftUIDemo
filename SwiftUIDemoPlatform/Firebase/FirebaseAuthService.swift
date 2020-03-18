//
//  FirebaseAuthService.swift
//  SwiftUIDemoPlatform
//
//  Created by Wilson on 27.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import SwiftUIDemoFoundation
import Combine
import FirebaseAuth

open class FirebaseAuthService: AuthService {
  public var observers: WeakReferenceCollection<AuthServiceObserver> = []

  public init() {

  }

  public func signIn(withPhone input: AuthPhoneInput) -> AnyPublisher<UserModel, Error> {
    return Future { promise in
      let credential = PhoneAuthProvider.provider().credential(
        withVerificationID: input.verificationId,
        verificationCode: input.verificationCode
      )
      Auth.auth().signIn(with: credential) { authResult, authError in
        guard let authUser = authResult?.user else {
          guard let error = authError else { return }
          promise(.failure(error)); return
        }
        promise(.success(authUser.userModel))
      }
    }.eraseToAnyPublisher()
  }

  public func verify(phoneNumber: String) -> AnyPublisher<String, Error> {
    return Future { promise in
      PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, authError in
        guard let verificationID = verificationID else {
          guard let error = authError else { return }
          promise(.failure(error)); return
        }
        promise(.success(verificationID))
      }
    }.eraseToAnyPublisher()
  }

  public func signOut() -> AnyPublisher<Void, Error> {
    return Future { promise in
      do {
        try Auth.auth().signOut()
        promise(.success)
      } catch {
        promise(.failure(error))
      }
    }.eraseToAnyPublisher()
  }

  public func delete() -> AnyPublisher<Void, Error> {
    return Future { promise in
      Auth.auth().currentUser?.delete { authError in
        guard let error = authError else {
          promise(.success); return
        }
        promise(.failure(error))
      }
    }.eraseToAnyPublisher()
  }
}

private extension User {
  var userModel: UserModel {
    return UserModel(authUser: self)
  }
}
