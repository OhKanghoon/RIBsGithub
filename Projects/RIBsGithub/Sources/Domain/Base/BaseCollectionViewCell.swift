//
//  BaseCollectionViewCell.swift
//  RIBsGithub
//
//  Created by ohkanghoon on 2020/06/18.
//

import UIKit

import RxCocoa
import RxSwift

class BaseCollectionViewCell: UICollectionViewCell {

  // MARK: Properties

  lazy var disposeBag = DisposeBag()


  // MARK: Gesture Recognizers

  private(set) lazy var tapGestureRecognizer: UITapGestureRecognizer = {
    let tapGestureRecognizer = UITapGestureRecognizer()
    self.contentView.addGestureRecognizer(tapGestureRecognizer)
    return tapGestureRecognizer
  }()


  // MARK: Initializing

  override init(frame: CGRect) {
    super.init(frame: frame)
    DispatchQueue.main.async {
      self.setNeedsUpdateConstraints()
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: Auto Layout Constraints

  private(set) var didSetupConstraints = false

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


// MARK: - Rx

extension Reactive where Base: BaseCollectionViewCell {
  var tap: ControlEvent<Void> {
    let source = self.base.tapGestureRecognizer.rx.event.map { _ in }
    return ControlEvent(events: source)
  }
}

