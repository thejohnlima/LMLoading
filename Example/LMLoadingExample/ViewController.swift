//
//  ViewController.swift
//  LMLoadingExample
//
//  Created by John Lima on 14/08/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import LMLoading

class ViewController: UIViewController {

  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    didTapButton()
  }
  
  // MARK: - Actions
  @IBAction private func didTapButton() {
    showLoading()
    Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { timer in
      timer.invalidate()
      self.hideLoading()
    }
  }
  
  // MARK: - Private Methods
  @objc
  private func showLoading() {
    LMLoading.show(loading: .activity, target: self)
  }
  
  private func hideLoading() {
    LMLoading.hide(.networkError)
  }
}
