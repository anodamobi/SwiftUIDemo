// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit
  public typealias AssetColorTypeAlias = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  import SwiftUI
  public typealias AssetColorTypeAlias = UIColor
  public typealias AssetColorSwiftUITypeAlias = Color
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Palette {
  public static let black = ColorAsset(name: "black")
  public static let blue = ColorAsset(name: "blue")
  public static let greenFern = ColorAsset(name: "greenFern")
  public static let greenShamrock = ColorAsset(name: "greenShamrock")
  public static let grey = ColorAsset(name: "grey")
  public static let greyPrimary = ColorAsset(name: "greyPrimary")
  public static let greyWarm4 = ColorAsset(name: "greyWarm4")
  public static let primary = ColorAsset(name: "primary")
  public static let red = ColorAsset(name: "red")
  public static let white = ColorAsset(name: "white")

  // swiftlint:disable trailing_comma
  public static let allColors: [ColorAsset] = [
    black,
    blue,
    greenFern,
    greenShamrock,
    grey,
    greyPrimary,
    greyWarm4,
    primary,
    red,
    white,
  ]
  // swiftlint:enable trailing_comma
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct ColorAsset {
  public fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  public var uicolor: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
  @available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
  public var color: AssetColorSwiftUITypeAlias {
    return AssetColorSwiftUITypeAlias(asset: self)
  }
}

public extension AssetColorSwiftUITypeAlias {
  @available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
  init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    self.init(asset.name, bundle: bundle)
  }
}

public extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
