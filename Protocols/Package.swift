// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Protocols",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Protocols",
            targets: ["Protocols"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Protocols",
            dependencies: []),
        .testTarget(
            name: "ProtocolsTests",
            dependencies: ["Protocols"]),
    ]
)
