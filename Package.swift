// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PropertyWrappers",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "PropertyWrappers",
            targets: [
                "PropertyWrappers"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/auremsinistram/Extensions.git",
            from: .init(0, 2, 0)
        )
    ],
    targets: [
        .target(
            name: "PropertyWrappers",
            dependencies: [
                .product(
                    name: "Extensions"
                )
            ]
        )
    ]
)
