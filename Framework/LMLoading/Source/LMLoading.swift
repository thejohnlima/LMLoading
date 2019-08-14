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

  public static var isLoading: Bool {
    return loadingView?.superview != nil
  }

  // MARK: - Public Methods
  public static func show(loading: LMLoadingType, target: UIView) {
    DispatchQueue.main.async {
      loadingView?.removeFromSuperview()
      loadingView = UIView.fromNib()
      guard let loadingView = loadingView else { return }
      target.addSubview(loadingView)
      self.loadingView?.start(animation: loading)
    }
  }
  
  public static func hide(_ animation: LMLoadingType? = nil, completion: (() -> Void)? = nil) {
    DispatchQueue.main.async {
      guard let type = animation else {
        stop()
        completion?()
        return
      }
      loadingView?.stop(animation: type) {
        self.stop()
        completion?()
      }
    }
  }

  public static func stop() {
    loadingView?.removeFromSuperview()
  }
}
