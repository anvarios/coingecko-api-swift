// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "coingecko-api-swift",
    platforms: [.iOS(.v13), .macOS(.v10_14)],
    products: [
        .library(name: "CoinGeckoApi", targets: ["CoinGeckoApi"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.4.0"),
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.4.3")
    ],
    targets: [
        .target(name: "CoinGeckoApi", dependencies: [
            .product(name: "Logging", package: "swift-log"),
            .product(name: "Alamofire", package: "Alamofire")
        ]),
        .testTarget(name: "CoinGeckoApiTests", dependencies: [
            .target(name: "CoinGeckoApi")
        ])
    ],
    swiftLanguageVersions: [.v5]
)
