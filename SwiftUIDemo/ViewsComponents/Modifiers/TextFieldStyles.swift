//
//  TextFieldStyles.swift
//  SwiftUIDemo
//
//  Created by Wilson on 17.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import SwiftUI
import SwiftUIDemoFoundation

struct EntranceTextFilledFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.body)
            .foregroundColor(Palette.primary.color)
            .frame(maxWidth: .infinity, minHeight: 48)
            .padding(.horizontal, 15)
    }
}

struct EntranceTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.body)
            .foregroundColor(Palette.primary.color)
            .frame(maxWidth: .infinity, minHeight: 48)
            .padding(.horizontal, 15)
    }
}
