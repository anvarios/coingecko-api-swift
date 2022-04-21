import Alamofire

public enum CoinGeckoRoute: Route {
    case ping
    case coinsList(includePlatform: Bool)

    public var path: String {
        switch self {
        case .ping: return "/ping"
        case .coinsList(let includePlatform):
            return "/coins/list?include_platform=\(includePlatform)"
        }
    }

    public var method: HTTPMethod {
        return .get
    }
}
