//
//  User.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 27.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation

public struct UserModel {
  public var uid: String
  public var providerID: String
  public var displayName: String?
  public var email: String?
  public var phoneNumber: String?
  public var creationDate: Date?
  public var lastSignInDate: Date?
  public var photoURL: URL?
  
  public init(
    uid: String,
    providerID: String,
    displayName: String?,
    email: String?,
    phoneNumber: String?,
    creationDate: Date?,
    lastSignInDate: Date?,
    photoURL: URL?
  ) {
    self.uid = uid
    self.providerID = providerID
    self.email = email
    self.displayName = displayName
    self.phoneNumber = phoneNumber
    self.creationDate = creationDate
    self.lastSignInDate = lastSignInDate
    self.photoURL = photoURL
  }
}

extension UserModel: Equatable {}
extension UserModel: Codable {}

public struct AuthPhoneInput: Equatable {
  public let verificationId: String
  public let verificationCode: String
}

public struct AuthGuideInput: Equatable {
  public var password: String?
  public var phone: String?
  public var firstName: String?
  public var lastName: String?
  public var picture: Data?
}
