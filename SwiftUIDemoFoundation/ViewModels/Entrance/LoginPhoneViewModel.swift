//
//  LoginPhoneViewModel.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 18.10.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import Combine

public class LoginPhoneViewModel: ObservableObject {
  
  @Published public var inputCode = ""
  @Published public var inputPhoneNumber = ""
  
  // TODO: Handle and update a country code on country picker response
  @Published public var outputCountry: CountryModel?
  @Published public var outputAlertText = ""
  @Published public var outputAlertVisible = false
  @Published public var outputContinueDisabled = false
  @Published public var outputSpinnerVisible = false
  
  public var serviceAuth: AuthService
  public var sourceCountry: CountrySource
  
  public var disposables = Set<AnyCancellable>()
  
  public init(
    serviceAuth: AuthService,
    sourceCountry: CountrySource
  ) {
    self.serviceAuth = serviceAuth
    self.sourceCountry = sourceCountry
    self.outputCountry = sourceCountry.country(for: .current) ?? sourceCountry.defaultCountry
    
    self.bindOutputs()
  }
  
  private func bindOutputs() {
    $outputCountry
      .compactMap { $0?.dialCode }
      .removeDuplicates()
      .assign(to: \.inputCode, on: self)
      .store(in: &disposables)
    
    $inputCode
      .combineLatest($inputPhoneNumber)
      .map { $0.isEmpty || $1.isEmpty && $0.contains("+") }
      .assign(to: \.outputContinueDisabled, on: self)
      .store(in: &disposables)
    
    $inputCode
      .removeDuplicates()
      .map ({ [weak self] code in
        if code.isEmpty {
          return nil
        }
        return self?.sourceCountry.countries.first(where: { $0.dialCode == code })
      })
      .assign(to: \.outputCountry, on: self)
      .store(in: &disposables)
  }
  
  public func onContinue() {
    
  }
}
