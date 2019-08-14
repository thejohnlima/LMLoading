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

@testable import LMLoading
import Lottie
import XCTest

class LMLoadingViewTests: XCTestCase {

  // MARK: - Properties
  private var loadingView: LMLoadingView?

  // MARK: - Overrides
  override func setUp() {
    super.setUp()
    loadingView = UIView.fromNib()
  }

  override func tearDown() {
    loadingView = nil
    super.tearDown()
  }

  // MARK: - Test Methods
  func testInitSuccess() {
    XCTAssertNotNil(loadingView)
    XCTAssertNotNil(loadingView?.animationContainerView)
    XCTAssertEqual(loadingView?.animationContainerView.layer.cornerRadius, 4)
  }

  func testStartAnimationWithSuccess() {
    loadingView?.start(animation: .image)
    let container = loadingView?.animationContainerView
    let animationView = container?.subviews.first { $0 is AnimationView } as? AnimationView
    XCTAssertNotNil(animationView)
    XCTAssertEqual(animationView?.frame, loadingView?.animationContainerView.bounds)
    XCTAssertEqual(animationView?.autoresizingMask, [.flexibleWidth, .flexibleHeight])
    XCTAssertEqual(animationView?.loopMode, .loop)
  }
}
