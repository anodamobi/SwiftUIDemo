//
//  KeyboardResponder.swift
//  SwiftUIDemo
//
//  Created by Wilson on 01.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import SwiftUI
import Combine

class KeyboardResponder: ObservableObject {
  @Published private(set) var currentHeight: CGFloat = 0
  private(set) var duration: TimeInterval = 0.3
  private var disposables = Set<AnyCancellable>()
  
  init() {
    let keyboardWillShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
    let keyboardWillHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
    Publishers.Merge(keyboardWillShow, keyboardWillHide)
      .receive(on: RunLoop.main)
      .sink { [weak self] in self?.keyboardNotification($0) }
      .store(in: &disposables)
  }
  
  private func keyboardNotification(_ notification: Notification) {
    let isShowing = notification.name == UIResponder.keyboardWillShowNotification
    if let userInfo = notification.userInfo {
      duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.0
      let endFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
      if isShowing {
        currentHeight = endFrame?.height ?? 0.0
      } else {
        currentHeight = 0.0
      }
    }
  }
}
