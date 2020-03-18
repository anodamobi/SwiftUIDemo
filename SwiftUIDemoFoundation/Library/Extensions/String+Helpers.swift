//
//  String+Helpers.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 08.12.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation

public extension String {
  var trimmed: String {
      return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  }
}
