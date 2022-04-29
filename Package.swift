// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "coingecko-api-swift",
    platforms: [.iOS(.v13), .macOS(.v10_14)],
    products: [
        .library(name: "CoinGeckoApi", targets: ["CoinGeckoApi"])
    ],
    dependencies: [],
    targets: [
        .target(name: "CoinGeckoApi", dependencies: []),
        .testTarget(name: "CoinGeckoApiTests", dependencies: [
            .target(name: "CoinGeckoApi")
        ])
    ],
    swiftLanguageVersions: [.v5]
)
