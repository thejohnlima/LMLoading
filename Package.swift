// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "LMLoading",
  platforms: [
    .macOS(.v10_13),
    .iOS(.v13),
    .tvOS(.v9)
  ],
  products: [
    .library(
      name: "LMLoading",
      targets: ["LMLoading"]
    ),
  ],
  dependencies: [
    .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", from: "3.2.3")
  ],
  targets: [
    .target(
      name: "LMLoading",
      dependencies: ["Lottie"],
      exclude: [
        "../../README.md",
        "../../Documents",
        "../../Example",
        "../../fastlane",
        "../../Gemfile",
        "../../Gemfile.lock",
        "../../LMLoading.podspec"
      ],
      resources: [
        .process("ResourceFiles")
      ]
    ),
    .testTarget(
      name: "LMLoadingTests",
      dependencies: ["LMLoading"]
    )
  ]
)
