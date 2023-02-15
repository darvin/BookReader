// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Shared",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Shared",
            targets: ["Shared"]),
    ],
    dependencies: [

        .package(path: "../Books"),
        .package(path: "../TelegramReader"),
        .package(path: "../GutenReader"),
        .package(path: "../PDFViewer"),
    ],
    targets: [
        .target(
            name: "Shared",
            dependencies: [
                "TelegramReader",
                "GutenReader",
                "Books",
                "PDFViewer",

            ])
    ]
)
