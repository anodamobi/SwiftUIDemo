//
//  Bundle+SwiftUIDemoPlatform.swift
//  SwiftUIDemoPlatform
//
//  Created by Wilson on 16.10.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation

extension Bundle {
    /// Returns an NSBundle pinned to the framework target. We could choose anything for the `forClass`
    /// parameter as long as it is in the framework target.
    public static var SwiftUIDemoPlatform: Bundle {
        return Bundle(for: BundleToken.self)
    }
}

private final class BundleToken {}
