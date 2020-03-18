//
//  CountryModel.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 08.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation

public struct CountryModel: Equatable, Hashable, Identifiable {
  public let code: String
  public let dialCode: String
  public let name: String
  
  public var id: Int {
    return self.hashValue
  }
}

extension CountryModel: Codable {
  public enum CodingKeys: String, CodingKey {
    case code
    case dialCode = "dial_code"
    case name
  }
}
