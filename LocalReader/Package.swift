// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "LocalReader",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "LocalReader",
            targets: ["LocalReader"]),
    ],
    dependencies: [
        .package(path: "../Protocols"),
        .package(path: "../UITools"),
    ],
    targets: [
        .target(
            name: "LocalReader",
            dependencies: [
                "Protocols",
                "UITools",
            ]),
        .testTarget(
            name: "LocalReaderTests",
            dependencies: ["LocalReader"]),
    ]
)
