// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Lab4uui",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Lab4uui",
            targets: ["Lab4uui"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Lab4uui"),
        .testTarget(
            name: "Lab4uuiTests",
            dependencies: ["Lab4uui"]),
    ]
)
