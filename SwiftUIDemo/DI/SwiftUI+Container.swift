//
//  SwiftUI+Container.swift
//  SwiftUIDemo
//
//  Created by Wilson on 08.12.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import SwiftUI

extension View {
  func navigationLink<S: View>(destination: S) -> some View {
    return ModifiedContent(
      content: self,
      modifier: NestedNavigationLinkViewModifier(destination: destination)
    )
  }
}

private struct NestedNavigationLinkViewModifier<Destination>: ViewModifier where Destination: View {
  let destination: Destination
  
  func body(content: Content) -> some View {
    NavigationLink(destination: destination) {
      content
    }
  }
}
