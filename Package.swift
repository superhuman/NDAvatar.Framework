// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "NDAvatarView",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(name: "NDAvatarView", targets: ["NDAvatarView"]),
    ],
    targets: [
        .target(name: "NDAvatarView", dependencies: []),
        .testTarget(name: "NDAvatarViewTests", dependencies: ["NDAvatarView"]),
    ]
)
