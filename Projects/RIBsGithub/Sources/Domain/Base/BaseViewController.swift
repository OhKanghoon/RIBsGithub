//
//  BaseViewController.swift
//  RIBsGithub
//
//  Created by ohkanghoon on 2020/06/18.
//

import UIKit

import RxSwift

import Logging

class BaseViewController: UIViewController {

  // MARK: Properties

  private(set) var didSetupConstraints = false

  var disposeBag = DisposeBag()


  // MARK: Initializing

  init() {
    super.init(nibName: nil, bundle: nil)
    self.modalPresentationStyle = .fullScreen
  }

  required convenience init(coder aDecoder: NSCoder) {
    self.init()
  }

  deinit {
    NotificationCenter.default.removeObserver(self)
    log.info("[DEINIT] \(type(of: self))")
  }


  // MARK: View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.setNeedsUpdateConstraints()
  }


  // MARK: Layout Constratins

  override func updateViewConstraints() {
    if !self.didSetupConstraints {
      self.prepareConstraints()
      self.didSetupConstraints = true
    }
    super.updateViewConstraints()
  }

  func prepareConstraints() {
    // Override this
  }
}
