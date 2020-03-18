//
//  BundleCountrySourceTestCase.swift
//  SwiftUIDemoFoundationTests
//
//  Created by Wilson on 25.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftUIDemoFoundation

class BundleCountrySourceTestCase: SwiftUIDemoTestCaseBase {
  
  private let usa = CountryModel(code: "US", dialCode: "+1", name: "United States")
  private let canada = CountryModel(code: "CA", dialCode: "+1", name: "Canada")
  private let australia = CountryModel(code: "AU", dialCode: "+61", name: "Australia")
  
  func testShouldLoadCountries() {
    let source = BundleCountrySource()
    XCTAssert(source.countries.count > 0)
  }
  
  func testShouldLoadFromPlist() throws {
    let source = BundleCountrySource()
    
    guard let url = Bundle.SwiftUIDemoFoundation.url(forResource: "countries", withExtension: ".plist") else {
      XCTFail("Missing file: countries.plist"); return
    }
    
    let data = try Data(contentsOf: url)
    let decoder = PropertyListDecoder()
    
    let countries = try decoder.decode([CountryModel].self, from: data)
    XCTAssert(source.countries == countries)
    XCTAssert(source.countries == countries)
  }
  
  func testShouldContainDefaultCountry() {
    let source = BundleCountrySource()
    XCTAssert(source.defaultCountry == usa)
  }
  
  func testShouldContainCountryForLocale() throws {
    let source = BundleCountrySource()
    
    let usaLocale = Locale(identifier: "en_US")
    XCTAssert(source.country(for: usaLocale) == usa)
    
    let canadaLocale = Locale(identifier: "en_CA")
    XCTAssert(source.country(for: canadaLocale) == canada)
    
    let australiaLocale = Locale(identifier: "en_AU")
    XCTAssert(source.country(for: australiaLocale) == australia)
  }
}
