// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Views",
    platforms: [
        .macOS(.v12),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Views",
            targets: ["Views"]),
    ],
    dependencies: [
        .package(path: "../Models"),
        .package(path: "../ViewModels"),
        .package(path: "../UITools"),
        .package(path: "../PDFViewer"),

    ],
    targets: [
        .target(
            name: "Views",
            dependencies: [
                "Models",
                "ViewModels",
                "UITools",
                "PDFViewer",
            ]),
        .testTarget(
            name: "ViewsTests",
            dependencies: ["Views"]),
    ]
)
