<h1 align="center">LMLoading</h1>

<p align="center">
 <a href="https://github.com/thejohnlima/LMLoading/releases">
  <img src="https://img.shields.io/github/v/release/thejohnlima/LMLoading?style=for-the-badge">
 </a>
 <a href="https://github.com/thejohnlima/LMLoading/actions">
  <img src="https://img.shields.io/github/workflow/status/thejohnlima/LMLoading/CI/master?style=for-the-badge">
 </a>
 <a href="https://cocoapods.org/pods/LMLoading">
  <img src="https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=for-the-badge">
 </a><br>
 <a href="https://github.com/thejohnlima/LMLoading">
  <img src="https://img.shields.io/github/repo-size/thejohnlima/LMLoading.svg?style=for-the-badge">
 </a>
 <a href="https://raw.githubusercontent.com/thejohnlima/LMLoading/master/LICENSE">
  <img src="https://img.shields.io/github/license/thejohnlima/LMLoading.svg?style=for-the-badge">
 </a>
 <a href="https://developer.apple.com/ios/">
  <img src="https://img.shields.io/cocoapods/p/LMLoading?style=for-the-badge">
 </a>
 <a href="https://developer.apple.com/swift/">
  <img src="https://img.shields.io/badge/Swift-5-blue.svg?style=for-the-badge">
 </a>
 <a href="https://patreon.com/thejohnlima">
  <img src="https://img.shields.io/badge/donate-patreon-yellow.svg?style=for-the-badge">
 </a>
</p>

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
