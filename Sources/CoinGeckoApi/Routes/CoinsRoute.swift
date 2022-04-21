public enum CoinsRoute: Route {
    case coinsList(includePlatform: Bool)

    public var path: String {
        switch self {
        case .coinsList(let includePlatform):
            return "/coins/list?include_platform=\(includePlatform)"
        }
    }
}
