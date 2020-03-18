//
//  SwiftUIDemoPhoneNumberTextField.swift
//  SwiftUIDemo
//
//  Created by Wilson on 08.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation
import PhoneNumberKit
import SwiftUI

struct SwiftUIDemoPhoneNumberTextField: UIViewRepresentable {
  
  @Binding var text: String
  @Binding var isEditing: Bool
  
  private var font: UIFont?
  private var foregroundColor: UIColor?
  private var accentColor: UIColor?
  
  private var withExamplePlaceholder: Bool = true
  private var withPrefix: Bool = true
  
  init(
    text: Binding<String>,
    isEditing: Binding<Bool>
  ) {
    self._text = text
    self._isEditing = isEditing
  }
  
  func makeUIView(context: Context) -> PhoneNumberTextField {
    let textField = PhoneNumberTextField()
    
    textField.delegate = context.coordinator
    
    textField.text = text
    textField.font = font
    if let accentColor = accentColor {
      textField.tintColor = accentColor
    }
    textField.withExamplePlaceholder = withExamplePlaceholder
    textField.withPrefix = withPrefix
    
    textField.addTarget(
      context.coordinator,
      action: #selector(Coordinator.textFieldDidChange(_:)),
      for: .editingChanged
    )
    return textField
  }
  
  func updateUIView(_ uiView: PhoneNumberTextField, context: Context) {
    uiView.text = text
    if isEditing {
      uiView.becomeFirstResponder()
    } else {
      uiView.resignFirstResponder()
    }
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(
      text: $text,
      isEditing: $isEditing
    )
  }
  
  final class Coordinator: NSObject, UITextFieldDelegate {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    init(
      text: Binding<String>,
      isEditing: Binding<Bool>
    ) {
      self._text = text
      self._isEditing = isEditing
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
      DispatchQueue.main.async {
        if !self.isEditing {
          self.isEditing = true
        }
      }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
      text = textField.text ?? ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
      DispatchQueue.main.async {
        if self.isEditing {
          self.isEditing = false
        }
      }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      isEditing = false
      return false
    }
  }
}

extension SwiftUIDemoPhoneNumberTextField {
  func font(_ font: UIFont?) -> Self {
    var view = self
    view.font = font
    return view
  }
  
  func foregroundColor(_ color: UIColor?) -> Self {
    var view = self
    view.foregroundColor = color
    return view
  }
  
  func accentColor(_ accentColor: UIColor?) -> Self {
    var view = self
    view.accentColor = accentColor
    return view
  }
  
  func withExamplePlaceholder(_ isOn: Bool) -> Self {
    var view = self
    view.withExamplePlaceholder = isOn
    return view
  }
  
  func withPrefix(_ isOn: Bool) -> Self {
    var view = self
    view.withPrefix = isOn
    return view
  }
}

/// https://github.com/marmelroy/PhoneNumberKit/issues/247
public extension PhoneNumberKit {
  override convenience init() {
    self.init(metadataCallback: PhoneNumberKit.bundleMetadataCallback)
  }
  
  static func bundleMetadataCallback() throws -> Data? {
    guard let jsonPath = Bundle.main.path(forResource: "PhoneNumberMetadata", ofType: "json") else {
      throw PhoneNumberError.metadataNotFound
    }
    let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
    return data
  }
}

#if DEBUG
struct SwiftUIDemoPhoneNumberTextField_Previews: PreviewProvider {
  
  static var previews: some View {
    SwiftUIDemoPhoneNumberTextField(
      text: .constant(""),
      isEditing: .constant(false)
    )
      .withExamplePlaceholder(true)
      .withPrefix(true)
  }
}
#endif
