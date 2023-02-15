// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Books",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Books",
            targets: ["Books"]),
    ],
    dependencies: [
        .package(path: "../PDFViewer"),
        .package(path: "../Tools"),

    ],
    targets: [
        .target(
            name: "Books",
            dependencies: [
                "PDFViewer",
                "Tools"
            ]),
        .testTarget(
            name: "BooksTests",
            dependencies: ["Books"]),
    ]
)
