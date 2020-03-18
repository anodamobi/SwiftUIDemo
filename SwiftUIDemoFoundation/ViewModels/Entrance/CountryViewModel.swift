//
//  CountryViewModel.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 23.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import Combine

public class CountryViewModel: ObservableObject {
  
  @Published public var inputSearchText: String = ""
  
  @Published public var outputCountry: CountryModel?
  @Published public var outputSections = [CountrySectionViewModel]()
  
  public var sourceCountry: CountrySource
  
  private var disposables = Set<AnyCancellable>()
  
  public init(sourceCountry: CountrySource) {
    self.sourceCountry = sourceCountry
    
    self.bindOutputs()
  }
  
  private func bindOutputs() {
    $inputSearchText
      .map { [weak self] searchText in
        guard let strongSelf = self else { return [] }
        
        let countries: [CountryModel]
        if searchText.isEmpty {
          countries = strongSelf.sourceCountry.countries
        } else {
          countries = strongSelf.sourceCountry.countries.filter {
            $0.name.lowercased().hasPrefix(searchText.lowercased())
          }
        }
        return countries
          .compactMap { $0.name.prefix(1) }
          .distincts()
          .sorted()
          .map { index in
            let cells = countries
              .filter { $0.name.prefix(1) == index }
              .sorted(by: { $0.name < $1.name })
            
            return (String(index), cells)
        }
        .map(CountrySectionViewModel.init)
    }
    .assign(to: \.outputSections, on: self)
    .store(in: &disposables)
  }
}

public struct CountrySectionViewModel: Equatable, Identifiable {
  public var title: String
  public var cells: [CountryModel]
  
  public var id: String {
    return title
  }
}
