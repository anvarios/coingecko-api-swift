public enum TrendingRoute: Route {
    case searchTrending
    
    public var path: String {
        switch self {
        case .searchTrending: return "/search/trending"
        }
    }
}
