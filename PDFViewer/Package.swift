// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PDFViewer",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PDFViewer",
            targets: ["PDFViewer"]),
    ],
    dependencies: [
        .package(url:"https://github.com/raspu/Highlightr.git", from: "2.1.2"),
        .package(path: "../Tools"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PDFViewer",
            dependencies: [
                "Highlightr",
                "Tools",

            ]),
        .testTarget(
            name: "PDFViewerTests",
            dependencies: ["PDFViewer"]),
    ]
)
