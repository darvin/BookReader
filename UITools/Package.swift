// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UITools",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "UITools",
            targets: ["UITools"]),
    ],
    dependencies: [
        .package(path: "../Protocols"),
    ],
    targets: [
        .target(
            name: "UITools",
            dependencies: [
                "Protocols",
            ]),
        .testTarget(
            name: "UIToolsTests",
            dependencies: ["UITools"]),
    ]
)
