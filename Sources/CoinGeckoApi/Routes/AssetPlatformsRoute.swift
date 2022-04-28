public enum AssetPlatformsRoute: Route {
    case assetPlatforms
    
    public var path: String {
        switch self {
        case .assetPlatforms: return "/asset_platforms"
        }
    }
}
