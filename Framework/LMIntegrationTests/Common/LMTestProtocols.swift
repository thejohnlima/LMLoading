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

/// Protocol to sign enum with string reference elements of one test
public protocol IdentifierViewProtocol {
    /// The identifier for the View with Accessibility.
    var identifier: String { get }
}

public protocol LabelViewProtocol {
    /// The label of element
    var label: String { get }
}

/// Protocol to sign load view functions
public protocol UITestLoadViewProtocol {
    func loadView()
}

/// Protocol to Test visibility of all elements in the view
protocol UITestVisibilityProtocol {
    func testElementsExists()
}

/// Protocol to Test interaction of elements in the view
protocol UITestInteractableProtocol {
    func testElementsIsTappable()
}

/// Protocol to Test type of elements in the view
protocol UITestElementTypeProtocol {
    func testElementsIsDesignSystem()
}

/// Protocol to Test interactions of user (after loading data behaviours)
protocol UITestInputsProtocol {
    func testInputsSuccess()
    func testInputsFails()
    func testInputsChanges()
}
