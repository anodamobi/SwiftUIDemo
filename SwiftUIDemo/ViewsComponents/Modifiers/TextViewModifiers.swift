//
//  TextViewModifiers.swift
//  SwiftUIDemo
//
//  Created by Wilson on 17.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import SwiftUI
import SwiftUIDemoFoundation

extension Text {
  func entranceAlert() -> some View {
    self
      .font(.callout)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .foregroundColor(Palette.red.color)
  }
  
  func entranceBlueButton() -> some View {
    self
      .bold()
      .font(.body)
      .foregroundColor(Palette.white.color)
      .frame(maxWidth: .infinity, minHeight: 48)
      .background(Palette.blue.color)
      .cornerRadius(10)
  }
  
  func entranceGreyButton() -> some View {
    self
      .bold()
      .font(.body)
      .foregroundColor(Palette.primary.color)
      .frame(maxWidth: .infinity, minHeight: 48)
      .background(Palette.greyPrimary.color)
      .cornerRadius(10)
  }
}
