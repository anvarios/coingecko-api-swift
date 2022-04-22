# CoinGeckoApi - CoinGecko Swift Standard api wrapper
[![Swift](https://img.shields.io/badge/swift-5.3-brightgreen.svg)](https://swift.org/download/#releases) [![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/anvarios/coingecko-api-swift/blob/master/LICENSE/)  [![Contributing](https://img.shields.io/badge/contributing-guide-brightgreen.svg)](https://github.com/anvarios/coingecko-api-swift/blob/master/CONTRIBUTING.md) ![GitHub last commit](https://img.shields.io/github/last-commit/anvarios/coingecko-api-swift) ![pv](https://pageview.vercel.app/?github_user=anvarios)

## Installation
### Swift
Download and install [Swift](https://swift.org/download)

### Swift Package
```shell
mkdir MyApp
cd MyApp
swift package init --type executable // Creates an executable app named "MyApp"
```

#### Package.swift
```swift
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
```

### Build
```shell
swift build -c release
```

## Usage
```swift
import CoinGeckoApi
// TODO:
```

## Tests
```shell
swift test --enable-test-discovery --sanitize=thread
```
