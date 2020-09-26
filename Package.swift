// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ReindentEmptyLines",
    products: [
        .executable(
            name: "ReindentEmptyLines",
            targets: ["ReindentEmptyLines"]
        ),
    ],
    targets: [
        .target(
            name: "ReindentEmptyLines",
            dependencies: []
        ),
        .testTarget(
            name: "ReindentEmptyLinesTests",
            dependencies: [
                "ReindentEmptyLines"
            ]
        ),
    ]
)
