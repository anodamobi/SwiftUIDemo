//
//  AppCardView.swift
//  SwiftUIDemo
//
//  Created by Alex on 11.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import SwiftUI
import SwiftUIDemoFoundation

struct AppCardView: View {

  var data: AppModel

  @Binding var activeDetailsItem: AppModel?

  @State var isExpanded: Bool = false

  var body: some View {
    Button(action: {
      if self.activeDetailsItem == nil {
        self.activeDetailsItem = self.data
      }
    }, label: {
      VStack {
        Image(self.data.image)
          .resizable()
          .aspectRatio(contentMode: .fit)

        HStack {
          VStack(alignment: .leading, spacing: 5) {
            Text(self.data.category)
              .font(.headline)
              .foregroundColor(.secondary)
            Text(self.data.heading)
              .font(.title)
              .fontWeight(.black)
              .foregroundColor(.primary)
              .lineLimit(3)
            Text(self.data.author.uppercased())
              .font(.caption)
              .foregroundColor(.secondary)
          }
          .layoutPriority(100)

          Spacer()
        }
        .padding()
      }
      .background(AppCardViewSetter(data: data))
      .background(Color.white)
      .cornerRadius(10)
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
      )
        .shadow(radius: 5)
        .padding(.horizontal, 35)
        .padding(.vertical)
    })
      .buttonStyle(ScaleButtonStyle())
  }
}

#if DEBUG
struct AppCardView_Previews: PreviewProvider {
  static var previews: some View {
    AppCardView(data:
      AppModel(
        image: "swiftui-button",
        category: "SwiftUI",
        heading: "Drawing a Border with Rounded Corners",
        author: "Simon Ng"
      ), activeDetailsItem: .constant(nil)
    )
  }
}
#endif

struct AppCardPreferenceData: Equatable {
  let data: AppModel
  let rect: CGRect
}

struct AppCardPreferenceKey: PreferenceKey {
  typealias Value = [AppCardPreferenceData]

  static var defaultValue: [AppCardPreferenceData] = []

  static func reduce(value: inout [AppCardPreferenceData], nextValue: () -> [AppCardPreferenceData]) {
    value.append(contentsOf: nextValue())
  }
}

struct AppCardViewSetter: View {
  let data: AppModel

  var body: some View {
    GeometryReader { geometry in
      Rectangle()
        .fill(Color.clear)
        .preference(
          key: AppCardPreferenceKey.self,
          value: [AppCardPreferenceData(data: self.data, rect: geometry.frame(in: .named("AppListView")))]
      )
    }
  }
}
