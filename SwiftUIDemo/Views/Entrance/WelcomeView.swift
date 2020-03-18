//
//  WelcomeView.swift
//  SwiftUIDemo
//
//  Created by Wilson on 17.10.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import SwiftUI
import Combine
import SwiftUIDemoFoundation
import SwiftUIDemoPlatform

struct WelcomeView: View {
  @Environment(\.localStatusBarStyle) var statusBarStyle
  
  @ObservedObject var viewModel: WelcomeViewModel
  
  init(viewModel: WelcomeViewModel = WelcomeViewModel()) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView {
        VStack {
          Spacer()
          
          self.titleView
            .padding(.top, 40)
            .padding(.horizontal, 60)
          
          self.imageView
            .frame(width: geometry.size.width)
    
          Spacer()
          
          self.formView
            .padding(.horizontal, 60)
            .padding(.bottom, 60)
        }
        .frame(size: geometry.size)
      }
      .navigationBarTitle("Welcome")
      .navigationBarHidden(true)
    }
    .onAppear {
      self.statusBarStyle.currentStyle = .darkContent
    }
  }
}

private extension WelcomeView {
  var titleView: some View {
    VStack(alignment: .leading, spacing: 10) {
      VStack(alignment: .leading, spacing: -5) {
        Text("Welcome")
          .bold()
          .foregroundColor(Palette.blue.color)
        Text("to SwiftUIDemo App")
          .bold()
          .foregroundColor(Palette.primary.color)
      }
      .font(.largeTitle)
      
      VStack(alignment: .leading) {
        Text("Open-source native application iOS Messanger")
          .fontWeight(.semibold)
          .foregroundColor(Palette.grey.color)
      }
      .font(.body)
      .frame(minHeight: 50)
    }
  }
  
  var imageView: some View {
    Image(Icons.icFirebaseLogo.name)
      .resizable()
      .scaledToFit()
  }
  
  var formView: some View {
    Text("Continue")
      .entranceBlueButton()
      .navigationLink(destination: LoginPhoneView(viewModel: LoginPhoneViewModel(serviceAuth: FirebaseAuthService(),
                                                                                 sourceCountry: BundleCountrySource()),
                                                  keyboardResponder: KeyboardResponder()))
  }
}

#if DEBUG
struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      WelcomeView()
        .navigation()
        .previewDevice(.iphoneXsMax)
        .environment(\.colorScheme, .light)
      
      WelcomeView()
        .navigation()
        .previewDevice(.iphone7)
        .environment(\.colorScheme, .dark)
      
      WelcomeView()
        .navigation()
        .previewDevice(.iphoneSE)
    }
  }
}
#endif
