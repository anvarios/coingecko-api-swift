import Alamofire

public enum CoinGeckoRoute: Route {
    case ping

    public var path: String {
        switch self {
        case .ping: return "/ping"
        }
    }

    public var method: HTTPMethod {
        return .get
    }
}
