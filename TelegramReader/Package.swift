// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TelegramReader",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TelegramReader",
            targets: ["TelegramReader"]),
    ],
    dependencies: [
         .package(url: "https://github.com/mock-foundation/tdlibkit.git", from: "3.1.0-1.8.4-07b7faf6"),
         .package(path: "../Books"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TelegramReader",
            dependencies: [
                .product(name: "TDLibKit", package: "tdlibkit"),
                "Books",
            ]),
        .testTarget(
            name: "TelegramReaderTests",
            dependencies: ["TelegramReader"]),
    ]
)
