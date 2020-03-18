//
//  WeakReferenceCollection.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 07.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation

public struct WeakReferenceCollection<T>: Sequence, ExpressibleByArrayLiteral {
  
  private var collection: Array<WeakReference<T>>
  
  public init() {
    self.collection = []
  }
  
  public init(arrayLiteral elements: T...) {
    self.collection = elements.compactMap { WeakReference(object: $0) }
  }
  
  public var count: Int {
    return self.collection.count
  }
  
  public var first: T? {
    return self.collection.first?.object as? T
  }
  
  public var last: T? {
    return self.collection.last?.object as? T
  }
  
  public func makeIterator() -> Array<T>.Iterator {
    return self.collection.compactMap({ $0.object as? T }).makeIterator()
  }
  
  public mutating func append(_ newElement: T) {
    let object = WeakReference(object: newElement)
    if !contain(newElement) {
      collection.append(object)
    }
  }
  
  public mutating func remove(_ element: T) {
    let object = element as AnyObject
    if let index = collection.firstIndex(where: { $0.object === object }) {
      collection.remove(at: index)
    }
  }
  
  public func contain(_ element: T) -> Bool {
    let object = WeakReference(object: element) 
    return collection.contains(where: { $0.object === object.object })
  }
}
