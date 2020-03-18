//
//  TabbarView.swift
//  SwiftUIDemo
//
//  Created by Alex on 16.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
  var body: some View {
    TabView {
      EventView()
        .tabItem {
          Image(systemName: "1.circle")
          Text("Event")
      }.tag(0)
      AppListView()
        .tabItem {
          Image(systemName: "2.circle")
          Text("AppStore")
      }.tag(1)
      NavigationView {
        WelcomeView()
      }.tabItem {
        Image(systemName: "3.circle")
        Text("Entrance")
      }.tag(2)
    }.edgesIgnoringSafeArea(.top)
  }
}

struct TabbarView_Previews: PreviewProvider {
  static var previews: some View {
    TabbarView()
  }
}
