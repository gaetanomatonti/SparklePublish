// swift-tools-version: 5.7
import PackageDescription

let package = Package(
  name: "SparklePublish",
  platforms: [.macOS(.v13)],
  products: [
    .library(
      name: "SparklePublish",
      targets: ["SparklePublish"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/johnsundell/publish.git",
      from: "0.9.0"
    ),
    .package(
      url: "https://github.com/gaetanomatonti/Sparkle.git",
      branch: "develop"
    )
  ],
  targets: [
    .target(
      name: "SparklePublish",
      dependencies: [
        .product(name: "Publish", package: "publish"),
        "Sparkle"
      ]
    ),
    .testTarget(
      name: "SparklePublishTests",
      dependencies: ["SparklePublish"]
    ),
  ]
)
