//
//  AppLauncher.swift
//  SwiftUIDemo
//
//  Created by Wilson on 17.10.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import SwiftUIDemoFoundation

protocol AppLaunchTask {
  func execute()
}

class AppSceneLauncher {
  private let sceneDelegate: SceneDelegate
  private var launchTasks = [AppLaunchTask]()
  
  init(sceneDelegate: SceneDelegate) {
    self.sceneDelegate = sceneDelegate
  }
  
  func build(scene: UIScene) -> AppSceneLauncher {
    launchTasks = [
      SetWindowLaunchTask(sceneDelegate: sceneDelegate, scene: scene)
    ]
    return self
  }
  
  func execute() {
    launchTasks.forEach { $0.execute() }
  }
}

class AppLauncher {
  private let appDelegate: AppDelegate
  private var launchTasks = [AppLaunchTask]()
  
  init(delegate: AppDelegate) {
    self.appDelegate = delegate
  }
  
  func build() -> AppLauncher {
    launchTasks = [
      UIAppearanceLaunchTask()
    ]
    return self
  }
  
  func execute() {
    launchTasks.forEach { $0.execute() }
  }
}

struct SetWindowLaunchTask: AppLaunchTask {
  private let sceneDelegate: SceneDelegate
  private let scene: UIScene
  
  init(sceneDelegate: SceneDelegate, scene: UIScene) {
    self.sceneDelegate = sceneDelegate
    self.scene = scene
  }
  
  func execute() {
    guard let windowScene = scene as? UIWindowScene else { return }

    let window = UIWindow(windowScene: windowScene)
    let contentView: TabbarView = TabbarView()

    window.rootViewController = SwiftUIDemoHostingController(rootView: contentView)
    sceneDelegate.window = window
    window.makeKeyAndVisible()
  }
}

struct UIAppearanceLaunchTask: AppLaunchTask {
  func execute() {
    registerNavBar()
    registerTableView()
  }
  
  private func registerNavBar() {
  }
  
  private func registerTableView() {
  }
}
