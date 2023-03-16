// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Main",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Main",
            targets: ["Main"]),
    ],
    dependencies: [
        .package(path: "../Views"),
        .package(path: "../ViewModels"),
        .package(path: "../Protocols"),
        .package(path: "../Plugins/GutenReader"),
        .package(path: "../Plugins/PDFViewer"),
        .package(path: "../Plugins/TelegramReader"),
        .package(path: "../Plugins/QuranReader"),
        .package(path: "../Plugins/LocalReader"),
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: [
                .product(name: "TelegramReader", package: "TelegramReader", condition: .when(platforms: [.iOS])),
                "GutenReader",
                "QuranReader",
                "PDFViewer",
                "LocalReader",
                "ViewModels",
                "Protocols",
                "Views",

            ]),
        .testTarget(
            name: "MainTests",
            dependencies: ["Main"]),
    ]
)
