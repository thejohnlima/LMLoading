# LMLoading

[![GitHub release](https://img.shields.io/github/release/thejohnlima/LMLoading.svg)](https://github.com/thejohnlima/LMLoading/releases)
[![Build Status](https://travis-ci.com/thejohnlima/LMLoading.svg?branch=master)](https://travis-ci.com/thejohnlima/LMLoading)
[![codecov](https://codecov.io/gh/thejohnlima/LMLoading/branch/master/graph/badge.svg)](https://codecov.io/gh/thejohnlima/LMLoading)
[![CocoaPods](https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=flat)](https://cocoapods.org/pods/LMLoading)
[![Language](https://img.shields.io/badge/language-Swift%205.0-orange.svg)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/github/license/thejohnlima/LMLoading.svg)](https://raw.githubusercontent.com/thejohnlima/LMLoading/master/LICENSE)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://paypal.me/thejohnlima)

**LMLoading** is the best and easy way to show an loading in your view.

![LMLoading](https://raw.githubusercontent.com/thejohnlima/LMLoading/master/Documents/LMLoading.gif)

## ❗️Requirements

- iOS 10.0+
- Swift 5.0+

## ⚒ Installation

### CocoaPods

**LMLoading** is available through [CocoaPods](https://cocoapods.org/pods/LMLoading). To install
it, simply add the following line to your Podfile:

```ruby
# Swift 5.0 or later
pod 'LMLoading'
```

and run `pod install`

## 🎓 How to use

Import library in your swift file:

```Swift
import LMLoading
```

Show LMLoading in your view:

```Swift
LMLoading.show(loading: .image, target: view)
```

Hide LMLoading:

```swift
LMLoading.hide()
```

## 📱 Feature

- [x] Diferent kids of animations by default;
- [x] Able to work with custom animations;
- [x] Can hide with animation or not;
- [x] iPad support;

## 🙋🏻‍  Communication

- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request. 👨🏻‍💻

## 📜 License

**LMLoading** is under MIT license. See the [LICENSE](https://raw.githubusercontent.com/thejohnlima/LMLoading/master/LICENSE) file for more info.
