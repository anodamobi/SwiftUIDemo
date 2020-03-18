//
//  AppEnvironmentPredicate.swift
//  SwiftUIDemo
//
//  Created by Wilson on 18.10.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation

enum AppEnvironment {
  case dev
  case prod
}

extension AppEnvironment {
  static var current: AppEnvironment {
    #if BUILD_DEVELOPMENT
    return .dev
    #elseif BUILD_PRODUCTION
    return .prod
    #else
    fatalError("Unknown build configuration")
    #endif
  }
}
