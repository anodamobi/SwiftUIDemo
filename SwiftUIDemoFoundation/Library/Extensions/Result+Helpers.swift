//
//  Result+Helpers.swift
//  SwiftUIDemoFoundation
//
//  Created by Wilson on 04.12.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation

extension Result where Success == Void {
    public static var success: Result {
        return .success(())
    }
}
