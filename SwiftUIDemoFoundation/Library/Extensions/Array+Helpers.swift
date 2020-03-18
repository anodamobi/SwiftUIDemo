//
//  Array+Helpers.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 15.12.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation

public extension Array where Element: OptionalType {

  /**
   - returns: A new array with `nil` values removed.
   */
  func compact() -> [Element.Wrapped] {
    return self.filter { $0.optional != nil }.map { $0.optional! }
  }
}

public extension Array {

  /**
   Returns a random element from the array, or `nil` if the array is empty.
   */
  var randomElement: Element? {
    guard !self.isEmpty else { return nil }

    let idx = Int(arc4random_uniform(UInt32(self.count)))
    return self[idx]
  }

  /**
   Remove repeated elements from an array. This is an O(n^2) implementation based
   on Array.contains.

   - parameter eq: A function to determine equality of two elements.

   - returns: An array of distinct values in the array without changing the order.
   */
  func distincts( _ eq: (Element, Element) -> Bool) -> Array {
    var result = Array()
    forEach { x in
      if !result.contains(where: { eq(x, $0) }) {
        result.append(x)
      }
    }
    return result
  }

  /**
   Groups elements into a dictionary.

   - parameter grouping: A function that maps elements into a `Hashable` type.

   - returns: A dictionary where each key contains all the elements of `self` that are mapped to the key
              via the `grouping` function.
   */
  func groupedBy <K: Hashable> (_ grouping: (Element) -> K) -> [K: [Element]] {
    var result: [K: [Element]] = [:]

    for value in self {
      let key = grouping(value)
      result[key] = result[key] ?? []
      result[key]?.append(value)
    }

    return result
  }

  /**
   Sorts an array given a comparator.

   - parameter comparator: A comparator.

   - returns: A sorted array.
   */
  func sorted(comparator: Comparator<Element>) -> Array {
    return self.sorted(by: comparator.isOrdered)
  }
}

public extension Array where Element: Equatable {

  /**
   Remove repeated elements from an array. This is an O(n^2) implementation based
   on Array.contains.

   - returns: An array of distinct values in the array without changing the order.
   */
  func distincts() -> Array {
    return self.distincts(==)
  }
}

public struct Comparator<A> {
  public let compare: (A, A) -> Ordering

  public init(compare: @escaping (A, A) -> Ordering) {
    self.compare = compare
  }

  /**
   Compare if two elements of the same type are ordered.

   - returns: A bool value.
   */
  public var isOrdered: (A, A) -> Bool {
    return { lhs, rhs in self.compare(lhs, rhs) != .gt }
  }

  /**
   Reverses the order of a comparator.
   */
  public var reversed: Comparator {
    return Comparator { lhs, rhs in self.compare(lhs, rhs).reversed }
  }
}

/// A type that represents ordering (less than, equal, or greater than).
public enum Ordering {
  case lt
  case eq
  case gt

  public var reversed: Ordering {
    switch self {
    case .lt:
      return .gt
    case .eq:
      return .eq
    case .gt:
      return .lt
    }
  }
}
