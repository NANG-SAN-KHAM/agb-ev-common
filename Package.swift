// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AGBEVCommon",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "AGBEVCommon",
            targets: ["AGBEVCommon"]
        ),
    ],
    dependencies: [
        // AGB Common
        .package(url: "git@github.com:NANG-SAN-KHAM/AGBCommon.git", branch: "main")
    ],
    targets: [
        .target(
            name: "AGBEVCommon",
            dependencies: [
                .product(name: "AGBCommon", package: "agbcommon")
            ],
            resources: [
                .process("Resources")
            ]
        ),
    ]
)
