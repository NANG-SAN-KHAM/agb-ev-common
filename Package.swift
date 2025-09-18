// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AGBEVCommon",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AGBEVCommon",
            targets: ["AGBEVCommon"]
        ),
    ],
    dependencies: [
        // AGB Common
        .package(url: "git@github.com:NANG-SAN-KHAM/agb-common.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AGBEVCommon",
            dependencies: [
                .product(name: "AGBCommon", package: "agb-common")   
            ],
            resources: [
                .process("Resources")
            ]
        ),
        
    ]
)
