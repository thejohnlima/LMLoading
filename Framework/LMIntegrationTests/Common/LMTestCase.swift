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

import Foundation
import KIF
@testable import LMLoading
import XCTest

protocol IntegrationTestCaseProtocol {
    func withLabel(_ label: LabelViewProtocol) -> KIFUIViewTestActor?
    func withIdentifier(_ identifier: IdentifierViewProtocol) -> KIFUIViewTestActor?
}

/// IntegrationTetCase - stubs and KIF functions
internal class IntegrationTestCase: KIFTestCase {
    let bundleIdentifier = "thejohnlima.LMLoading"

    override func setUp() {
        super.setUp()
        UserDefaults.standard.removePersistentDomain(forName: bundleIdentifier)
    }
    
    func screenshot(line: UInt, name: String, _ desc: String = "") {
        try? UIApplication.shared.writeScreenshot(forLine: line, inFile: name, description: desc)
    }
    
    override func tearDown() {
        super.tearDown()
        //clear user status
        UserDefaults.standard.removePersistentDomain(forName: bundleIdentifier)
    }
}

extension IntegrationTestCase {
    func tester(_ file: String = #file, _ line: Int = #line) -> KIFUIViewTestActor {
        return KIFUIViewTestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(_ file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}