//
//  TextView.swift
//  SwiftUIDemo
//
//  Created by Alex on 13.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import SwiftUI

// MARK: For demo use only
struct ContentView: View {
    @State private var items: [String] = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                ForEach(items, id: \.self) { item in
                    ItemView(item: item)
                }
            }
            Spacer()
        }
    }
}

struct ItemView: View {
    let item: String

    @State private var actionsShown = false
    @GestureState private var translation: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Text(self.item)
                    .font(.largeTitle)
                    .frame(width: geometry.size.width)
                Group {
                    Color.red
                    Color.blue
                }.frame(width: 44, height: 44)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: self.actionsShown ? -88 : 0)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .simultaneousGesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    self.actionsShown = value.translation.width <= -88
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
