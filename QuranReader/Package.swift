// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QuranReader",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "QuranReader",
            targets: ["QuranReader"]),
    ],
    dependencies: [
        .package(path: "../Protocols"),
        .package(path: "../Tools"),
        .package(path: "../UITools"),
    ],
    targets: [
        .target(
            name: "QuranReader",
            dependencies: [
                "Protocols",
                "Tools",
                "UITools",
            ]),
        .testTarget(
            name: "QuranReaderTests",
            dependencies: ["QuranReader"]),
    ]
)
