//
//  XCTestManifests.swift
//  
//
//  Created by John Lima on 6/30/21.
//

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    LMLoadingTests.allTests
  ]
}
#endif
