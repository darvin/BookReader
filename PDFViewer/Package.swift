// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "PDFViewer",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "PDFViewer",
            targets: ["PDFViewer"]),
    ],
    dependencies: [
        .package(url:"https://github.com/raspu/Highlightr.git", from: "2.1.2"),
        .package(path: "../Tools"),
        .package(path: "../UITools"),
    ],
    targets: [
        .target(
            name: "PDFViewer",
            dependencies: [
                "Highlightr",
                "Tools",
                "UITools",

            ]),
        .testTarget(
            name: "PDFViewerTests",
            dependencies: ["PDFViewer"]),
    ]
)
