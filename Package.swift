// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "LMLoading",
  platforms: [
    .iOS(.v13)
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
      dependencies: [
        "Lottie"
      ],
      resources: [
        .process("ResourceFiles")
      ]
    ),
    .testTarget(
      name: "LMLoadingTests",
      dependencies: [
        "LMLoading"
      ]
    )
  ]
)
