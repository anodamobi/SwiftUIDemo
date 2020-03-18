//
//  ViewModifier.swift
//  SwiftUIDemo
//
//  Created by Wilson on 17.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import SwiftUI

extension View {
  func frame(size: CGSize) -> some View {
    ModifiedContent(
      content: self,
      modifier: FrameCGRectViewModifier(size: size)
    )
  }
  
  func navigation() -> some View {
    ModifiedContent(
      content: self,
      modifier: NestedNavigationViewModifier()
    )
  }
}

private struct FrameCGRectViewModifier: ViewModifier {
  let size: CGSize
  
  func body(content: Content) -> some View {
    return content.frame(width: size.width, height: size.height)
  }
}

private struct NestedNavigationViewModifier: ViewModifier {
  func body(content: Content) -> some View {
    NavigationView {
      content
    }
  }
}
