// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "GutenReader",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "GutenReader",
            targets: ["GutenReader"]),
    ],
    dependencies: [
        .package(path: "../Books"),
    ],
    targets: [
        .target(
            name: "GutenReader",
            dependencies: [
                "Books",
            ]),
        .testTarget(
            name: "GutenReaderTests",
            dependencies: ["GutenReader"]),
    ]
)
