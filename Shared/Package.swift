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
        .package(path: "../GutenReader"),
        .package(path: "../PDFViewer"),
        .package(path: "../TelegramReader")
    ],
    targets: [
        .target(
            name: "Shared",
            dependencies: [
                .product(name: "TelegramReader", package: "TelegramReader", condition: .when(platforms: [.iOS])),
                "GutenReader",
                "Books",
                "PDFViewer",

            ])
    ]
)
