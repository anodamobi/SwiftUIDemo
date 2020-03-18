//
//  DevelopmentModule.swift
//  SwiftUIDemo
//
//  Created by Wilson on 18.10.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

//#if BUILD_DEVELOPMENT
//
//import Foundation
//import SwiftUIDemoFoundation
//import SwiftUIDemoPlatform
//
//class DevelopmentModule: Module {
//  override func load() {
//    defineServices()
//    defineViews()
//  }
//  
//  private func defineServices() {
//    define(AuthService.self) { args in
//      FirebaseAuthService()
//    }.inSingletonScope()
//    
//    FirebaseEnvironment.configure()
//  }
//  
//  private func defineViews() {
//    
//  }
//  
//  override func loadingPredicate() -> ModuleLoadingPredicate {
//    return AppEnvironmentPredicate(environment: .dev)
//  }
//}
//
//#endif
