//
//  BaseView.swift
//  RIBsGithub
//
//  Created by ohkanghoon on 2020/06/18.
//

import UIKit

class BaseView: UIView {

  // MARK: Properties

  private(set) var didSetupConstraints = false


  // MARK: Layout Constratins

  override func updateConstraints() {
    if !self.didSetupConstraints {
      self.prepareConstraints()
      self.didSetupConstraints = true
    }
    super.updateConstraints()
  }

  func prepareConstraints() {
    // Override this
  }
}
