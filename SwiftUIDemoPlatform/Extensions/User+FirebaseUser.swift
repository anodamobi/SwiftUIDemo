//
//  User+FirebaseUser.swift
//  SwiftUIDemoPlatform
//
//  Created by Wilson on 04.12.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import FirebaseAuth
import SwiftUIDemoFoundation

extension UserModel {
  public init(authUser: User) {
    self = UserModel(
      uid: authUser.uid,
      providerID: authUser.providerID,
      displayName: authUser.displayName,
      email: authUser.email,
      phoneNumber: authUser.phoneNumber,
      creationDate: authUser.metadata.creationDate,
      lastSignInDate: authUser.metadata.lastSignInDate,
      photoURL: authUser.photoURL
    )
  }
}
