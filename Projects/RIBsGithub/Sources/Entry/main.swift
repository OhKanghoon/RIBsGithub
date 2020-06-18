//
//  main.swift
//  RIBsGithub
//
//  Created by ohkanghoon on 2020/06/18.
//

import UIKit

UIApplicationMain(
  CommandLine.argc,
  CommandLine.unsafeArgv,
  NSStringFromClass(UIApplication.self),
  NSStringFromClass(NSClassFromString("RIBsGithubTests.AppDelegateStub") ?? AppDelegate.self)
)
