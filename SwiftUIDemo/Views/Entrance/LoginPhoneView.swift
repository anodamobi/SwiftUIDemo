//
//  LoginPhoneView.swift
//  SwiftUIDemo
//
//  Created by Wilson on 18.10.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
import SwiftUIDemoFoundation
import SwiftUIDemoPlatform

struct LoginPhoneView: View {
  @ObservedObject var viewModel: LoginPhoneViewModel
  @ObservedObject var keyboardResponder: KeyboardResponder
  @State var showingCountryPicker: Bool = false

  @State var inputPhoneNumberIsEditing: Bool = false
  
  init(
    viewModel: LoginPhoneViewModel,
    keyboardResponder: KeyboardResponder
  ) {
    self.viewModel = viewModel
    self.keyboardResponder = keyboardResponder
  }
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView(showsIndicators: false) {
        VStack {
          Spacer()
          
          VStack(alignment: .leading, spacing: 20) {
            self.titleView
              .padding(.bottom, 10)
            self.countryView
            self.phoneFormView
              .frame(height: 100)
          }
          
          Spacer()
          
          self.continueView
            .padding(.top, 40)
            .padding(.bottom, 60)
        }
        .padding(.top, 50)
        .padding(.horizontal, 60)
        .padding(.bottom, self.keyboardResponder.currentHeight)
        .onTapGesture {
          UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
          )
        }
      }
      .frame(size: geometry.size)
      .navigationBarTitle("Phone", displayMode: .inline)
      .onAppear {
        self.inputPhoneNumberIsEditing = true
      }
    }
  }
  
  var countryPicker: some View {
    let viewModel = CountryViewModel(sourceCountry: BundleCountrySource())
    viewModel.$outputCountry
      .compactMap { $0 }
      .sink(receiveValue: { country in
        self.viewModel.outputCountry = country
      })
      .store(in: &self.viewModel.disposables)
    
    return CountryPickerView(viewModel: viewModel)
  }
}

private extension LoginPhoneView {
  var titleView: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("Your Phone")
        .bold()
        .foregroundColor(Palette.primary.color)
        .font(.largeTitle)
        .fixedSize(horizontal: false, vertical: true)
      
      Text("Please confirm your country code and enter your phone number")
        .font(.body)
        .fontWeight(.semibold)
        .foregroundColor(Palette.grey.color)
        .fixedSize(horizontal: false, vertical: true)
    }
  }
  
  var countryView: some View {
    Button(action: {
      self.inputPhoneNumberIsEditing = false
      self.showingCountryPicker.toggle()
    }) {
      Text(viewModel.outputCountry?.name ?? "Country")
        .fontWeight(.semibold)
        .font(.callout)
        .foregroundColor(viewModel.outputCountry.isNil ? Palette.grey.color : Palette.primary.color)
        .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
        .padding(.horizontal, 15)
        .background(Palette.greyPrimary.color)
        .cornerRadius(10)
    }.sheet(isPresented: $showingCountryPicker) {
      self.countryPicker
    }
  }
  
  var phoneFormView: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        Text("Enter your number")
          .font(.callout)
          .fontWeight(.semibold)
          .foregroundColor(Palette.grey.color)
          .lineLimit(nil)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.top, 15)
          .padding(.horizontal, 15)
        
        SwiftUIDemoPhoneNumberTextField(
          text: self.$viewModel.inputPhoneNumber,
          isEditing: self.$inputPhoneNumberIsEditing
        )
        .withExamplePlaceholder(true)
        .withPrefix(true)
        .font(.systemFont(ofSize: 25, weight: .light))
        .frame(maxWidth: .infinity, minHeight: 48)
        .padding(.horizontal, 16)
      }
      .frame(maxWidth: geometry.size.width, minHeight: 48)
      .background(Palette.greyPrimary.color)
      .cornerRadius(10)
      .onTapGesture {
        self.inputPhoneNumberIsEditing = true
      }
    }
  }
   
  var continueView: some View {
    Button(action: viewModel.onContinue, label: {
      Text("Continue")
        .entranceBlueButton()
    })
      .disabled(viewModel.outputContinueDisabled)
      .opacity(viewModel.outputContinueDisabled ? 0.5 : 1)
  }
}

#if DEBUG
struct LoginPhoneView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LoginPhoneView()
        .navigation()
        .previewDevice(.iphoneXsMax)
        .environment(\.colorScheme, .light)
      
      LoginPhoneView()
        .navigation()
        .previewDevice(.iphone7)
        .environment(\.colorScheme, .dark)
      
      LoginPhoneView()
        .navigation()
        .previewDevice(.iphoneSE)
        .environment(\.colorScheme, .dark)
    }
  }
}

extension LoginPhoneView {
  init() {
    self.viewModel = LoginPhoneViewModel(
      serviceAuth: FirebaseAuthService(),
      sourceCountry: BundleCountrySource()
    )
    self.keyboardResponder = KeyboardResponder()
  }
}
#endif
