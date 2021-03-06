// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "RouteComposer",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "RouteComposer",
            targets: ["RouteComposer"]),
        .library(name: "RouteComposerStatic",
            type: .static,
            targets: ["RouteComposer"]),
        .library(name: "RouteComposerDynamic",
            type: .dynamic,
            targets: ["RouteComposer"])
    ],
    targets: [
        .target(
            name: "RouteComposer",
            dependencies: [],
            path: "RouteComposer/Classes"),
        .testTarget(
            name: "RouteComposerTests",
            dependencies: ["RouteComposer"],
            path: "Example/Tests")
    ],
    swiftLanguageVersions: [.v5])
