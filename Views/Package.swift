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
        .package(path: "../Protocols"),
        .package(path: "../ViewModels"),
        .package(path: "../UITools"),
        .package(path: "../PDFViewer"),

    ],
    targets: [
        .target(
            name: "Views",
            dependencies: [
                "Protocols",
                "ViewModels",
                "UITools",
                "PDFViewer",
            ]),
        .testTarget(
            name: "ViewsTests",
            dependencies: ["Views"]),
    ]
)
