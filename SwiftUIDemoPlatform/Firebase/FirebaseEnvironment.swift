//
//  FirebaseEnvironment.swift
//  SwiftUIDemoPlatform
//
//  Created by Wilson on 16.10.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

#if DEBUG
let firebaseInfo = "GoogleService-Info-Development"
#else
let firebaseInfo = "GoogleService-Info-Production"
#endif

public class FirebaseEnvironment {
  public class func app() -> FirebaseApp? {
    return FirebaseApp.app()
  }

  public class func configure() {
    guard
      let configPath = Bundle.SwiftUIDemoPlatform.path(forResource: firebaseInfo, ofType: "plist"),
      let options = FirebaseOptions(contentsOfFile: configPath)
    else {
      fatalError("Invalid Firebase configuration file.")
    }
    FirebaseApp.configure(options: options)
    FirebaseConfiguration.shared.setLoggerLevel(.min)
  }
}
