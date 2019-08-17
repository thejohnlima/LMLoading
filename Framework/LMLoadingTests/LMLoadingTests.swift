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

class LMLoadingTests: XCTestCase {
  
  // MARK: - Properties
  private var controller: UIViewController?
  
  var loadingView: LMLoadingView? {
    let view = controller?.view.subviews.first { $0 is LMLoadingView } as? LMLoadingView
    return view
  }
  
  var animationView: AnimationView? {
    let view = loadingView?.animationContainerView.subviews.first { $0 is AnimationView } as? AnimationView
    return view
  }
  
  // MARK: - Overrides
  override func setUp() {
    super.setUp()
    controller = UIViewController()
    controller?.view.frame = UIScreen.main.bounds
    _ = controller?.view
  }
  
  override func tearDown() {
    controller = nil
    super.tearDown()
  }
  
  // MARK: - Private Methods
  private func showLoading(_ type: LMLoadingType) {
    guard let view = controller?.view else {
      XCTFail("❌ view should't be nil")
      return
    }
    
    let expectation = self.expectation(description: "Wait for loading appear")
    
    LMLoading.show(loading: type, target: view) {
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 2)
  }
  
  private func hideLoading(_ type: LMLoadingType? = nil) {
    let expectation = self.expectation(description: "Wait for hide loading")
    
    LMLoading.hide(type) {
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 2)
  }
  
  // MARK: - Test Methods
  func testShowLoading() {
    showLoading(.activity)
    
    XCTAssertTrue(LMLoading.isLoading)
    
    let loadingView = self.loadingView
    
    XCTAssertEqual(loadingView?.frame, self.controller?.view.bounds ?? .zero)
    XCTAssertEqual(loadingView?.backgroundContainerView.alpha, 0.75)
    XCTAssertEqual(loadingView?.animationContainerView.alpha, 1)
    XCTAssertEqual(loadingView?.animationContainerView.layer.cornerRadius, 4)
    XCTAssertEqual(loadingView?.animationContainerView.backgroundColor, .white)
    XCTAssertEqual(loadingView?.animationContainerView.isHidden, false)
    
    let animationView = self.animationView
    XCTAssertNotNil(animationView?.animation)
    XCTAssertEqual(animationView?.frame, loadingView?.animationContainerView.bounds ?? .zero)
    XCTAssertEqual(animationView?.contentMode, .scaleAspectFit)
    XCTAssertEqual(animationView?.loopMode, .loop)
    XCTAssertEqual(animationView?.accessibilityIdentifier, "ANIMATION_VIEW")
  }
  
  func testHideLoading() {
    showLoading(.image)
    hideLoading()
    XCTAssertNil(loadingView)
  }
  
  func testHideLoadingWithAnimation() {
    showLoading(.image)
    hideLoading(.success)
    XCTAssertNil(loadingView)
  }
}
