//
//  AppListViewModel.swift
//  SwiftUIDemoFoundation
//
//  Created by Alex on 11.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Combine

public class AppListViewModel: ObservableObject {
  @Published public var outputApps: [AppModel] = []
  
  public init() {
    outputApps = [
      AppModel(
        image: "swiftui-button",
        category: "SwiftUI",
        heading: "Drawing a Border with Rounded Corners",
        author: "Simon Ng"
      ),
      AppModel(
        image: "flutter-app",
        category: "Flutter",
        heading: "Building a Complex Layout with Flutter",
        author: "Simon Ng"
      ),
      AppModel(
        image: "macos-programming",
        category: "Catalyst",
        heading: "How to Create Star Wars Animated Text Using SwiftU",
        author: "Simon Ng"
      ),
      AppModel(
        image: "natural-language-api",
        category: "MacOS",
        heading: "Builing a Simple Editing App",
        author: "Simon Ng"
      ),
    ]
  }
}

public struct AppModel: Equatable, Identifiable {
  public var image: String
  public var category: String
  public var heading: String
  public var author: String
  
  public var id: String {
    return heading
  }
  
  public init(
    image: String,
    category: String,
    heading: String,
    author: String
  ) {
    self.image = image
    self.category = category
    self.heading = heading
    self.author = author
  }
}
