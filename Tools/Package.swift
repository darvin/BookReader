// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Tools",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Tools",
            targets: ["Tools"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Tools",
            dependencies: []),
        .testTarget(
            name: "ToolsTests",
            dependencies: ["Tools"]),
    ]
)
