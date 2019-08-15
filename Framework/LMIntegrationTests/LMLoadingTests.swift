//
//  LMLoadingTests.swift
//  LMIntegrationTests
//
//  Created by John on 14/08/19.
//  Copyright © 2019 LMLoading. All rights reserved.
//

@testable import LMLoading
import XCTest

private enum ViewElements {
  case background
  case containerAnimation
  case animation

  var identifier: String {
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

class LMLoadingTests: IntegrationTestCase, UITestLoadViewProtocol {
  private var loadingType: LMLoadingType = .activity

  func loadView() {
    let controller = LMTestController()
    _ = controller.view
    LMLoading.show(loading: loadingType, target: controller.view)
  }
}

extension LMLoadingTests: UITestVisibilityProtocol {
  func testElementsExists() {
    loadView()
    XCTAssertNotNil(tester().usingIdentifier(ViewElements.background.identifier)?.view)
  }
}
