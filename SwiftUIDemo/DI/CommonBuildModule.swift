//
//  CommonBuildModule.swift
//  SwiftUIDemo
//
//  Created by Wilson on 18.10.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import SwiftUIDemoFoundation
import SwiftUIDemoPlatform

//class CommonBuildModule: Module {
//  override func load() {
//    defineServices()
//    defineViews()
//  }
//  
//  private func defineServices() {
//    define(CountrySource.self) { args in
//      BundleCountrySource()
//    }
//    define(KeyboardResponder.self) { args in
//      KeyboardResponder()
//    }.inSingletonScope()
//  }
//  
//  private func defineViews() {
//    defineAuthViews()
//    defineCallsViews()
//    defineChatsViews()
//    defineSettingViews()
//  }
//  
//  private func defineAuthViews() {
//    define(WelcomeView.self) { args in
//      WelcomeView(viewModel: WelcomeViewModel())
//    }
//    define(LoginPhoneView.self) { args in
//      LoginPhoneView(
//        viewModel: LoginPhoneViewModel(serviceAuth: Container.get(), sourceCountry: Container.get()),
//        keyboardResponder: Container.get()
//      )
//    }
//    define(CountryPickerView.self) { args in
//      CountryPickerView(viewModel: CountryViewModel(sourceCountry: Container.get()))
//    }
//  }
//  
//  private func defineCallsViews() {
//    
//  }
//  
//  private func defineChatsViews() {
//    
//  }
//  
//  private func defineSettingViews() {
//    
//  }
//}
