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

import UIKit

public class LMLoading {

  // MARK: - Properties
  static var loadingView: LMLoadingView?
  static var presentation: Presentation?

  public static var isLoading: Bool {
    return loadingView?.superview != nil
  }

  typealias Presentation = (target: UIViewController, styleFull: Bool)

  // MARK: - Enums
  public enum ViewElements {
    case background
    case containerAnimation
    case animation

    public var identifier: String {
      switch self {
      case .background:
        return "BACKGROUND_VIEW"
      case .containerAnimation:
        return "CONTAINER_ANIMATION_VIEW"
      case .animation:
        return "ANIMATION_VIEW"
      }
    }
  }

  // MARK: - Public Methods
  public static func show(loading: LMLoadingType,
                          target: UIViewController,
                          styleFull: Bool = true,
                          completion: (() -> Void)? = nil) {
    DispatchQueue.main.async {
      loadingView?.removeFromSuperview()
      loadingView = UIView.fromNib()

      guard let loadingView = loadingView else { return }

      if styleFull {
        target.navigationController?.setNavigationBarHidden(true, animated: false)
      }

      target.view.addSubview(loadingView)

      self.presentation = (target, styleFull)
      self.loadingView?.start(animation: loading, completion: completion)
    }
  }

  public static func hide(_ animation: LMLoadingType? = nil, completion: (() -> Void)? = nil) {
    DispatchQueue.main.async {
      guard let type = animation else {
        stop()
        completion?()
        return
      }

      loadingView?.systemActivityIndicator.stopAnimating()

      loadingView?.stop(animation: type) {
        self.stop()
        completion?()
      }
    }
  }

  public static func stop() {
    loadingView?.removeFromSuperview()
    if presentation?.target.navigationController?.isNavigationBarHidden == true, presentation?.styleFull == true {
      presentation?.target.navigationController?.setNavigationBarHidden(false, animated: false)
    }
  }
}
