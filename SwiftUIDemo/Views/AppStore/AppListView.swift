//
//  AppListView.swift
//  SwiftUIDemo
//
//  Created by Alex on 11.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import UIKit
import SwiftUI
import SwiftUIDemoFoundation

struct AppListView: View {

  @Environment(\.localStatusBarStyle) var statusBarStyle
  
  @ObservedObject(wrappedValue: AppListViewModel()) var viewModel: AppListViewModel

  @State var activeDetailsItem: AppModel?
  @State var preferences: [AppCardPreferenceData] = []

  init() {
    UITableView.appearance().separatorColor = .clear
  }

  var body: some View {
    ZStack {
      List {
        ForEach(viewModel.outputApps) { item in
          AppCardView(
            data: item,
            activeDetailsItem: self.$activeDetailsItem
          ).opacity(item == self.activeDetailsItem ? 0 : 1)
        }
      }.onPreferenceChange(AppCardPreferenceKey.self) { preferences in
        self.preferences = preferences
      }
      if activeDetailsItemPreferences != nil {
        AppCardViewDetails(preferences: activeDetailsItemPreferences!, activeDetailsItem: $activeDetailsItem)
      }
    }
    .edgesIgnoringSafeArea(.top)
    .coordinateSpace(name: "AppListView")
    .onAppear {
      self.statusBarStyle.currentStyle = .darkContent
    }
  }

  var activeDetailsItemPreferences: AppCardPreferenceData? {
    return preferences.first(where: { $0.data == activeDetailsItem })
  }
}

#if DEBUG
struct AppListView_Previews: PreviewProvider {
  static var previews: some View {
    AppListView()
  }
}
#endif

struct ScaleButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .scaleEffect(configuration.isPressed ? 0.97 : 1)
  }
}
