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

public enum LMLoadingType {
  case image
  case activity
  case activitySystem
  case success
  case networkError
  case error
  case custom(_ name: String, bundle: Bundle = .main)

  var fileName: String {
    switch self {
    case .image:
      return "image_loading_animation"
    case .activity:
      return "balls_animation"
    case .success:
      return "success_animation"
    case .networkError:
      return "network_error_animation"
    case .error:
      return "error_animation"
    case .custom(let name, _):
      return name
    case .activitySystem:
      return ""
    }
  }

  var bundle: Bundle {
    switch self {
    case .custom(_, let bundle):
      return bundle
    default:
      return Bundle.bundle
    }
  }
}
