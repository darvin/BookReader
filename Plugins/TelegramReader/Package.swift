// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "TelegramReader",
    platforms: [
        .iOS(.v16),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "TelegramReader",
            targets: ["TelegramReader"]),
    ],
    dependencies: [
         .package(path: "./tdlibkit"),
         .package(path: "../../Protocols"),
         .package(path: "../PDFViewer"),
         .package(path: "../../Tools"),

    ],
    targets: [
        .target(
            name: "TelegramReader",
            dependencies: [
                .product(name: "TDLibKit", package: "tdlibkit", condition: .when(platforms: [.iOS])),
                "Protocols",
                "Tools",
                "PDFViewer",
            ]),
        .testTarget(
            name: "TelegramReaderTests",
            dependencies: ["TelegramReader"]),
    ]
)
