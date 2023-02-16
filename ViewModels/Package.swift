// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "ViewModels",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ViewModels",
            targets: ["ViewModels"]),
    ],
    dependencies: [
        .package(path: "../Protocols"),
    ],
    targets: [
        .target(
            name: "ViewModels",
            dependencies: [
                "Protocols",
            ]),
        .testTarget(
            name: "ViewModelsTests",
            dependencies: ["ViewModels"]),
    ]
)
