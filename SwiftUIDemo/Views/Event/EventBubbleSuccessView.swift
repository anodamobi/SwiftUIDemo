//
//  EventBubbleSuccessView.swift
//  SwiftUIDemo
//
//  Created by Alex on 16.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import SwiftUI
import SwiftUIDemoFoundation

struct EventBubbleSuccessView: View {
  @Binding var presented: Bool
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        VStack {
          HStack {
            Spacer()
            Button(action: {
              self.presented.toggle()
            }, label: {
              Image(systemName: "xmark")
                .font(.system(size: 26, weight: .regular))
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .padding(.top, 50)
                .padding(.trailing, 26)
            })
          }
          Spacer()
        }
        VStack(spacing: 10) {
          Text("You are in!".uppercased())
            .font(.system(size: 30, weight: .bold))
            .foregroundColor(.white)
          Text("See you at the event.")
            .font(.system(size: 18, weight: .regular))
            .foregroundColor(.white)
        }
      }
      .frame(size: geometry.size)
    }
    .background(Palette.greenFern.color)
    .edgesIgnoringSafeArea(.all)
  }
}

struct BubbleSuccessView_Previews: PreviewProvider {
  static var previews: some View {
    EventBubbleSuccessView(presented: .constant(true))
  }
}
