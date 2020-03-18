//
//  StaticPreviewDevice.swift
//  SwiftUIDemo
//
//  Created by Wilson on 17.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import SwiftUI

public enum StaticPreviewDevice: String {
  case iphoneSE = "iPhone SE"
  case iphone7 = "iPhone 7"
  case iphoneXsMax = "iPhone Xs Max"
}

extension View {
  
  /// The following values are supported:
  ///
  ///     "Mac"
  ///     "iPhone 7"
  ///     "iPhone 7 Plus"
  ///     "iPhone 8"
  ///     "iPhone 8 Plus"
  ///     "iPhone SE"
  ///     "iPhone X"
  ///     "iPhone Xs"
  ///     "iPhone Xs Max"
  ///     "iPhone Xʀ"
  ///     "iPad mini 4"
  ///     "iPad Air 2"
  ///     "iPad Pro (9.7-inch)"
  ///     "iPad Pro (12.9-inch)"
  ///     "iPad (5th generation)"
  ///     "iPad Pro (12.9-inch) (2nd generation)"
  ///     "iPad Pro (10.5-inch)"
  ///     "iPad (6th generation)"
  ///     "iPad Pro (11-inch)"
  ///     "iPad Pro (12.9-inch) (3rd generation)"
  ///     "iPad mini (5th generation)"
  ///     "iPad Air (3rd generation)"
  ///     "Apple TV"
  ///     "Apple TV 4K"
  ///     "Apple TV 4K (at 1080p)"
  ///     "Apple Watch Series 2 - 38mm"
  ///     "Apple Watch Series 2 - 42mm"
  ///     "Apple Watch Series 3 - 38mm"
  ///     "Apple Watch Series 3 - 42mm"
  ///     "Apple Watch Series 4 - 40mm"
  ///     "Apple Watch Series 4 - 44mm"
  
  @inlinable public func previewDevice(_ value: StaticPreviewDevice) -> some View {
    self.previewDevice(PreviewDevice(rawValue: value.rawValue))
  }
}
