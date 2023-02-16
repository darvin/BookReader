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
        .package(path: "../Protocols"),
        .package(path: "../PDFViewer"),
        .package(path: "../Tools"),
    ],
    targets: [
        .target(
            name: "GutenReader",
            dependencies: [
                "Protocols",
                "Tools",
                "PDFViewer",
            ]),
        .testTarget(
            name: "GutenReaderTests",
            dependencies: ["GutenReader"]),
    ]
)
