//
//  AppDelegateStub.swift
//  RIBsGithubTests
//
//  Created by ohkanghoon on 2020/06/18.
//

import UIKit

final class AppDelegateStub: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    return true
  }
}

