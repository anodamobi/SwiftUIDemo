//
//  ModalLinkModifier.swift
//  SwiftUIDemo
//
//  Created by Alex on 11.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import SwiftUI

//struct TransitionLink<Content, Destination>: View where Content: View, Destination: View {
//
//  @Binding var isExpanded: Bool
//  var content: () -> Content
//  var destination: () -> Destination
//
//  init(
//    isPresented: Binding<Bool>,
//    @ViewBuilder destination: @escaping () -> Destination,
//    @ViewBuilder content: @escaping () -> Content
//  ) {
//    self.content = content
//    self.destination = destination
//    self._isExpanded = isPresented
//  }
//
//  var body: some View {
//    ZStack {
//      if isExpanded {
//        destination()
//      } else {
//        content()
//      }
//    }
//  }
//}
//
//struct AppCardViewLinkViewModifier<Destination>: ViewModifier where Destination: View {
//
//  @Binding var isExpanded: Bool
//  var destination: () -> Destination
//  var frame: CGRect
//
//  func body(content: Self.Content) -> some View {
//    TransitionLink(
//      isPresented: self.$isExpanded,
//      destination: destination,
//      content: { content }
//    )
//  }
//}
//
//extension AppCardView {
//  func modalLink(destination: @escaping () -> AppCardViewDetails) -> some View {
//    GeometryReader { geometry in
//      self.modifier(
//        AppCardViewLinkViewModifier(
//          isExpanded: self.$isExpanded,
//          destination: destination,
//          frame: geometry.frame(in: CoordinateSpace.local)
//        )
//      )
//    }
//  }
//}
