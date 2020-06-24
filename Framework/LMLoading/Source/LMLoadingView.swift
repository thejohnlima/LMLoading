//  MIT License
//
//  Copyright (c) 2019 John Lima
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Lottie
import UIKit

public class LMLoadingView: UIView {
  
  // MARK: - Constants
  private let animationViewRoundedValue: CGFloat = 4
  
  // MARK: - Properties
  @IBOutlet public weak var backgroundContainerView: UIView!
  @IBOutlet public weak var animationContainerView: UIView!
  @IBOutlet public weak var systemActivityIndicator: UIActivityIndicatorView!
  
  // MARK: - Overrides
  override public func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  
  // MARK: - Private Methods
  private func setupUI() {
    frame = UIScreen.main.bounds
    animationContainerView.layer.cornerRadius = animationViewRoundedValue
    animationContainerView.layer.masksToBounds = true
  }
  
  // MARK: - Internal Methods
  func start(animation type: LMLoadingType, completion: LMCompletion.Empty? = nil) {
    create(animation: type, loop: true, completion: completion)
  }
  
  func stop(animation type: LMLoadingType, completion: @escaping LMCompletion.Empty) {
    create(animation: type, completion: completion)
  }
  
  // MARK: - Private Methods
  private func create(animation: LMLoadingType,
                      loop: Bool = false,
                      completion: LMCompletion.Empty? = nil) {
    if case .activitySystem = animation {
      systemActivityIndicator.isHidden = false
      systemActivityIndicator.startAnimating()
      animationContainerView.isHidden = true
      return
    }

    let animationView = AnimationView(name: animation.fileName, bundle: animation.bundle ?? Bundle(for: type(of: self)))
    animationView.frame = animationContainerView.bounds
    animationView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    animationView.contentMode = .scaleAspectFit
    animationView.accessibilityIdentifier = "ANIMATION_VIEW"
    
    if loop {
      animationView.loopMode = .loop
    }

    animationContainerView.isHidden = false
    animationContainerView.subviews.first { $0 is AnimationView }?.removeFromSuperview()
    animationContainerView.addSubview(animationView)
    
    guard animationView.window != nil else {
      completion?()
      return
    }
    
    animationView.play { _ in
      completion?()
    }
  }
}
