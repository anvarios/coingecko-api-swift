# CoinGeckoApi - CoinGecko Swift Standard api wrapper
[![Swift](https://img.shields.io/badge/swift-5.3-brightgreen.svg)](https://swift.org/download/#releases) [![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/anvarios/coingecko-api-swift/blob/master/LICENSE/)  [![Contributing](https://img.shields.io/badge/contributing-guide-brightgreen.svg)](https://github.com/anvarios/coingecko-api-swift/blob/master/CONTRIBUTING.md) ![GitHub last commit](https://img.shields.io/github/last-commit/anvarios/coingecko-api-swift) ![pv](https://pageview.vercel.app/?github_user=anvarios)

<p align="center">
    <img src="https://static.coingecko.com/s/thumbnail-007177f3eca19695592f0b8b0eabbdae282b54154e1be912285c9034ea6cbaf2.png" alt="thumbnail-007177f3eca19695592f0b8b0eabbdae282b54154e1be912285c9034ea6cbaf2" alt="CoinGecko-logo" alt="CoinGecko-logo"/>
</p>

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
    name: "MyApp",
    dependencies: [
        .package(name: "coingecko-api-swift", url: "https://github.com/anvarios/coingecko-api-swift.git", .branch("master"))
    ],
    targets: [
        .target(name: "MyApp", dependencies: [
            .product(name: "CoinGeckoApi", package: "coingecko-api-swift"),
        ]),
        .testTarget(name: "MyAppTests", dependencies: [
            .target(name: "MyApp")
        ])
    ]
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
