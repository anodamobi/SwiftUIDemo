//
//  WeakReference.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 07.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation

public struct WeakReference<T> {
  public weak var object: AnyObject?
  
  public init(object: T?) {
    self.object = object as AnyObject
  }
}

extension WeakReference where T: AnyObject {
  public init(object: T) {
    self.object = object
  }
}
