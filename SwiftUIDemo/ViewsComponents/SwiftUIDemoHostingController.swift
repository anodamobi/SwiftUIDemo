//
//  SwiftUIDemoHostingController.swift
//  SwiftUIDemo
//
//  Created by Alex on 18.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import SwiftUI

// style proxy to be stored in Environment
class LocalStatusBarStyle {
  var getter: () -> UIStatusBarStyle = { .default }
  var setter: (UIStatusBarStyle) -> Void = { _ in }
  
  var currentStyle: UIStatusBarStyle {
    get { self.getter() }
    set { self.setter(newValue) }
  }
}

// Custom Environment key, as it is set once, it can be accessed from anywhere
// of SwiftUI view hierarchy
struct LocalStatusBarStyleKey: EnvironmentKey {
  static var defaultValue: LocalStatusBarStyle = LocalStatusBarStyle()
}

// Environment key path variable
extension EnvironmentValues {
  var localStatusBarStyle: LocalStatusBarStyle {
    get {
      return self[LocalStatusBarStyleKey.self]
    }
  }
}

// Custom hosting controller that updates the status bar style
class SwiftUIDemoHostingController<Content>: UIHostingController<Content> where Content: View {
  private var internalStyle = UIStatusBarStyle.default
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    get {
      return internalStyle
    }
    set {
      internalStyle = newValue
      self.setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  override init(rootView: Content) {
    super.init(rootView: rootView)
    LocalStatusBarStyleKey.defaultValue.getter = { self.preferredStatusBarStyle }
    LocalStatusBarStyleKey.defaultValue.setter = { self.preferredStatusBarStyle = $0 }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
