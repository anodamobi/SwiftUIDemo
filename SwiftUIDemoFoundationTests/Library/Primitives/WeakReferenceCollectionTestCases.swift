//
//  WeakReferenceCollectionTestCases.swift
//  SwiftUIDemoFoundationTests
//
//  Created by Wilson on 07.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftUIDemoFoundation

class WeakCollectionTestCase: XCTestCase {
  
  private class Element { }
  
  private var collection: WeakReferenceCollection<Element>!
  private let elementOne = Element()
  private let elementTwo = Element()
  
  func testShouldAddElement() {
    collection = .init()
    
    collection.append(elementOne)
    collection.append(elementTwo)
    
    XCTAssert(self.collection.count == 2)
    XCTAssert(self.collection.first === elementOne)
    XCTAssert(self.collection.last === elementTwo)
  }
  
  func testShouldRemoveElement() {
    collection = .init([elementOne, elementTwo])
    
    collection.remove(elementOne)
    
    XCTAssert(self.collection.count == 1)
    XCTAssert(self.collection.first === elementTwo)
  }
  
  func testShouldMakeInterator() {
    collection = .init([elementOne, elementTwo])
    
    let iterator = collection.makeIterator()
    
    for pair in iterator.enumerated() {
      if pair.offset == 0 {
        XCTAssert(pair.element === elementOne)
      } else {
        XCTAssert(pair.element === elementTwo)
      }
    }
  }
}
