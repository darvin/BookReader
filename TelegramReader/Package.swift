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
         .package(path: "../tdlibkit"),
         .package(path: "../Books"),
         .package(path: "../Tools"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TelegramReader",
            dependencies: [
//                .product(name: "TDLibKit", package: "tdlibkit"),
                .product(name: "TDLibKit", package: "tdlibkit", condition: .when(platforms: [.iOS])),
                "Books",
                "Tools",
            ]),
        .testTarget(
            name: "TelegramReaderTests",
            dependencies: ["TelegramReader"]),
    ]
)
