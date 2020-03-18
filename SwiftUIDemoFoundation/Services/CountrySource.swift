//
//  CountrySource.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 23.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import Combine

public protocol CountrySource: class {
  var countries: [CountryModel] { get }
}

public extension CountrySource {
  var defaultCountry: CountryModel {
    return CountryModel(code: "US", dialCode: "+1", name: "United States")
  }
  
  func country(for locale: Locale = .current) -> CountryModel? {
    return countries.first(where: { $0.code == locale.regionCode })
  }
}

public class BundleCountrySource: CountrySource {
  
  public let bundle: Bundle
  
  public lazy var countries: [CountryModel] = {
    guard let url = bundle.url(forResource: "countries", withExtension: ".plist") else {
      fatalError("countries.plist missing from \(bundle)")
    }
    do {
      let data = try Data(contentsOf: url)
      let decoder = PropertyListDecoder()
      
      return try decoder.decode([CountryModel].self, from: data)
    } catch {
      fatalError("Cannot load countries \(error)")
    }
  }()
  
  public init(bundle: Bundle = .SwiftUIDemoFoundation) {
    self.bundle = bundle
  }
}
